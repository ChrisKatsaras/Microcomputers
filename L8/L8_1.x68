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
    JSR    QUADRATIC
    LEA    2(sp),sp
    TRAP #14

QUADRATIC
    CLR.L  D1
    CLR.L  D2
    MOVE.W 4(sp),D0
    MOVE.W D0,D2
    MULS   D0,D0
    MULS   #5,D0
    MULS   #2,D2
    SUB.W  D2,D0
    ADD.W  #6,D0
    MOVE.W D0,D1
    RTS

    ORG   $9000
X   DC.W  -5

    END    START        ; last line of source


*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
