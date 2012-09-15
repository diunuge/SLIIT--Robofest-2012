
_configureation:

;main v1.0.c,6 :: 		void configureation(){
;main v1.0.c,12 :: 		UART1_Init(9600);
	MOVLW       129
	MOVWF       SPBRG+0 
	BSF         TXSTA+0, 2, 0
	CALL        _UART1_Init+0, 0
;main v1.0.c,13 :: 		TRISD=0;
	CLRF        TRISD+0 
;main v1.0.c,14 :: 		TRISC=0;
	CLRF        TRISC+0 
;main v1.0.c,15 :: 		TRISB=0;
	CLRF        TRISB+0 
;main v1.0.c,22 :: 		TRISA=255;
	MOVLW       255
	MOVWF       TRISA+0 
;main v1.0.c,24 :: 		ADCON0 = 0b11000001;
	MOVLW       193
	MOVWF       ADCON0+0 
;main v1.0.c,25 :: 		ADCON1 = 0b00000000;
	CLRF        ADCON1+0 
;main v1.0.c,31 :: 		TRISA = 0b11111111;
	MOVLW       255
	MOVWF       TRISA+0 
;main v1.0.c,37 :: 		PORTA = 0;
	CLRF        PORTA+0 
;main v1.0.c,43 :: 		INTCON.ADIF = 0;
	BCF         INTCON+0, 6 
;main v1.0.c,44 :: 		INTCON.ADIE = 1;
	BSF         INTCON+0, 6 
;main v1.0.c,45 :: 		INTCON.GIE = 1;
	BSF         INTCON+0, 7 
;main v1.0.c,47 :: 		}
	RETURN      0
; end of _configureation

_countInc:

;main v1.0.c,51 :: 		void countInc(){
;main v1.0.c,52 :: 		if(count==1000000)
	MOVLW       0
	BTFSC       _count+1, 7 
	MOVLW       255
	MOVWF       R0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L__countInc18
	MOVF        R0, 0 
	XORLW       15
	BTFSS       STATUS+0, 2 
	GOTO        L__countInc18
	MOVF        _count+1, 0 
	XORLW       66
	BTFSS       STATUS+0, 2 
	GOTO        L__countInc18
	MOVLW       64
	XORWF       _count+0, 0 
L__countInc18:
	BTFSS       STATUS+0, 2 
	GOTO        L_countInc0
;main v1.0.c,53 :: 		count = 0;
	CLRF        _count+0 
	CLRF        _count+1 
	GOTO        L_countInc1
L_countInc0:
;main v1.0.c,55 :: 		count++;
	INFSNZ      _count+0, 1 
	INCF        _count+1, 1 
L_countInc1:
;main v1.0.c,58 :: 		}
	RETURN      0
; end of _countInc

_main:

;main v1.0.c,60 :: 		void main() {
;main v1.0.c,61 :: 		configureation();
	CALL        _configureation+0, 0
;main v1.0.c,67 :: 		UART1_Write_Text("Connected!.. ");
	MOVLW       ?lstr1_main_32v1.0+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr1_main_32v1.0+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;main v1.0.c,68 :: 		temp_res = 'Z';
	MOVLW       90
	MOVWF       _temp_res+0 
	MOVLW       0
	MOVWF       _temp_res+1 
;main v1.0.c,70 :: 		do {
L_main2:
;main v1.0.c,71 :: 		temp_res = ADC_Read(2);   // Get 10-bit results of AD conversion
	MOVLW       2
	MOVWF       FARG_ADC_Read_channel+0 
	CALL        _ADC_Read+0, 0
	MOVF        R0, 0 
	MOVWF       _temp_res+0 
	MOVF        R1, 0 
	MOVWF       _temp_res+1 
;main v1.0.c,72 :: 		PORTB = temp_res;         // Send lower 8 bits to PORTB
	MOVF        R0, 0 
	MOVWF       PORTB+0 
;main v1.0.c,73 :: 		PORTC = temp_res >> 8;    // Send 2 most significant bits to RC1, RC0
	MOVF        R1, 0 
	MOVWF       R2 
	CLRF        R3 
	MOVF        R2, 0 
	MOVWF       PORTC+0 
;main v1.0.c,76 :: 		if(temp_res<500 && temp_res >=400){
	MOVLW       1
	SUBWF       R1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main19
	MOVLW       244
	SUBWF       R0, 0 
L__main19:
	BTFSC       STATUS+0, 0 
	GOTO        L_main7
	MOVLW       1
	SUBWF       _temp_res+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main20
	MOVLW       144
	SUBWF       _temp_res+0, 0 
L__main20:
	BTFSS       STATUS+0, 0 
	GOTO        L_main7
L__main17:
;main v1.0.c,77 :: 		command = 'A';
	MOVLW       65
	MOVWF       _command+0 
;main v1.0.c,79 :: 		}
L_main7:
;main v1.0.c,82 :: 		if(temp_res<400 && temp_res >=300){
	MOVLW       1
	SUBWF       _temp_res+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main21
	MOVLW       144
	SUBWF       _temp_res+0, 0 
L__main21:
	BTFSC       STATUS+0, 0 
	GOTO        L_main10
	MOVLW       1
	SUBWF       _temp_res+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main22
	MOVLW       44
	SUBWF       _temp_res+0, 0 
L__main22:
	BTFSS       STATUS+0, 0 
	GOTO        L_main10
L__main16:
;main v1.0.c,83 :: 		command = 'B';
	MOVLW       66
	MOVWF       _command+0 
;main v1.0.c,84 :: 		}
L_main10:
;main v1.0.c,87 :: 		if(temp_res<300 && temp_res >=200){
	MOVLW       1
	SUBWF       _temp_res+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main23
	MOVLW       44
	SUBWF       _temp_res+0, 0 
L__main23:
	BTFSC       STATUS+0, 0 
	GOTO        L_main13
	MOVLW       0
	SUBWF       _temp_res+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main24
	MOVLW       200
	SUBWF       _temp_res+0, 0 
L__main24:
	BTFSS       STATUS+0, 0 
	GOTO        L_main13
L__main15:
;main v1.0.c,88 :: 		command = 'C';
	MOVLW       67
	MOVWF       _command+0 
;main v1.0.c,89 :: 		}
L_main13:
;main v1.0.c,91 :: 		UART1_Write(command);
	MOVF        _command+0, 0 
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;main v1.0.c,92 :: 		delay_ms(100);
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       138
	MOVWF       R12, 0
	MOVLW       85
	MOVWF       R13, 0
L_main14:
	DECFSZ      R13, 1, 0
	BRA         L_main14
	DECFSZ      R12, 1, 0
	BRA         L_main14
	DECFSZ      R11, 1, 0
	BRA         L_main14
	NOP
	NOP
;main v1.0.c,108 :: 		} while(1);
	GOTO        L_main2
;main v1.0.c,109 :: 		}
	GOTO        $+0
; end of _main
