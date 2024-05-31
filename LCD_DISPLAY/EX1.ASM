        ORG     0000H
        ACALL   INIT
        ACALL   LINE1
        MOV     DPTR,#TAB1
        ACALL   DISPLAY
        ACALL   LINE2
        MOV     DPTR,#TAB2
        ACALL   DISPLAY
OK:     AJMP    OK
;
INIT    ACALL   DELAY
        MOV     A,#38
        ACALL   WRINS
        MOV     A,#38
        ACALL   WRINS
        MOV     A,#38
        ACALL   WRINS
        MOV     A,#38
        ACALL   WRINS
;
        MOV     A,#08H
        ACALL   WRINS

        MOV     A,#01H
        ACALL   WRINS


        MOV     A,#06H
        ACALL   WRINS

        MOV     A,#0CH
        ACALL   WRINS
        RET
;
DISPLAY:MOV     R7,#00H
NEXT:   MOV     A,R7
        MOVC    A,@A+DPTR
        CJNE    A,#10H,DSP
        RET
DSP:    ACALL   WRDATA
        INC     R7
        AJMP    NEXT

LINE1:  MOV     A,#10001000B
        ACALL   WRINS
        RET
LINE2:  MOV    A,#11001000B
        ACALL   WRINS
        RET

WRINS:  MOV     P3,#00011111B
        NOP
        SETB    P3.5
        MOV     P1,A
        NOP
        CLR     P3.5
        ACALL   DL1
        RET
WRDATA: MOV     P3,#10011111B
        NOP
        SETB    P3.5
        MOV     P1,A
        NOP
        CLR     P3.5
        ACALL   DLY2
        RET

DELAY:  MOV     R6,#100
DL:     MOV     R7,#200
        DJNZ    R7,$
        DJNZ    R6,DL
        RET

DLY1:   MOV     R6,#20
DL1:    MOV     R7,#200
        DJNZ    R7,$
        DJNZ    R6,DL1
        RET

DLY2:    MOV     R6,#80
        DJNZ    R6,$
        RET
;=========================
TAB1:   DB      'EE'
        DB      '02'
        DB      10H
TAB2:   DB      'JERR'
        DB      'Y'
        DB      10H

        END
