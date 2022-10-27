/* *************************************************************
 * 6SENG001W Reasoning About Programs
 * Machine:  Grid
 * Component: PaperRound_3
 * Spec:      Tutorial 3 - X, Y Grid Sample Solutions 
 *            Exercise 3.8 Grid
 * Author:   P Howells (howellp)
 * Modified: 11/10/2020
 ************************************************************ */
 
MACHINE Grid
       
  SETS
      DIRECTION = { Up, Down, Left, Right } ;
      
      REPORT    = {  MovedUp,   MovedUp_Failed,   MovedDown,  MovedDown_Failed,
                     MovedLeft, MovedLeft_Failed, MovedRight, MovedRight_Failed  } 
       
       
  CONSTANTS
     X_axis, X_limit, 
     Y_axis, Y_limit 
         
  PROPERTIES
      X_limit : NAT1  &  X_limit = 9 
      &
      Y_limit : NAT1  &  Y_limit = 7
      &
      X_axis <: NAT1  &  X_axis = 1..9 
      &
      Y_axis <: NAT1  &  Y_axis = 1..7
  
       
   VARIABLES
       xx, yy
       
       
   INVARIANT
       xx : NAT1  &  xx : X_axis 
       &
       yy : NAT1  &  yy : Y_axis 
       
   INITIALISATION
       xx, yy := 1, 1
       
   OPERATIONS
       
       report <-- Move ( direction ) = 
                    PRE
                        direction : DIRECTION 
                    THEN
 
                        CASE direction OF EITHER

                              Up THEN 
                                       IF ( yy < Y_limit )
                                       THEN
                                             yy := yy + 1      || 
                                             report := MovedUp
                                       ELSE
                                             report := MovedUp_Failed
                                       END
                        OR
                           Down THEN 
                                       IF ( yy > 1 )
                                       THEN
                                             yy := yy - 1        || 
                                             report := MovedDown
                                       ELSE
                                             report := MovedDown_Failed
                                       END
                             
                        OR
                           Left THEN 
                                       IF ( xx > 1 )
                                       THEN
                                             xx := xx - 1        || 
                                             report := MovedLeft
                                       ELSE
                                             report := MovedLeft_Failed
                                       END                              
                        OR
                           Right THEN 
                                       IF ( xx < X_limit )
                                       THEN
                                             xx := xx + 1         || 
                                             report := MovedRight
                                       ELSE
                                             report := MovedRight_Failed
                                       END
 
                                 END /* EITHER/THEN */
                        END /* CASE */
                    END /* PRE */
                    ;
                                       
                    
       reset = 
         BEGIN
               xx, yy :=  1, 1
         END
         ;
         
         
        xx_pos, yy_pos <-- position = 
                             BEGIN
                                    xx_pos, yy_pos  :=  xx, yy 
                             END
                             
       
END /* Grid */
   
