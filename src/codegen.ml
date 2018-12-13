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
let pt some_lltype = Printf.eprintf "pt: %s%s\n" "---->" (L.string_of_lltype some_lltype)
let pv some_llvalue = Printf.eprintf "pv: %s%s\n" "---->" (L.string_of_llvalue some_llvalue)
let tst() = Printf.eprintf "!!!!!!!!!!";()
let tstp str = Printf.eprintf "%s\n" str;()



(*type state = (L.llvalue StringMap.t) * L.llvalue * L.llbuilder*)
type state = {
    namespace: L.llvalue StringMap.t;
    func: L.llvalue;
    b: L.llbuilder
}

let seq len =
  let rec aux len acc =
    if len < 0 then acc else aux (len - 1) (len::acc)
  in aux (len - 1) []

let initial_list_size = 10
let list_growth_factor = 2

type oprt =
  | Oprt of
      string
    * ((L.llvalue -> L.llvalue -> string -> L.llbuilder -> L.llvalue) * L.lltype) option
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
    * ((L.llvalue -> string -> L.llbuilder -> L.llvalue) * L.lltype) option
  | Loprt of
      string
    * ((L.llvalue -> L.llvalue -> string -> L.llbuilder -> L.llvalue) * L.lltype) option
    * ((L.llvalue -> L.llvalue -> string -> L.llbuilder -> L.llvalue) * L.lltype) option
    * ((L.llvalue -> L.llvalue -> string -> L.llbuilder -> L.llvalue) * L.lltype) option
    * ((L.llvalue -> L.llvalue -> string -> L.llbuilder -> L.llvalue) * L.lltype) option
    * ((L.llvalue -> L.llvalue -> string -> L.llbuilder -> L.llvalue) * L.lltype) option

type built_oprt =
  | BOprt of ((L.llvalue * L.llbuilder) * ((L.llvalue -> L.llvalue -> string -> L.llbuilder -> L.llvalue) * L.lltype)) option
  | BUoprt of ((L.llvalue * L.llbuilder) * ((L.llvalue -> string -> L.llbuilder -> L.llvalue) * L.lltype)) option
  | BLoprt of ((L.llvalue * L.llbuilder) * ((L.llvalue -> L.llvalue -> string -> L.llbuilder -> L.llvalue) * L.lltype)) option

