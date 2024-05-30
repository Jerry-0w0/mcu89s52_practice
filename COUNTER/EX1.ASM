        ORG     0000H
        SETB    P3.4
        MOV     TMOD,#00000110B
        MOV     TH0,#256-2
        MOV     TL0,#256-2
        SETB    TR0
;===================================
        MOV     A,#11111110B
LOOP:   MOV     P1,A
        ACALL   COUNTER
        RL      A
        AJMP    LOOP
;=====================================
COUNTER:JB      TF0,OK
        AJMP    COUNTER
OK:     CLR     TF0
        RET
;========================================
        END
