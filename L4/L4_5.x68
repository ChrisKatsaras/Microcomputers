*L4_5.x68      
	
	ORG	$8000
START  	MOVEA.L #LIST,A0
	MOVE.L	(A0)+,D0
	MOVE.W	(A0)+,D0
	MOVE.B	(A0)+,D0
	TRAP	#14

	ORG	$9000
LIST	DC.L	$12345678
	DC.W	$9ABC
	DC.B	$DE
	END	START