(************************************************************************)
(*  v      *   The Coq Proof Assistant  /  The Coq Development Team     *)
(* <O___,, * CNRS-Ecole Polytechnique-INRIA Futurs-Universite Paris Sud *)
(*   \VV/  **************************************************************)
(*    //   *      This file is distributed under the terms of the       *)
(*         *       GNU Lesser General Public License Version 2.1        *)
(************************************************************************)

(*i $Id: printer.mli 7855 2006-01-12 08:21:57Z herbelin $ i*)

(*i*)
open Pp
open Names
open Libnames
open Term
open Sign
open Environ
open Rawterm
open Pattern
open Nametab
open Termops
open Evd
open Proof_type
open Rawterm
(*i*)

(* These are the entry points for printing terms, context, tac, ... *)

(* Terms *)

val pr_lconstr_env         : env -> constr -> std_ppcmds
val pr_lconstr_env_at_top  : env -> constr -> std_ppcmds
val pr_lconstr             : constr -> std_ppcmds

val pr_constr_env          : env -> constr -> std_ppcmds
val pr_constr              : constr -> std_ppcmds

val pr_ltype_env           : env -> types -> std_ppcmds
val pr_ltype               : types -> std_ppcmds

val pr_type_env            : env -> types -> std_ppcmds
val pr_type                : types -> std_ppcmds

val pr_ljudge_env          : env -> unsafe_judgment -> std_ppcmds * std_ppcmds
val pr_ljudge              : unsafe_judgment -> std_ppcmds * std_ppcmds

val pr_lrawconstr_env      : env -> rawconstr -> std_ppcmds
val pr_lrawconstr          : rawconstr -> std_ppcmds

val pr_rawconstr_env       : env -> rawconstr -> std_ppcmds
val pr_rawconstr           : rawconstr -> std_ppcmds

val pr_constr_pattern_env  : env -> constr_pattern -> std_ppcmds
val pr_constr_pattern      : constr_pattern -> std_ppcmds

val pr_cases_pattern       : cases_pattern -> std_ppcmds

(* Printing global references using names as short as possible *)

val pr_global_env          : Idset.t -> global_reference -> std_ppcmds
val pr_global              : global_reference -> std_ppcmds

val pr_constant            : env -> constant -> std_ppcmds
val pr_existential         : env -> existential -> std_ppcmds
val pr_constructor         : env -> constructor -> std_ppcmds
val pr_inductive           : env -> inductive -> std_ppcmds
val pr_evaluable_reference : evaluable_global_reference -> std_ppcmds

(* Contexts *)

val pr_ne_context_of       : std_ppcmds -> env -> std_ppcmds

val pr_var_decl            : env -> named_declaration -> std_ppcmds
val pr_rel_decl            : env -> rel_declaration -> std_ppcmds

val pr_named_context       : env -> named_context -> std_ppcmds
val pr_named_context_of    : env -> std_ppcmds
val pr_rel_context         : env -> rel_context -> std_ppcmds
val pr_rel_context_of      : env -> std_ppcmds
val pr_context_of          : env -> std_ppcmds

(* Proofs *)

val pr_goal                : goal -> std_ppcmds
val pr_subgoals            : evar_map -> goal list -> std_ppcmds
val pr_subgoal             : int -> goal list -> std_ppcmds

val pr_open_subgoals       : unit -> std_ppcmds
val pr_nth_open_subgoal    : int -> std_ppcmds
val pr_evars_int           : int -> (evar * evar_info) list -> std_ppcmds

val pr_prim_rule           : prim_rule -> std_ppcmds

(* Emacs/proof general support *)

val emacs_str              : string -> string

(* Backwards compatibility *)

val prterm                 : constr -> std_ppcmds (* = pr_lconstr *)
