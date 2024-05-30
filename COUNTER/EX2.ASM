        ORG     0000H
        SETB    P1.0
        MOV     T2CON,#00000110B
        MOV     TH2,#0FFH
        MOV     TL2,#0FFH
        SETB    TR2
;===================================
        MOV     A,#11111110B
LOOP:   MOV     P1,A
        ACALL   COUNTER
        RL      A
        AJMP    LOOP
;=====================================
COUNTER:JB      TF2,OK
        AJMP    COUNTER
OK:     CLR     TF2
        RET
;========================================
        END

