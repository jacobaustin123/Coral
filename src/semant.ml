open Ast
open Sast
open Utilities

(* evaluates expressions and returns a type and semantically checked sexpr object *)

let rec expr map = function (* evaluate expressions, return types and add to map *)
  | Lit(x) -> let typ = match x with | IntLit(x) -> Int | BoolLit(x) -> Bool | StringLit(x) -> String | FloatLit(x) -> Float in (typ, SLit(x), None) (* convert lit to type, return (type, SLit(x)), check if defined in map *)
  | List(x) -> let rec aux typ out = function
        | [] -> (type_to_array typ, SList(List.rev out, type_to_array typ), None)
        | a :: rest -> let (t, e, _) = expr map a in if t = typ then aux typ (e :: out) rest else aux Dyn (e :: out) rest
          in (match x with
            | a :: rest -> let (t, e, _) = expr map a in aux t [e] rest
            | [] -> (Dyn, SList([], Dyn), None) (* todo maybe do something with this special case of empty list *))
  | Var(Bind(x, t)) -> if StringMap.mem x map then let (typ, t', decl, data) = StringMap.find x map in if decl then (t', SVar(StrongBind(x, t')), data) else (t', SVar(WeakBind(x, t')), None) else raise (Failure ("SNameError: name '" ^ x ^ "' is not defined"))
  | Unop(op, e) -> let (typ, e', _) = expr map e in (match typ with
      | Dyn -> (Dyn, SUnop(op, e'), None)
      | _ -> (match op with
        | Neg when typ = Int || typ = Float || typ = Bool -> (typ, SUnop(op, e'), None)
        | Not -> (typ, SUnop(op, e'), None)
        | _ -> raise (Failure ("STypeError: unsupported operand type for unary " ^ unop_to_string op ^ ": '" ^ type_to_string typ ^ "'"))
      ))

  | Binop(a, op, b) -> let (t1, e1, _) = expr map a in let (t2, e2, _) = expr map b in (match (t1, t2) with (* will have to fix this later depending on behavior *)
    | (Dyn, Dyn) | (Dyn, _) | (_, Dyn) -> (Dyn, SBinop(e1, op, e2), None)
    | _ -> let same = t1 = t2 in (match op with
      | Add | Sub | Mul | Exp when same && t1 = Int   -> (Int, SBinop(e1, op, e2), None)
      | Add | Sub | Mul | Div | Exp when same && t1 = Float -> (Float, SBinop(e1, op, e2), None)
      | Add | Sub | Mul | Div | Exp when same && t1 = Bool -> (Bool, SBinop(e1, op, e2), None)
      | Add when same && t1 = String -> (String, SBinop(e1, op, e2), None)
      | Add | Sub | Mul | Div | Exp when t1 = Int || t1 = Float || t1 = Bool && t2 = Int || t2 = Float || t2 = Bool -> (Float, SBinop(e1, op, e2), None)
      | Eq | Neq | Less | Leq | Greater | Geq -> (Bool, SBinop(e1, op, e2), None) (* will have to fix later for strings *)
      | And | Or when same && t1 = Bool -> (Bool, SBinop(e1, op, e2), None)
      | Mul when is_arr t1 && t2 = Int -> (t1, SBinop(e1, op, e2), None)
      | Mul when is_arr t2 && t1 = Int -> (t2, SBinop(e1, op, e2), None)
      | Mul when t1 = String && t2 = Int -> (String, SBinop(e1, op, e2), None)
      | Mul when t2 = String && t1 = Int -> (String, SBinop(e1, op, e2), None)
      | Add when same && is_arr t1 -> (t1, SBinop(e1, op, e2), None)
      | _ -> raise (Failure ("STypeError: unsupported operand type(s) for binary " ^ binop_to_string op ^ ": '" ^ type_to_string t1 ^ "' and '" ^ type_to_string t2 ^ "'"))
    ))

  | Call(name, exprs) -> if not (StringMap.mem name map) then 
    raise (Failure ("SNameError: function not found.")) else (* complex function to do semantic checking for calls. makes sure arguments match types, and then recursively checks given function with the given types *)
    let (typ, t', decl, func) = StringMap.find name map in (* if func = None then raise (Failure ("SNameError: function not found.")) *)
      (match func with
        | Some(Func(n, args, c)) -> if t' <> FuncType && typ <> Dyn then 
          (raise (Failure ("STypeError: cannot call variable"))) else
          let param_length = List.length exprs in
          if List.length args <> param_length then
                raise (Failure ("SSyntaxError: unexpected number of arguments in function call"))

          else let rec aux (map, map', bindout, exprout) v1 v2 = match v1, v2 with
            | b, e -> let data = expr map e in let (t', e', _) = data in 
              let (map1, bind2) = check_assign map' data b in (map, map1, (bind2 :: bindout), (e' :: exprout))

          in let (_, map1, bindout, exprout) = (List.fold_left2 aux (map, map, [], []) args exprs) in
          let (map2, block, data, locals) = (func_stmt map map1 TypeMap.empty false c) in
          match data with
            | Some (typ2, e', d) -> let Bind(n1, btype) = n in 
                if btype <> Dyn && btype <> typ2 then if typ2 <> Dyn then 
                raise (Failure ("STypeError: invalid return type")) else 
                let func = { styp = btype; sfname = name; sformals = (List.rev bindout); slocals = locals; sbody = block } in 
                  (btype, (SCall(WeakBind(name, btype), (List.rev exprout), SFunc(func))), d) else (* case where definite return type and Dynamic inferrence still has weak bind*)
                let func = { styp = typ2; sfname = name; sformals = (List.rev bindout); slocals = locals; sbody = block } in 
                (typ2, (SCall(StrongBind(name, typ2), (List.rev exprout), SFunc(func))), d)
            
            | None -> let Bind(name, btype) = n in if btype <> Dyn then 
              raise (Failure ("STypeError: invalid return type")) else 
              let func = { styp = Null; sfname = name; sformals = (List.rev bindout); slocals = locals; sbody = block } in
              (Null, (SCall(StrongBind(name, Null), (List.rev exprout), SFunc(func))), None)

        | None -> print_endline "SWarning: called weak/undefined function"; (* TODO probably not necessary *)
            let eout = List.rev (List.fold_left (fun acc e' -> let (_, e', _) = expr map e' in e' :: acc) [] exprs) in
            (Dyn, (SCall(WeakBind(name, Dyn), eout, SNop)), None) (* TODO fix this somehow *)
        | _ -> raise (Failure ("SCriticalFailure: unexpected type encountered internally in Call evaluation")))

  | _ as temp -> print_endline ("SNotImplementedError: '" ^ (expr_to_string temp) ^ 
      "' semantic checking not implemented"); (Dyn, SNoexpr, None)

(* checks expressions within functions. differs from expr in how  it handles function calls *)

and func_expr globals locals stack flag = function (* evaluate expressions, return types and add to map *)
  | Unop(op, e) -> let (typ, e', _) = func_expr globals locals stack flag e in (match typ with
      | Dyn -> (Dyn, SUnop(op, e'), None)
      | _ -> (match op with
        | Neg when typ = Int || typ = Float || typ = Bool -> (typ, SUnop(op, e'), None)
        | Not -> (typ, SUnop(op, e'), None)
        | _ -> raise (Failure ("STypeError: bad operand type for unary " ^ unop_to_string op ^ ": '" ^ type_to_string typ ^ "'"))
      ))

  | Binop(a, op, b) -> 
    let (t1, e1, _) = func_expr globals locals stack flag a in 
    let (t2, e2, _) = func_expr globals locals stack flag b in 
    let typexn = Failure ("STypeError: unsupported operand type(s) for binary " ^ binop_to_string op ^ ": '" ^ type_to_string t1 ^ "' and '" ^ type_to_string t2 ^ "'") in

    (match (t1, t2) with (* will have to fix this later depending on behavior *)
      | (Dyn, Dyn) | (Dyn, _) | (_, Dyn) -> (Dyn, SBinop(e1, op, e2), None)
      | _ -> let same = t1 = t2 in (match op with
        | Add | Sub | Mul | Exp when same && t1 = Int   -> (Int, SBinop(e1, op, e2), None)
        | Add | Sub | Mul | Div | Exp when same && t1 = Float -> (Float, SBinop(e1, op, e2), None)
        | Add | Sub | Mul | Div | Exp when same && t1 = Bool -> (Bool, SBinop(e1, op, e2), None)
        | Add when same && t1 = String -> (String, SBinop(e1, op, e2), None)
        | Add | Sub | Mul | Div | Exp when t1 = Int || t1 = Float || t1 = Bool && t2 = Int || t2 = Float || t2 = Bool -> (Float, SBinop(e1, op, e2), None)

        | Eq | Neq | Less | Leq | Greater | Geq -> (Bool, SBinop(e1, op, e2), None) (* will have to fix later for strings *)
        | And | Or when same && t1 = Bool -> (Bool, SBinop(e1, op, e2), None)
        | Mul when is_arr t1 && t2 = Int -> (t1, SBinop(e1, op, e2), None)
        | Add when same && is_arr t1 -> (t1, SBinop(e1, op, e2), None)
        | _ -> raise typexn    
      ))

   (* complex function to do semantic checking for calls. makes sure arguments match types, 
   and then recursively checks given function with the given types *)

  | Call(name, exprs) -> 
      let (typ, t', decl, func) = if not (StringMap.mem name locals) then if not flag then
      raise (Failure ("SNameError: function not found.")) else (Dyn, Dyn, false, None) else StringMap.find name locals in 
      (match func with 
        | Some(Func(n, args, c)) -> if t' <> FuncType && typ <> Dyn then 
          (raise (Failure ("STypeError: cannot call variable"))) else
          let param_length = List.length exprs in
          if List.length args <> param_length then
                raise (Failure ("SyntaxError: unexpected number of arguments in function call"))

          else let rec aux (globals, locals, bindout, exprout) v1 v2 = match v1, v2 with 
            | b, e -> let data = func_expr globals locals stack flag e in let (t', e', _) = data in 
            let (map1, bind2) = check_assign globals data b in (map1, locals, (bind2 :: bindout), (e' :: exprout))

          in let (map1, _, bindout, exprout) = (List.fold_left2 aux (globals, locals, [], []) args exprs) in
          
          let (formals, types) = split_sbind bindout in 
          if TypeMap.mem (name, types) stack then (Dyn, (SCall(WeakBind(name, Dyn), [], SNop)), None) else
          let stack' = TypeMap.add (name, types) true stack in (* temporarily a boolean *)
          
          let (map2, block, data, locals) = (func_stmt globals map1 stack' flag c) in
          (match data with
            | Some (typ2, e', d) -> let Bind(n1, btype) = n in if btype <> Dyn && btype <> typ2 then 
                if typ2 <> Dyn then raise (Failure ("STypeError: invalid return type")) else 
                let func = { styp = btype; sfname = name; sformals = (List.rev bindout); slocals = locals; sbody = block } in
                (btype, (SCall(WeakBind(name, btype), (List.rev exprout), SFunc(func))), d) else (* case where definite return type and Dynamic inferrence still has weak bind*)
                let func = { styp = typ2; sfname = name; sformals = (List.rev bindout); slocals = locals; sbody = block } in
                (typ2, (SCall(StrongBind(name, typ2), (List.rev exprout), SFunc(func))), d) (* TODO fix this somehow *)
            
            | None -> let Bind(name, btype) = n in if btype <> Dyn then 
              raise (Failure ("STypeError: invalid return type")) else 
              let func = { styp = Null; sfname = name; sformals = (List.rev bindout); slocals = locals; sbody = block } in 
              (Null, (SCall(StrongBind(name, Null), (List.rev exprout), SFunc(func))), None)) (* TODO fix this somehow *)

        | None -> if not flag then print_endline "SWarning: called weak/undefined function"; 
            let eout = List.rev (List.fold_left (fun acc e' -> let (_, e'', _) = func_expr globals locals stack flag e' in e'' :: acc) [] exprs) in
            (Dyn, (SCall(WeakBind(name, Dyn), eout, SNop)), None)) (* TODO fix this somehow *)
   
    | Var(Bind(x, t)) -> if StringMap.mem x locals then 
          let (typ, t', decl, data) = StringMap.find x locals in 
          if decl then (t', SVar(StrongBind(x, t')), data) 
          else (t', SVar(WeakBind(x, t')), None) else 
          if flag then (Dyn, SVar(WeakBind(x, Dyn)), None) 
          else raise (Failure ("SNameError: name '" ^ x ^ "' is not defined")) 

    | _ as other -> expr locals other

(* function to check if a certain assignment can be performed with inferred/given types, does assignment if possible, returns appropriate bind *)

and check_assign map (typ, _, data) = function (* check if a value can be assigned, and assign if true *)
  | Bind(n, t) when StringMap.mem n map -> let (t', _, _, _) = StringMap.find n map in 
        (match typ with
          | Dyn -> (match (t', t) with (* todo deal with the WeakBind thing *)
              | (Dyn, Dyn) -> let map' = StringMap.add n (Dyn, Dyn, true, data) map in (map', StrongBind(n, Dyn))
              | (Dyn, _) -> let map' = StringMap.add n (t, t, true, data) map in (map', WeakBind(n, t))
              | (_, Dyn) -> let map' = StringMap.add n (t', t', true, data) map in (map', WeakBind(n, t'))
              | (_, _) -> let map' = StringMap.add n (t, t, true, data) map in (map', WeakBind(n, t)))
          | _ -> (match t' with
            | Dyn -> (match t with 
                  | Dyn -> let map' = StringMap.add n (Dyn, typ, true, data) map in (map', StrongBind(n, typ))
                  | _ when t = typ -> let m' = StringMap.add n (t, t, true, data) map in (m', StrongBind(n, t))
                  | _ -> raise (Failure ("STypeError: invalid type assigned to " ^ n)))
              | _ -> (match t with
                  | Dyn when t' = typ -> (map, StrongBind(n, t'))
                  | _ when t = typ -> let m' = StringMap.add n (t, t, true, data) map in (m', StrongBind(n, t))
                  | _ -> raise (Failure ("STypeError: invalid type assigned to " ^ n)))
              | _ -> raise (Failure ("STypeError: invalid type assigned to " ^ n))))
  | Bind(n, t) when not (StringMap.mem n map) -> if t = typ then let m' = StringMap.add n (t, t, true, data) map in (m', StrongBind(n, t))
        else if t = Dyn then let m' = StringMap.add n (Dyn, typ, true, data) map in (m', StrongBind(n, typ))
        else raise (Failure ("STypeError: invalid type assigned to " ^ n))
  | _ -> raise (Failure ("STypeError: invalid types for assignment."))

(* makes sure an array type can be assigned to a given variable *)
and check_array map e b = let (typ, e', data) = expr map e in match typ with
  | IntArr | FloatArr | BoolArr | StringArr -> (check_assign map (array_to_type typ, e', data) b)
  | Dyn -> let Bind(n, t) = b in let map' = StringMap.add n (t, t, false, data) map in 
    (map, WeakBind(n, t)) (* TODO fix this *)
  | _ -> raise (Failure ("STypeError: invalid types for assignment."))

(* checks an entire function. 

  globals and locals are the globals and locals maps (locals contains all globals).
  out is a sstmt list containing the semanting checked stmts
  data is a (typ, e', sstmt) tuple containing return information for the function
  local_vars is a list of sbinds containing the local variables
  stack is a TypeMap containing the function call stack 
*)

and check_func globals locals out data local_vars stack flag = (function  
  | [] -> ((List.rev out), data, locals, List.sort_uniq compare (List.rev local_vars))
  | a :: t -> let (m', value, d, loc) = func_stmt globals locals stack flag a in (match (data, d) with
      | (None, None) -> check_func globals m' (value :: out) None (loc @ local_vars) stack flag t
      | (None, _) -> check_func globals m' (value :: out) d (loc @ local_vars) stack flag t
      | (_, None) -> check_func globals m' (value :: out) data (loc @ local_vars) stack flag t
      | (_, _) when d = data -> check_func globals m' (value :: out) data (loc @ local_vars) stack flag t
      | _ -> check_func globals m' (value :: out) (Some (Dyn, SNoexpr, None)) (loc @ local_vars) stack flag t))

(* used to evaluate functions and handle return types. 
  will be used to handle closures too. 
  duplicate stmt as much as possible 

  globals and locals are maps containing global and local variables (locals duplicates globals.
  stack is a TypeMap containing the function stack 
*)

and func_stmt globals locals stack flag = function 
  | Return(e) -> let data = func_expr globals locals stack flag e in let (typ, e', d) = data in (locals, SReturn(e'), (Some data), []) (* for closures, match t with FuncType, attach local scope *)
  | Block(s) -> let (value, data, map', out) = check_func globals locals [] None [] stack flag s in (map', SBlock(value), data, out)
  | Asn(binds, e) -> let data = func_expr globals locals stack flag e in let (typ, e', d) = data in
    (match e with 
    | Var(Bind(x, t)) when StringMap.mem x locals -> 
        let info = StringMap.find x locals in
        let rec aux (m, out) = (function
          | [] -> (m, List.rev out)
          | a :: t -> let (m, x) = check_assign locals data a in let Bind(name, _) = a in 
            let map' = StringMap.add name info m in aux (map', x :: out) t)
        in let (m, out) = aux (locals, []) binds in (m, SAsn(out, e'), None, out)
    | _ ->
        let rec aux (m, out) = function
          | [] -> (m, List.rev out)
          | a :: t -> let (m, x) = check_assign locals data a in let Bind(name, _) = a in (aux (m, x :: out) t)
        in let (m, out) = aux (locals, []) binds in (m, SAsn(out, e'), None, out))

  | Expr(e) -> let (t, e', data) = func_expr globals locals stack flag e in (locals, SExpr(e'), None, [])
  | Func(a, b, c) -> let rec dups = function (* check duplicate argument names *)
      | [] -> ()
      | (Bind(n1, _) :: Bind(n2, _) :: _) when n1 = n2 -> raise (Failure ("SyntaxError: duplicate argument '" ^ n1 ^ "' in function definition"))
      | _ :: t -> dups t
    in let _ = dups (List.sort (fun (Bind(a, _)) (Bind(b, _)) -> compare a b) b) in let Bind(x, t) = a in 
    let map' = StringMap.add x (FuncType, FuncType, true, Some(Func(a, b, c))) locals in 

    let semantmap = StringMap.add x (FuncType, FuncType, true, Some(Func(a, b, c))) StringMap.empty in (* empty map for semantic checking *)

    let (map'', bind) = List.fold_left (fun (map, out) (Bind(x, t)) -> let (map', bind) = check_assign map (t, SNoexpr, None) (Bind(x, t)) in (map', bind :: out)) (semantmap, []) b in
    let bindout = List.rev bind in
    let (map2, block, data, locals) = (func_stmt map'' map'' TypeMap.empty true c) in
      (match data with
        | Some (typ2, e', d) -> let Bind(name, btype) = a in 
            if btype <> Dyn && btype <> typ2 then if typ2 <> Dyn then 
            raise (Failure ("STypeError: invalid return type")) else 
            let func = { styp = btype; sfname = name; sformals = (List.rev bindout); slocals = locals; sbody = block } in 
              (map', SFunc(func), None, [StrongBind(x, FuncType)]) else
              let func = { styp = typ2; sfname = name; sformals = (List.rev bindout); slocals = locals; sbody = block } in 
            (map', SFunc(func), None, [StrongBind(x, FuncType)])
        
        | None -> let Bind(name, btype) = a in if btype <> Dyn then 
          raise (Failure ("STypeError: invalid return type")) else 
          let func = { styp = Null; sfname = name; sformals = (List.rev bindout); slocals = locals; sbody = block } in 
          (map', SFunc(func), None, [StrongBind(x, FuncType)]))

  | If(a, b, c) -> let (typ, e', _) = func_expr globals locals stack flag a in 
        let (map', value, data, out) = func_stmt globals locals stack flag b in 
        let (map'', value', data', out') = func_stmt globals locals stack flag c in 
        if equals map' map'' then if data = data' then (map', SIf(e', value, value'), data, out) 
        else (map', SIf(e', value, value'), Some (Dyn, SNoexpr, None), out) else 
        let merged = merge map' map'' in if data = data' 
        then (merged, SIf(e', value, value'), data, out @ out') 
        else (merged, SIf(e', value, value'), Some (Dyn, SNoexpr, None), out @ out')

  | For(a, b, c) -> let (m, x) = check_array locals b a in 
        let (m', x', d, out) = func_stmt globals m stack flag c in 
        let (typ, e', _) = func_expr globals m' stack flag b in 
        if equals locals m' then (m', SFor(x, e', x'), d, out) else 
        let merged = merge locals m' in (merged, SFor(x, e', x'), Some (Dyn, SNoexpr, None), out)

  | While(a, b) -> let (typ, e, data) = func_expr globals locals stack flag a in 
        let (m', x', d, out) = func_stmt globals locals stack flag b in 
        if equals locals m' then (m', SWhile(e, x'), d, out) else
        let merged = merge locals m' in (merged, SWhile(e, x'), Some (Dyn, SNoexpr, None), out)

  | Nop -> let (a, b, out) = stmt locals (Nop) in (a, b, None, out)
  | TypeInfo(a) -> let (a, b, out) = stmt locals (TypeInfo a) in (a, b, None, out)
  | _ as s -> let (map', value, out) = stmt locals s in (map', value, None, [])

(* evaluate statements in the global scope *)
and stmt map = function (* evaluates statements, can pass it a func *)
  | Asn(binds, e) ->  let data = expr map e in let (typ, e', d) = data in
    let rec aux (m, out) = function
      | [] -> (m, List.rev out)
      | a :: t -> let (m, x) = check_assign map data a in let Bind(name, _) = a in (aux (m, x :: out) t)
    in let (m, out) = aux (map, []) binds in (m, SAsn(out, e'), out)
  | Expr(e) -> let (t, e', _) = expr map e in (map, SExpr(e'), [])
  | Block(s) -> let ((value, globals), map') = check map [] [] s in (map', SBlock(value), globals)
  | Return(e) -> raise (Failure ("SyntaxError: return statement outside of function"))
  | Func(a, b, c) -> let rec dups = function (* check duplicate argument names *)
      | [] -> ()
      | (Bind(n1, _) :: Bind(n2, _) :: _) when n1 = n2 -> raise (Failure ("SyntaxError: duplicate argument '" ^ n1 ^ "' in function definition"))
      | _ :: t -> dups t
    in let _ = dups (List.sort (fun (Bind(a, _)) (Bind(b, _)) -> compare a b) b) in let Bind(x, t) = a in 
    let map' = StringMap.add x (FuncType, FuncType, true, Some(Func(a, b, c))) map in 

    let semantmap = StringMap.add x (FuncType, FuncType, true, Some(Func(a, b, c))) StringMap.empty in (* empty map for semantic checking *)

    let (map'', bind) = List.fold_left (fun (map, out) (Bind(x, t)) -> let (map', bind) = check_assign map (t, SNoexpr, None) (Bind(x, t)) in (map', bind :: out)) (semantmap, []) b in
    let bindout = List.rev bind in
    let (map2, block, data, locals) = (func_stmt map'' map'' TypeMap.empty true c) in
      (match data with
        | Some (typ2, e', d) -> let Bind(name, btype) = a in 
            if btype <> Dyn && btype <> typ2 then if typ2 <> Dyn then 
            raise (Failure ("STypeError: invalid return type")) else 
            let func = { styp = btype; sfname = name; sformals = (List.rev bindout); slocals = locals; sbody = block } in 
              (map', SFunc(func), [StrongBind(name, FuncType)]) else
              let func = { styp = typ2; sfname = name; sformals = (List.rev bindout); slocals = locals; sbody = block } in 
            (map', SFunc(func), [StrongBind(name, FuncType)])
        
        | None -> let Bind(name, btype) = a in if btype <> Dyn then 
          raise (Failure ("STypeError: invalid return type")) else 
          let func = { styp = Null; sfname = name; sformals = (List.rev bindout); slocals = locals; sbody = block } in 
          (map', SFunc(func), [StrongBind(name, FuncType)]))

  | If(a, b, c) -> let (typ, e', _) = expr map a in let (map', value, out) = stmt map b in let (map'', value', out') = stmt map c in if equals map' map'' then (map', SIf(e', value, value'), out') else 
         let merged = merge map' map'' in (merged, SIf(e', value, value'), out @ out')

  | For(a, b, c) -> let (m, x) = check_array map b a in let (m', x', out) = stmt m c in let (typ, e', _) = expr m' b in if equals map m' then (m', SFor(x, e', x'), out) else 
        let merged = merge m m' in (merged, SFor(x, e', x'), out)

  | While(a, b) -> let (_, e, _) = expr map a in let (m', x', out) = stmt map b in if equals map m' then (m', SWhile(e, x'), out) else
    let merged = merge map m' in (merged, SWhile(e, x'), out)
  
  | Nop -> (map, SNop, [])
  | TypeInfo(a) -> let (t, e, _) = expr map a in print_endline (type_to_string t); (map, SNop, [])
  | _ as temp -> print_endline ("NotImplementedError: '" ^ (stmt_to_string temp) ^ "' semantic checking not implemented"); (map, SNop, [])

(* check the entire program. out is an sstmt list used to accumulate the output program. globals is the list of global sbinds *)
and check map out globals = function
  | [] -> ((List.rev out, List.sort_uniq compare (List.rev globals)), map)
  | a :: t -> let (m', value, g) = stmt map a in check m' (value :: out) (g @ globals) t

;;