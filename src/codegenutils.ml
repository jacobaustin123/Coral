open Ast
open Sast
module L = Llvm

(* debug function *)
let pt some_lltype = Printf.eprintf "pt: %s%s\n" "---->" (L.string_of_lltype some_lltype)
let pv some_llvalue = Printf.eprintf "pv: %s%s\n" "---->" (L.string_of_llvalue some_llvalue)
let tst() = Printf.eprintf "!!!!!!!!!!\n";()
let tstp str = (*Printf.eprintf "%s\n" str; *)()
let pbind bind = tstp (string_of_sbind bind); ()
let _ = L.enable_pretty_stacktrace()
(* Maps *)
module StringMap = Map.Make(String)
module BindMap = Map.Make(struct type t = Ast.bind let compare = Pervasives.compare end)
module SfdeclMap = Map.Make(struct type t = Sast.sfunc_decl let compare = Pervasives.compare end)

let explode s = 
    let rec aux out n =
        match n with
            | 0 -> out
            | _ -> aux ((String.get s (n - 1)) :: out) (n - 1)
    in

    aux [] (String.length s)

(* A wrapper for an Llvalue representing data *)
type dataunit =
    |Raw of L.llvalue     (* where llvalue = i32 or other prim *)
    |Box of L.llvalue     (* where llvalue = cobj_pt *)
(* A wrapper for an Llvalue representing an address *)
type dataunit_addr = 
    |RawAddr of L.llvalue (* where llvalue = i32_pt, like what alloca returned *)
    |BoxAddr of L.llvalue * bool  (* bool is needs_update: a flag to tell you if the box contents need to be updated by a heapify() call before the next usage *)
(* a record keeping track of the current state throughout expr and stmt evaluation *)

type state = {
    namespace: dataunit_addr BindMap.t;
    func: L.llvalue;
    ret_typ: typ;
    b: L.llbuilder;
    optim_funcs: L.llvalue SfdeclMap.t;
    generic_func: bool;  (* true if in a totally cfunctionobject function (unoptim) *)
}

(* a type used by change_state() to succinctly update the state record *)
type state_component = 
    | S_names of dataunit_addr BindMap.t
    | S_rettyp of typ
    | S_func of L.llvalue
    | S_b of L.llbuilder
    | S_optimfuncs of L.llvalue SfdeclMap.t
    | S_needs_reboxing of string * bool
    | S_generic_func of bool
    | S_list of state_component list

(* create a quick list of ints *) 
let seq len =
  let rec aux len acc =
    if len < 0 then acc else aux (len - 1) (len::acc)
  in aux (len - 1) []

type binop_builder = ((L.llvalue -> L.llvalue -> string -> L.llbuilder -> L.llvalue) * L.lltype)
type call_builder = ((L.llvalue -> L.llvalue array -> string -> L.llbuilder -> L.llvalue) * L.lltype)
type unop_builder = ((L.llvalue -> string -> L.llbuilder -> L.llvalue) * L.lltype)

(* operator generation! *)
type oprt =
  | Oprt of
      string * binop_builder option * binop_builder option * binop_builder option * binop_builder option * binop_builder option * binop_builder option * binop_builder option
  | Coprt of
      string * call_builder option * call_builder option * call_builder option * call_builder option * call_builder option * call_builder option * call_builder option
  | Uoprt of
      string * unop_builder option * unop_builder option * unop_builder option * unop_builder option * unop_builder option * unop_builder option * unop_builder option

(* operators after they've been built *)
type built_oprt =
  | BOprt of string * (((L.llvalue * L.llbuilder) * ((L.llvalue -> L.llvalue -> string -> L.llbuilder -> L.llvalue) * L.lltype)) option)
  | BCoprt of string * (((L.llvalue * L.llbuilder) * ((L.llvalue -> L.llvalue array -> string -> L.llbuilder -> L.llvalue) * L.lltype)) option)
  | BUoprt of string * (((L.llvalue * L.llbuilder) * ((L.llvalue -> string -> L.llbuilder -> L.llvalue) * L.lltype)) option)