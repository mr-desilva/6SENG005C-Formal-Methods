/* ***********************************************
** 6SENG001W Reasoning about Programs  2020/21
** Component: PaperRound_3
** Spec:      Tutorial 3 - PaperRound Sample Solutions 
**            Exercises 3.1 - 3.7
** Author:    P Howells (howellp)
** Modified:  4/10/2020
*********************************************** */

/* Exercise 3.1: 
   Add operations - firsthouse, lasthouse, haspaper, stopdelivery
   
*/

MACHINE  PaperRound_3

  SETS
    ANSWER = { yes, no } ;

    OUTCOME = { NoMoreDeliveries, NotDeliveredTo, NotDeliveringPaperAndMagazine } ;

    STATUS = { PaperAndMagazine, OnlyPaper, OnlyMagazine, NoDeliveries, NotBothPaperAndMagazine }
               

  CONSTANTS
      MAX_DELIVERIES                        /* Exercise 3.7: Max house deliveries to just 10. */
     
  PROPERTIES
      MAX_DELIVERIES : NAT1  &  MAX_DELIVERIES = 10


  VARIABLES 
    paperHouses,
    magazineHouses                          /* Exercise 3.3: Magazine houses variable */

  INVARIANT 
    paperHouses <: NAT1 
    &
    card( paperHouses ) <= MAX_DELIVERIES   /* Exercise 3.7: Max house deliveries to just 10. */
    &
    magazineHouses <: NAT1 
    &
    magazineHouses <: paperHouses     /* Exercise 3.5: Add an additional condition to the INVARIANT - 
                                                       all Magazine houses also have to have a paper 
                                                       delivered, i.e. they must also be paper houses  
                                                       that is a subset of them.
                                      */

   /* Errors - try requesting to deliver a magazine to a non-paper house */
   
  
  INITIALISATION 
       paperHouses := {}  
    ||
       magazineHouses := {}



  OPERATIONS

    addNewHouse( newHouse ) =
      PRE
           newHouse : NAT1  &  newHouse /: paperHouses & 
           card( paperHouses ) < MAX_DELIVERIES            /* Exercise 3.7 */
      THEN 
           paperHouses := paperHouses \/ { newHouse }
      END
      ;

    numbHouses <-- howManyHouses =
                     BEGIN
                           numbHouses := card( paperHouses )
                     END
                     ;           

    ans <-- getsPapers( houseNumber ) =
              PRE
                     houseNumber : NAT1 & houseNumber : paperHouses
              THEN
                     ans := 1    
              END
              ; 


    //  Using PRE-condition to avoid  min( {} )  error
    housenumb <-- firsthouse_v1 =
                    PRE
                          paperHouses /= {} 
                    THEN
                          housenumb := min( paperHouses )
                    END
                    ;
                  
                  
    //  Using IF & returning a very large number to avoid  min( {} )  error
    housenumb <-- firsthouse_v2 =
                  BEGIN
                         IF ( paperHouses /= {} )
                         THEN
                               housenumb := min( paperHouses )
                         ELSE
                               housenumb := 99999       
                         END
                  END
                  ;


    housenumb <-- lasthouse =
                  BEGIN
                        IF ( paperHouses /= {} )
                        THEN
                              housenumb := max( paperHouses )
                        ELSE
                              housenumb := 0
                        END
                  END
                  ;

    answer <-- haspaper( housenumb ) = 
               PRE
                    housenumb : NAT1
               THEN
                     IF ( housenumb : paperHouses )
                     THEN
                           answer := yes
                     ELSE
                           answer := no
                     END
               END
               ;


    outcome <-- stopdelivery( housenumb ) = 
                PRE
                     housenumb : NAT1
                THEN
                     IF ( housenumb : paperHouses )
                     THEN
                             paperHouses := paperHouses - { housenumb }
                           ||
                             outcome := NoMoreDeliveries 
                     ELSE
                           outcome := NotDeliveredTo
                     END
                END
                ;

