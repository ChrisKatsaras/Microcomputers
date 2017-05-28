*-----------------------------------------------------------
* Title      :
* Written by :
* Date       :
* Description:
*-----------------------------------------------------------
        ORG    $8000
START:                 
        MOVE.B  #30,D0 ;Moving the value into the first column
        MOVE.B  #25,D1 ;Moving the value into the second column
        CLR.L   D2
        CLR.L   D3
        
LOOP   
*        ASL     #1,D0
*        ASR     #1,D1
        MOVE.L  D1,D2
        ANDI.B  #1,D2
        BEQ     SKIP
        ADD.L   D0,D3
SKIP

        CMPI    #1,D1
        ASL     #1,D0
        ASR     #1,D1
        BNE     LOOP
        TRAP    #14
        ORG    $9000

    END    START        ; last line of source


*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
