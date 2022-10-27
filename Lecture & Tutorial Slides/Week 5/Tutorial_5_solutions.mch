/* *************************************************************
 * 6SENG001W Reasoning About Programs
 * Machine:  Tutorial_5_solutions, 
 *           This machine includes the whole of Relations.mch
 * Spec:     Solutions for some of the Tutorial 5 Exercises.
 * Author:   P Howells (howellp)
 * Created:  Monday, 9 November 2020
 * Modified: 09/11/2020
 ************************************************************ */
 
MACHINE Tutorial_5_solutions
       
  
// I have included Relations.mch in this solutions machine.
//
// MACHINE Relations

  SETS
    PEOPLE = { Paul, Jim, Sue, Ian } ;

    COLOUR = { purple, red, blue, pink, orange, green, yellow } ;

    LETTER = { aa, bb, cc, dd, ee, ff, gg, hh, ii, jj, kk, 
               ll, mm, nn, oo, pp, qq, rr, ss, tt, uu, vv, 
               ww, xx, yy, zz                               } ;
    
    COUNTRY = { Wales, Canada, England, France, Scotland, 
                NIreland, Germany, Italy, Spain, USA      } ;

    LANGUAGE = { Welsh, French, English, Spanish, German, Italian } 
   
  CONSTANTS 
     AA, XX, 
     R1, R2, R3,
     alphabet,
     RR, QQ

  PROPERTIES
     AA <: LETTER      &  AA = { aa, bb }  
     &
     
     XX <: NAT         &  XX = { 1, 2, 3 } 
     &
     
     R1 : LETTER <-> NAT  
     & 
     R1 = { aa |-> 1, bb |-> 1, bb |-> 2, cc |-> 3, dd |-> 2, 
	        ee |-> 4, ff |-> 4, gg |-> 5, hh |-> 6 }
     & 
     
     R2 : LETTER <-> NAT  
     &
     R2 = { aa |-> 1, bb |-> 1, bb |-> 2, cc |-> 3, dd |-> 2 }
     &
     
     R3 : LETTER <-> NAT  & 
     R3 = { ee |-> 4, ff |-> 4, gg |-> 5, hh |-> 6 }
     &
    
    alphabet : LETTER <-> LETTER   &
     alphabet = { aa |-> bb, bb |-> cc, cc |-> dd, dd |-> ee, 
                  ee |-> ff, ff |-> gg, gg |-> hh, hh |-> ii,
                  aa |-> xx, bb |-> yy, cc |-> zz             }
     &
     RR : NAT <-> NAT  
     &
     RR = { 0 |-> 0, 1 |-> 2, 2 |-> 3, 3 |-> 3, 3 |-> 4, 3 |-> 5, 4 |-> 5 }
     &
     
     QQ : NAT <-> NAT  
     &
     QQ = { 0 |-> 1, 3 |-> 3, 4 |-> 5, 4 |-> 6, 5 |-> 5, 6 |-> 7 }


  VARIABLES 
    speaks, 
    favourite,
    AAxXX

  INVARIANT
    speaks    : COUNTRY <-> LANGUAGE  
    &
    favourite : PEOPLE <-> COLOUR     
    &
    AAxXX <: AA * XX 
 
  INITIALISATION 

       speaks := { Wales    |-> Welsh,     Scotland |-> English,
                   NIreland |-> English,   England  |-> English, 
                   Canada   |-> English,   Canada   |-> French, 
                   France   |-> French,    Italy    |-> Italian, 
                   USA      |-> English,   USA      |-> Spanish, 
                   Spain    |-> Spanish,   Germany  |-> German   }
    ||
       favourite := { Paul |-> purple, Paul |-> red, Jim |-> blue, 
                      Sue  |-> pink,    Ian |-> blue               }
    ||
    AAxXX := AA * XX  

// END // of Relations.mch  



  /* 
     Exercises 1. Run Relations.mch in Atelier B & ProB. 
     
     Exercises 1 - 2.8.1 
     Require you to use ProB to evaluate B relation expressions 
     using the definitions given in Relations.mch.  So to check 
     them type them into ProB's Eval terminal. You can also use 
     the Evaluation terminal to help you.
  */   
  
  ASSERTIONS    
      
     /*
        Exercises 2.  Evaluate the following expressions     
        
        Add B expression to Relations.mch as ASSERTIONS. This can only be 
        done for expressions that evaluate to a boolean truth value.
        As the purpose of ASSERTIONS is to evaluate their truth value.
        So this is only appropriate for Exercises 2.2.
     */
      
     // Exercises 2.2, 

     (Paul, purple) :  favourite ;   // true
     (Paul, pink)   :  favourite ;   // false
     (Paul, blue)   /: favourite ;   // true
 
     (Wales, French) :  speaks ;     // false
     (Canada, Welsh) /: speaks ;     // true


      /* 
         Exercise 2.8.2 Using Overriding modify people’s choice of their 
                        favourite colour(s)
                        
          We can demonstrate this by using ASSERTIONS to show that our 
          solutions achieve the desired result on the favourite relation.
          NOTE: these are not cumulative, but all are applied to the original 
          definition of favourite. 
      */

      // 1. Paul’s favourite colour is now blue, not red & purple.
     
      favourite <+ { Paul |-> blue } = { Paul |-> blue, Jim |-> blue, Sue |-> pink, Ian|->blue } ;
      // true
   
      // 2. Sue’s favourite colours are now pink & purple, not just pink.
   
      favourite <+ { Sue |-> pink, Sue |-> purple } 
         = { Paul |-> purple, Paul |-> red, Jim |-> blue, Sue |-> pink, Sue |-> purple, Ian|->blue } ;
      // true


      // 3. Ian’s favourite colours are now green & yellow, not just blue.

      favourite <+ { Ian |-> green, Ian |-> yellow }  
         = { Paul |-> purple, Paul |-> red, Jim |-> blue, Sue |-> pink, Ian |-> green, Ian |-> yellow } 
      // true

       
END /* Tutorial_5_solutions */
   
