        ORG     0000H
        AJMP    MAIN

;=================================
        ORG     0003H
BUZZER: MOV     R6,#83
        MOV     R5,#200
        ACALL   SOUND
        ACALL   DELAY
        AJMP    BUZZER
        RETI
;================================
MAIN:   SETB    P3.2
        SETB    IT0
        SETB    EX0
        SETB    EA
        
        MOV     A,#11111110B
LOOP:   MOV     P1,A
        ACALL   DELAY
        RL      A
        AJMP    LOOP
;================================
DELAY:  MOV     R4,#100
        MOV     TMOD,#00000000B

TIMER:  MOV     TH0,#>(8192-5000)
        MOV     TL0,#<(8192-5000)
        SETB    TR0
WAIT:   JB      TF0,OK
        AJMP    WAIT

OK:     CLR     TF0
        DJNZ    R4,TIMER
        RET
;================================
SOUND:  CLR     P3.7
        ACALL   DELAY1
        SETB    P3.7
        ACALL   DELAY1
        DJNZ    R5,SOUND
        RET

DELAY1: MOV     B,R6
DL:     MOV     R7,#6
        DJNZ    R7,$
        DJNZ    R6,DL
        MOV     R6,B
        RET
        
        END
