*Lab4_1.x68

	
VALUE	 EQU	100

	 ORG	 $8000
START	 MOVE.B  #100,D0
	 MOVE.B  #VALUE,D0
	 MOVE.W  #(VALUE*VALUE),D0
	 MOVE.L  #(VALUE*VALUE*VALUE),D0			
	 TRAP	 #14	
  	 END	START		
