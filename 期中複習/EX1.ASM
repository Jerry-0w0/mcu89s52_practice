        ORG     0000H
        AJMP    MAIN
;============================
MAIN:   MOV     A,#11111110B
        SETB    
LOOP:   MOV     P1,A
        ACALL   DELAY
        RL      A
        AJMP    LOOP
;=============================
DELAY:  MOV     R4,#140
        MOV     TMOD,#00000000B

TIMER:  MOV     TH0,#>(8192-5000)
        MOV     TL0,#<(8192-5000)
        SETB    TR0
WAIT:   JB      TF0,OK
        AJMP    WAIT

OK:     CLR     TF0
        DJNZ    R4,TIMER
        RET
;
        END
