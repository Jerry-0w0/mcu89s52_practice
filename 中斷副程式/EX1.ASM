        ORG     0000H
        AJMP    MAIN
;==========================
        ORG     000BH

        MOV     TH0,#>(65536-50000)
        MOV     TL0,#<(65536-50000)


        DJNZ    R4,CONT
        
        MOV     R4,#14
        RL      A
        MOV     P1,A
CONT:   RETI

;==========================
MAIN:   MOV     A,#11111110B
        MOV     P1,A
;
        MOV     R4,#10
        
        MOV     TH0,#>(65536-50000)
        MOV     TL0,#<(65536-50000)
        SETB    EA
        SETB    ET0
        SETB    TR0
;
PAUSE:  AJMP    PAUSE

        END

        

