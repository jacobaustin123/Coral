(* Code generation: translate takes a semantically checked AST and


LLVM tutorial: Make sure to read the OCaml version of the tutorial

http://llvm.org/docs/tutorial/index.html

Detailed documentation on the OCaml LLVM library:

http://llvm.moe/
http://llvm.moe/ocaml/

*)

module L = Llvm
(*module A = Ast*)
open Ast
open Sast

module StringMap = Map.Make(String)
let pt some_lltype = Printf.printf ";%s%s\n" "---->" (L.string_of_lltype some_lltype)
let pv some_llvalue = Printf.printf ";%s%s\n" "---->" (L.string_of_llvalue some_llvalue)

type oprt =
  | Oprt of
      string
    * ((L.llvalue -> L.llvalue -> string -> L.llbuilder -> L.llvalue) * L.lltype) option
    * ((L.llvalue -> L.llvalue -> string -> L.llbuilder -> L.llvalue) * L.lltype) option
    * ((L.llvalue -> L.llvalue -> string -> L.llbuilder -> L.llvalue) * L.lltype) option
    * ((L.llvalue -> L.llvalue -> string -> L.llbuilder -> L.llvalue) * L.lltype) option
  | Uoprt of
      string
    * ((L.llvalue -> string -> L.llbuilder -> L.llvalue) * L.lltype) option
    * ((L.llvalue -> string -> L.llbuilder -> L.llvalue) * L.lltype) option
    * ((L.llvalue -> string -> L.llbuilder -> L.llvalue) * L.lltype) option
    * ((L.llvalue -> string -> L.llbuilder -> L.llvalue) * L.lltype) option

type built_oprt =
  | BOprt of
      (L.llvalue * L.llbuilder)
    * ((L.llvalue -> L.llvalue -> string -> L.llbuilder -> L.llvalue) * L.lltype) option
    * ((L.llvalue -> L.llvalue -> string -> L.llbuilder -> L.llvalue) * L.lltype) option
    * ((L.llvalue -> L.llvalue -> string -> L.llbuilder -> L.llvalue) * L.lltype) option
    * ((L.llvalue -> L.llvalue -> string -> L.llbuilder -> L.llvalue) * L.lltype) option
  | BUoprt of
      (L.llvalue * L.llbuilder)
    * ((L.llvalue -> string -> L.llbuilder -> L.llvalue) * L.lltype) option
    * ((L.llvalue -> string -> L.llbuilder -> L.llvalue) * L.lltype) option
    * ((L.llvalue -> string -> L.llbuilder -> L.llvalue) * L.lltype) option
    * ((L.llvalue -> string -> L.llbuilder -> L.llvalue) * L.lltype) option

