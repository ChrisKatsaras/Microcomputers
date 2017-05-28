*-----------------------------------------------------------
* Title      :
* Written by :
* Date       :
* Description:
*-----------------------------------------------------------


    ORG    $802A  ;Location of Trap 6 instruction         
    JMP    T6
    
    ORG    $8030
    JMP    T7

    ORG    $9000
START: NOP  
    TRAP   #7
    NOP
    TRAP   #6
    TRAP    #14

    
    ORG   $A000
T6  ORI.W #%0010000000000000,(SP)
    RTE

T7  ANDI.W #%1101111111111111,(SP)
    RTE


    END    START        ; last line of source


*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
