(************************************************************************)
(*  v      *   The Coq Proof Assistant  /  The Coq Development Team     *)
(* <O___,, * CNRS-Ecole Polytechnique-INRIA Futurs-Universite Paris Sud *)
(*   \VV/  **************************************************************)
(*    //   *      This file is distributed under the terms of the       *)
(*         *       GNU Lesser General Public License Version 2.1        *)
(************************************************************************)

(*i $Id: recordops.mli 6748 2005-02-18 22:17:50Z herbelin $ i*)

(*i*)
open Names
open Nametab
open Term
open Libnames
open Classops
open Libobject
open Library
(*i*)

(*s A structure S is a non recursive inductive type with a single
   constructor (the name of which defaults to Build_S) *)

type struc_typ = {
  s_CONST : identifier; 
  s_PARAM : int;
  s_PROJKIND : bool list;
  s_PROJ : constant option list }

val declare_structure : 
  inductive * identifier * int * bool list * constant option list -> unit

(* [lookup_structure isp] returns the infos associated to inductive path
   [isp] if it corresponds to a structure, otherwise fails with [Not_found] *)
val lookup_structure : inductive -> struc_typ

(* raise [Not_found] if not a projection *)
val find_projection_nparams : global_reference -> int

(*s A canonical structure declares "canonical" conversion hints between *)
(*  the effective components of a structure and the projections of the  *)
(*  structure *)

type obj_typ = {
  o_DEF : constr;
  o_TABS : constr list;    (* ordered *)
  o_TPARAMS : constr list; (* ordered *)
  o_TCOMPS : constr list } (* ordered *)
               
val lookup_canonical_conversion : (global_reference * global_reference) -> obj_typ
val declare_canonical_structure : global_reference -> unit
val canonical_projections : unit -> 
  ((global_reference * global_reference) * obj_typ) list
