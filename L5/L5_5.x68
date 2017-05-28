*-----------------------------------------------------------
* Title      :
* Written by :
* Date       :
* Description:
*-----------------------------------------------------------
        ORG    $8000
START:                 
        MOVE.W num1,D1
        MOVE.W num2,D2
        MOVE.W num3,D3
        CMP.W  D2,D1
        BLT    TWO
        CMP.W  D3,D1
        BLT    TWO
        MOVE.W num1,biggest
        BRA EXIT
        
TWO     CMP.W D3,D2
        BLT   THREE
        MOVE.W num2,biggest
        BRA EXIT
THREE   MOVE.B num3,biggest
        
EXIT    TRAP #14
        ORG    $9000
num1    DC.W   4
num2    DC.W   2
num3    DC.W   3
biggest DS.W   1
        
    END    START        ; last line of source

*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
