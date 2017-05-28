*-----------------------------------------------------------
* Title      :
* Written by :
* Date       :
* Description:
*-----------------------------------------------------------
    ORG    $8000
START:                  ; first instruction of program
    LEA    $700A,SP
    PEA    X
    PEA    Y
    PEA    Z
    PEA    W
    JSR    QUADRATIC
    LEA    16(SP),SP
    TRAP   #14
    
    
QUADRATIC
    MOVEM.L D2-D4/A0,-(SP)
    
    MOVEA.L 28(SP),A0
    MOVE.W  (A0),D3
    MOVEA.L 32(SP),A0
    MOVE.W  (A0),D2
    MOVEA.L 24(SP),A0
    MOVE.W  (A0),D4
    
    MULS    D2,D3
    MULS    #4,D3
        
    MULS    D2,D2
    MULS    #5,D2
    
    MULS    D4,D4
    
    SUB.W   D3,D2
    ADD.W   D4,D2
    
    MOVEA.L 20(SP),A0
    MOVE.W  D2,D1
    
    MOVEM.L (SP)+,D2-D4/A0
    RTS

    ORG    $9000
X   DC.W   1
Y   DC.W   2
Z   DC.W   3
W   DS.W   1
    END    START        ; last line of source


*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
