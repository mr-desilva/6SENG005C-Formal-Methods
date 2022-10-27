/* *************************************************************
 * 6SENG001W Reasoning About Programs
 * Machine:  Tutorial_5_HotelRooms_solutions
 * Spec:     
 * Author:   P Howells (howellp)
 * Created:  Monday, 9 November 2020
 * Modified: 09/11/2020
 ************************************************************ */
 
MACHINE Tutorial_5_HotelRooms_solutions
       

/* This machine includes HotelRooms.mch 

MACHINE HotelRooms
*/   
 
  SETS        
     ROOM   = { rm1, rm2, rm3, rm4, rm5 } ; 
     NAME   = { Ian, Sue, Tom, Jim, Bill, empty } ; 
     ANSWER = { Yes, No }

  VARIABLES     
     guests

  INVARIANT   
     guests : ROOM <-> NAME

  INITIALISATION 
     guests := ROOM * { empty }     /* All rooms are empty */    
   
   
  
  OPERATIONS

    guestsCheckIn( room, gnames ) =
      PRE
          (room : ROOM) & (gnames <: NAME) & 
          (gnames /= {}) & (empty /: gnames)
      THEN 
            guests := guests <+ ( { room } * gnames ) 
      END ;


    guestsCheckOut( room ) = 
      PRE 
          room : ROOM
      THEN
            guests := guests <+ { room |-> empty } 
      END ; 
   
   
    rmOcc <-- roomOccupants( room ) = 
             PRE 
                 room : ROOM
             THEN 
                   rmOcc := ran( { room } <| guests ) 
             END ;


    ans <-- hasGuestCheckedIn( gname ) =
           PRE 
                (gname : NAME) & (gname /= empty)
           THEN
                IF ( gname : ran(guests) )
                THEN  
                     ans := Yes
                ELSE 
                     ans := No
                END
            END ;  
   
  
    guestsSwapRoom( roomi, roomj ) = 
      PRE
           (roomi : ROOM) & (roomj : ROOM)
      THEN 
          guests := guests 
                    <+ (   ( { roomi } * guests[ { roomj } ] ) 
                        \/  
                           ( { roomj } * guests[ { roomi } ] ) 
                       )
      END 
  
       
// END /* HotelRooms */       
   
   
END /* Tutorial_5_HotelRooms_solutions */
   


