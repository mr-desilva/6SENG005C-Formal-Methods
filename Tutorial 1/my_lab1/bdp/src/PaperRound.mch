/* PaperRound
 * Author: andre
 * Creation date: 10/10/2022
 */
MACHINE PaperRound

ABSTRACT_VARIABLES houseset
INVARIANT
    houseset <: NAT1
INITIALISATION
    houseset := {}
OPERATIONS
    add ( new ) =
    PRE
        new : NAT1 & new /: houseset
    THEN
        houseset := houseset \/ { new }
    END ;

    ans <-- number =
    BEGIN
        ans := card ( houseset )
    END
END
