			INCLUDE		<D:\dtrej\Documents\Escuela\Micros\PROGRAMAS\ENCABEZADO.ASM>		;B1
			CLRF		TRISD
			BCF			STATUS,RP0
INICIO:		MOVLW		0XF5
			BTFSC		PORTB,0
			MOVLW		0X24
			MOVWF		PORTD

			CALL		SUB1
			MOVLW		0X24
			MOVWF		PORTD
			
			CALL		SUB2
			BTFSC		PORTB,0
			MOVLW		0X24
			GOTO		INICIO

SUB1:		MOVF		PORTB,W
			ADDWF		PORTC,W
			CALL		SUB2
			MOVF		PORTB,W
			MOVWF		PORTD
			RETURN

SUB2:		MOVF		PORTB,W
			ADDWF		PORTC,W
			CALL		SUB3
			MOVF		PORTB,W
			RETURN

SUB3:		MOVF		PORTB,W
			ADDWF		PORTC,W
			CALL		SUB4
			MOVF		PORTB,W
			RETURN

SUB4:		MOVF		PORTB,W
			ADDWF		PORTC,W
			RETURN

			END