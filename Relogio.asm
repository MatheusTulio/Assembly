		SEG DB 0
		MIN DB 0
		HORA DB 0
		AUX0 DB 0
		AUX1 DB 0
		AUX2 DB 0

LOOP:	OUT F001,HORA
		OUT F002,MIN
		OUT F003,SEG
DELAY:	MOV AUX0,#8
D3:		MOV AUX1,#250	
D2:		MOV AUX2,#250
D1:		DJNZ AUX2,D1
        DJNZ AUX1,D2
        DJNZ AUX0,D3
	    INC SEG
	    CMP SEG,60
	    JE MINSEG
	    JL DELAY

MINSEG:	MOV SEG,0
		INC MIN
		CMP MIN,60
		JE HORMIN
		JL LOOP


HORMIN: MOV MIN,0
		INC HORA
		CMP HORA,24
		JE ZERAR
		JL LOOP


ZERAR: 	MOV SEG,0
		MOV MIN,0
		MOV HORA,0
		GOTO LOOP