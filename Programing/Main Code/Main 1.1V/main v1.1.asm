
_motorLeft_foward:

;motion.h,17 :: 		void motorLeft_foward(int pwm){
;motion.h,18 :: 		Motor_Right_Forward = 1;
	BSF         PORTD+0, 0 
;motion.h,19 :: 		Motor_Right_Reverse = 0;
	BCF         PORTD+0, 1 
;motion.h,20 :: 		PWM1_Set_Duty(pwm);
	MOVF        FARG_motorLeft_foward_pwm+0, 0 
	MOVWF       FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;motion.h,21 :: 		}
	RETURN      0
; end of _motorLeft_foward

_configure:

;configuration.h,1 :: 		void configure(){
;configuration.h,7 :: 		UART1_Init(9600);
	MOVLW       129
	MOVWF       SPBRG+0 
	BSF         TXSTA+0, 2, 0
	CALL        _UART1_Init+0, 0
;configuration.h,8 :: 		TRISD=0;
	CLRF        TRISD+0 
;configuration.h,9 :: 		TRISC=0;
	CLRF        TRISC+0 
;configuration.h,10 :: 		TRISB=0;
	CLRF        TRISB+0 
;configuration.h,17 :: 		TRISA=255;
	MOVLW       255
	MOVWF       TRISA+0 
;configuration.h,19 :: 		ADCON0 = 0b11000001;
	MOVLW       193
	MOVWF       ADCON0+0 
;configuration.h,20 :: 		ADCON1 = 0b00000000;
	CLRF        ADCON1+0 
;configuration.h,26 :: 		TRISA = 0b11111111;
	MOVLW       255
	MOVWF       TRISA+0 
;configuration.h,32 :: 		PORTA = 0;
	CLRF        PORTA+0 
;configuration.h,38 :: 		INTCON.ADIF = 0;
	BCF         INTCON+0, 6 
;configuration.h,39 :: 		INTCON.ADIE = 1;
	BSF         INTCON+0, 6 
;configuration.h,40 :: 		INTCON.GIE = 1;
	BSF         INTCON+0, 7 
;configuration.h,42 :: 		}
	RETURN      0
; end of _configure

_main:

;main v1.1.c,10 :: 		void main() {
;main v1.1.c,11 :: 		configure();
	CALL        _configure+0, 0
;main v1.1.c,13 :: 		UART1_Write_Text(ConnectionEstablished);
	MOVF        _ConnectionEstablished+0, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVF        _ConnectionEstablished+1, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;main v1.1.c,15 :: 		temp_res = 'Z';
	MOVLW       90
	MOVWF       _temp_res+0 
	MOVLW       0
	MOVWF       _temp_res+1 
;main v1.1.c,17 :: 		do {
L_main0:
;main v1.1.c,18 :: 		temp_res = ADC_Read(0);   // Get 10-bit results of AD conversion
	CLRF        FARG_ADC_Read_channel+0 
	CALL        _ADC_Read+0, 0
	MOVF        R0, 0 
	MOVWF       _temp_res+0 
	MOVF        R1, 0 
	MOVWF       _temp_res+1 
;main v1.1.c,19 :: 		PORTB = temp_res;         // Send lower 8 bits to PORTB
	MOVF        R0, 0 
	MOVWF       PORTB+0 
;main v1.1.c,20 :: 		PORTC = temp_res >> 8;    // Send 2 most significant bits to RC1, RC0
	MOVF        R1, 0 
	MOVWF       R2 
	CLRF        R3 
	MOVF        R2, 0 
	MOVWF       PORTC+0 
;main v1.1.c,23 :: 		if(temp_res<500 && temp_res >=400){
	MOVLW       1
	SUBWF       R1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main16
	MOVLW       244
	SUBWF       R0, 0 
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
;main v1.1.c,24 :: 		command = 'A';
	MOVLW       65
	MOVWF       _command+0 
;main v1.1.c,26 :: 		}
L_main5:
;main v1.1.c,29 :: 		if(temp_res<400 && temp_res >=300){
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
;main v1.1.c,30 :: 		command = 'B';
	MOVLW       66
	MOVWF       _command+0 
;main v1.1.c,31 :: 		}
L_main8:
;main v1.1.c,34 :: 		if(temp_res<300 && temp_res >=200){
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
;main v1.1.c,35 :: 		command = 'C';
	MOVLW       67
	MOVWF       _command+0 
;main v1.1.c,36 :: 		}
L_main11:
;main v1.1.c,38 :: 		UART1_Write(command);
	MOVF        _command+0, 0 
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;main v1.1.c,39 :: 		delay_ms(100);
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
;main v1.1.c,42 :: 		} while(1);
	GOTO        L_main0
;main v1.1.c,44 :: 		}
	GOTO        $+0
; end of _main
