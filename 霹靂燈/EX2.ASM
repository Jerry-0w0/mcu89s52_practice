        ORG     0000H
START:  MOV     R1,#07H
        MOV     A,#11111110B
LEFT:   MOV     P1,A
        ACALL   DELAY
        RL      A
        DJNZ    R1,LEFT
;
        MOV     R1,#07H
        MOV     A,#01111111B
RIGHT:  MOV     P1,A
        ACALL   DELAY
        RR      A
        DJNZ    R1,RIGHT
        AJMP    START
;-------------DELAY--------------------
DELAY:  MOV     R2,#250
DL1:    MOV     R3,#200
DL2:    DJNZ    R3,DL2
        DJNZ    R2,DL1
        RET
;--------------------------------------
        END