/*************************************************************************************  

ProB animation using the Eval terminal, see also the .dot file.

This is the current state of guests when the Exercise 5.3 1 - 6 exercises 
are carried out:


Logged on Mon Nov 09 15:44:10 GMT 2020

>>>> guests
  {(rm1 |-> empty),(rm2 |-> empty),(rm3 |-> empty),(rm4 |-> empty),(rm5 |-> empty)}


>>>> ROOM * { empty }
  {(rm1 |-> empty),(rm2 |-> empty),(rm3 |-> empty),(rm4 |-> empty),(rm5 |-> empty)}
  

// after operations:
//    
//    guestsCheckIn( rm1, { Ian } )
//    guestsCheckIn( rm2, { Sue, Tom } )
//    guestsCheckIn( rm3, { Jim } )
//    guestsCheckOut( rm2 )
//

//////////////////////////////////////////////////////////////////////////////////////
>>>> guests
  {(rm1 |-> Ian),(rm2 |-> empty),(rm3 |-> Jim),(rm4 |-> empty),(rm5 |-> empty)}
  
  
>>>> { rm2 } * { Ian, Sue, Tom }
  {(rm2 |-> Ian),(rm2 |-> Sue),(rm2 |-> Tom)}
  
  
>>>> guests <+ { rm2 } * { Ian, Sue, Tom } 
  {(rm1 |-> Ian),(rm2 |-> Ian),(rm2 |-> Sue),(rm2 |-> Tom),(rm3 |-> Jim),(rm4 |-> empty),(rm5 |-> empty) }
  
  
  
>>>> guests <+ { rm2  |->  empty } 
  {(rm1 |-> Ian),(rm2 |-> empty),(rm3 |-> Jim),(rm4 |-> empty),(rm5 |-> empty)}
  

// after operations:
//    
//    guestsCheckOut( rm2 )
//

>>>> guests
  {(rm1 |-> Ian),(rm2 |-> empty),(rm3 |-> Jim),(rm4 |-> empty),(rm5 |-> empty)}
  

// after operations:
//    
//    guestsCheckIn( rm3, { Ian, Sue, Tom } )
//

>>>> guests
  {(rm1 |-> Ian),(rm2 |-> empty),(rm3 |-> Ian),(rm3 |-> Sue),(rm3 |-> Tom),(rm4 |-> empty),(rm5 |-> empty)}
  
  

//////////////////////////////////////////////////////////////////////////////////////

>>>> {rm1 } <| guests 
  {(rm1 |-> Ian)}


>>>> ran( { rm1 } <| guests )
  {Ian}
  
  
>>>> guests[ { rm1 } ]
  {Ian}
  
  
>>>> guests[ { rm2 } ]
  {empty}
  
  
>>>> guests[ { rm3 } ]
  {Ian,Sue,Tom}
  
  
>>>> guests[ { rm4 } ]
  {empty}
  
  
>>>> guests[ { rm5 } ]
  {empty}
  
  
>>>> dom( guests )
  {rm1,rm2,rm3,rm4,rm5}
  
  
>>>> ran( guests )
  {Ian,Sue,Tom,empty}
  
  

//////////////////////////////////////////////////////////////////////////////////////

>>>> guests
  {(rm1 |-> Ian),(rm2 |-> empty),(rm3 |-> Ian),(rm3 |-> Sue),(rm3 |-> Tom),(rm4 |-> empty),(rm5 |-> empty)}
  

>>>> guests[ { rm1 } ]
  {Ian}
  
  
>>>> guests[ { rm3 } ]
  {Ian,Sue,Tom}
  
  
>>>> { rm1 } * guests[ { rm3 } ]
  {(rm1 |-> Ian),(rm1 |-> Sue),(rm1 |-> Tom)}
  
  
>>>> { rm3 } * guests[ { rm1 } ]
  {(rm3 |-> Ian)}
  
  
>>>> { rm1 } * guests[ { rm3 } ] \/ { rm3 } * guests[ { rm1 } ]
  {(rm1 |-> Ian),(rm1 |-> Sue),(rm1 |-> Tom),(rm3 |-> Ian)}
  
  
>>>> guests
  {(rm1 |-> Ian),(rm2 |-> empty),(rm3 |-> Ian),(rm3 |-> Sue),(rm3 |-> Tom),(rm4 |-> empty),(rm5 |-> empty)}
  
  
>>>> guests <+ ( { rm1 } * guests[ { rm3 } ] \/ { rm3 } * guests[ { rm1 } ] )
  {(rm1 |-> Ian),(rm1 |-> Sue),(rm1 |-> Tom),(rm2 |-> empty),(rm3 |-> Ian),(rm4 |-> empty),(rm5 |-> empty)}
  
  
>>>> guests
  {(rm1 |-> Ian),(rm2 |-> empty),(rm3 |-> Ian),(rm3 |-> Sue),(rm3 |-> Tom),(rm4 |-> empty),(rm5 |-> empty)}
  


// after operation:
//
//   guestsSwapRoom( rm1, rm3 )
//

>>>> guests
  {(rm1 |-> Ian),(rm1 |-> Sue),(rm1 |-> Tom),(rm2 |-> empty),(rm3 |-> Ian),(rm4 |-> empty),(rm5 |-> empty)}
  
>>>> 

//////////////////////////////////////////////////////////////////////////////////////

// See the two ProB files:

//   Tutorial_5_HotelRooms_solutions_STATE.dot

//   Tutorial_5_HotelRooms_solutions_HISTORY.dot


*/