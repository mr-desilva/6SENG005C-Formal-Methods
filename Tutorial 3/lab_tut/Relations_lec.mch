/* Relations_lec
 * Author: andre
 * Creation date: 11/3/2022
 */
MACHINE
    Relations_lec
SETS
    
    COLOR = { purple, red, blue, pink, orange, green, yellow };

    LETTER = { aa, bb, cc, dd, ee, ff, gg, hh, ii, jj, kk, 
               ll, mm, nn, oo, pp, qq, rr, ss, tt, uu, vv, 
               ww, xx, yy, zz                               } ;
    
    COUNTRY = { Wales, Canada, England, France, Scotland, 
                NIreland, Germany, Italy, Spain, USA      } ;

    LANGUAGE = { Welsh, French, English, Spanish, German, Italian }
    
CONSTANTS
    AA, XX
    
PROPERTIES
    AA <: LETTER & AA = {aa, bb} & 
    XX <: NAT1 & XX = {1 ,2, 3}

VARIABLES
    speaks
    
INVARIANT
    speaks : COUNTRY <-> LANGUAGE
INITIALISATION
    speaks := { Wales    |-> Welsh,     Scotland |-> English,
                   NIreland |-> English,   England  |-> English, 
                   Canada   |-> English,   Canada   |-> French, 
                   France   |-> French,    Italy    |-> Italian, 
                   USA      |-> English,   USA      |-> Spanish, 
                   Spain    |-> Spanish,   Germany  |-> German   }
END
