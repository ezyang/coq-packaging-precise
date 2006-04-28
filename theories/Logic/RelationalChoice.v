(************************************************************************)
(*  v      *   The Coq Proof Assistant  /  The Coq Development Team     *)
(* <O___,, * CNRS-Ecole Polytechnique-INRIA Futurs-Universite Paris Sud *)
(*   \VV/  **************************************************************)
(*    //   *      This file is distributed under the terms of the       *)
(*         *       GNU Lesser General Public License Version 2.1        *)
(************************************************************************)

(*i $Id: RelationalChoice.v 6001 2004-08-01 09:27:26Z herbelin $ i*)

(** This file axiomatizes the relational form of the axiom of choice *)

Axiom
  relational_choice :
    forall (A B:Type) (R:A -> B -> Prop),
      (forall x:A,  exists y : B, R x y) ->
       exists R' : A -> B -> Prop,
        (forall x:A,
            exists y : B,
             R x y /\ R' x y /\ (forall y':B, R' x y' -> y = y')).
