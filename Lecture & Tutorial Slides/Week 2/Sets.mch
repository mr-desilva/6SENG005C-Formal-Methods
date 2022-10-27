MACHINE Sets

  SETS
    EU = { BEL, NL, LUX, FR, DK, POR, GBR, ITA, IRL, DUT, ESP, GRE } ;

   LETTER = { aa, bb, cc, dd, ee, ff, gg, hh, ii, jj, kk, ll, mm,   
	          nn, oo, pp, qq, rr, ss, tt, uu, vv, ww, xx, yy, zz  } 

  CONSTANTS 
    Benelux,
    AA, BB, CC, DD, 
    Even, Odd, Fives

  PROPERTIES

     Benelux <: EU & Benelux = { BEL, LUX, NL } 
     &
     AA <: LETTER & AA = { aa, bb, cc, dd, ee, ff , gg, hh }            &
     BB <: LETTER & BB = { aa, ee, ii, oo, uu }                         &
     CC <: LETTER & CC = { xx, yy, zz }                                 &
     DD <: LETTER & DD = { ff, oo, rr, mm, aa, ll, ee, tt, hh, dd, ss } 
     &
     Even <: NAT  & Even = { ev | ev : NAT & ev mod 2 = 0 & ev <= 20 } 
     &
     Odd <: NAT   & Odd = { od | od : NAT & od mod 2 = 1 & od <= 20 } 
     &
     Fives <: NAT & Fives = { fi | fi : NAT & fi mod 5 = 0 & fi <= 20 }
    
  VARIABLES 
    homeland, EE, FF, GG 

  INVARIANT
     homeland : EU 
     & 
     EE <: LETTER & FF <: LETTER & GG <: LETTER 

  INITIALISATION 
    homeland, EE, FF, GG  :=  GBR, { ee }, { ff }, { gg } 

END
