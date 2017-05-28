*-----------------------------------------------------------
* Title      :
* Written by :
* Date       :
* Description:
*-----------------------------------------------------------
        ORG    $8000
START:  
        MOVE.W num1,D1 ;Moves the values into the data registers
        MOVE.W num2,D2
        MOVE.W num3,D3               
        CMP.W  D1,D2   ;Checks to see if D2 is bigger than D1
        BGT ELSE       ;If it is then branch to the else label 
        CMP.W  D1,D3   ;If D1 is bigger than D2, check to see if D3 is bigger than D1
        BGT NUM3BIG    ;If it is then branch to the NUM3BIG label
        MOVE.W num1,biggest ;If we have no branched elsewhere by this point than num1 is the biggest
        BRA EXIT
NUM3BIG MOVE.W num3,biggest ;Num 3 is the biggest, so move it to the biggest variable
        BRA EXIT
ELSE    CMP.W D2,D3
        BGT NUM3BIG ;If D3 is bigger than D2 than branch to NUM3BIG label
        MOVE.W num2,biggest ;If D2 is bigger than D3 then we move num2 into biggest
        
EXIT    TRAP #14
        ORG    $9000
num1    DC.W   -4
num2    DC.W   2
num3    DC.W   3
biggest DS.W   1
    END    START        ; last line of source

*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
