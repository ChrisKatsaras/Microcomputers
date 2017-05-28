*-----------------------------------------------------------
* Title      :
* Written by :
* Date       :
* Description:
*-----------------------------------------------------------
        ORG    $8000
START:  CLR.L D0       ;Clearing match
        MOVE.B #$FF,D0 ;Match status
        LEA   FIRST,A0
        LEA   SECOND,A1
        
LOOP    MOVE.B  (A0)+,D1
        MOVE.B  (A1)+,D2
        CMP.B    D1,D2
        BEQ      SKIP
        CLR.L    D0
SKIP    CMP.B   #$53,D1
        BEQ     EXIT   
        CMP.B   #$FF,D0 
        BEQ     LOOP 
                 
EXIT    TRAP    #14
        ORG    $9000
FIRST   DC.L   'CHRSD'   
        ORG    $9020
SECOND  DC.L   'CHRSD'
        END    START        ; last line of source




*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
