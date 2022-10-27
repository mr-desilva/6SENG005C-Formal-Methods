/* Club
 * Author: andre
 * Creation date: 10/24/2022
 */
MACHINE Club (NAME, capacity)

    CONSTRAINTS
        capacity : NAT1 & 5 <= capacity & capacity < card(NAME)
    
    SETS
        ANSWER = {yes, no}
    
    CONSTRAINTS
        queuetotal
        
    PROPERTIES
        queuetotal : NAT1 & queuetotal > 2
        
    VARIABLES
        memebers, waiting
        
    INVARIANT
        queuetotal < capacity & members <:NAME
        & waiting <: NAME
        & members /\ waiting = {}
        & card(members) <= capacity
        & card(waiting) <= queuetotal

END
