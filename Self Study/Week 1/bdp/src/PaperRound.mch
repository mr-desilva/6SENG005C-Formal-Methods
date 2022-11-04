/* PaperRound
 * Author: andre
 * Creation date: 11/3/2022
 */
MACHINE PaperRound
   ABSTRACT_VARIABLES houseset    /**/
   INVARIANT houseset <: NAT1        /* house set is a subset of natural number set*/
   INITIALISATION houseset := {} /* initial value - house set is a empty set*/

   OPERATIONS
       /* adding a new element to the house set*/
       add ( new ) =
       PRE new : NAT1 & new /: houseset
       THEN
           houseset := houseset \/ { new } /* Adding a new element to the house set by taking the union of the house set + new element */
       END ;


       /* next operation is a inquiry type operation which will not change a value */
       ans <-- number =                /* shows the output */
       BEGIN
           ans := card ( houseset ) /* take the cardinality of the house set and save the output in the ans variable */
       END
END
