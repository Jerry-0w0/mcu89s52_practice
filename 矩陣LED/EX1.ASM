        ORG     0000H
START:  MOV     DPTR,#TABLE
        MOV     R3,#8
LOOP:   MOV     R2,#62
SCAN:   ACALL   SCAN1
        DJNZ    R2,SCAN
        INC     DPTR
        INC     DPTR
        INC     DPTR
        INC     DPTR
        INC     DPTR
        INC     DPTR
        INC     DPTR
        INC     DPTR

        DJNZ    R3,LOOP
        AJMP    START
;================================
SCAN1:  MOV     R1,#00H
        MOV     R5,#11111110B
        MOV     R4,#08
LOOP1:  MOV     A,R1
        MOVC     A,@A+DPTR
        MOV     P3,A
        MOV     P1,R5
        MOV     R6,#5
DL1:    MOV     R7,#200
DL2:    DJNZ    R7,DL2
        DJNZ    R6,DL1
        ORL     P1,#11111111B
        MOV     A,R5
        RL      A
        MOV     R5,A
        INC     R1
        DJNZ    R4,LOOP1
        RET
;============================
;S
TABLE:  DB      11000001B
        DB      10111111B
        DB      10111111B
        DB      11000011B
        DB      11111101B
        DB      11111101B
        DB      10111101B
        DB      11000011B

;U
        DB      10111101B
        DB      10111101B
        DB      10111101B
        DB      10111101B
        DB      10111101B
        DB      10111101B
        DB      10111101B
        DB      11000011B
;P
        DB      10000011B
        DB      10111101B
        DB      10111101B
        DB      10000011B
        DB      10111111B
        DB      10111111B
        DB      10111111B
        DB      10111111B
;E
        DB      10000001B
        DB      10111111B
        DB      10111111B
        DB      10000011B
        DB      10111111B
        DB      10111111B
        DB      10111111B
        DB      10000001B
;R
        DB      10000011B
        DB      10111101B
        DB      10111101B
        DB      10000011B
        DB      10101111B
        DB      10110111B
        DB      10111011B
        DB      10111101B
;E
        DB      10000001B
        DB      10111111B
        DB      10111111B
        DB      10000011B
        DB      10111111B
        DB      10111111B
        DB      10111111B
        DB      10000001B
;E
        DB      10000001B
        DB      10111111B
        DB      10111111B
        DB      10000011B
        DB      10111111B
        DB      10111111B
        DB      10111111B
        DB      10000001B
;2
OK:     DB      11000011B
        DB      10111101B
        DB      11111101B
        DB      11111101B
        DB      11110011B
        DB      11001111B
        DB      10111111B
        DB      10000001B
;
        END
