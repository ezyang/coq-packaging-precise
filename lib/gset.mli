(************************************************************************)
(*  v      *   The Coq Proof Assistant  /  The Coq Development Team     *)
(* <O___,, *   INRIA - CNRS - LIX - LRI - PPS - Copyright 1999-2011     *)
(*   \VV/  **************************************************************)
(*    //   *      This file is distributed under the terms of the       *)
(*         *       GNU Lesser General Public License Version 2.1        *)
(************************************************************************)

(*i $Id: gset.mli 14641 2011-11-06 11:59:10Z herbelin $ i*)

(* Sets using the generic comparison function of ocaml. Same interface as
   the module [Set] from the ocaml standard library. *)

type 'a t

val empty : 'a t
val is_empty : 'a t -> bool
val mem : 'a -> 'a t -> bool
val add : 'a -> 'a t -> 'a t
val singleton : 'a -> 'a t
val remove : 'a -> 'a t -> 'a t
val union : 'a t -> 'a t -> 'a t
val inter : 'a t -> 'a t -> 'a t
val diff : 'a t -> 'a t -> 'a t
val compare : 'a t -> 'a t -> int
val equal : 'a t -> 'a t -> bool
val subset : 'a t -> 'a t -> bool
val iter : ('a -> unit) -> 'a t -> unit
val fold : ('a -> 'b -> 'b) -> 'a t -> 'b -> 'b
val cardinal : 'a t -> int
val elements : 'a t -> 'a list
val min_elt : 'a t -> 'a
val max_elt : 'a t -> 'a
val choose : 'a t -> 'a
