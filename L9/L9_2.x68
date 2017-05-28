*-----------------------------------------------------------
* Title      :
* Written by :
* Date       :
* Description:
*-----------------------------------------------------------
    ORG    $1000
START:       
    MOVE.W   #1234,-(SP)
    MOVE.W   (SP),D0
    JSR    REC
    TRAP   #14
    
REC
    LINK  A0,#-4
    CLR.L D0
    MOVE.W 8(A0),D0
    CMP.W  #0,D0
    BEQ   QUIT
     
    DIVS   #10,D0
    MOVE.W D0,-4(A0)
    MOVE.W D0,-(SP)
    SWAP   D0
    MOVE.W D0,-2(A0)
    
    JSR REC
    
    MOVE.L  #6,D0
    MOVE.W  -2(A0),D1
    ADD.W   #48,D1
    TRAP    #15
    
QUIT  
    UNLK    A0
    RTS

    END    START        ; last line of source



*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
