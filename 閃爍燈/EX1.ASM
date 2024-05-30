        ORG     0000H
LOOP:   MOV     P1,#00000010B
        ACALL   DELAY
        MOV     P1,#11111101B
        ACALL   DELAY
        AJMP    LOOP
;
;
DELAY:  MOV     R1,#5
DL3:    MOV     R2,#250
DL2:    MOV     R3,#200
DL1:    DJNZ    R3,DL1
        DJNZ    R2,DL2
        DJNZ    R1,DL3
        

        RET
;
        END
