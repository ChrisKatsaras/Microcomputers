*L4_3.x68      
	
	ORG	 $8000

START  	MOVEA.L #LIST,A0
	MOVE.B	(A0),D0
	MOVE.W	(A0),D0
	MOVE.L	(A0),D0
	TRAP	#14

	ORG	$9000
LIST	DC.B	$2
	DC.B	$4
	DC.B	$6
	DC.B	$8
	
	END	START


*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
