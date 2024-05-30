        ORG     0000H
        AJMP    MAIN
;===========================
        ORG     000BH
        MOV     TH0,#3CH        
        MOV     TL0,#0B0H
        DJNZ    R4,CONT
        MOV     R4,#20
        ADD     A,#01
        DA      A
        CJNE    R1,#00H,CONT
        MOV     P1,A
CONT:   RETI
;==========================
MAIN:   MOV     A,#00
        MOV     P1,A
        MOV     R0,#01
        MOV     R3,#01
        MOV     R4,#20
        MOV     TMOD,#00000001B
        MOV     TH0,#3CH
        MOV     TL0,#0B0H
        SETB    EA
        SETB    ET0
        SETB    P2.0
        SETB    P2.1
LOOP1:  JB      P2.0,LOOP2
        ACALL   DELAY
        JNB     P2.0,$
        ACALL   DELAY
        AJMP    MAIN1_1
LOOP2:  JB      P2.1,LOOP1
        ACALL   DELAY
        JNB     P2.1,$
        ACALL   DELAY
        AJMP    MAIN2_1
MAIN1_1:DJNZ    R0,MAIN1_2
        MOV     R1,A
        MOV     R0,#02
        AJMP    LOOP1
MAIN1_2:MOV     P1,R1
        MOV     R2,#12
STOP:   ACALL   DELAY
        DJNZ    R2,STOP
        MOV     R1,#00H
        AJMP    LOOP1
MAIN2_1:DJNZ    R3,MAIN2_2
        SETB    TR0
        MOV     R3,#02
        AJMP    LOOP1
MAIN2_2:DJNZ    R3,MAIN
        CLR     TR0
        MOV     R3,#03
        AJMP    LOOP1
;=========================
DELAY:  MOV     R6,#100
DL:     MOV     R7,#200
        DJNZ    R7,$
        DJNZ    R6,DL
        RET
;==========================
        END
