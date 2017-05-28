*-----------------------------------------------------------
* Title      : Evaluate 
* Written by :
* Date       :
* Description:
*-----------------------------------------------------------
    ORG    $8000
START:                  ; first instruction of program
	
	MOVE.B Y,D0
	EXT.W  D0           ; Have to extend due to the fact that MULS requires a word and not a byte
	MULS   W,D0
	EXT.L  D0           ; Have to extend so that the sign is carried over from the multiplication
	    MOVE.W X,D1
	  EXT.L  D1           ; Have to extned here so the destination is a 32 bit value
	DIVS   #3,D1
    EXT.L  D1           ; Have to extend here so that the result overwrites the remainder value and extends to 32 bit
	ADD.L  D0,D1
	MOVE.L D1,Z
    TRAP   #14
* Put variables and constants here
	ORG		$9000
W	DC.W	1
X	DC.W	 -3
Y	DC.B    -5
Z	DS.L	1
    END    START        ; last line of source





*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
