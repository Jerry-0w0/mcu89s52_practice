        ORG     0000H
        CLR     A
        MOV     R1,#00H
        AJMP    LOOP


KEY6:   ACALL   DELAY 
        JNB     P3.1,$
        ACALL   DELAY
        ADD     A,#6H
        DA      A
        AJMP    MAIN


KEY7:   ACALL   DELAY 
        JNB     P3.0,$
        ACALL   DELAY
        ADD     A,#7H
        DA      A
        AJMP    MAIN

KEY8:   ACALL   DELAY 
        JNB     P3.3,$
        ACALL   DELAY
        ADD     A,#8H
        DA      A
        AJMP    MAIN

KEY9:   ACALL   DELAY 
        JNB     P3.2,$
        ACALL   DELAY
        ADD     A,#9H
        DA      A
        AJMP    MAIN

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
        JNB     P3.3,$
        ACALL   DELAY
        ADD     A,#0H
        DA      A
        AJMP    MAIN

KEY1:   ACALL   DELAY 
        JNB     P3.2,$
        ACALL   DELAY
        ADD     A,#1H
        DA      A
        AJMP    MAIN

KEY2:   ACALL   DELAY 
        JNB     P3.1,$
        ACALL   DELAY
        ADD     A,#2H
        DA      A
        AJMP    MAIN

KEY3:   ACALL   DELAY 
        JNB     P3.0,$
        ACALL   DELAY
        ADD     A,#3H
        DA      A
        AJMP    MAIN

KEY4:   ACALL   DELAY 
        JNB     P3.3,$
        ACALL   DELAY
        ADD     A,#6H
        DA      A
        AJMP    MAIN

KEY5:   ACALL   DELAY 
        JNB     P3.2,$
        ACALL   DELAY
        ADD     A,#5H
        DA      A
        AJMP    MAIN

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
MAIN:   MOV     P1,A
        AJMP    LOOP
        END




