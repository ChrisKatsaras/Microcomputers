*-----------------------------------------------------------
* Title      :
* Written by :
* Date       :
* Description:
*-----------------------------------------------------------
    ORG    $8000
START:                 
    LEA    $700A,SP 
    MOVE.W X,-(SP)  
    MOVE.W Y,-(SP)
    PEA    Z
    JSR    SQUARESUM
    LEA 8(SP),SP
    TRAP   #14
    
    
SQUARESUM
    LINK    A0,#-6     ;Allocates the stack from for 6 bytes
    MOVEM.L D2-D5/A1,-(SP) ;Stores the states of registers
    
    MOVE.W  14(A0),D2  ;Register for U calc
    MOVE.W  12(A0),D3  ;Register for Y calc
    MOVE.W  14(A0),D4  ;Register for W calc
    MOVEA.L 8(A0),A1   ;Register for V address
    
    MULS    D3,D4      ;W calculations
    MULS    #2,D4
    
    MULS    D3,D3      ;V calculations
    
    MULS    D2,D2      ;U calculations
    
    MOVE.W  D2,-2(A0)  ;U 
    MOVE.W  D3,-4(A0)  ;V 
    MOVE.W  D4,-6(A0)  ;W 
    ADD.W   D2,D5      ;Adds values for Z
    ADD.W   D3,D5
    ADD.W   D4,D5
    MOVE.W  D5,(A1)    ;Stores the value at z's address
    
    MOVEM.L (SP)+,D2-D5/A1 ;Restores the states of the registers
    UNLK    A0             ;Frees the memory allocated for the stack frame
    RTS

    ORG    $9000
X   DC.W   -1   
Y   DC.W   2
Z   DC.W   3
    END    START        ; last line of source

*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
