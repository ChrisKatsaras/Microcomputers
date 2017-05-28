*-----------------------------------------------------------
* Title      :
* Written by :
* Date       :
* Description:
*-----------------------------------------------------------
    ORG    $8000
START:                  

INCHR   MOVEA.L #DUART,A0
        MOVEA.L #SCAN,A1
INCHR2  MOVE.B  SRA(A0),D7
        ANDI.B  #1,D7
        beq     INCHR2
        MOVE.B  RBA(A0),D0
        
        move.b  D0,(A1)+
        
        CMP.B   #CR,D0
        BEQ     EXIT
        BRA     INCHR2
EXIT    TRAP    #14

    ORG    $9000
DUART   EQU $C001
SRA     EQU 2
RBA     EQU 6
CR      EQU $0D
LF      EQU $0A
SCAN    DS.B 20
    END    START        



*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
