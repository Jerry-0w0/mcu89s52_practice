        ORG     0000H
        AJMP    MAIN
;===========================
        ORG     0003H
        CPL     33H.1
        ACALL   DELAY
        RETI
;============================
        ORG     000BH
        MOV     TH0,#3CH
        MOV     TL0,#0B0H
        DJNZ    R4,CONT        
        MOV     R4,#20
        ADD     A,#01
        DA      A
        MOV     P1,A
CONT:   RETI



;===========================
MAIN:   MOV     A,#00
        MOV     P1,A
        MOV     R4,#20
        MOV     TMOD,#00010001B
        MOV     TH0,#3CH
        MOV     TL0,#0B0H
        MOV     SP,#60H
        MOV     IP,#10000000B
        SETB    EA
        SETB    ET0
        SETB    IT0
        SETB    EX0
        SETB    P3.2
        SETB    P2.0
        SETB    33H.1
;
        ACALL   DELAY
        JNB     P2.0,$
        ACALL   DELAY
        JB      P2.0,$
;
        SETB    TR0
LOOP1:  JNB     P2.0,PUSH1
        JB      33H.1,LOOP1
;
        CLR     TR0

;
LOOP2:  JNB     P2.0,POP1
        JNB     33H.1,LOOP2

        AJMP    MAIN

PUSH1:  PUSH    P1
        ACALL   DELAY
        JNB     P2.0,$
        AJMP    LOOP1

POP1:   POP     P1
        ACALL   DELAY
        JNB     P2.0,$
        AJMP    LOOP2
;=============================
DELAY:  MOV     TMOD,#00010001B

TIMER:  MOV     TH1,#63H
        MOV     TL1,#0C0H
        SETB    TR1
WAIT:   JB      TF1,OK
        AJMP    WAIT

OK:     CLR     TF1
        RET
;
        END


