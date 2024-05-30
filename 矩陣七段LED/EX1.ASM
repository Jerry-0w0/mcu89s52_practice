        ORG     0000H
        CLR     C
        CLR     A
        MOV     R1,#00H
        AJMP    LOOP


KEY6:   ACALL   DELAY 
        JNB     P3.1,$
        ACALL   DELAY
        JC      KEY6_1
        MOV     R1,#6H
        SETB    C
        AJMP    LOOP
KEY6_1: MOV     A,#60H
        ADD     A,R1
        DA      A
        MOV     P1,A
        AJMP    PAUSE

KEY7:   ACALL   DELAY 
        JNB     P3.0,$
        ACALL   DELAY
        JC      KEY7_1
        MOV     R1,#7H
        SETB    C
        AJMP    LOOP
KEY7_1: MOV     A,#70H
        ADD     A,R1
        DA      A
        MOV     P1,A
        AJMP    PAUSE

KEY8:   ACALL   DELAY 
        JNB      P3.3,$
        ACALL   DELAY
        JC      KEY8_1
        MOV     R1,#8H
        SETB    C
        AJMP    LOOP
KEY8_1: MOV     A,#80H
        ADD     A,R1
        DA      A
        MOV     P1,A
        AJMP    PAUSE

KEY9:   ACALL   DELAY 
        JNB     P3.3,$
        ACALL   DELAY
        JC      KEY9_1
        MOV     R1,#9H
        SETB    C
        AJMP    LOOP
KEY9_1: MOV     A,#90H
        ADD     A,R1
        DA      A
        MOV     P1,A
        AJMP    PAUSE

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
KEY0:   ACALL   DELAY   
        JNB      P3.3,$    
        ACALL   DELAY   
        JC      KEY0_1
        MOV     R1,#0H
        SETB    C  
        AJMP    LOOP
KEY0_1: MOV     A,#00H
        ADD     A,R1
        DA      A
        MOV     P1,A
        AJMP    PAUSE

KEY1:   ACALL   DELAY
        JNB      P3.2,$
        ACALL   DELAY
        JC      KEY1_1
        MOV     R1,#1H
        SETB    C
        AJMP    LOOP
KEY1_1: MOV     A,#10H
        ADD     A,R1
        DA      A
        MOV     P1,A
        AJMP    PAUSE

KEY2:   ACALL   DELAY 
        JNB      P3.1,$
        ACALL   DELAY
        JC      KEY2_1
        MOV     R1,#2H
        SETB    C
        AJMP    LOOP
KEY2_1: MOV     A,#20H
        ADD     A,R1
        DA      A
        MOV     P1,A
        AJMP    PAUSE

KEY3:   ACALL   DELAY 
        JNB      P3.0,$
        ACALL   DELAY
        JC      KEY3_1
        MOV     R1,#3H
        SETB    C
        AJMP    LOOP
KEY3_1: MOV     A,#30H
        ADD     A,R1
        DA      A
        MOV     P1,A
        AJMP    PAUSE

KEY4:   ACALL   DELAY 
        JNB     P3.3,$
        ACALL   DELAY
        JC      KEY4_1
        MOV     R1,#4H
        SETB    C
        AJMP    LOOP
KEY4_1: MOV     A,#40H
        ADD     A,R1
        DA      A
        MOV     P1,A
        AJMP    PAUSE

KEY5:   ACALL   DELAY 
        JNB      P3.2,$
        ACALL   DELAY
        JC      KEY5_1
        MOV     R1,#5H
        SETB    C
        AJMP    LOOP
KEY5_1: MOV     A,#50H
        ADD     A,R1
        DA      A
        MOV     P1,A
        AJMP    PAUSE

;=============================
DELAY:  MOV     R0,#2
        MOV     TMOD,#00000001B
TIMER:  MOV     TH0,#>(65536-50000)
        MOV     TL0,#<(65536-50000)
        SETB    TR0
WAIT:   JB      TF0,OK
        AJMP    WAIT

OK:     CLR     TF0
        DJNZ    R0,TIMER
        RET
;==============================
;
PAUSE:   AJMP,$
        END



