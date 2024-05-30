        ORG     0000H
        AJMP    MAIN
;===========================
        ORG     0003H
KEY1_1: DJNZ    R1,KEY1_2
        MOV     R1,#02
        MOV     R0,A
        AJMP    OK1
KEY1_2: MOV     P1,R0
        MOV     R2,#12
DL:     ACALL   DELAY
        DJNZ    R2,DL
        MOV     R2,#00H
OK1:    RETI
;============================
        ORG     000BH
        MOV     TH0,#>(65536-50000)
        MOV     TL0,#<(65536-50000)
        DJNZ    R4,CONT        
        MOV     R4,#20
        ADD     A,#01
        DA      A
        CJNE    R2,#00H,CONT
        MOV     P1,A
CONT:   RETI



;===========================
MAIN:   MOV     A,#00
        MOV     P1,A
        MOV     R1,#01
        MOV     R4,#20
        MOV     TMOD,#00010001B
        MOV     TH0,#>(65536-50000)
        MOV     TL0,#<(65536-50000)
        ;MOV     SP,#60H
        MOV     IP,#10000000B
        SETB    EA
        SETB    ET0
        SETB    IT0
        SETB    EX0
        SETB    P3.2
        SETB    P2.0

;
        ACALL   DELAY
        JNB     P2.0,$
        ACALL   DELAY
        JB      P2.0,$
;
        SETB    TR0
;
        ACALL   DELAY
        JNB     P2.0,$
        ACALL   DELAY
        JB      P2.0,$
;
        CLR     TR0

;
        ACALL   DELAY
        JNB     P2.0,$
        ACALL   DELAY
        JB      P2.0,$
;
        AJMP    MAIN
;=============================
DELAY:  MOV     TMOD,#00010001B

TIMER:  MOV     TH1,#>(65536-40000)
        MOV     TL1,#<(65536-40000)
        SETB    TR1
WAIT:   JB      TF1,OK
        AJMP    WAIT

OK:     CLR     TF1
        RET
;
        END

