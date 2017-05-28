******************************************************
* TWOHZ.x68                                          *
*                                                    *
* This program uses the 68681 timer to create a 2 Hz *
* square wave on OP3.  If the 68681 X1 input is      *
* driven at 3.6864 MHz, then the frequency on OP3    *
* equals                                             *
*                                                    *
*       3686400 / 2 / 16 / COUNT                     *
*                                                    *
* where COUNT is the 16-bit integer in the timer     *
* registers CTUR and CTLR.  CTUR holds the upper     *
* byte, CTLR holds the lower byte.                   *
******************************************************
DUART    EQU      $00C001  ;68681 base address
STOP     EQU      $1E
ISR      EQU      $A
ACR      EQU      4*2      ;auxiliary control reg.
CTUR     EQU      6*2      ;counter/timer upper reg.
CTLR     EQU      7*2      ;counter/timer lower reg.
OPCR     EQU      13*2     ;output port config. reg.
COUNT    EQU      14400    ;2 Hz count (see above)
IPR      EQU      13*2        ;input port register
OPR_SET  EQU      14*2        ;set bit command reg.
OPR_CLR  EQU      15*2        ;clear bit cmd. reg.


         ORG      $8000
START    MOVEA.L  #DUART,A0
         MOVE.L   #COUNT,D0
         MOVEP.W  D0,CTUR(A0)
         MOVE.B   #$70,ACR(A0)   ;crystal clock / 16
*         MOVE.B   #$04,OPCR(A0)  ;timer output to OP3
         
LOOP     MOVE.B   ISR(A0),D0
         AND.B    #8,D0
         BEQ      LOOP
         TST.B    STOP(A0)
         JSR        OUT681
         BRA      loop             ;now relax a bit

OUT681   MOVE.B   D1,OPR_CLR(A0) ;clr. bits, set pins
         NOT.B    D1
         MOVE.B   D1,OPR_SET(A0) ;set bits, clr. pins
         RTS
         
         END      START

*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
