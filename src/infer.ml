open Ast

(* Hindley-Milner type inference support for Coral.
   This module provides type variables, substitutions, and unification. *)

(* Type variable map: maps type variable IDs to their resolved types *)
module TVarMap = Map.Make(struct type t = int let compare = compare end)

type substitution = typ TVarMap.t

(* Fresh type variable generation *)
let tvar_counter = ref 0

let fresh_var () =
  incr tvar_counter;
  TVar(!tvar_counter)

let reset_counter () =
  tvar_counter := 0

let empty_subst : substitution = TVarMap.empty

(* Check if a type variable occurs in a type (prevents infinite types) *)
let rec occurs (var : int) (t : typ) : bool =
  match t with
  | TVar v -> v = var
  | Int | Float | Bool | String | Dyn | Arr | Object | FuncType | Null -> false

(* Apply a substitution to a type, recursively resolving type variables *)
let rec apply_subst (subst : substitution) (t : typ) : typ =
  match t with
  | TVar id ->
    (match TVarMap.find_opt id subst with
    | None -> TVar id  (* Unresolved, keep as-is *)
    | Some t' -> apply_subst subst t')  (* Recursively apply in case t' has vars *)
  | Int | Float | Bool | String | Dyn | Arr | Object | FuncType | Null -> t

(* Extend a substitution by mapping var to t *)
let extend_subst (subst : substitution) (var : int) (t : typ) : substitution =
  TVarMap.add var t subst

(* Compose two substitutions: apply s1 first, then s2 *)
let compose_subst (s1 : substitution) (s2 : substitution) : substitution =
  (* Apply s1 to all types in s2 *)
  let s2_after_s1 = TVarMap.map (apply_subst s1) s2 in
  (* Merge: s1 takes precedence for common keys *)
  TVarMap.merge (fun _ v1 v2 ->
    match v1, v2 with
    | Some x, _ -> Some x
    | None, Some x -> Some x
    | None, None -> None
  ) s1 s2_after_s1

exception UnificationError of string

(* Unify two types, returning an updated substitution *)
let rec unify (t1 : typ) (t2 : typ) (subst : substitution) : substitution =
  (* Apply current substitution first *)
  let t1' = apply_subst subst t1 in
  let t2' = apply_subst subst t2 in

  match t1', t2' with
  (* Same types: no change needed *)
  | t1, t2 when t1 = t2 -> subst

  (* Type variable on one side *)
  | TVar v, t | t, TVar v ->
    (* Occurs check: prevent infinite types like 'a = list['a] *)
    if occurs v t then
      raise (UnificationError
        (Printf.sprintf "Cannot unify: occurs check failed for TVar(%d)" v))
    else
      extend_subst subst v t

  (* Dyn (dynamic type) unifies with anything - gradual typing *)
  | Dyn, _ | _, Dyn -> subst

  (* All other cases: types must match exactly *)
  | t1, t2 ->
    raise (UnificationError
      (Printf.sprintf "Cannot unify %s with %s"
        (string_of_typ t1) (string_of_typ t2)))

(* Replace all unresolved type variables with Dyn *)
let finalize_type (subst : substitution) (t : typ) : typ =
  let t' = apply_subst subst t in
  match t' with
  | TVar _ -> Dyn  (* Unresolved type variable becomes Dyn *)
  | _ -> t'

(* Helper to check if a type is a type variable *)
let is_tvar = function
  | TVar _ -> true
  | _ -> false

(* Get the ID from a type variable, or None *)
let get_tvar_id = function
  | TVar id -> Some id
  | _ -> None

(* Apply substitution to a bind *)
let apply_subst_bind (subst : substitution) (Bind(name, t) : Ast.bind) : Ast.bind =
  Bind(name, finalize_type subst t)

(* SAST transformation functions - apply substitution to resolve TVars *)
open Sast

(* Check if an sstmt is an SStage (dynamic call) *)
let is_sstage = function
  | SStage(_, _, _) -> true
  | _ -> false

