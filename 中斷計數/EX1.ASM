        ORG     0000H
        AJMP    MAIN
;===========================
        ORG     002BH
        XCH     A,R0
        MOV     P1,A
        CLR     TF2
        MOV     TH2,#0FFH
        MOV     TL2,#0FFH
        RETI
;===========================
MAIN:   SETB    P1.0
        MOV     R0,#11111111B
        MOV     T2CON,#00000110B
        MOV     TH2,#0FFH
        MOV     TL2,#0FFH
        SETB    EA
        SETB    ET2
        SETB    TR2
;
        MOV     A,#00001111B
        MOV     P1,A
;
PAUSE:  AJMP    PAUSE
;
        END
