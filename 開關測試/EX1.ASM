;=======初始?=========
        ORG     0000H
        MOV     R1,#11110101B
        MOV     R2,#11111101B
        MOV     R4,#01010101B
;=======開關測試=======
TEST:   ORL     P0,#0FFH        ;令P0.0~P0.7皆輸出1
        JNB     P0.0,CASE1
        JNB     P0.1,CASE2
        JNB     P0.2,CASE3
        JNB     P0.3,CASE4
        AJMP    TEST
;=======執行對應輸出===

CASE1:  MOV     A,R1
        MOV     P1,A
        XRL     A,#00001010B
        MOV     R1,A
        ACALL   DELAY
        AJMP   TEST

CASE2:  MOV     A,R2
        MOV     P1,A
        XRL     A,#00000010B
        MOV     R2,A
        ACALL   DELAY
        AJMP    TEST

CASE3:  MOV     R0,#09H
        MOV     R3,#01111111B
        MOV     B ,#11111110B
        MOV     A,B
LOOP1:  ANL     A ,R3
        MOV     P1,A
        MOV     A,R3
        RL      A
        MOV     R3,A
        MOV     A,B
        RR      A
        MOV     B,A
        ACALL   DELAY
        DJNZ    R0,LOOP1
        MOV     P1,#11111111B
        ACALL   DELAY
        AJMP    TEST
        

CASE4:  MOV     A,R4
        MOV     P1,A
        XRL     A,#10101010B
        MOV     R4,A
        ACALL   DELAY
        AJMP   TEST
;=======延遲========
DELAY:  MOV     R5,#2
DL1:    MOV     R6,#250
DL2:    MOV     R7,#200
DL3:    DJNZ    R7,DL3
        DJNZ    R6,DL2
        DJNZ    R5,DL1
        RET
;===================

        END

