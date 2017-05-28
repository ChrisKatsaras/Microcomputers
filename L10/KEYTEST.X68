*-----------------------------------------------------------
* Title      :
* Written by :
* Date       :
* Description:
*-----------------------------------------------------------
    ORG    $8000
START:                  

INCHR   MOVEA.L #DUART,A0

INCHR2  MOVE.B  SRA(A0),D7
        ANDI.B  #1,D7
        beq     INCHR2
        MOVE.B  RBA(A0),D0
        
        JSR     OUT681
        
        CMP.B   #CR,D0
        BEQ     EXIT
        BRA     INCHR2
EXIT    TRAP    #14

OUT681   MOVE.B   D0,OPR_CLR(A0) ;clr. bits, set pins
         NOT.B    D0
         MOVE.B   D0,OPR_SET(A0) ;set bits, clr. pins
         NOT.B    D0             ;restore D0
         RTS

    ORG    $9000
DUART   EQU $C001
SRA     EQU 2
RBA     EQU 6
CR      EQU $0D
LF      EQU $0A
IPR      EQU      13*2        ;input port register
OPR_SET  EQU      14*2        ;set bit command reg.
OPR_CLR  EQU      15*2        ;clear bit cmd. reg.

    END    START        



*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
