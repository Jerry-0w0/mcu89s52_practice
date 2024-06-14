        ORG     0000H
        ACALL   INIT
MAIN:   MOV     A,#01H
        ACALL   WRINS
        ACALL   CGRAM
        ACALL   LINE1
        MOV     DPTR,#TAB1
        ACALL   DISPLAY
        ACALL   LINE2
        MOV     DPTR,#TAB2
        ACALL   DISPLAY
        MOV     R1,#16
LOOP1:  MOV     R0,#10
DLL:    ACALL   DELAY
        DJNZ    R0,DLL
        MOV     A,#1CH
        ACALL   WRINS
        DJNZ    R1,LOOP1 
        AJMP    MAIN
;==========================
INIT:   ACALL   DELAY
        MOV     A,#38H
        ACALL   WRINS
        MOV     A,#38H
        ACALL   WRINS
        MOV     A,#38H
        ACALL   WRINS
        MOV     A,#38H
        ACALL   WRINS
        
        MOV     A,#08H
        ACALL   WRINS

        MOV     A,#01H
        ACALL   WRINS
        
        MOV     A,#06H
        ACALL   WRINS
        
        MOV     A,#0CH
        ACALL   WRINS
        RET
        
CGRAM:  MOV     A,#01000000B
        ACALL   WRINS
        MOV     R5,#48
        MOV     DPTR,#PATTERN
        MOV     R4,#0
LOOP:   MOV     A,R4
        MOVC    A,@A+DPTR
        ACALL   WRDATA
        INC     R4
        DJNZ    R5,LOOP
        RET
DISPLAY:MOV     R7,#00H
NEXT:   MOV     A,R7
        MOVC    A,@A+DPTR
        CJNE    A,#10H,DSP
        RET
DSP:    ACALL   WRDATA
        INC     R7
        AJMP    NEXT

LINE1:  MOV     A,#10000000B
        ACALL   WRINS
        RET
     
LINE2:  MOV     A,#11000000B
        ACALL   WRINS
        RET

WRINS:  MOV     P3,#00011111B
        NOP
        SETB    P3.5
        MOV     P1,A
        NOP
        CLR     P3.5
        ACALL   DLY1
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
    
DLY2:   MOV     R6,#80
        DJNZ    R6,$
        RET

;===================================
PATTERN:DB      00H
        DB      00H
        DB      00H
        DB      1CH
        DB      1FH
        DB      00H
        DB      00H
        DB      00H
;
        DB      10H
        DB      0CH
        DB      06H
        DB      1FH
        DB      1FH
        DB      06H
        DB      0CH
        DB      10H
;
        DB      18H
        DB      18H
        DB      18H
        DB      1FH
        DB      1FH
        DB      00H
        DB      00H
        DB      00H
;=======
        DB      00H
        DB      00H
        DB      00H
        DB      1CH
        DB      1FH
        DB      00H
        DB      00H
        DB      00H
;
        DB      10H
        DB      0CH
        DB      06H
        DB      1FH
        DB      1FH
        DB      06H
        DB      0CH
        DB      10H
;
        DB      18H
        DB      18H
        DB      18H
        DB      1FH
        DB      1FH
        DB      00H
        DB      00H
        DB      00H


;=====================================
TAB1:   DB      02H
        DB      01H
        DB      00H
        DB      '          '
        DB      '          '
        DB      ' '

        DB      02H
        DB      01H
        DB      00H

        DB      10H

TAB2:   DB      05H
        DB      04H
        DB      03H
        DB      '          '
        DB      '          '
        DB      ' '
        DB      05H
        DB      04H
        DB      03H

        DB      10H
        
        END

