*-----------------------------------------------------------
* Title      :
* Written by :
* Date       :
* Description:
*-----------------------------------------------------------
    ORG    $8000
START:
    CLR.l   D0                     
    MOVE.B  #$30,D0      ; Adding Hex 30 into char code
    ADD.B hexVal,D0
    MOVE.B  D0,charCode
    CMP.B  #$39,charCode
    BLS    EXIT
    ADD.B #$7,charCode
EXIT TRAP #14



* Put variables and constants here
    ORG   $9000
hexVal  DC.B $A
charCode DS.B 1
    END    START        ; last line of source

*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
