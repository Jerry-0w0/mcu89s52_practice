        ORG     0000H
        AJMP    MAIN

        ORG     000BH
        MOV     TH0,#3CH
        MOV     TL0,#0B0H
        
        DJNZ    R2,CONT
        MOV     R2,#20
        JNB     P2.0,RECORD
        ADD     A,#01
        DA      A
        MOV     P1,A
CONT:   RETI
        
RECORD: CPL     33H.1
        JNB     33H.1,SECOND
        ACALL   DELAY
        MOV     R0,A 
        MOV     P1,#11111111B
        ACALL   DELAY1 
        ACALL   DELAY
        AJMP    OK

SECOND: JNB     P2.0,$
        MOV     R1,A
        MOV     A,R0
        DA      A
        MOV     P1,A
        ACALL   DELAY1
        MOV     A,R1
        ACALL   DELAY

OK:     RET

MAIN:   MOV     A,#00
        MOV     P1,A
        MOV     R2,#20
        MOV     TMOD,#00000001B
        MOV     TH0,#3CH
        MOV     TL0,#0B0H
        SETB    EA
        SETB    ET0
        SETB    33H.1
 
        ACALL   DELAY
        JNB     P2.1,$
        ACALL   DELAY
        
        JB      P2.1,$
        SETB    TR0
        ACALL   DELAY
        JNB     P2.1,$

        ACALL   DELAY


        JB      P2.1,$ 
        CLR     TR0
        ACALL   DELAY
        JNB     P2.1,$
        ACALL   DELAY
        
        JB      P2.1,$
        AJMP    MAIN

DELAY:  MOV     R3,#100
DL:     MOV     R4,#200
        DJNZ    R4,$
        DJNZ    R3,DL
        RET

DELAY1: MOV     R5,#5
DL2:    MOV     R6,#250
DL1:    MOV     R7,#200
DL0:    DJNZ    R7,DL0
        DJNZ    R6,DL1
        DJNZ    R5,DL2
        RET

        END
