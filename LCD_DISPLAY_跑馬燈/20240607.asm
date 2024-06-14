        ORG     0000H
A1:     MOV     R5,#17
        MOV     R0,#10000000B
        MOV     R1,#11000000B
;�]�w��l���A
MAIN:   ACALL   INIT

;��X�Ĥ@��
        ACALL   CGRAM
        ACALL   LINE1
        MOV     DPTR,#TAB1
        ACALL   DISPLAY

;��X�ĤG��
        ACALL   CGRAM1
        ACALL   LINE2
        MOV     DPTR,#TAB2
        ACALL   DISPLAY

        INC     R0
        INC     R1
        ACALL   DLY1S
        DJNZ    R5,MAIN

        MOV     R5,#02
        MOV     R0,#10100110B
        MOV     R1,#11100110B
AA:     ACALL   INIT

        ACALL   CGRAM
        ACALL   LINE1
        MOV     DPTR,#TAB2
        ACALL   DISPLAY

        ACALL   CGRAM1
        ACALL   LINE2
        MOV     DPTR,#TAB1
        ACALL   DISPLAY
        INC     R0
        INC     R1
        ACALL   DLY1S
        DJNZ    R5,AA
        AJMP    A1
        

;===========   ��l���A   ============
;��30-1-14
INIT:   ACALL   DLY40m
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
      

;===================================  
CGRAM:  MOV     A,#01000000B      
        ACALL   WRINS
        MOV     R3,#24
        MOV     DPTR,#PAT1
        MOV     R4,#00
LOOP:   MOV     A,R4
        MOVC    A,@A+DPTR
        ACALL   WRDATA
        INC     R4
        DJNZ    R3,LOOP
        RET
CGRAM1:  MOV     A,#01011000B      
        ACALL   WRINS
        MOV     R3,#24
        MOV     DPTR,#PAT1
        MOV     R4,#24
LOOP1:  MOV     A,R4
        MOVC    A,@A+DPTR
        ACALL   WRDATA
        INC     R4
        DJNZ    R3,LOOP1
        RET


;=====  �]�mLCD�Ĥ@����ܰ_�l��m  =====
LINE1:  MOV     A,R0
        ACALL   WRINS
        RET
;=====  �]�mLCD�ĤG����ܰ_�l��m  =====
LINE2:  MOV     A,R1
        ACALL   WRINS
        RET

;======  �NDPTR���r���v�@�e��LCD  =======
DISPLAY:MOV     R7,#00H
NEXT:   MOV     A,R7
        MOVC    A,@A+DPTR
        CJNE    A,#10H,DSP
        RET
DSP:    ACALL   WRDATA
        INC     R7
        AJMP    NEXT

;========   �N"���O�X"�e��LCD   ========
WRINS:  MOV     P3,#00011111B
        NOP
        SETB    P3.5
        MOV     P1,A
        NOP
        CLR     P3.5
        ACALL   DLY8m
        RET

;========    �N"���"�e��LCD    ========
WRDATA: MOV     P3,#10011111B
        NOP
        SETB    P3.5
        MOV     P1,A
        NOP
        CLR     P3.5
        ACALL   DLY160u
        RET

;============   ����   =============
DLY1S:  MOV     R6,#250

DL3:    MOV     R7,#250

        DJNZ    R7,$

        DJNZ    R6,DL3

        RET

DLY40m: MOV     R6,#100
DL0:    MOV     R7,#200
        DJNZ    R7,$
        DJNZ    R6,DL0
        RET

DLY8m:  MOV     R6,#20
DL1:    MOV     R7,#200
        DJNZ    R7,$
        DJNZ    R6,DL1
        RET

DLY160u:MOV     R6,#80
        DJNZ    R6,$
        RET

;========   �U��ܰ��r��   ========
PAT1:   DB      00000B
        DB      00000B
        DB      00000B
        DB      00000B
        DB      00000B
        DB      00000B
        DB      11100B
        DB      11111B

        DB      10000B
        DB      11000B
        DB      01100B
        DB      01100B
        DB      01110B
        DB      01110B
        DB      11111B
        DB      11111B

        DB      11000B
        DB      11000B
        DB      11000B
        DB      11000B
        DB      11000B
        DB      11000B
        DB      11111B
        DB      11111B

        DB      11111B
        DB      11110B
        DB      00000B
        DB      00000B
        DB      00000B
        DB      00000B
        DB      00000B
        DB      00000B

        DB      11111B
        DB      11111B
        DB      01110B
        DB      01110B
        DB      01100B
        DB      01100B
        DB      01100B
        DB      10000B

        DB      11111B
        DB      11111B
        DB      11000B
        DB      10000B
        DB      00000B
        DB      00000B
        DB      00000B
        DB      00000B



TAB1:   DB      02H
        DB      01H
        DB      00H
        DB      10H

TAB2:   DB      05H
        DB      04H
        DB      03H
        DB      10H
        
        END
