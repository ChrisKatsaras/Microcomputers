*-----------------------------------------------------------
* Title      : Evaluate 
* Written by :
* Date       :
* Description:
*-----------------------------------------------------------
    ORG    $8000
START:                  ; first instruction of program
	
	MOVE.B W+4,D0
	EXT.W  D0
	MULS   W,D0
	EXT.L  D0
	MOVE.W W+2,D1
	EXT.L  D1
	DIVS   #3,D1
	EXT.L  D1
 	ADD.L  D0,D1
	MOVE.L D1,W+6
    TRAP   #14
* Put variables and constants here
	ORG		$9000
W	DC.W	-1
	DC.W    -3
	DC.B    3
	DS.L	1
    END    START        ; last line of source




*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