(* translate : Sast.program -> Llvm.module *)
let translate prgm =   (* note this whole thing only takes two things: globals= list of (typ,name) (bindings basically). And functions= list of sfunc_decl's (each has styp sfname sformals slocals sbody) *)
  let context = L.global_context () in  (* context keeps track of global vars and stuff i think *)
  
  (* Create the LLVM compilation module boolo which
     we will generate code *)
  let the_module = L.create_module context "MicroC" in  (* the_module will hold all functs + global vars. its the highest level thing *)

  (* Get types from the context *)
  let int_t      = L.i32_type    context
  and float_t    = L.double_type context
  and bool_t     = L.i1_type     context
  and char_t     = L.i8_type     context in

  (* ptr types *)
  let int_pt = L.pointer_type int_t
  and float_pt = L.pointer_type float_t
  and bool_pt = L.pointer_type bool_t
  and char_pt = L.pointer_type char_t in

  (* define cobj and ctype structs *)
  let cobj_t = L.named_struct_type context "CObj" in (*define a named struct*)
  let cobj_pt = L.pointer_type cobj_t in

  (* define some global values like idxs in ctype and cobj *)
  (* cobj idxs *)
  let cobj_data_idx = 0
  and cobj_type_idx = 1 in

  (* index at which the pointer to the function that handles the operation for the type is found *)
  let ctype_add_idx = 0
  and ctype_sub_idx = 1
  and ctype_mul_idx = 2
  and ctype_div_idx = 3
  and ctype_exp_idx = 4
  and ctype_eq_idx = 5
  and ctype_neq_idx = 6
  and ctype_lesser_idx = 7
  and ctype_leq_idx = 8
  and ctype_greater_idx = 9
  and ctype_geq_idx = 10
  and ctype_and_idx = 11
  and ctype_or_idx = 12
  and ctype_neg_idx = 13
  and ctype_not_idx = 14
  and num_ctype_idxs = 15 in (**must update when adding idxs! (tho not used anywhere yet)**)

  (* type sigs for fns in ctype *)
  let ctype_add_t = L.function_type cobj_pt [| cobj_pt; cobj_pt |]
  and ctype_sub_t = L.function_type cobj_pt [| cobj_pt; cobj_pt |]
  and ctype_mul_t = L.function_type cobj_pt [| cobj_pt; cobj_pt |]
  and ctype_div_t = L.function_type cobj_pt [| cobj_pt; cobj_pt |]
  and ctype_exp_t = L.function_type cobj_pt [| cobj_pt; cobj_pt |]
  and ctype_eq_t = L.function_type cobj_pt [| cobj_pt; cobj_pt |]
  and ctype_neq_t = L.function_type cobj_pt [| cobj_pt; cobj_pt |]
  and ctype_lesser_t = L.function_type cobj_pt [| cobj_pt; cobj_pt |]
  and ctype_leq_t = L.function_type cobj_pt [| cobj_pt; cobj_pt |]
  and ctype_greater_t = L.function_type cobj_pt [| cobj_pt; cobj_pt |]
  and ctype_geq_t = L.function_type cobj_pt [| cobj_pt; cobj_pt |]
  and ctype_and_t = L.function_type cobj_pt [| cobj_pt; cobj_pt |]
  and ctype_or_t = L.function_type cobj_pt [| cobj_pt; cobj_pt |]
  and ctype_neg_t = L.function_type cobj_pt [| cobj_pt |]
  and ctype_not_t = L.function_type cobj_pt [| cobj_pt |] in

  (* type sigs for ptrs to fns in ctype *)
  let ctype_add_pt = L.pointer_type ctype_add_t
  and ctype_sub_pt = L.pointer_type ctype_sub_t
  and ctype_mul_pt = L.pointer_type ctype_mul_t
  and ctype_div_pt = L.pointer_type ctype_div_t
  and ctype_exp_pt = L.pointer_type ctype_exp_t
  and ctype_eq_pt = L.pointer_type ctype_eq_t
  and ctype_neq_pt = L.pointer_type ctype_neq_t
  and ctype_lesser_pt = L.pointer_type ctype_lesser_t
  and ctype_leq_pt = L.pointer_type ctype_leq_t
  and ctype_greater_pt = L.pointer_type ctype_greater_t
  and ctype_geq_pt = L.pointer_type ctype_geq_t
  and ctype_and_pt = L.pointer_type ctype_and_t
  and ctype_or_pt = L.pointer_type ctype_or_t
  and ctype_neg_pt = L.pointer_type ctype_neg_t
  and ctype_not_pt = L.pointer_type ctype_not_t in

  let ctype_t = L.named_struct_type context "CType" in (*define a named struct*)
  let ctype_pt = L.pointer_type ctype_t in

  (* set ctype and cobj struct bodies *)
  ignore(L.struct_set_body cobj_t [| char_pt; ctype_pt |] false);
  ignore(L.struct_set_body ctype_t [|
  	ctype_add_pt;
  	ctype_sub_pt;
  	ctype_mul_pt;
    ctype_div_pt;
    ctype_exp_pt;
    ctype_eq_pt;
    ctype_neq_pt;
    ctype_lesser_pt;
  	ctype_leq_pt;
  	ctype_greater_pt;
  	ctype_geq_pt;
  	ctype_and_pt;
  	ctype_or_pt;
  	ctype_neg_pt;
  	ctype_not_pt |] false);

  let build_ctype_fn fname ftype =   (* ftype = "ctype_add_t" etc *)
    let the_function = L.define_function fname ftype the_module in
    let builder = L.builder_at_end context (L.entry_block the_function) in
    (the_function, builder)
  in

  let get_t = function
    | "int" -> int_t
    | "float" -> float_t
    | "bool" -> bool_t
    | "char" -> char_t
  in

  let built_ops =
  	 let typs = ["int"; "float"; "bool"; "char"] in

  	 let ops = [
  	   Oprt("add", Some((L.build_add), int_t), Some((L.build_fadd), float_t), None, None);
  	   Oprt("sub", Some((L.build_sub), int_t), Some((L.build_fsub), float_t), None, None);
       Oprt("mul", Some((L.build_mul), int_t), Some((L.build_fmul), float_t), None, None);
  	   Oprt("div", Some((L.build_sdiv), int_t), Some((L.build_fdiv), float_t), None, None);
  	   Oprt("exp", None, None, None, None);
       Oprt("eq", Some((L.build_icmp L.Icmp.Eq), bool_t), Some((L.build_fcmp L.Fcmp.Ueq), bool_t), Some((L.build_icmp L.Icmp.Eq), bool_t), Some((L.build_icmp L.Icmp.Eq), bool_t));
  	   Oprt("neq", Some((L.build_icmp L.Icmp.Ne), bool_t), Some((L.build_fcmp L.Fcmp.Une), bool_t), Some((L.build_icmp L.Icmp.Eq), bool_t), Some((L.build_icmp L.Icmp.Eq), bool_t));
       Oprt("lesser", Some((L.build_icmp L.Icmp.Slt), bool_t), Some((L.build_fcmp L.Fcmp.Ult), bool_t), Some((L.build_icmp L.Icmp.Slt), bool_t), Some((L.build_icmp L.Icmp.Slt), bool_t));
  	   Oprt("leq", Some((L.build_icmp L.Icmp.Sle), bool_t), Some((L.build_fcmp L.Fcmp.Ule), bool_t), Some((L.build_icmp L.Icmp.Sle), bool_t), Some((L.build_icmp L.Icmp.Sle), bool_t));
       Oprt("greater", Some((L.build_icmp L.Icmp.Sgt), bool_t), Some((L.build_fcmp L.Fcmp.Ugt), bool_t), Some((L.build_icmp L.Icmp.Sgt), bool_t), Some((L.build_icmp L.Icmp.Sgt), bool_t));
  	   Oprt("geq", Some((L.build_icmp L.Icmp.Sge), bool_t), Some((L.build_fcmp L.Fcmp.Uge), bool_t), Some((L.build_icmp L.Icmp.Sge), bool_t), Some((L.build_icmp L.Icmp.Sge), bool_t));
  	   Oprt("and", Some((L.build_and), int_t), None, Some((L.build_and), bool_t), Some((L.build_add), char_t));
       Oprt("or", Some((L.build_or), int_t), None, Some((L.build_or), bool_t), Some((L.build_or), char_t));
  	   Uoprt("neg", Some((L.build_neg), int_t), Some((L.build_fneg), float_t), Some((L.build_neg), bool_t), Some((L.build_neg), char_t));
  	   Uoprt("not", Some((L.build_not), int_t), Some((L.build_fneg), float_t), Some((L.build_not), bool_t), Some((L.build_not), char_t));
       ] in

  	 List.map (fun t -> let bops = List.map (function
  	 	 | Oprt(o, i, f, b, c) ->
		   let tfn = match t with
			 | "int" -> i
			 | "float" -> f
			 | "bool" -> b
			 | "char" -> c
		   in
		   let bop = match tfn with
			 | Some tfn ->
				let (fn, bd) = build_ctype_fn (t ^ "_" ^ o) ((function
				  | "add" -> ctype_add_t
				  | "sub" -> ctype_sub_t
				  | "mul" -> ctype_mul_t
				  | "div" -> ctype_div_t
				  | "exp" -> ctype_exp_t
				  | "eq" -> ctype_eq_t
				  | "neq" -> ctype_neq_t
				  | "lesser" -> ctype_lesser_t
				  | "leq" -> ctype_leq_t
				  | "leq" -> ctype_leq_t
				  | "greater" -> ctype_greater_t
				  | "geq" -> ctype_geq_t
				  | "and" -> ctype_and_t
				  | "or" -> ctype_or_t
				  | "neg" -> ctype_neg_t
				  | "not" -> ctype_not_t) o)
				in Some(BOprt((fn, bd), i, f, b, c))
			 | None -> None
		   in bop
         | Uoprt(o, i, f, b, c) ->
		   let tfn = match t with
			 | "int" -> i
			 | "float" -> f
			 | "bool" -> b
			 | "char" -> c
		   in
		   let bop = match tfn with
			 | Some tfn ->
				let (fn, bd) = build_ctype_fn (t ^ "_" ^ o) ((function
				  | "add" -> ctype_add_t
				  | "sub" -> ctype_sub_t
				  | "mul" -> ctype_mul_t
				  | "div" -> ctype_div_t
				  | "exp" -> ctype_exp_t
				  | "eq" -> ctype_eq_t
				  | "neq" -> ctype_neq_t
				  | "lesser" -> ctype_lesser_t
				  | "leq" -> ctype_leq_t
				  | "leq" -> ctype_leq_t
				  | "greater" -> ctype_greater_t
				  | "geq" -> ctype_geq_t
				  | "and" -> ctype_and_t
				  | "or" -> ctype_or_t
				  | "neg" -> ctype_neg_t
				  | "not" -> ctype_not_t) o)
				in Some(BUoprt((fn, bd), i, f, b, c))
			 | None -> None
		   in bop) ops
		 in (t, bops)) typs
       in

  (* define the default CTypes *)
  let [ctype_int; ctype_float; ctype_bool; ctype_char] =
  	List.map (fun (t, bops) -> L.define_global ("ctype_" ^ t) (L.const_named_struct ctype_t (Array.of_list (List.map (function
  	  | Some op -> (match op with
  	     | BOprt((fn, bd), i, f, b, c) -> fn
  	     | BUoprt((fn, bd), i, f, b, c) -> fn)
  	  | None -> L.const_pointer_null ctype_add_pt (* this seems hacky *)) bops))) the_module) built_ops in

  let ctype_of_datatype = function
  	  | int_t -> ctype_int
  	  | float_t -> ctype_float
      | bool_t -> ctype_bool
      | char_t -> ctype_char
    in

  (* here's how you go from a cobj to the data value: *)
  let build_getdata_cobj data_type cobj_p b =  (* data_type = int_t etc *)
    (*let x1 = L.build_load (lookup_global_binding "a") "x1" b in*)
    let x2 = L.build_struct_gep cobj_p cobj_data_idx "x2" b in
    let x3 = L.build_load x2 "x3" b in
    let x4 = L.build_bitcast x3 (L.pointer_type data_type) "x4" b in
    let data = L.build_load x4 "data" b in
    data
  in

  let build_getctypefn_cobj ctype_fn_idx cobj_p b =
    let x2 = L.build_struct_gep cobj_p cobj_type_idx "x2" b in
    let x3 = L.build_load x2 "x3" b in  (* x3: ctype_pt *)
    let x4 = L.build_struct_gep x3 ctype_fn_idx "x4" b in
    let fn_ptr = L.build_load x4 "fn_ptr" b in
    fn_ptr
  in

  (** define helper functions for commonly used code snippets **)
  let build_new_cobj data_type builder =
    (* malloc the new object and its data *)
    let objptr = L.build_malloc cobj_t "__new_objptr" builder in (* objptr: cobj_t* *)
    let dataptr = L.build_malloc data_type "__new_dataptr" builder in
    let dataptr_as_i8ptr = L.build_bitcast dataptr char_pt "dataptr_as_i8" builder in
    let ctypefieldptr = L.build_struct_gep objptr cobj_type_idx "ctypefieldptr" builder in
    ignore(L.build_store (ctype_of_datatype data_type) ctypefieldptr builder);

    (* store the data ptr in the object *)
    let datafieldptr = L.build_struct_gep objptr cobj_data_idx "datafieldptr" builder in  (* datafieldptr: i8* *)
    let datafieldptr_as_i8ptrptr = L.build_bitcast datafieldptr (L.pointer_type char_pt) "datafieldptr_as_i8ptrptr" builder in
    ignore(L.build_store dataptr_as_i8ptr datafieldptr_as_i8ptrptr builder);

    (objptr, dataptr)
  in

  let build_new_cobj_init data_type value b =
      let (objptr,dataptr) = build_new_cobj data_type b in
      ignore(L.build_store value dataptr b);
      objptr
  in

  (** manually making the ctype_ functions **)
  (* does alloca, store, then load *)  (* note you should not use this if youre not using the values right away !!!!!! TODO note! *)
  let boilerplate_till_load remote_cobj_p prettyname b =
      ignore(L.set_value_name ("remote_"^prettyname) remote_cobj_p);
      let cobj_pp = L.build_alloca cobj_pt (prettyname^"_p") b in
      ignore(L.build_store remote_cobj_p cobj_pp b);
      let cobj_p = L.build_load cobj_pp (prettyname^"_p") b in
      cobj_p
  in

  (*let quick_def_fn fname ret_type formals_types =
    let ftype = L.function_type ret_type formals_types in
    let the_function = L.define_function fname ftype the_module in
    let builder = L.builder_at_end context (L.entry_block the_function) in
    (the_function, ftype, builder)
    *)

  (* define lookup functions like lltype of typ and lookup for CType of typ or something *)

  let boilerplate_binop data_type fn b =
      let formals_llvalues = (Array.to_list (L.params fn)) in
      let [ remote_self_p; remote_other_p ] = formals_llvalues in

      (* boilerplate *)
      let self_p = boilerplate_till_load remote_self_p "self_p" b in
      let other_p = boilerplate_till_load remote_other_p "other_p" b in

      (* get data *)
      let self_data = build_getdata_cobj data_type self_p b in
      let other_data = build_getdata_cobj data_type other_p b in
      (self_data, other_data)
  in

  let boilerplate_uop data_type fn b =
      let formals_llvalues = (Array.to_list (L.params fn)) in
      let [ remote_self_p ] = formals_llvalues in

      (* boilerplate *)
      let self_p = boilerplate_till_load remote_self_p "self_p" b in

      (* get data *)
      let self_data = build_getdata_cobj data_type self_p b in
      (self_data)
  in

  List.iter (fun (t, bops) -> List.iter (function
    | Some op -> (match op with
       | BOprt((fn, bd), i, f, b, c) ->
          let (tfn, tp) = match t with
	        | "int" -> (function Some(tfn, tp) -> (tfn, tp) | None -> (L.build_add, int_t)) i
	        | "float" -> (function Some(tfn, tp) -> (tfn, tp) | None -> (L.build_add), int_t) f
	        | "bool" -> (function Some(tfn, tp) -> (tfn, tp) | None -> (L.build_add, int_t)) b
	        | "char" -> (function Some(tfn, tp) -> (tfn, tp) | None -> (L.build_add, int_t)) c in
	  	  let (self_data, other_data) = boilerplate_binop (get_t t) fn bd in
	  	  let result_data = tfn self_data other_data "result_data" bd in
		  let result = build_new_cobj_init tp result_data bd in
		  ignore(L.build_ret result bd)
       | BUoprt((fn, bd), i, f, b, c) ->
          let (tfn, tp) = match t with
	        | "int" -> (function Some(tfn, tp) -> (tfn, tp) | None -> (L.build_neg, int_t)) i
	        | "float" -> (function Some(tfn, tp) -> (tfn, tp) | None -> (L.build_neg, int_t)) f
	        | "bool" -> (function Some(tfn, tp) -> (tfn, tp) | None -> (L.build_neg, int_t)) b
	        | "char" -> (function Some(tfn, tp) -> (tfn, tp) | None -> (L.build_neg, int_t)) c in
	  	  let (self_data) = boilerplate_uop (get_t t) fn bd in
	  	  let result_data = tfn self_data "result_data" bd in
		  let result = build_new_cobj_init tp result_data bd in
		  ignore(L.build_ret result bd))
	| None -> ()) bops) built_ops;

  (** allocate for all the bindings and put them in a map **)
  let build_binding_list_global coral_names =   (* coral_names: string list *)  (* returns a stringmap coral_name -> llvalue *)
        List.fold_left (fun map name -> StringMap.add name (L.define_global name (L.const_pointer_null cobj_pt) the_module) map) StringMap.empty coral_names
  and build_binding_list_local coral_names builder =   (* coral_names: string list *)  (* returns a stringmap coral_name -> llvalue *)
        List.fold_left (fun map name -> StringMap.add name (L.build_malloc cobj_pt name builder) map) StringMap.empty coral_names
  (*let example_binding = L.declare_global cobj_ppt "example_binding" the_module in*)
  in
  
  let globals_map =
      let globals_list = List.map (fun sbind -> match sbind with  (* fn to extract coral_names *)
            |WeakBind(coral_name,_)|StrongBind(coral_name,_) -> coral_name
            ) (snd prgm)  (* snd prgrm is the sbind list of globals *) in
  (*let globals_map = build_binding_list_global ["a";"b";"c"] in*)
      build_binding_list_global globals_list
  in
  let lookup_global_binding coral_name = 
    StringMap.find coral_name globals_map
  in


  (* define printf *)
  let printf_t : L.lltype =   (* define the type that the printf function shd be *)
      L.var_arg_function_type int_t [| char_pt |] in
  let printf_func : L.llvalue =   (* now use that type to declare printf (dont fill out the body just declare it in the context) *)
      L.declare_function "printf" printf_t the_module in



  (** setup main() where all the code will go **)
  let main_ftype = L.function_type int_t [||] in   (* ftype is the full llvm function signature *)
  let main_function = L.define_function "main" main_ftype the_module in
  let main_builder = L.builder_at_end context (L.entry_block main_function) in

  (*
  (* basic object creation test *)
  let (objptr,dataptr) = build_new_cobj int_t main_builder in
  ignore(L.build_store objptr (lookup_global_binding "a") main_builder);
  ignore(L.build_store (L.const_int int_t 69) dataptr main_builder);

  let x5 = build_getdata_cobj int_t objptr main_builder in



  (**we'll need one of these per-fn actually**)
  let int_format_str = L.build_global_stringptr "%d\n" "fmt" main_builder
  and float_format_str = L.build_global_stringptr "%g\n" "fmt" main_builder in 


  let retval = L.build_call printf_func [| int_format_str ; (L.const_int int_t 10) |] "printf" main_builder in
  let r2 = L.build_call printf_func [| int_format_str ; x5 |] "printf" main_builder in
*)

  let lookup coral_name namespace = 
      try StringMap.find coral_name namespace
        with Not_found -> lookup_global_binding coral_name
  in

  let int_format_str = L.build_global_stringptr "%d\n" "fmt" main_builder
  and float_format_str = L.build_global_stringptr "%g\n" "fmt" main_builder in 
  
  let rec expr b namespace e = match e with
    | SLit x -> (match x with
        | IntLit i -> build_new_cobj_init int_t (L.const_int int_t i) b
        | BoolLit i ->  build_new_cobj_init bool_t (L.const_int bool_t (if i then 1 else 0)) b
        | FloatLit i ->  build_new_cobj_init float_t (L.const_float float_t i) b
    )
        (* TODO stringlit *)
    | SVar sbind -> (match sbind with
        |WeakBind (coral_name,_) | StrongBind (coral_name,_) -> L.build_load (lookup coral_name namespace) coral_name b
    )
    | SBinop(e1, op, e2) ->
      let e1' = expr b namespace e1
      and e2' = expr b namespace e2 in
      let fn_idx = match op with
        | Add      -> ctype_add_idx
        | Sub      -> ctype_sub_idx
        | Mul      -> ctype_mul_idx
        | Div      -> ctype_div_idx
        | Exp      -> ctype_exp_idx
        | Eq       -> ctype_eq_idx
        | Neq      -> ctype_neq_idx
        | Less     -> ctype_lesser_idx
        | Leq      -> ctype_leq_idx
        | Greater  -> ctype_greater_idx
        | Geq      -> ctype_geq_idx
        | And      -> ctype_and_idx
        | Or       -> ctype_or_idx in
      let fn_p = build_getctypefn_cobj fn_idx e1' b in
        L.build_call fn_p [| e1'; e2' |] "binop_result" b
    | SUnop(op, e) ->
      let e' = expr b namespace e in
      let fn_idx = match op with
        | Neg      -> ctype_neg_idx
        | Not      -> ctype_not_idx in
      let fn_p = build_getctypefn_cobj fn_idx e' b in
        L.build_call fn_p [| e' |] "uop_result" b
    (* | SCall ->
    | SList  L.build_call
    | Snoexper *)

  in

    let add_terminal builder instr = 
      match L.block_terminator (L.insertion_block builder) with  
	    Some _ -> ()   (* do nothing if terminator is there *)
      | None -> ignore (instr builder)
    in   
    
  let the_function = main_function in   (** TEMP **)

  let rec stmt namespace b = function  (* namespace comes first bc never gets modified unless descending so it works better for fold_left in SBlock *)
      (*|SFuncDecl  (* later. do raw nonfunction stuff first *)*)
      |SBlock s -> List.fold_left (stmt namespace) b s
      |SExpr e ->  ignore(expr b namespace e); b
      |SAsn (sbinds,e) ->
        let e' = expr b namespace e in
        List.iter
          (fun sbind -> match sbind with
          |WeakBind (name,_) | StrongBind (name,_) -> ignore(L.build_store e' (lookup name namespace) b)) sbinds; b
      (*|SReturn  (* later *)*)
      |SNop -> b
      |SIf (predicate, then_stmt, else_stmt) ->
         let bool_val = build_getdata_cobj bool_t (expr b namespace predicate) b in
         (*let bool_val = (L.const_bool bool_t 1) in*)
           let merge_bb = L.append_block context "merge" the_function in  
             let build_br_merge = L.build_br merge_bb in 
               let then_bb = L.append_block context "then" the_function in
                 add_terminal (stmt namespace (L.builder_at_end context then_bb) then_stmt) build_br_merge;  
                 let else_bb = L.append_block context "else" the_function in
                   add_terminal (stmt namespace (L.builder_at_end context else_bb) else_stmt) build_br_merge;  (* same deal as with 'then' BB *)
                   ignore(L.build_cond_br bool_val then_bb else_bb b);  
                   L.builder_at_end context merge_bb
      | SWhile (predicate, body) ->
          let pred_bb = L.append_block context "while" the_function in  
            ignore(L.build_br pred_bb b);  
              let body_bb = L.append_block context "while_body" the_function in  
                add_terminal (stmt namespace (L.builder_at_end context body_bb) body)  (L.build_br pred_bb);  
                let pred_builder = L.builder_at_end context pred_bb in  
                  let bool_val = build_getdata_cobj bool_t (expr pred_builder namespace predicate) pred_builder in
                    let merge_bb = L.append_block context "merge" the_function in  
                      ignore(L.build_cond_br bool_val body_bb merge_bb pred_builder);  
                      L.builder_at_end context merge_bb  
    | SPrint e -> ignore(L.build_call printf_func [| int_format_str ; (build_getdata_cobj int_t (expr b namespace e) b) |] "printf" b); (*build_new_cobj_init int_t (L.const_int int_t 0) b;*) b
  in
  


  (*
  let ex = SIf(SLit(BoolLit(true)),SAsn([WeakBind("a",Dyn)],SLit(boolLit(42))),SNop) in
  let main_builder = stmt StringMap.empty main_builder ex in
*)
  let main_builder = stmt StringMap.empty main_builder (SBlock(fst prgm)) in
  (*
  let ex = SAsn([WeakBind("a",Dyn)],SLit(BoolLit(42))) in
  ignore(stmt StringMap.empty main_builder ex);
  *)

  (*
  let objptr = L.build_load (lookup_global_binding "a") "objptr" main_builder in
  let x5 = build_getdata_cobj int_t objptr main_builder in
  (**we'll need one of these per-fn actually**)

  (*
  let objptr = L.build_load (lookup_global_binding "b") "objptr" main_builder in
  let x6 = build_getdata_cobj int_t objptr main_builder in
*)

  let retval = L.build_call printf_func [| int_format_str ; (L.const_int int_t 10) |] "printf" main_builder in
  let r2 = L.build_call printf_func [| int_format_str ; x5 |] "printf" main_builder in
  (*let r2 = L.build_call printf_func [| int_format_str ; x6 |] "printf" main_builder in*)
*)
  
  ignore(L.build_ret (L.const_int int_t 0) main_builder);


  (* L.dump_module the_module; *)
  the_module  (* return the resulting llvm module with all code!! *)
