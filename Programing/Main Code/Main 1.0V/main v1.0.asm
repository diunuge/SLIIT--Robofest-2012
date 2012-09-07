
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
	GOTO        L__countInc22
	MOVF        R0, 0 
	XORLW       15
	BTFSS       STATUS+0, 2 
	GOTO        L__countInc22
	MOVF        _count+1, 0 
	XORLW       66
	BTFSS       STATUS+0, 2 
	GOTO        L__countInc22
	MOVLW       64
	XORWF       _count+0, 0 
L__countInc22:
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
;main v1.0.c,63 :: 		for(counter=1; counter<128; counter++){
	MOVLW       1
	MOVWF       _counter+0 
	MOVLW       0
	MOVWF       _counter+1 
L_main2:
	MOVLW       128
	XORWF       _counter+1, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main23
	MOVLW       128
	SUBWF       _counter+0, 0 
L__main23:
	BTFSC       STATUS+0, 0 
	GOTO        L_main3
;main v1.0.c,64 :: 		UART1_Write(counter);
	MOVF        _counter+0, 0 
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;main v1.0.c,65 :: 		delay_ms(100);
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       138
	MOVWF       R12, 0
	MOVLW       85
	MOVWF       R13, 0
L_main5:
	DECFSZ      R13, 1, 0
	BRA         L_main5
	DECFSZ      R12, 1, 0
	BRA         L_main5
	DECFSZ      R11, 1, 0
	BRA         L_main5
	NOP
	NOP
;main v1.0.c,63 :: 		for(counter=1; counter<128; counter++){
	INFSNZ      _counter+0, 1 
	INCF        _counter+1, 1 
;main v1.0.c,66 :: 		}
	GOTO        L_main2
L_main3:
;main v1.0.c,67 :: 		temp_res = 'Z';
	MOVLW       90
	MOVWF       _temp_res+0 
	MOVLW       0
	MOVWF       _temp_res+1 
;main v1.0.c,69 :: 		do {
L_main6:
;main v1.0.c,70 :: 		temp_res = ADC_Read(0);   // Get 10-bit results of AD conversion
	CLRF        FARG_ADC_Read_channel+0 
	CALL        _ADC_Read+0, 0
	MOVF        R0, 0 
	MOVWF       _temp_res+0 
	MOVF        R1, 0 
	MOVWF       _temp_res+1 
;main v1.0.c,71 :: 		PORTB = temp_res;         // Send lower 8 bits to PORTB
	MOVF        R0, 0 
	MOVWF       PORTB+0 
;main v1.0.c,72 :: 		PORTC = temp_res >> 8;    // Send 2 most significant bits to RC1, RC0
	MOVF        R1, 0 
	MOVWF       R2 
	CLRF        R3 
	MOVF        R2, 0 
	MOVWF       PORTC+0 
;main v1.0.c,75 :: 		if(temp_res<500 && temp_res >=400){
	MOVLW       1
	SUBWF       R1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main24
	MOVLW       244
	SUBWF       R0, 0 
L__main24:
	BTFSC       STATUS+0, 0 
	GOTO        L_main11
	MOVLW       1
	SUBWF       _temp_res+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main25
	MOVLW       144
	SUBWF       _temp_res+0, 0 
L__main25:
	BTFSS       STATUS+0, 0 
	GOTO        L_main11
L__main21:
;main v1.0.c,76 :: 		command = 'A';
	MOVLW       65
	MOVWF       _command+0 
;main v1.0.c,78 :: 		}
L_main11:
;main v1.0.c,81 :: 		if(temp_res<400 && temp_res >=300){
	MOVLW       1
	SUBWF       _temp_res+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main26
	MOVLW       144
	SUBWF       _temp_res+0, 0 
L__main26:
	BTFSC       STATUS+0, 0 
	GOTO        L_main14
	MOVLW       1
	SUBWF       _temp_res+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main27
	MOVLW       44
	SUBWF       _temp_res+0, 0 
L__main27:
	BTFSS       STATUS+0, 0 
	GOTO        L_main14
L__main20:
;main v1.0.c,82 :: 		command = 'B';
	MOVLW       66
	MOVWF       _command+0 
;main v1.0.c,83 :: 		}
L_main14:
;main v1.0.c,86 :: 		if(temp_res<300 && temp_res >=200){
	MOVLW       1
	SUBWF       _temp_res+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main28
	MOVLW       44
	SUBWF       _temp_res+0, 0 
L__main28:
	BTFSC       STATUS+0, 0 
	GOTO        L_main17
	MOVLW       0
	SUBWF       _temp_res+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main29
	MOVLW       200
	SUBWF       _temp_res+0, 0 
L__main29:
	BTFSS       STATUS+0, 0 
	GOTO        L_main17
L__main19:
;main v1.0.c,87 :: 		command = 'C';
	MOVLW       67
	MOVWF       _command+0 
;main v1.0.c,88 :: 		}
L_main17:
;main v1.0.c,90 :: 		UART1_Write(command);
	MOVF        _command+0, 0 
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;main v1.0.c,91 :: 		delay_ms(100);
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       138
	MOVWF       R12, 0
	MOVLW       85
	MOVWF       R13, 0
L_main18:
	DECFSZ      R13, 1, 0
	BRA         L_main18
	DECFSZ      R12, 1, 0
	BRA         L_main18
	DECFSZ      R11, 1, 0
	BRA         L_main18
	NOP
	NOP
;main v1.0.c,108 :: 		} while(1);
	GOTO        L_main6
;main v1.0.c,110 :: 		}
	GOTO        $+0
; end of _main