///////////////////////////////////////////////////////////////////////
/* 
   Exercise 3.4 
   Add new Magazine operations: 
     deliverMagazine, stopMagazine, deliveries, stopalldeliverys 

*/

    deliverMagazine( housenumb ) = 
      PRE
           housenumb : NAT1  &  housenumb /: magazineHouses &
           housenumb : paperHouses                                   /* Exercise 3.7 */
      THEN 
           magazineHouses := magazineHouses \/ { housenumb }
      END
      ;
 
    stopMagazine( housenumb ) = 
      PRE
           housenumb : NAT1
      THEN
            magazineHouses := magazineHouses - { housenumb }
      END
      ;

    status <-- deliveries( housenumb ) = 
      PRE
           status : STATUS  &  housenumb : NAT1
      THEN
            IF ( ( housenumb : paperHouses ) & ( housenumb : magazineHouses) )
            THEN
                  status := PaperAndMagazine  

            ELSIF ( housenumb : paperHouses )  
            THEN   
                  status := OnlyPaper  

            ELSIF ( housenumb : magazineHouses )  
            THEN  
                  status := OnlyMagazine
            ELSE
                  status := NoDeliveries
            END
       END
       ;



    outcome <-- stopalldeliverys( housenumb ) = 
                PRE
                     outcome : OUTCOME  &  housenumb : NAT1
                THEN
                     IF ( ( housenumb : paperHouses ) & ( housenumb : magazineHouses) )
                     THEN
                             paperHouses := paperHouses - { housenumb }
                          ||
                             magazineHouses := magazineHouses - { housenumb }
                          ||
                             outcome := NoMoreDeliveries 
                     ELSE
                           outcome := NotDeliveringPaperAndMagazine  
                     END
                END
                ;

/*  Exercise 3.7
    (1) Max house deliveries to just 10.
    (2) Add operation: howmanymore
    
*/

   moreDeliveries <-- howManyMore =
            BEGIN
                   moreDeliveries :=   MAX_DELIVERIES - card( paperHouses ) 
            END


END /* PaperRound_3 */


/***********************************************************
   Exercise 3.2: 
   Test Table  - this is a sample of what you could do.
   
===============================================================
OPERATION                     EXPECTED                   ACTUAL    
& CASES         INPUT         OUTPUT                     OUTPUT  
===============================================================

add(new)
new >= 1     
                new = 1       paperHouses = { 1 }
                new = 5       paperHouses = { 1, 5 }
                new = 10      paperHouses = { 1, 5, 10 }

new = 0
                new = 0       PRE-COND fails
                              paperHouses = { 1, 5, 10 }

new < 0
                new = -1      PRE-COND fails
                              paperHouses = { 1, 5, 10 }
---------------------------------------------------------------
ans <-- number

card(paperHouses) = 0
paperHouses = {}              card({}) = 0
                              ans = 0

card(paperHouses) > 0
paperHouses = { 1, 5, 10 }    card( { 1, 5, 10 } )
                              ans = 3
---------------------------------------------------------------
housenumb <-- firsthouse 

paperHouses = {}              paperHouses /= {}  == FALSE
                              housenumb = 99999

paperHouses /= {}
paperHouses = { 1, 5, 10 }    paperHouses /= {}  == TRUE
                              min( { 1, 5, 10 } ) = 1
                              housenumb = 1
       
---------------------------------------------------------------
housenumb <-- lasthouse  

paperHouses = {}              paperHouses /= {}  == FALSE
                              housenumb = 0

paperHouses /= {}
paperHouses = { 1, 5, 10 }    paperHouses /= {}  == TRUE
                              max( { 1, 5, 10 } ) = 10
                              housenumb = 10
       
---------------------------------------------------------------
answer <-- haspaper( housenumb )

housenumb = 0                
                              PRE-COND fails: 0 /: NAT1
                              
housenumb < 0                
housenumb = -1                PRE-COND fails: -1 /: NAT1
 
 
paperHouses = { 1, 5, 10 } 
housenumb >= 1  

housenumb = 1                 1 : paperHouses == TRUE
                              answer = yes

housenumb = 3                 3 : paperHouses == FALSE
                              answer = no

---------------------------------------------------------------
outcome <-- stopdelivery( housenumb )

....

etc, etc,....

************************************************************/
