*-----------------------------------------------------------
* Title      :
* Written by :
* Date       :
* Description:
*-----------------------------------------------------------
    ORG    $8000
START:               
    LEA    $700A,SP
    MOVE.W X,-(sp)
    MOVE.W Y,-(sp)
    MOVE.W Z,-(sp)
    JSR    QUADRATIC
    LEA    6(sp),SP
    TRAP   #14
    

QUADRATIC
    MOVEM.L  D2-D4,-(SP)
    MOVE.W   20(sp),D2
    MOVE.W   18(sp),D3
    MOVE.W   16(sp),D4
    
    MULS    D2,D3   ;2xy section
    MULS    #2,D3
    
    MULS     D2,D2  ;5X^2 section
    MULS     #5,D2
    
    MULS     D4,D4  ;Z*Z
    
    SUB.W    D3,D2
    ADD.W    D4,D2
    MOVE.W   D2,D1
    
    MOVEM.L  (SP)+,D2-D4
    RTS
    
    ORG    $9000
X   DC.W   1
Y   DC.W   2
Z   DC.W   3
    END    START        ; last line of source


*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