let rec apply_subst_sexpr (subst : substitution) ((sexp, t) : sexpr) : sexpr =
  (* For SCall with SStage (dynamic calling), always use Dyn as the result type *)
  let resolved_t = match sexp with
    | SCall(_, _, s) when is_sstage s -> Dyn  (* Dynamic calls return boxed Dyn *)
    | _ -> finalize_type subst t
  in
  (apply_subst_sexp subst sexp, resolved_t)

and apply_subst_sexp (subst : substitution) (sexp : sexp) : sexp =
  match sexp with
  | SBinop(e1, op, e2) -> SBinop(apply_subst_sexpr subst e1, op, apply_subst_sexpr subst e2)
  | SLit(l) -> SLit(l)
  | SVar(s) -> SVar(s)
  | SUnop(op, e) -> SUnop(op, apply_subst_sexpr subst e)
  | SCall(e, args, s) -> SCall(apply_subst_sexpr subst e, List.map (apply_subst_sexpr subst) args, apply_subst_sstmt subst s)
  | SMethod(e, name, args) -> SMethod(apply_subst_sexpr subst e, name, List.map (apply_subst_sexpr subst) args)
  | SField(e, s) -> SField(apply_subst_sexpr subst e, s)
  | SList(exprs, t) -> SList(List.map (apply_subst_sexpr subst) exprs, finalize_type subst t)
  | SNoexpr -> SNoexpr
  | SListAccess(e1, e2) -> SListAccess(apply_subst_sexpr subst e1, apply_subst_sexpr subst e2)
  | SListSlice(e1, e2, e3) -> SListSlice(apply_subst_sexpr subst e1, apply_subst_sexpr subst e2, apply_subst_sexpr subst e3)
  | SCast(t1, t2, e) -> SCast(finalize_type subst t1, finalize_type subst t2, apply_subst_sexpr subst e)

and apply_subst_sstmt (subst : substitution) (stmt : sstmt) : sstmt =
  match stmt with
  | SFunc(fdecl) -> SFunc({
      styp = finalize_type subst fdecl.styp;
      sfname = fdecl.sfname;
      sformals = List.map (apply_subst_bind subst) fdecl.sformals;
      slocals = List.map (apply_subst_bind subst) fdecl.slocals;
      sbody = apply_subst_sstmt subst fdecl.sbody
    })
  | SBlock(stmts) -> SBlock(List.map (apply_subst_sstmt subst) stmts)
  | SExpr(e) -> SExpr(apply_subst_sexpr subst e)
  | SIf(e, s1, s2) -> SIf(apply_subst_sexpr subst e, apply_subst_sstmt subst s1, apply_subst_sstmt subst s2)
  | SFor(b, e, s) -> SFor(apply_subst_bind subst b, apply_subst_sexpr subst e, apply_subst_sstmt subst s)
  | SWhile(e, s) -> SWhile(apply_subst_sexpr subst e, apply_subst_sstmt subst s)
  | SRange(b, e, s) -> SRange(apply_subst_bind subst b, apply_subst_sexpr subst e, apply_subst_sstmt subst s)
  | SReturn(e) -> SReturn(apply_subst_sexpr subst e)
  | SClass(name, s) -> SClass(name, apply_subst_sstmt subst s)
  | SAsn(lvalues, e) -> SAsn(List.map (apply_subst_lvalue subst) lvalues, apply_subst_sexpr subst e)
  | STransform(s, t1, t2) -> STransform(s, finalize_type subst t1, finalize_type subst t2)
  | SStage(s1, s2, s3) -> SStage(apply_subst_sstmt subst s1, apply_subst_sstmt subst s2, apply_subst_sstmt subst s3)
  | SPrint(e) -> SPrint(apply_subst_sexpr subst e)
  | SType(e) -> SType(apply_subst_sexpr subst e)
  | SContinue -> SContinue
  | SBreak -> SBreak
  | SNop -> SNop

and apply_subst_lvalue (subst : substitution) (lv : lvalue) : lvalue =
  match lv with
  | SLVar(b) -> SLVar(apply_subst_bind subst b)
  | SLListAccess(e1, e2) -> SLListAccess(apply_subst_sexpr subst e1, apply_subst_sexpr subst e2)
  | SLListSlice(e1, e2, e3) -> SLListSlice(apply_subst_sexpr subst e1, apply_subst_sexpr subst e2, apply_subst_sexpr subst e3)
