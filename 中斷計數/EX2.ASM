        ORG     0000H
        AJMP    MAIN
        ORG     002BH
        XCH     A,R0
        MOV     P1,A
        CLR     TF2
        RETI
MAIN:   SETB    P3.4
        MOV     R0,#11111111B
        MOV     T2CON,#00000110B
        MOV     TMOD,#00000110B
        MOV     A,#00001111B
        MOV     P1,A
        MOV     TH0,#256-5
        MOV     TL0,#256-5
        SETB    EA
        SETB    ET2
        SETB    TR0
        
COUNTER:JB      TF0,OK
        AJMP    COUNTER
OK:     CLR     TF0
        SETB TF2
        AJMP    COUNTER

        END
