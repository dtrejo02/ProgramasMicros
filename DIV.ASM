;PRACTICA1
			INCLUDE		<D:\dtrej\Documents\Escuela\Micros\PROGRAMAS\ENCABEZADO.ASM> ;B1
			CLRF		TRISC
			BCF			TRISB,7
			BCF			STATUS,RP0	;B0

INICIO		BTFSS		PORTB,0
			GOTO		INICIO
			MOVF		PORTD,W
			MOVWF		0X20	;VALOR1 O A
			MOVWF		PORTC

PUSH		BTFSS		PORTB,1
			GOTO		PUSH			
			MOVF		PORTD,W
			MOVWF		0X21	;VALOR2 O B
			CLRF		0X22	;CONTADOR CNT

			MOVLW		0XFF
			ANDWF		0X20,W
			BTFSS		STATUS,Z
			GOTO		TESTDIVB
			MOVF		0X22,W
			MOVWF		PORTC
			GOTO		INICIO

TESTDIVB	MOVLW		0XFF
			ANDWF		0X21,W
			BTFSS		STATUS,Z
			GOTO		DIVA
			MOVLW		0XFF
			MOVWF		PORTC
			BSF			PORTB,7
			GOTO		INICIO

DIVA		INCF		0X22,F	;CNT=CNT+1
			MOVF		0X21,W	;B
			SUBWF		0X20,F	;A=A-W PERO W=B
			BTFSS		STATUS,C	
			GOTO		DIVA
			BTFSS		STATUS,Z
			BSF			PORTB,7	
			MOVWF		PORTC
			GOTO 		$
			
			END