(* translate : Sast.program -> Llvm.module *)
let translate prgm =   (* note this whole thing only takes two things: globals= list of (typ,name) (bindings basically). And functions= list of sfunc_decl's (each has styp sfname sformals slocals sbody) *)
  let context = L.global_context () in  (* context keeps track of global vars and stuff i think *)
  
  (* Create the LLVM compilation module boolo which
     we will generate code *)
  let the_module = L.create_module context "Coral" in  (* the_module will hold all functs + global vars. its the highest level thing *)
  let pm() = L.dump_module the_module in

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
  let cobj_ppt = L.pointer_type cobj_pt in

  (* all generic userdef functions follow this type *)
  let userdef_fn_t = L.function_type cobj_pt [| cobj_ppt |] in   (* takes an argv *)
  let userdef_fn_pt = L.pointer_type userdef_fn_t in

  (* define cobj_list and ctype_list structs *)
  let clist_t = L.named_struct_type context "CList" in (*define a named struct*)
  let clist_pt = L.pointer_type clist_t in

  (* define ctype and ctype structs *)
  let ctype_t = L.named_struct_type context "CType" in (*define a named struct*)
  let ctype_pt = L.pointer_type ctype_t in

  (* cobj idxs *)
  let cobj_data_idx = 0
  and cobj_type_idx = 1 in

  (* clist idxs *)
  let clist_data_idx = 0
  and clist_len_idx = 1
  and clist_cap_idx = 2
  in

  (* ctype idx *)
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
  and ctype_idx_idx = 15
  and ctype_call_idx = 16
  and num_ctype_idxs = 17 in (**must update when adding idxs! (tho not used anywhere yet)**)

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
  and ctype_not_t = L.function_type cobj_pt [| cobj_pt |]
  and ctype_idx_t = L.function_type cobj_pt [| cobj_pt; cobj_pt |]
  and ctype_call_t = L.function_type cobj_pt [| cobj_pt ; cobj_ppt |] in

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
  and ctype_not_pt = L.pointer_type ctype_not_t
  and ctype_idx_pt = L.pointer_type ctype_idx_t
  and ctype_call_pt = L.pointer_type ctype_call_t in

  let ctype_t = L.named_struct_type context "CType" in (*define a named struct*)
  let ctype_pt = L.pointer_type ctype_t in

  (* set ctype and cobj struct bodies *)
  ignore(L.struct_set_body cobj_t [| char_pt; ctype_pt |] false);
  ignore(L.struct_set_body clist_t [| char_pt; int_t; int_t |] false);
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
    ctype_not_pt;
  	ctype_idx_pt;
  	ctype_call_pt |] false);

   let get_t = function
     | "int" -> int_t
     | "float" -> float_t
     | "bool" -> bool_t
     | "char" -> char_t
     | "list" -> clist_t
   in

   let build_ctype_fn fname ftype = (* ftype = "ctype_add_t" etc *)
     let the_function = L.define_function fname ftype the_module in
     let builder = L.builder_at_end context (L.entry_block the_function) in
     (the_function, builder)
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

  let build_getlist_cobj cobj_p b =
    let gep_addr = L.build_struct_gep cobj_p cobj_data_idx "__gep_addr" b in
    let objptr = L.build_load gep_addr "__objptr" b in
    L.build_bitcast objptr clist_pt "__clistptr" b
  in

  let build_idx self_p other_p name b =
    (* get capacity *)
    let gep_addr = L.build_struct_gep self_p clist_cap_idx "__gep_addr" b in
    let gep_addr_as_intptr = L.build_bitcast gep_addr int_pt "__gep_addr_as_intptr" b in
    let capacity = L.build_load gep_addr_as_intptr "__capacity" b in

    (* TODO: throw error if array bounds exceeded *)
    let inbounds = L.build_icmp L.Icmp.Slt other_p capacity "__inbounds" b in (* other_p is index being accessed *)

    (* get elememnt *)
    let gep_addr = L.build_struct_gep self_p clist_data_idx "__gep_addr" b in
    let gep_addr_as_cobjptrptrptr = L.build_bitcast gep_addr (L.pointer_type (L.pointer_type cobj_pt)) "__gep_addr_as_cobjptrptrptr" b in
    let gep_addr_as_cobjptrptr = L.build_load gep_addr_as_cobjptrptrptr "__gep_addr_as_cobjptrptr" b in
    let gep_addr_as_cobjptrptr = L.build_gep gep_addr_as_cobjptrptr [| other_p |] "__gep_addr_as_cobjptrptr" b in (* other_p is offset of sought element *)
    let cobjptr = L.build_load gep_addr_as_cobjptrptr "__cobjptr" b in
    cobjptr
  in

  let built_ops =
  	 let typs = ["int"; "float"; "bool"; "char"; "list"] in

  	 let ops = [
  	   Oprt("add", Some((L.build_add), int_t), Some((L.build_fadd), float_t), None, None, None);
       Oprt("sub", Some((L.build_sub), int_t), Some((L.build_fsub), float_t), None, None, None);
       Oprt("mul", Some((L.build_mul), int_t), Some((L.build_fmul), float_t), None, None, None);
       Oprt("div", Some((L.build_sdiv), int_t), Some((L.build_fdiv), float_t), None, None, None);
       Oprt("exp", None, None, None, None, None);
       Oprt("eq", Some((L.build_icmp L.Icmp.Eq), bool_t), Some((L.build_fcmp L.Fcmp.Ueq), bool_t), Some((L.build_icmp L.Icmp.Eq), bool_t), Some((L.build_icmp L.Icmp.Eq), bool_t), None);
       Oprt("neq", Some((L.build_icmp L.Icmp.Ne), bool_t), Some((L.build_fcmp L.Fcmp.Une), bool_t), Some((L.build_icmp L.Icmp.Eq), bool_t), Some((L.build_icmp L.Icmp.Eq), bool_t), None);
       Oprt("lesser", Some((L.build_icmp L.Icmp.Slt), bool_t), Some((L.build_fcmp L.Fcmp.Ult), bool_t), Some((L.build_icmp L.Icmp.Slt), bool_t), Some((L.build_icmp L.Icmp.Slt), bool_t), None);
       Oprt("leq", Some((L.build_icmp L.Icmp.Sle), bool_t), Some((L.build_fcmp L.Fcmp.Ule), bool_t), Some((L.build_icmp L.Icmp.Sle), bool_t), Some((L.build_icmp L.Icmp.Sle), bool_t), None);
       Oprt("greater", Some((L.build_icmp L.Icmp.Sgt), bool_t), Some((L.build_fcmp L.Fcmp.Ugt), bool_t), Some((L.build_icmp L.Icmp.Sgt), bool_t), Some((L.build_icmp L.Icmp.Sgt), bool_t), None);
       Oprt("geq", Some((L.build_icmp L.Icmp.Sge), bool_t), Some((L.build_fcmp L.Fcmp.Uge), bool_t), Some((L.build_icmp L.Icmp.Sge), bool_t), Some((L.build_icmp L.Icmp.Sge), bool_t), None);
       Oprt("and", Some((L.build_and), int_t), None, Some((L.build_and), bool_t), Some((L.build_add), char_t), None);
       Oprt("or", Some((L.build_or), int_t), None, Some((L.build_or), bool_t), Some((L.build_or), char_t), None);
       Uoprt("neg", Some((L.build_neg), int_t), Some((L.build_fneg), float_t), Some((L.build_neg), bool_t), None, None);
       Uoprt("not", Some((L.build_not), int_t), None, Some((L.build_not), bool_t), Some((L.build_not), char_t), None);
       Loprt("idx", None, None, None, None, Some((build_idx), int_t))
       ] in

  	 List.map (fun t -> let bops = List.map (function
  	    | Oprt(o, i, f, b, c, l) ->
          let tfn = match t with
            | "int" -> i
            | "float" -> f
            | "bool" -> b
            | "char" -> c
            | "list" -> l
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
                | "greater" -> ctype_greater_t
                | "geq" -> ctype_geq_t
                | "and" -> ctype_and_t
                | "or" -> ctype_or_t) o)
				      in BOprt(Some(((fn, bd), tfn)))
			      | None -> BOprt(None)
          in bop
        | Uoprt(o, i, f, b, c, l) ->
          let tfn = match t with
            | "int" -> i
            | "float" -> f
            | "bool" -> b
            | "char" -> c
            | "list" -> l
          in
		      let bop = match tfn with
			      | Some tfn ->
			        let (fn, bd) = build_ctype_fn (t ^ "_" ^ o) ((function
                | "neg" -> ctype_neg_t
                | "not" -> ctype_not_t) o)
				      in BUoprt(Some(((fn, bd), tfn)))
			      | None -> BUoprt(None)
		      in bop
 	      | Loprt(o, i, f, b, c, l) ->
          let tfn = match t with
            | "int" -> i
            | "float" -> f
            | "bool" -> b
            | "char" -> c
            | "list" -> l
		      in
		      let bop = match tfn with
			      | Some tfn ->
			        let (fn, bd) = build_ctype_fn (t ^ "_" ^ o) ((function
                | "idx" -> ctype_idx_t) o)
				      in BLoprt(Some(((fn, bd), tfn)))
			      | None -> BLoprt(None)
          in bop) ops
        in (t, bops)) typs
      in

  (* Functions! *)
  let (func_call_fn,func_call_b) = build_ctype_fn "func_call" ctype_call_t in

  let ctype_func = L.define_global "ctype_func" (L.const_named_struct ctype_t [|
        L.const_pointer_null ctype_add_pt; (* ctype_add_pt *)
        L.const_pointer_null ctype_sub_pt; (* ctype_sub_pt *)
        L.const_pointer_null ctype_mul_pt; (* ctype_mul_pt *)
        L.const_pointer_null ctype_div_pt; (* ctype_div_pt *)
        L.const_pointer_null ctype_exp_pt; (* ctype_exp_pt *)
        L.const_pointer_null ctype_eq_pt; (* ctype_eq_pt *)
        L.const_pointer_null ctype_neq_pt; (* ctype_neq_pt *)
        L.const_pointer_null ctype_lesser_pt; (* ctype_lesser_pt *)
        L.const_pointer_null ctype_leq_pt; (* ctype_leq_pt *)
        L.const_pointer_null ctype_greater_pt; (* ctype_greater_pt *)
        L.const_pointer_null ctype_geq_pt; (* ctype_geq_pt *)
        L.const_pointer_null ctype_and_pt; (* ctype_and_pt *)
        L.const_pointer_null ctype_or_pt; (* ctype_or_pt *)
        L.const_pointer_null ctype_neg_pt; (* ctype_neg_pt *)
        L.const_pointer_null ctype_not_pt; (* ctype_not_pt *)
        L.const_pointer_null ctype_idx_pt; (* ctype_not_pt *)
        func_call_fn; (* ctype_call_pt *)
    |]) the_module in

  let build_fnptr_of_cfo cobj_p b = 
    let x2 = L.build_struct_gep cobj_p cobj_data_idx "x2" b in
    let x3 = L.build_load x2 "x3" b in
    let fnptr = L.build_bitcast x3 userdef_fn_pt "fnptr" b in
    fnptr
  in

  (* define the default CTypes *)
  let [ctype_int; ctype_float; ctype_bool; ctype_char; ctype_list] =
  	List.map (fun (t, bops) -> L.define_global ("ctype_" ^ t) (L.const_named_struct ctype_t (Array.of_list ((List.map(function
  	  | BOprt(o) -> (match o with
  	    | Some(((fn, bd), tfn)) -> fn
  	    | None -> L.const_pointer_null ctype_add_pt)
  	  | BUoprt(o) -> (match o with
  	    | Some(((fn, bd), tfn)) -> fn
  	    | None -> L.const_pointer_null ctype_neg_pt)
  	  | BLoprt(o) -> (match o with
  	    | Some(((fn, bd), tfn)) -> fn
  	    | None -> L.const_pointer_null ctype_idx_pt)) bops) @ ([L.const_pointer_null ctype_call_pt])))) the_module) built_ops
  	    in

  let ctype_of_datatype = function
    | dt when dt = int_t -> ctype_int
    | dt when dt = float_t -> ctype_float
    | dt when dt = bool_t -> ctype_bool
    | dt when dt = char_t -> ctype_char
    | dt when dt = clist_t -> ctype_list
  in

  let build_getctypefn_cobj ctype_fn_idx cobj_p b =
    let x2 = L.build_struct_gep cobj_p cobj_type_idx "x2" b in
    let x3 = L.build_load x2 "x3" b in  (* x3: ctype_pt *)
    let x4 = L.build_struct_gep x3 ctype_fn_idx "x4" b in
    let fn_ptr = L.build_load x4 "fn_ptr" b in
    fn_ptr
  in

  (** define helper functions for commonly used code snippets **)
  let build_new_cobj_empty builder =   
    let objptr = L.build_malloc cobj_t "__new_objptr" builder in (* objptr: cobj_pt* *)
    let datafieldptr = L.build_struct_gep objptr cobj_data_idx "datafieldptr" builder in  (* datafieldptr: i8* *)
    let ctypefieldptr = L.build_struct_gep objptr cobj_type_idx "ctypefieldptr" builder in
    (objptr,datafieldptr,ctypefieldptr)
  in
    
  let build_new_cobj data_type builder =
    (* malloc the new object and its data *)
    let objptr = L.build_malloc cobj_t "__new_objptr" builder in (* objptr: cobj_pt *)
    let dataptr = L.build_malloc data_type "__new_dataptr" builder in
    let dataptr_as_i8ptr = L.build_bitcast dataptr char_pt "dataptr_as_i8" builder in

    (* store ctypeptr in the struct *)
    let ctypefieldptr = L.build_struct_gep objptr cobj_type_idx "ctypefieldptr" builder in
    ignore(L.build_store (ctype_of_datatype data_type) ctypefieldptr builder);

    (* store dataptr in the struct *)
    let datafieldptr = L.build_struct_gep objptr cobj_data_idx "datafieldptr" builder in  (* datafieldptr: i8* *)
    let datafieldptr_as_i8ptrptr = L.build_bitcast datafieldptr (L.pointer_type char_pt) "datafieldptr_as_i8ptrptr" builder in
    ignore(L.build_store dataptr_as_i8ptr datafieldptr_as_i8ptrptr builder);

    (objptr, dataptr)
  in

  let build_new_cobj_init data_type value b =
      let (objptr, dataptr) = build_new_cobj data_type b in
      ignore(L.build_store value dataptr b);
      objptr
  in

  let build_new_clist dataptr_of_cobj elm_pts builder =
    (* len *)
    let length = List.length elm_pts in
    let len = L.const_int int_t length in

    (* cap *)
    let capacity = max length initial_list_size in
    let cap = L.const_int int_t capacity in

    (* dataptr: mallocs empty CObj array *)
    let dataptr = L.build_malloc (L.array_type cobj_pt capacity) "__new_dataptr" builder in
    let dataptr_as_i8ptr = L.build_bitcast dataptr char_pt "dataptr_as_i8" builder in

    let elm_pts_as_cobjptrs = List.map (fun e ->
      let elm_pt_as_cobjptr = L.build_bitcast e cobj_pt "elm_ptr_as_cobjptr" builder
      in elm_pt_as_cobjptr) elm_pts in

    (* null pointers to fill empty capacity *)
    let elms_w_nulls = if List.length elm_pts_as_cobjptrs < capacity
      then elm_pts_as_cobjptrs@(Array.to_list (Array.make (capacity - List.length elm_pts) (L.const_pointer_null cobj_pt)))
      else elm_pts_as_cobjptrs in

    (* stores the data *)
    let store_elms elm idx =
      let gep_addr = L.build_gep dataptr [|L.const_int int_t 0; L.const_int int_t idx|] "__elem_ptr" builder in
      ignore(L.build_store elm gep_addr builder); ()
    in
    ignore(List.iter2 store_elms elms_w_nulls (seq capacity));

    (* store dataptr the struct *)
    let datafieldptr = L.build_struct_gep dataptr_of_cobj clist_data_idx "datafieldptr" builder in  (* datafieldptr: i8* *)
    let datafieldptr_as_i8ptrptr = L.build_bitcast datafieldptr (L.pointer_type char_pt) "datafieldptr_as_i8ptrptr" builder in
    ignore(L.build_store dataptr_as_i8ptr datafieldptr_as_i8ptrptr builder);

    (* store len in the struct *)
    let lenfieldptr = L.build_struct_gep dataptr_of_cobj clist_len_idx "lenfieldptr" builder in  (* lenfieldptr: i32* *)
    ignore(L.build_store len lenfieldptr builder);

    (* store cap in the struct *)
    let capfieldptr = L.build_struct_gep dataptr_of_cobj clist_cap_idx "capfieldptr" builder in  (* capfieldptr: i32* *)
    ignore(L.build_store cap capfieldptr builder);
  in

  (** manually making the ctype_ functions **)
  (* does alloca, store, then load *)  (* note you should not use this if youre not using the values right away !!!!!! *)
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

  let boilerplate_lop data_type fn b =
      (* TODO: throw error if array bounds exceeded *)
    let formals_llvalues = Array.to_list (L.params fn) in
    let [ remote_self_p; remote_other_p ] = formals_llvalues in

    (* boilerplate *)
    let self_p = boilerplate_till_load remote_self_p "self_p" b in
    let other_p = boilerplate_till_load remote_other_p "other_p" b in

    (* get data *)
    let self_data = build_getlist_cobj self_p b in
    let other_data = build_getdata_cobj int_t other_p b in
    (self_data, other_data)
  in

  List.iter (fun (t, bops) -> List.iter (function
    | BOprt(o) -> (match o with
      | Some(((fn, bd), tfn)) ->
        let (tf, tp) = tfn in
        let (self_data, other_data) = boilerplate_binop (get_t t) fn bd in
        let result_data = tf self_data other_data "result_data" bd in
        let result = build_new_cobj_init tp result_data bd in
        ignore(L.build_ret result bd)
      | None -> ())
    | BUoprt(o) -> (match o with
      | Some(((fn, bd), tfn)) ->
        let (tf, tp) = tfn in
        let (self_data) = boilerplate_uop (get_t t) fn bd in
        let result_data = tf self_data "result_data" bd in
        let result = build_new_cobj_init tp result_data bd in
        ignore(L.build_ret result bd)
      | None -> ())
    | BLoprt(o) -> (match o with
      | Some(((fn, bd), tfn)) ->
        let (tf, tp) = tfn in
        let (self_data, other_data) = boilerplate_lop (get_t t) fn bd in
        let result_data = tf self_data other_data "result_data" bd in
        let result = result_data in
        ignore(L.build_ret result bd)
      | None -> ())) bops) built_ops;


    (* Functions! *)
    (* building __call__ for ctype_func *)
        let (fn,b) = (func_call_fn,func_call_b) in
          let formals_llvalues = (Array.to_list (L.params fn)) in
          let [ remote_self_p ; remote_argv ] = formals_llvalues in
          let self_p = boilerplate_till_load remote_self_p "self_p" b in

          (* manual boilerplate for argv since it's not a cobj *)
          ignore(L.set_value_name ("remote_argv") remote_argv);
          let argv_p = L.build_alloca cobj_ppt "argv_p" b in
          ignore(L.build_store remote_argv argv_p b);
          let argv = L.build_load argv_p "argv" b in

          let fn_p = build_fnptr_of_cfo self_p b in
          let result = L.build_call fn_p [|argv|] "result" b in
          ignore(L.build_ret result b);
          
        

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
  let int_format_str = L.build_global_stringptr "%d\n" "fmt" main_builder
  and float_format_str = L.build_global_stringptr "%g\n" "fmt" main_builder in 
  let init_state:state = {namespace=StringMap.empty; func=main_function; b=main_builder} in

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

  (* useful utility functions! *)
  let name_of_sbind sbind = match sbind with
      |WeakBind(name,_) |StrongBind(name,_) -> name
  in
  let names_of_sbindlist sbindlist =
    List.map name_of_sbind sbindlist
  in
(* helper fn: seq 4 == [0;1;2;3] *)
  let seq len =
    let rec aux len acc =
      if len<0 then acc else aux (len-1) (len::acc)
    in aux (len-1) []
  in

  let lookup coral_name namespace = tstp coral_name;
      try StringMap.find coral_name namespace
        with Not_found -> tstp "global"; lookup_global_binding coral_name
  in

  
  let rec expr the_state e = 
      let (namespace,the_function,b) = (the_state.namespace,the_state.func,the_state.b) in
      match e with
    | SLit x -> (match x with
        | IntLit i -> build_new_cobj_init int_t (L.const_int int_t i) b
        | BoolLit i -> build_new_cobj_init bool_t (L.const_int bool_t (if i then 1 else 0)) b
        | FloatLit i -> build_new_cobj_init float_t (L.const_float float_t i) b
        | StringLit i -> let elements = List.rev (Seq.fold_left (fun l ch ->
            let cobj_of_char_ptr = build_new_cobj_init char_t (L.const_int char_t (Char.code ch)) b in
            cobj_of_char_ptr::l) [] (String.to_seq i)) in
          let (objptr, dataptr) = build_new_cobj clist_t b in
          let _ = build_new_clist dataptr elements b in
          objptr
    )
    | SVar sbind -> (match sbind with
        |WeakBind (coral_name,_) | StrongBind (coral_name,_) -> L.build_load (lookup coral_name namespace) coral_name b
    )
    | SCall(fname_sbind, arg_expr_list, sfdecl) ->
            tstp "entering SCALL";
        let argc = List.length arg_expr_list
        (* eval the arg exprs *)
        and llargs = List.map (expr the_state) (List.rev arg_expr_list) in
        let cobj_p_arr_t = L.array_type cobj_pt argc in
        (* allocate stack space for argv *)
        let argv_as_arr = L.build_alloca cobj_p_arr_t "argv_arr" b in
        (* store llargs values in argv *)

        let store_arg llarg idx =
          let gep_addr = L.build_gep argv_as_arr [|L.const_int int_t 0; L.const_int int_t idx|] "arg" b in
          ignore(L.build_store llarg gep_addr b);()
        in

        ignore(List.iter2 store_arg llargs (seq argc));
        (*let argv_as_arr_filled = List.fold_left2 (fun arr llarg idx -> L.build_insertvalue arr llarg idx ("arg"^(string_of_int idx)) b ) argv_as_arr llargs (seq argc) in
        *)
        (*ignore(L.build_store (L.const_array cobj_pt (Array.of_list llargs)) argv_as_arr b);*)
        let argv = L.build_bitcast argv_as_arr cobj_ppt "argv" b in

        (* now we have argv! so we just need to get the fn ptr and call it *)
        let fname = name_of_sbind fname_sbind in
            tstp ("SCALL of "^fname);

        let caller_cobj_p = L.build_load (lookup fname namespace) fname b in
        let call_ptr = build_getctypefn_cobj ctype_call_idx caller_cobj_p b in
        let result = L.build_call call_ptr [|caller_cobj_p;argv|] "result" b in
            tstp "leaving SCALL";
        result
    | SBinop(e1, op, e2) ->
      let e1' = expr the_state e1
      and e2' = expr the_state e2 in
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
        | Or       -> ctype_or_idx
        | ListAccess -> ctype_idx_idx in
      let fn_p = build_getctypefn_cobj fn_idx e1' b in
        L.build_call fn_p [| e1'; e2' |] "binop_result" b
    | SUnop(op, e) ->
      let e' = expr the_state e in
      let fn_idx = match op with
        | Neg         -> ctype_neg_idx
        | Not         -> ctype_not_idx in
      let fn_p = build_getctypefn_cobj fn_idx e' b in
        L.build_call fn_p [| e' |] "uop_result" b
    (* | SCall -> *)
    | SList(el, t) ->
      let elements = List.map (fun e ->
        expr the_state e) el in
      let (objptr, dataptr) = build_new_cobj clist_t b in
      let _ = build_new_clist dataptr elements b in
      objptr
    (* | Snoexper *)
  in

    let add_terminal the_state instr = 
      match L.block_terminator (L.insertion_block the_state.b) with  
	    Some _ -> ()   (* do nothing if terminator is there *)
      | None -> ignore (instr the_state.b)
    in

  let change_builder_state old_state b =
      {namespace=old_state.namespace;func=old_state.func;b=b}
  in

  let rec stmt the_state s =   (* namespace comes first bc never gets modified unless descending so it works better for fold_left in SBlock *)
      let (namespace,the_function,b) = (the_state.namespace,the_state.func,the_state.b) in
      match s with
      (*|SFuncDecl  (* later. do raw nonfunction stuff first *)*)
      |SBlock s -> List.fold_left stmt the_state s
      |SExpr e ->  ignore(expr the_state e); the_state
      |SAsn (sbinds,e) -> (*L.dump_module the_module;*) tstp "entering asn";
        let e' = expr the_state e in tstp "passing checkpoint";
        List.iter (fun sbind -> match sbind with |WeakBind (name,_) | StrongBind (name,_) -> ignore(L.build_store e' (lookup name namespace) b)) sbinds; tstp "leaving asn"; the_state
      (*|SReturn  (* later *)*)
      |SNop -> the_state
      |SIf (predicate, then_stmt, else_stmt) ->
         let bool_val = build_getdata_cobj bool_t (expr the_state predicate) b in
         (*let bool_val = (L.const_bool bool_t 1) in*)
           let merge_bb = L.append_block context "merge" the_function in  
             let build_br_merge = L.build_br merge_bb in 
               let then_bb = L.append_block context "then" the_function in
               let new_state = change_builder_state the_state (L.builder_at_end context then_bb) in
                 add_terminal (stmt new_state then_stmt) build_br_merge;  
               let else_bb = L.append_block context "else" the_function in
               let new_state = change_builder_state the_state (L.builder_at_end context else_bb) in
                 add_terminal (stmt new_state else_stmt) build_br_merge;  (* same deal as with 'then' BB *)
                   ignore(L.build_cond_br bool_val then_bb else_bb b);  
                   let new_state = change_builder_state the_state (L.builder_at_end context merge_bb ) in new_state
      | SWhile (predicate, body) ->
          let pred_bb = L.append_block context "while" the_function in  
            ignore(L.build_br pred_bb b);  
              let body_bb = L.append_block context "while_body" the_function in  
               let new_state = change_builder_state the_state (L.builder_at_end context body_bb) in
                add_terminal (stmt new_state body)  (L.build_br pred_bb);  
                let pred_builder = L.builder_at_end context pred_bb in  
               let new_state = change_builder_state the_state (L.builder_at_end context pred_bb) in
                  let bool_val = build_getdata_cobj bool_t (expr new_state predicate) pred_builder in
                    let merge_bb = L.append_block context "merge" the_function in  
                      ignore(L.build_cond_br bool_val body_bb merge_bb pred_builder);  
                      let new_state = change_builder_state the_state (L.builder_at_end context merge_bb ) in new_state
    | SPrint e -> ignore(L.build_call printf_func [| int_format_str ; (build_getdata_cobj int_t (expr the_state e) b) |] "printf" b); (*build_new_cobj_init int_t (L.const_int int_t 0) b;*) the_state
    | SFunc sfdecl ->
        (* outer scope work: point binding to new cfuncobj *)
        let fname = sfdecl.sfname in
        let the_function = L.define_function fname userdef_fn_t the_module in

        (* manually design the fn object w proper data & type ptrs and put in bind *)
        let _ = 
          let (fn_obj,datafieldptr,ctypefieldptr) = build_new_cobj_empty b in
          let dfp_as_fp = L.build_bitcast datafieldptr (L.pointer_type userdef_fn_pt) "dfp_as_fp" b in
          ignore(L.build_store the_function dfp_as_fp b);  (* store fnptr *)
          ignore(L.build_store ctype_func ctypefieldptr b);  (* store ctype ptr *)
          (* store new object in appropriate binding *)
          ignore(L.build_store fn_obj (lookup fname namespace) b)
        in

        let fn_b = L.builder_at_end context (L.entry_block the_function) in
        (* update the namespace *)
        let fn_namespace =
          let local_names = names_of_sbindlist sfdecl.slocals
          and formal_names = names_of_sbindlist sfdecl.sformals in
          (*List.iter print_endline local_names;*)
          let argc = List.length formal_names
          and argv = Array.get (L.params the_function) 0 in (* argv is first/only arg *)
          let cobj_p_arr_pt = L.pointer_type (L.array_type cobj_pt argc) in
          let formals_arr_p = L.build_bitcast argv cobj_p_arr_pt "formals_arr_p" fn_b in
          (* now formals_arr_p is a ptr to an array of cobj_ps which are the formals *)
          let formals_arr = L.build_load formals_arr_p "formals_arr" fn_b in
          (*let formal_co_pp_list = List.map (fun idx -> L.build_gep formals_arr_p [|0;idx|] ("arg"^(string_of_int idx)) fn_b in*)


          (* Very important! the actual extraction of the formals from formals_arr *)
          let formal_vals = List.map (fun idx -> L.build_extractvalue formals_arr idx ("arg"^(string_of_int idx)) fn_b) (seq argc)  in
            (* now formal_vals is a list of co_ps *)

          let add_formal namespace_wip name cobj_p =  (* alloc a formal *)
              L.set_value_name name cobj_p;  (* cosmetic *)
              let alloca = L.build_alloca cobj_pt name fn_b in
              ignore(L.build_store cobj_p alloca fn_b);
              StringMap.add name alloca namespace_wip
          and add_local namespace_wip name =  (* alloc a local *)
              let alloca = L.build_alloca cobj_pt name fn_b in
              StringMap.add name alloca namespace_wip
          in   (* pull in add_formal and add_local *)
          let added_locals = List.fold_left add_local namespace local_names in
          let added_formals = List.fold_left2 add_formal added_locals formal_names formal_vals
          in added_formals  (* fn_namespace is now equal to this *)
        in

        let int_format_str = L.build_global_stringptr "%d\n" "fmt" fn_b
        and float_format_str = L.build_global_stringptr "%g\n" "fmt" fn_b in 

        (* build function body by calling stmt! *)
        let build_return some_b = L.build_ret (build_new_cobj_init int_t (L.const_int int_t 69) some_b) some_b in
        let fn_state:state = {namespace=fn_namespace;func=the_function;b=fn_b} in
        add_terminal (stmt fn_state sfdecl.sbody) build_return;the_state  (* SFunc() returns the original builder *)
    | SReturn e ->
            L.build_ret (expr the_state e) b; the_state
        

  in

  (*
  let ex = SIf(SLit(BoolLit(true)),SAsn([WeakBind("a",Dyn)],SLit(boolLit(42))),SNop) in
  let main_builder = stmt StringMap.empty main_builder ex in
*)

  let final_state = stmt init_state (SBlock(fst prgm)) in
  (*
  let f = (L.define_function "myfn" (L.function_type (L.void_type context) [||]) the_module) in
  let myb = L.builder_at_end context (L.entry_block f) in
  ignore(L.build_ret_void myb);
  let main_builder = stmt StringMap.empty main_builder (SBlock(fst prgm)) in
  let f = (L.define_function "myfn" (L.function_type (L.void_type context) [||]) the_module) in
  let myb = L.builder_at_end context (L.entry_block f) in
  ignore(L.build_ret_void myb);
  *)


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

  ignore(L.build_ret (L.const_int int_t 0) final_state.b);
  (* pm(); (* prints module *) *)
  the_module  (* return the resulting llvm module with all code!! *)
