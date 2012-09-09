
_configure:

;Sonar.c,8 :: 		void configure(){
;Sonar.c,14 :: 		UART1_Init(9600);
	MOVLW       129
	MOVWF       SPBRG+0 
	BSF         TXSTA+0, 2, 0
	CALL        _UART1_Init+0, 0
;Sonar.c,15 :: 		TRISD=0;
	CLRF        TRISD+0 
;Sonar.c,16 :: 		TRISC=0;
	CLRF        TRISC+0 
;Sonar.c,17 :: 		TRISB=0;
	CLRF        TRISB+0 
;Sonar.c,24 :: 		TRISA=255;
	MOVLW       255
	MOVWF       TRISA+0 
;Sonar.c,26 :: 		ADCON0 = 0b11000001;
	MOVLW       193
	MOVWF       ADCON0+0 
;Sonar.c,27 :: 		ADCON1 = 0b00000000;
	CLRF        ADCON1+0 
;Sonar.c,33 :: 		TRISA = 0b11111111;
	MOVLW       255
	MOVWF       TRISA+0 
;Sonar.c,38 :: 		PORTA = 0;
	CLRF        PORTA+0 
;Sonar.c,43 :: 		INTCON.ADIF = 0;
	BCF         INTCON+0, 6 
;Sonar.c,44 :: 		INTCON.ADIE = 1;
	BSF         INTCON+0, 6 
;Sonar.c,45 :: 		INTCON.GIE = 1;
	BSF         INTCON+0, 7 
;Sonar.c,47 :: 		}
	RETURN      0
; end of _configure

_main:

;Sonar.c,49 :: 		void main() {
;Sonar.c,50 :: 		configure();
	CALL        _configure+0, 0
;Sonar.c,52 :: 		UART1_Write_Text(ConnectionEstablished);
	MOVF        _ConnectionEstablished+0, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVF        _ConnectionEstablished+1, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;Sonar.c,54 :: 		do {
L_main0:
;Sonar.c,59 :: 		if(temp_res<500 && temp_res >=400){
	MOVLW       1
	SUBWF       _temp_res+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main16
	MOVLW       244
	SUBWF       _temp_res+0, 0 
L__main16:
	BTFSC       STATUS+0, 0 
	GOTO        L_main5
	MOVLW       1
	SUBWF       _temp_res+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main17
	MOVLW       144
	SUBWF       _temp_res+0, 0 
L__main17:
	BTFSS       STATUS+0, 0 
	GOTO        L_main5
L__main15:
;Sonar.c,60 :: 		command = 'A';
	MOVLW       65
	MOVWF       _command+0 
;Sonar.c,62 :: 		}
L_main5:
;Sonar.c,65 :: 		if(temp_res<400 && temp_res >=300){
	MOVLW       1
	SUBWF       _temp_res+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main18
	MOVLW       144
	SUBWF       _temp_res+0, 0 
L__main18:
	BTFSC       STATUS+0, 0 
	GOTO        L_main8
	MOVLW       1
	SUBWF       _temp_res+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main19
	MOVLW       44
	SUBWF       _temp_res+0, 0 
L__main19:
	BTFSS       STATUS+0, 0 
	GOTO        L_main8
L__main14:
;Sonar.c,66 :: 		command = 'B';
	MOVLW       66
	MOVWF       _command+0 
;Sonar.c,67 :: 		}
L_main8:
;Sonar.c,70 :: 		if(temp_res<300 && temp_res >=200){
	MOVLW       1
	SUBWF       _temp_res+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main20
	MOVLW       44
	SUBWF       _temp_res+0, 0 
L__main20:
	BTFSC       STATUS+0, 0 
	GOTO        L_main11
	MOVLW       0
	SUBWF       _temp_res+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main21
	MOVLW       200
	SUBWF       _temp_res+0, 0 
L__main21:
	BTFSS       STATUS+0, 0 
	GOTO        L_main11
L__main13:
;Sonar.c,71 :: 		command = 'C';
	MOVLW       67
	MOVWF       _command+0 
;Sonar.c,72 :: 		}
L_main11:
;Sonar.c,74 :: 		UART1_Write(command);
	MOVF        _command+0, 0 
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;Sonar.c,75 :: 		delay_ms(100);
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       138
	MOVWF       R12, 0
	MOVLW       85
	MOVWF       R13, 0
L_main12:
	DECFSZ      R13, 1, 0
	BRA         L_main12
	DECFSZ      R12, 1, 0
	BRA         L_main12
	DECFSZ      R11, 1, 0
	BRA         L_main12
	NOP
	NOP
;Sonar.c,78 :: 		} while(1);
	GOTO        L_main0
;Sonar.c,80 :: 		}
	GOTO        $+0
; end of _main
