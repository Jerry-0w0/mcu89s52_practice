        ORG     0000H
        CLR     C
        CLR     A
        AJMP    LOOP

KEY5:   JC      KEY5_1
        MOV     R1,#5H
        ACALL   DELAY
        JNC     LOOP
KEY5_1: MOV     A,#50H
        ADD     A,R1
        DA      A
        MOV     P1,A

KEY6:   JC      KEY6_1
        MOV     R1,#6H
        ACALL   DELAY
        JNC     LOOP
KEY6_1: MOV     A,#60H
        ADD     A,R1
        DA      A
        MOV     P1,A

KEY7:   JC      KEY7_1
        MOV     R1,#7H
        ACALL   DELAY
        JNC     LOOP
KEY7_1: MOV     A,#70H
        ADD     A,R1
        DA      A
        MOV     P1,A

KEY8:   JC      KEY8_1
        MOV     R1,#8H
        ACALL   DELAY
        JNC     LOOP
KEY8_1: MOV     A,#80H
        ADD     A,R1
        DA      A
        MOV     P1,A

KEY9:   JC      KEY9_1
        MOV     R1,#9H
        ACALL   DELAY
        JNC     LOOP
KEY9_1: MOV     A,#90H
        ADD     A,R1
        DA      A
        MOV     P1,A

LOOP:   MOV     P3,#01111111B
        JNB     P3.3,KEY0
        JNB     P3.2,KEY1
        JNB     P3.1,KEY2
        JNB     P3.0,KEY3
;
        MOV     P3,#10111111B
        JNB     P3.3,KEY4
        JNB     P3.2,KEY5
        JNB     P3.1,KEY6
        JNB     P3.0,KEY7
        MOV     P3,#11011111B
        JNB     P3.3,KEY8
        JNB     P3.2,KEY9

        AJMP    LOOP
;
KEY0:   JC      KEY0_1
        MOV     R1,#0H
        ACALL   DELAY
        JNC     LOOP
KEY0_1: MOV     A,#00H
        ADD     A,R1
        DA      A
        MOV     P1,A

KEY1:   JC      KEY1_1
        MOV     R1,#1H
        ACALL   DELAY
        JNC     LOOP
KEY1_1: MOV     A,#10H
        ADD     A,R1
        DA      A
        MOV     P1,A

KEY2:   JC      KEY2_1
        MOV     R1,#2H
        ACALL   DELAY
        JNC     LOOP
KEY2_1: MOV     A,#20H
        ADD     A,R1
        DA      A
        MOV     P1,A

KEY3:   JC      KEY3_1
        MOV     R1,#3H
        ACALL   DELAY
        JNC     LOOP
KEY3_1: MOV     A,#30H
        ADD     A,R1
        DA      A
        MOV     P1,A

KEY4:   JC      KEY4_1
        MOV     R1,#4H
        ACALL   DELAY
        JNC     LOOP
KEY4_1: MOV     A,#40H
        ADD     A,R1
        DA      A
        MOV     P1,A


;=============================
DELAY:  MOV     TMOD,#00000001B
TIMER:  MOV     TH0,#>(65536-4000)
        MOV     TL0,#<(65536-4000)
        SETB    TR0
WAIT:   JB      TF0,OK
        AJMP    WAIT

OK:     CLR     TF0
        RET
;==============================
;
        END



