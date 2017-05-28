*-----------------------------------------------------------
* Title      :
* Written by :
* Date       :
* Description:
*-----------------------------------------------------------
        ORG    $8000
START:        
        LEA    MATRIX,A0         CLR.L  D0
        CLR.L  D1
        CLR.L  D0           
LOOPI   CMP.B  #2,D0 ;Outer loop
        BGT    EXIT
        MOVE.B D0,D1 ;Moves i into j
        ADD.B  #1,D1 ;Adds 1 to j 
LOOPJ   CMP.B  #3,D1 ;Inner loop
        BGT    BREAKJ
        
        CLR.L  D2
        MOVE.B D0,D2 ;i into spot
        MULU   #4,D2 ;x 4
        ADD.B  D1,D2
            
        CLR.L  D3
        MOVE.B D1,D3 ;j into spot
        MULU   #4,D3 ; x 4
        ADD.B  D0,D3
        CLR.L  TEMP
        MOVE.B 0(A0,D2.L),TEMP
        MOVE.B 0(A0,D3.L),0(A0,D2.L)
        MOVE.B TEMP,0(A0,D3.L)
        
        ADD.B #$1,D1
        BRA    LOOPJ
BREAKJ  ADD.B  #$1,D0
        BRA    LOOPI
        
EXIT    TRAP   #14
        ORG    $9000
MATRIX  DC.B    1,2,3,4
        DC.B    5,6,7,8
        DC.B    9,10,11,12
        DC.B    13,14,15,16
TEMP    DS.B    1
    END    START        ; last line of source


*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
