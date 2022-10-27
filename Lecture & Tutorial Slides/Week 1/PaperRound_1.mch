/* *************************************************************
 * 6SENG001W Reasoning About Programs
 * Machine:  PaperRound
 * Spec:     Tutorial 1 Sample Solution
 * Author:   P Howells (howellp)
 * Modified: 11/10/2020
 ************************************************************ */
 
/* Exercise 1.1:   
   Create a new "workspace" using Atelier B tool, where you will create your 
   B specifications projects. 
   
   Exercise 1.2:   
   (1) Create a new "project" for the PaperRound B specification within the 
       workspace using Atelier B tool.
   (2) Create a "component", i.e. a B machine, called PaperRound, within the 
       PaperRound project using Atelier B tool.
   
   
   Exercise 1.4
   Syntax & Type Checking the specification, using Atelier B. 
   
   
   Exercise 1.5
   (1) Start up ProB tool & set the number range to 32bit using: 
   
       Preferences > Configurations > MININT..MAXINT (32bit)"
   
   (2) Open (load) the PaperRound.mch specification into ProB.
   
   (3) Set up & initialise it, then animate it by execute a range of operations.
*/
 

/* Exercise 1.3: type in the PaperRound B machine */

MACHINE PaperRound

  VARIABLES 
    houseNumbers
    
  INVARIANT 
    houseNumbers <: NAT1 

  INITIALISATION 
       houseNumbers := {}  


  OPERATIONS

    addNewHouse( newHouse ) =
      PRE
           newHouse : NAT1  &  newHouse /: houseNumbers
      THEN 
           houseNumbers := houseNumbers \/ { newHouse }
      END
      ;

    numbHouses <-- howManyHouses =
                    BEGIN
                          numbHouses := card( houseNumbers )
                    END
                    ;           
  
    /* Exercise 1.6: add operation:  ans <-- getsPapers( houseNumber ) */

    answer <-- getsPapers( houseNumber ) =
              PRE
                     houseNumber : NAT1 & houseNumber : houseNumbers
              THEN
                     answer := 1    
              END
              ; 

    /* Exercise 1.7: add operation:  cancelPapers( houseNumber ) */

    cancelPapers( houseNumber ) = 
      PRE
           houseNumber : NAT1  &  houseNumber : houseNumbers
      THEN 
           houseNumbers := houseNumbers - { houseNumber }
      END
      
     
       
END /* PaperRound */
   

