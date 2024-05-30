;---------MAIN----------------
        ORG     0000H
START:  MOV     R0,#OK-TABLE+1
        MOV     DPTR,#TABLE
        MOV     R1,#00H
;        MOV     R2,#03H
;        MOV     R3,#OK-TABLE-2
;
LOOP1:  MOV     A,R1
        MOVC    A,@A+DPTR
        MOV     P1,A
        ACALL   DELAY
        INC     R1
      
        DJNZ    R0,LOOP1
        AJMP    START
;        AJMP    LOOP2
;
;LOOP2:  MOV     A,R2
;        MOVC    A,@A+DPTR
;        MOV     P1,A
 ;       ACALL   DELAY
 ;       INC     R2

 ;       DJNZ    R3,LOOP2
 ;       AJMP    START

;---------DELAY(0.3S)---------
DELAY:  MOV     R5,#3
DL1:    MOV     R6,#250
DL2:    MOV     R7,#200
DL3:    DJNZ    R7,DL3
        DJNZ    R6,DL2
        DJNZ    R5,DL1
        RET
;------------DB---------------
TABLE:  DB      01111110B
        DB      11111100B
        DB      11111001B
        DB      11110011B
        DB      11100111B
        DB      11001111B
        DB      10011111B
OK:     DB      00111111B
     
;-----------------------------
