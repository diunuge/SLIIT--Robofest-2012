
_motorLeft_foward:

;motion.h,36 :: 		void motorLeft_foward(int pwm){
;motion.h,37 :: 		Motor_Left_Forward = 1;
	BSF         PORTD+0, 2 
;motion.h,38 :: 		Motor_Left_Reverse = 0;
	BCF         PORTD+0, 3 
;motion.h,39 :: 		PWM2_Set_Duty(pwm);
	MOVF        FARG_motorLeft_foward_pwm+0, 0 
	MOVWF       FARG_PWM2_Set_Duty_new_duty+0 
	CALL        _PWM2_Set_Duty+0, 0
;motion.h,40 :: 		}
	RETURN      0
; end of _motorLeft_foward

_motorRight_foward:

;motion.h,42 :: 		void motorRight_foward(int pwm){
;motion.h,43 :: 		Motor_Right_Forward = 1;
	BSF         PORTC+0, 4 
;motion.h,44 :: 		Motor_Right_Reverse = 0;
	BCF         PORTC+0, 5 
;motion.h,45 :: 		PWM1_Set_Duty(pwm);
	MOVF        FARG_motorRight_foward_pwm+0, 0 
	MOVWF       FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;motion.h,46 :: 		}
	RETURN      0
; end of _motorRight_foward

_motorLeft_reverse:

;motion.h,48 :: 		void motorLeft_reverse(int pwm){
;motion.h,49 :: 		Motor_Left_Forward = 0;
	BCF         PORTD+0, 2 
;motion.h,50 :: 		Motor_Left_Reverse = 1;
	BSF         PORTD+0, 3 
;motion.h,51 :: 		PWM2_Set_Duty(pwm);
	MOVF        FARG_motorLeft_reverse_pwm+0, 0 
	MOVWF       FARG_PWM2_Set_Duty_new_duty+0 
	CALL        _PWM2_Set_Duty+0, 0
;motion.h,52 :: 		}
	RETURN      0
; end of _motorLeft_reverse

_motorRight_reverse:

;motion.h,54 :: 		void motorRight_reverse(int pwm){
;motion.h,55 :: 		Motor_Right_Forward = 0;
	BCF         PORTC+0, 4 
;motion.h,56 :: 		Motor_Right_Reverse = 1;
	BSF         PORTC+0, 5 
;motion.h,57 :: 		PWM1_Set_Duty(pwm);
	MOVF        FARG_motorRight_reverse_pwm+0, 0 
	MOVWF       FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;motion.h,58 :: 		}
	RETURN      0
; end of _motorRight_reverse

_motorLeft_stop:

;motion.h,60 :: 		void motorLeft_stop(){
;motion.h,61 :: 		Motor_Left_Forward = 1;
	BSF         PORTD+0, 2 
;motion.h,62 :: 		Motor_Left_Reverse = 1;
	BSF         PORTD+0, 3 
;motion.h,63 :: 		}
	RETURN      0
; end of _motorLeft_stop

_motorRight_stop:

;motion.h,65 :: 		void motorRight_stop(){
;motion.h,66 :: 		Motor_Right_Forward = 1;
	BSF         PORTC+0, 4 
;motion.h,67 :: 		Motor_Right_Reverse = 1;
	BSF         PORTC+0, 5 
;motion.h,68 :: 		}
	RETURN      0
; end of _motorRight_stop

_moveForward:

;motion.h,70 :: 		void moveForward(int pwmLeft, int pwmRight){
;motion.h,71 :: 		motorLeft_foward(pwmLeft);
	MOVF        FARG_moveForward_pwmLeft+0, 0 
	MOVWF       FARG_motorLeft_foward_pwm+0 
	MOVF        FARG_moveForward_pwmLeft+1, 0 
	MOVWF       FARG_motorLeft_foward_pwm+1 
	CALL        _motorLeft_foward+0, 0
;motion.h,72 :: 		motorRight_foward(pwmRight);
	MOVF        FARG_moveForward_pwmRight+0, 0 
	MOVWF       FARG_motorRight_foward_pwm+0 
	MOVF        FARG_moveForward_pwmRight+1, 0 
	MOVWF       FARG_motorRight_foward_pwm+1 
	CALL        _motorRight_foward+0, 0
;motion.h,73 :: 		}
	RETURN      0
; end of _moveForward

_turnRight:

;motion.h,75 :: 		void turnRight(int pwmLeft){
;motion.h,76 :: 		motorLeft_foward(pwmLeft);
	MOVF        FARG_turnRight_pwmLeft+0, 0 
	MOVWF       FARG_motorLeft_foward_pwm+0 
	MOVF        FARG_turnRight_pwmLeft+1, 0 
	MOVWF       FARG_motorLeft_foward_pwm+1 
	CALL        _motorLeft_foward+0, 0
;motion.h,77 :: 		motorRight_stop();
	CALL        _motorRight_stop+0, 0
;motion.h,78 :: 		}
	RETURN      0
; end of _turnRight

_turnLeft:

;motion.h,80 :: 		void turnLeft(int pwmRight){
;motion.h,81 :: 		motorRight_foward(pwmRight);
	MOVF        FARG_turnLeft_pwmRight+0, 0 
	MOVWF       FARG_motorRight_foward_pwm+0 
	MOVF        FARG_turnLeft_pwmRight+1, 0 
	MOVWF       FARG_motorRight_foward_pwm+1 
	CALL        _motorRight_foward+0, 0
;motion.h,82 :: 		motorLeft_stop();
	CALL        _motorLeft_stop+0, 0
;motion.h,83 :: 		}
	RETURN      0
; end of _turnLeft

_rotateClockwise:

;motion.h,85 :: 		void rotateClockwise(int pwm){
;motion.h,86 :: 		motorLeft_foward(pwm);
	MOVF        FARG_rotateClockwise_pwm+0, 0 
	MOVWF       FARG_motorLeft_foward_pwm+0 
	MOVF        FARG_rotateClockwise_pwm+1, 0 
	MOVWF       FARG_motorLeft_foward_pwm+1 
	CALL        _motorLeft_foward+0, 0
;motion.h,87 :: 		motorRight_reverse(pwm);
	MOVF        FARG_rotateClockwise_pwm+0, 0 
	MOVWF       FARG_motorRight_reverse_pwm+0 
	MOVF        FARG_rotateClockwise_pwm+1, 0 
	MOVWF       FARG_motorRight_reverse_pwm+1 
	CALL        _motorRight_reverse+0, 0
;motion.h,88 :: 		}
	RETURN      0
; end of _rotateClockwise

_rotateAntiClockwise:

;motion.h,90 :: 		void rotateAntiClockwise(int pwm){
;motion.h,91 :: 		motorLeft_reverse(pwm);
	MOVF        FARG_rotateAntiClockwise_pwm+0, 0 
	MOVWF       FARG_motorLeft_reverse_pwm+0 
	MOVF        FARG_rotateAntiClockwise_pwm+1, 0 
	MOVWF       FARG_motorLeft_reverse_pwm+1 
	CALL        _motorLeft_reverse+0, 0
;motion.h,92 :: 		motorRight_foward(pwm);
	MOVF        FARG_rotateAntiClockwise_pwm+0, 0 
	MOVWF       FARG_motorRight_foward_pwm+0 
	MOVF        FARG_rotateAntiClockwise_pwm+1, 0 
	MOVWF       FARG_motorRight_foward_pwm+1 
	CALL        _motorRight_foward+0, 0
;motion.h,93 :: 		}
	RETURN      0
; end of _rotateAntiClockwise

_stop:

;motion.h,95 :: 		void stop(){
;motion.h,96 :: 		motorLeft_stop();
	CALL        _motorLeft_stop+0, 0
;motion.h,97 :: 		motorRight_stop();
	CALL        _motorRight_stop+0, 0
;motion.h,98 :: 		}
	RETURN      0
; end of _stop

_testMotion:

;motion.h,100 :: 		void testMotion(int pwm){
;motion.h,101 :: 		rotateClockwise(pwm);
	MOVF        FARG_testMotion_pwm+0, 0 
	MOVWF       FARG_rotateClockwise_pwm+0 
	MOVF        FARG_testMotion_pwm+1, 0 
	MOVWF       FARG_rotateClockwise_pwm+1 
	CALL        _rotateClockwise+0, 0
;motion.h,102 :: 		delay_ms(1000);
	MOVLW       26
	MOVWF       R11, 0
	MOVLW       94
	MOVWF       R12, 0
	MOVLW       110
	MOVWF       R13, 0
L_testMotion0:
	DECFSZ      R13, 1, 0
	BRA         L_testMotion0
	DECFSZ      R12, 1, 0
	BRA         L_testMotion0
	DECFSZ      R11, 1, 0
	BRA         L_testMotion0
	NOP
;motion.h,103 :: 		rotateAntiClockwise(pwm);
	MOVF        FARG_testMotion_pwm+0, 0 
	MOVWF       FARG_rotateAntiClockwise_pwm+0 
	MOVF        FARG_testMotion_pwm+1, 0 
	MOVWF       FARG_rotateAntiClockwise_pwm+1 
	CALL        _rotateAntiClockwise+0, 0
;motion.h,104 :: 		delay_ms(1000);
	MOVLW       26
	MOVWF       R11, 0
	MOVLW       94
	MOVWF       R12, 0
	MOVLW       110
	MOVWF       R13, 0
L_testMotion1:
	DECFSZ      R13, 1, 0
	BRA         L_testMotion1
	DECFSZ      R12, 1, 0
	BRA         L_testMotion1
	DECFSZ      R11, 1, 0
	BRA         L_testMotion1
	NOP
;motion.h,105 :: 		moveForward(pwm,pwm);
	MOVF        FARG_testMotion_pwm+0, 0 
	MOVWF       FARG_moveForward_pwmLeft+0 
	MOVF        FARG_testMotion_pwm+1, 0 
	MOVWF       FARG_moveForward_pwmLeft+1 
	MOVF        FARG_testMotion_pwm+0, 0 
	MOVWF       FARG_moveForward_pwmRight+0 
	MOVF        FARG_testMotion_pwm+1, 0 
	MOVWF       FARG_moveForward_pwmRight+1 
	CALL        _moveForward+0, 0
;motion.h,106 :: 		delay_ms(1000);
	MOVLW       26
	MOVWF       R11, 0
	MOVLW       94
	MOVWF       R12, 0
	MOVLW       110
	MOVWF       R13, 0
L_testMotion2:
	DECFSZ      R13, 1, 0
	BRA         L_testMotion2
	DECFSZ      R12, 1, 0
	BRA         L_testMotion2
	DECFSZ      R11, 1, 0
	BRA         L_testMotion2
	NOP
;motion.h,107 :: 		}
	RETURN      0
; end of _testMotion

_configure:

;configuration.h,1 :: 		void configure(){
;configuration.h,4 :: 		TRISA = 0b11111111;
	MOVLW       255
	MOVWF       TRISA+0 
;configuration.h,5 :: 		TRISB = 0b11111111;
	MOVLW       255
	MOVWF       TRISB+0 
;configuration.h,6 :: 		TRISC = 0b00000000;
	CLRF        TRISC+0 
;configuration.h,7 :: 		TRISD = 0b11110000;
	MOVLW       240
	MOVWF       TRISD+0 
;configuration.h,10 :: 		PORTA = 0;
	CLRF        PORTA+0 
;configuration.h,11 :: 		PORTB = 0;
	CLRF        PORTB+0 
;configuration.h,12 :: 		PORTC = 0;
	CLRF        PORTC+0 
;configuration.h,13 :: 		PORTD = 0;
	CLRF        PORTD+0 
;configuration.h,16 :: 		PWM1_Init(5000);
	BSF         T2CON+0, 0, 0
	BCF         T2CON+0, 1, 0
	MOVLW       249
	MOVWF       PR2+0, 0
	CALL        _PWM1_Init+0, 0
;configuration.h,17 :: 		PWM2_Init(5000);
	BSF         T2CON+0, 0, 0
	BCF         T2CON+0, 1, 0
	MOVLW       249
	MOVWF       PR2+0, 0
	CALL        _PWM2_Init+0, 0
;configuration.h,18 :: 		PWM1_Start();
	CALL        _PWM1_Start+0, 0
;configuration.h,19 :: 		PWM2_Start();
	CALL        _PWM2_Start+0, 0
;configuration.h,20 :: 		UART1_Init(9600);
	MOVLW       129
	MOVWF       SPBRG+0 
	BSF         TXSTA+0, 2, 0
	CALL        _UART1_Init+0, 0
;configuration.h,28 :: 		ADCON0 = 0b11000001;
	MOVLW       193
	MOVWF       ADCON0+0 
;configuration.h,29 :: 		ADCON1 = 0b00000000;
	CLRF        ADCON1+0 
;configuration.h,35 :: 		}
	RETURN      0
; end of _configure

_main:

;Robo2.c,22 :: 		void main() {
;Robo2.c,23 :: 		configure();
	CALL        _configure+0, 0
;Robo2.c,25 :: 		UART1_Write_Text(ConnectionEstablished);
	MOVF        _ConnectionEstablished+0, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVF        _ConnectionEstablished+1, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;Robo2.c,26 :: 		setPID();
	CALL        _setPID+0, 0
;Robo2.c,32 :: 		debugText = "          Starting..  ";
	MOVLW       ?lstr3_Robo2+0
	MOVWF       _debugText+0 
	MOVLW       hi_addr(?lstr3_Robo2+0)
	MOVWF       _debugText+1 
;Robo2.c,33 :: 		UART1_Write_Text(debugText);
	MOVF        _debugText+0, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVF        _debugText+1, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;Robo2.c,35 :: 		delay_ms(1000);
	MOVLW       26
	MOVWF       R11, 0
	MOVLW       94
	MOVWF       R12, 0
	MOVLW       110
	MOVWF       R13, 0
L_main3:
	DECFSZ      R13, 1, 0
	BRA         L_main3
	DECFSZ      R12, 1, 0
	BRA         L_main3
	DECFSZ      R11, 1, 0
	BRA         L_main3
	NOP
;Robo2.c,36 :: 		debugText = "Test Sensors   ";
	MOVLW       ?lstr4_Robo2+0
	MOVWF       _debugText+0 
	MOVLW       hi_addr(?lstr4_Robo2+0)
	MOVWF       _debugText+1 
;Robo2.c,37 :: 		UART1_Write_Text(debugText);
	MOVF        _debugText+0, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVF        _debugText+1, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;Robo2.c,39 :: 		for(count=0; count<5; count++){
	CLRF        _count+0 
	CLRF        _count+1 
L_main4:
	MOVLW       128
	XORWF       _count+1, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main201
	MOVLW       5
	SUBWF       _count+0, 0 
L__main201:
	BTFSC       STATUS+0, 0 
	GOTO        L_main5
;Robo2.c,40 :: 		receiveCommand = UART1_Read();
	CALL        _UART1_Read+0, 0
	MOVF        R0, 0 
	MOVWF       _receiveCommand+0 
;Robo2.c,41 :: 		sendSensorStatus();
	CALL        _sendSensorStatus+0, 0
;Robo2.c,42 :: 		delay_ms(1000);
	MOVLW       26
	MOVWF       R11, 0
	MOVLW       94
	MOVWF       R12, 0
	MOVLW       110
	MOVWF       R13, 0
L_main7:
	DECFSZ      R13, 1, 0
	BRA         L_main7
	DECFSZ      R12, 1, 0
	BRA         L_main7
	DECFSZ      R11, 1, 0
	BRA         L_main7
	NOP
;Robo2.c,39 :: 		for(count=0; count<5; count++){
	INFSNZ      _count+0, 1 
	INCF        _count+1, 1 
;Robo2.c,43 :: 		}                                                  //while( receiveCommand != 'A' && receiveCommand != 'a' );
	GOTO        L_main4
L_main5:
;Robo2.c,45 :: 		debugText = "Start Line follow..   ";
	MOVLW       ?lstr5_Robo2+0
	MOVWF       _debugText+0 
	MOVLW       hi_addr(?lstr5_Robo2+0)
	MOVWF       _debugText+1 
;Robo2.c,46 :: 		UART1_Write_Text(debugText);
	MOVF        _debugText+0, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVF        _debugText+1, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;Robo2.c,48 :: 		lineFollow();
	CALL        _lineFollow+0, 0
;Robo2.c,49 :: 		}
	GOTO        $+0
; end of _main

_lineFollow:

;Robo2.c,50 :: 		void lineFollow(){
;Robo2.c,52 :: 		while(1){
L_lineFollow8:
;Robo2.c,53 :: 		if( (Sensor3==1 || Sensor4==1 || Sensor5==1 || Sensor6==1 || Sensor7==1) && Sensor1==0 && Sensor2==0 && Sensor8==0 && Sensor9==0 ){
	BTFSC       PORTD+0, 4 
	GOTO        L__lineFollow174
	BTFSC       PORTD+0, 5 
	GOTO        L__lineFollow174
	BTFSC       PORTD+0, 6 
	GOTO        L__lineFollow174
	BTFSC       PORTD+0, 7 
	GOTO        L__lineFollow174
	BTFSC       PORTB+0, 2 
	GOTO        L__lineFollow174
	GOTO        L_lineFollow14
L__lineFollow174:
	BTFSC       PORTB+0, 4 
	GOTO        L_lineFollow14
	BTFSC       PORTB+0, 3 
	GOTO        L_lineFollow14
	BTFSC       PORTB+0, 6 
	GOTO        L_lineFollow14
	BTFSC       PORTB+0, 7 
	GOTO        L_lineFollow14
L__lineFollow173:
;Robo2.c,55 :: 		debugText = "Line follow PID..   ";
	MOVLW       ?lstr6_Robo2+0
	MOVWF       _debugText+0 
	MOVLW       hi_addr(?lstr6_Robo2+0)
	MOVWF       _debugText+1 
;Robo2.c,56 :: 		UART1_Write_Text(debugText);
	MOVF        _debugText+0, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVF        _debugText+1, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;Robo2.c,57 :: 		lineFollowPID();
	CALL        _lineFollowPID+0, 0
;Robo2.c,58 :: 		}
	GOTO        L_lineFollow15
L_lineFollow14:
;Robo2.c,59 :: 		else if( !( Scout==1 && Sensor1==1 && Sensor2==1 && Sensor3==1 && Sensor4==1 && Sensor5==1 && Sensor6==1 && Sensor7==1 && Sensor8==1 && Sensor9==1) || !( Scout==0 && Sensor1==0 && Sensor2==0 && Sensor3==0 && Sensor4==0 && Sensor5==0 && Sensor6==0 && Sensor7==0 && Sensor8==0 && Sensor9==0)){
	BTFSS       PORTB+0, 5 
	GOTO        L_lineFollow17
	BTFSS       PORTB+0, 4 
	GOTO        L_lineFollow17
	BTFSS       PORTB+0, 3 
	GOTO        L_lineFollow17
	BTFSS       PORTD+0, 4 
	GOTO        L_lineFollow17
	BTFSS       PORTD+0, 5 
	GOTO        L_lineFollow17
	BTFSS       PORTD+0, 6 
	GOTO        L_lineFollow17
	BTFSS       PORTD+0, 7 
	GOTO        L_lineFollow17
	BTFSS       PORTB+0, 2 
	GOTO        L_lineFollow17
	BTFSS       PORTB+0, 6 
	GOTO        L_lineFollow17
	BTFSS       PORTB+0, 7 
	GOTO        L_lineFollow17
	MOVLW       1
	MOVWF       R0 
	GOTO        L_lineFollow16
L_lineFollow17:
	CLRF        R0 
L_lineFollow16:
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L__lineFollow172
	BTFSC       PORTB+0, 5 
	GOTO        L_lineFollow19
	BTFSC       PORTB+0, 4 
	GOTO        L_lineFollow19
	BTFSC       PORTB+0, 3 
	GOTO        L_lineFollow19
	BTFSC       PORTD+0, 4 
	GOTO        L_lineFollow19
	BTFSC       PORTD+0, 5 
	GOTO        L_lineFollow19
	BTFSC       PORTD+0, 6 
	GOTO        L_lineFollow19
	BTFSC       PORTD+0, 7 
	GOTO        L_lineFollow19
	BTFSC       PORTB+0, 2 
	GOTO        L_lineFollow19
	BTFSC       PORTB+0, 6 
	GOTO        L_lineFollow19
	BTFSC       PORTB+0, 7 
	GOTO        L_lineFollow19
	MOVLW       1
	MOVWF       R0 
	GOTO        L_lineFollow18
L_lineFollow19:
	CLRF        R0 
L_lineFollow18:
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L__lineFollow172
	GOTO        L_lineFollow22
L__lineFollow172:
;Robo2.c,61 :: 		debugText = "Line follow Normal..   ";
	MOVLW       ?lstr7_Robo2+0
	MOVWF       _debugText+0 
	MOVLW       hi_addr(?lstr7_Robo2+0)
	MOVWF       _debugText+1 
;Robo2.c,62 :: 		UART1_Write_Text(debugText);
	MOVF        _debugText+0, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVF        _debugText+1, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;Robo2.c,63 :: 		lineFollowNormal();
	CALL        _lineFollowNormal+0, 0
;Robo2.c,64 :: 		}
	GOTO        L_lineFollow23
L_lineFollow22:
;Robo2.c,65 :: 		else if(( Scout==1 && Sensor1==1 && Sensor2==1 && Sensor3==1 && Sensor4==1 && Sensor5==1 && Sensor6==1 && Sensor7==1 && Sensor8==1 && Sensor9==1) || !( Scout==0 && Sensor1==0 && Sensor2==0 && Sensor3==0 && Sensor4==0 && Sensor5==0 && Sensor6==0 && Sensor7==0 && Sensor8==0 && Sensor9==0)){
	BTFSS       PORTB+0, 5 
	GOTO        L__lineFollow171
	BTFSS       PORTB+0, 4 
	GOTO        L__lineFollow171
	BTFSS       PORTB+0, 3 
	GOTO        L__lineFollow171
	BTFSS       PORTD+0, 4 
	GOTO        L__lineFollow171
	BTFSS       PORTD+0, 5 
	GOTO        L__lineFollow171
	BTFSS       PORTD+0, 6 
	GOTO        L__lineFollow171
	BTFSS       PORTD+0, 7 
	GOTO        L__lineFollow171
	BTFSS       PORTB+0, 2 
	GOTO        L__lineFollow171
	BTFSS       PORTB+0, 6 
	GOTO        L__lineFollow171
	BTFSS       PORTB+0, 7 
	GOTO        L__lineFollow171
	GOTO        L__lineFollow170
L__lineFollow171:
	BTFSC       PORTB+0, 5 
	GOTO        L_lineFollow27
	BTFSC       PORTB+0, 4 
	GOTO        L_lineFollow27
	BTFSC       PORTB+0, 3 
	GOTO        L_lineFollow27
	BTFSC       PORTD+0, 4 
	GOTO        L_lineFollow27
	BTFSC       PORTD+0, 5 
	GOTO        L_lineFollow27
	BTFSC       PORTD+0, 6 
	GOTO        L_lineFollow27
	BTFSC       PORTD+0, 7 
	GOTO        L_lineFollow27
	BTFSC       PORTB+0, 2 
	GOTO        L_lineFollow27
	BTFSC       PORTB+0, 6 
	GOTO        L_lineFollow27
	BTFSC       PORTB+0, 7 
	GOTO        L_lineFollow27
	MOVLW       1
	MOVWF       R0 
	GOTO        L_lineFollow26
L_lineFollow27:
	CLRF        R0 
L_lineFollow26:
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L__lineFollow170
	GOTO        L_lineFollow30
L__lineFollow170:
;Robo2.c,67 :: 		stop();
	CALL        _stop+0, 0
;Robo2.c,68 :: 		sendSensorStatus();
	CALL        _sendSensorStatus+0, 0
;Robo2.c,69 :: 		delay_ms(200);
	MOVLW       6
	MOVWF       R11, 0
	MOVLW       19
	MOVWF       R12, 0
	MOVLW       173
	MOVWF       R13, 0
L_lineFollow31:
	DECFSZ      R13, 1, 0
	BRA         L_lineFollow31
	DECFSZ      R12, 1, 0
	BRA         L_lineFollow31
	DECFSZ      R11, 1, 0
	BRA         L_lineFollow31
	NOP
	NOP
;Robo2.c,70 :: 		}
L_lineFollow30:
L_lineFollow23:
L_lineFollow15:
;Robo2.c,71 :: 		}
	GOTO        L_lineFollow8
;Robo2.c,72 :: 		}
	RETURN      0
; end of _lineFollow

_lineFollowNormal:

;Robo2.c,74 :: 		void lineFollowNormal(){
;Robo2.c,75 :: 		while(!((Sensor3==1 || Sensor4==1 || Sensor5==1 || Sensor6==1 || Sensor7==1) && Sensor1==0 && Sensor2==0 && Sensor8==0 && Sensor9==0)){
L_lineFollowNormal32:
	BTFSC       PORTD+0, 4 
	GOTO        L__lineFollowNormal188
	BTFSC       PORTD+0, 5 
	GOTO        L__lineFollowNormal188
	BTFSC       PORTD+0, 6 
	GOTO        L__lineFollowNormal188
	BTFSC       PORTD+0, 7 
	GOTO        L__lineFollowNormal188
	BTFSC       PORTB+0, 2 
	GOTO        L__lineFollowNormal188
	GOTO        L_lineFollowNormal37
L__lineFollowNormal188:
	BTFSC       PORTB+0, 4 
	GOTO        L_lineFollowNormal37
	BTFSC       PORTB+0, 3 
	GOTO        L_lineFollowNormal37
	BTFSC       PORTB+0, 6 
	GOTO        L_lineFollowNormal37
	BTFSC       PORTB+0, 7 
	GOTO        L_lineFollowNormal37
	MOVLW       1
	MOVWF       R0 
	GOTO        L_lineFollowNormal36
L_lineFollowNormal37:
	CLRF        R0 
L_lineFollowNormal36:
	MOVF        R0, 1 
	BTFSS       STATUS+0, 2 
	GOTO        L_lineFollowNormal33
;Robo2.c,76 :: 		if( Scout==1 && Sensor1==1 && Sensor2==1 && Sensor3==1 && Sensor4==1 && Sensor5==1 && Sensor6==1 && Sensor7==1 && Sensor8==1 && Sensor9==1){
	BTFSS       PORTB+0, 5 
	GOTO        L_lineFollowNormal40
	BTFSS       PORTB+0, 4 
	GOTO        L_lineFollowNormal40
	BTFSS       PORTB+0, 3 
	GOTO        L_lineFollowNormal40
	BTFSS       PORTD+0, 4 
	GOTO        L_lineFollowNormal40
	BTFSS       PORTD+0, 5 
	GOTO        L_lineFollowNormal40
	BTFSS       PORTD+0, 6 
	GOTO        L_lineFollowNormal40
	BTFSS       PORTD+0, 7 
	GOTO        L_lineFollowNormal40
	BTFSS       PORTB+0, 2 
	GOTO        L_lineFollowNormal40
	BTFSS       PORTB+0, 6 
	GOTO        L_lineFollowNormal40
	BTFSS       PORTB+0, 7 
	GOTO        L_lineFollowNormal40
L__lineFollowNormal187:
;Robo2.c,77 :: 		stop();
	CALL        _stop+0, 0
;Robo2.c,78 :: 		}
	GOTO        L_lineFollowNormal41
L_lineFollowNormal40:
;Robo2.c,79 :: 		else if( (Scout==0 && Sensor1==0 && Sensor2==0 && Sensor3==0 && Sensor4==1 && Sensor5==1 && Sensor6==1 && Sensor7==1 && Sensor8==1 && Sensor9==1) || (Scout==0 && Sensor1==0 && Sensor2==0 && Sensor3==0 && Sensor4==0 && Sensor5==1 && Sensor6==1 && Sensor7==1 && Sensor8==1 && Sensor9==1)){
	BTFSC       PORTB+0, 5 
	GOTO        L__lineFollowNormal186
	BTFSC       PORTB+0, 4 
	GOTO        L__lineFollowNormal186
	BTFSC       PORTB+0, 3 
	GOTO        L__lineFollowNormal186
	BTFSC       PORTD+0, 4 
	GOTO        L__lineFollowNormal186
	BTFSS       PORTD+0, 5 
	GOTO        L__lineFollowNormal186
	BTFSS       PORTD+0, 6 
	GOTO        L__lineFollowNormal186
	BTFSS       PORTD+0, 7 
	GOTO        L__lineFollowNormal186
	BTFSS       PORTB+0, 2 
	GOTO        L__lineFollowNormal186
	BTFSS       PORTB+0, 6 
	GOTO        L__lineFollowNormal186
	BTFSS       PORTB+0, 7 
	GOTO        L__lineFollowNormal186
	GOTO        L__lineFollowNormal184
L__lineFollowNormal186:
	BTFSC       PORTB+0, 5 
	GOTO        L__lineFollowNormal185
	BTFSC       PORTB+0, 4 
	GOTO        L__lineFollowNormal185
	BTFSC       PORTB+0, 3 
	GOTO        L__lineFollowNormal185
	BTFSC       PORTD+0, 4 
	GOTO        L__lineFollowNormal185
	BTFSC       PORTD+0, 5 
	GOTO        L__lineFollowNormal185
	BTFSS       PORTD+0, 6 
	GOTO        L__lineFollowNormal185
	BTFSS       PORTD+0, 7 
	GOTO        L__lineFollowNormal185
	BTFSS       PORTB+0, 2 
	GOTO        L__lineFollowNormal185
	BTFSS       PORTB+0, 6 
	GOTO        L__lineFollowNormal185
	BTFSS       PORTB+0, 7 
	GOTO        L__lineFollowNormal185
	GOTO        L__lineFollowNormal184
L__lineFollowNormal185:
	GOTO        L_lineFollowNormal48
L__lineFollowNormal184:
;Robo2.c,81 :: 		while(Scout==0){
L_lineFollowNormal49:
	BTFSC       PORTB+0, 5 
	GOTO        L_lineFollowNormal50
;Robo2.c,82 :: 		rotateClockwise(TEST_RPM);
	MOVF        _TEST_RPM+0, 0 
	MOVWF       FARG_rotateClockwise_pwm+0 
	MOVF        _TEST_RPM+1, 0 
	MOVWF       FARG_rotateClockwise_pwm+1 
	CALL        _rotateClockwise+0, 0
;Robo2.c,83 :: 		}
	GOTO        L_lineFollowNormal49
L_lineFollowNormal50:
;Robo2.c,84 :: 		}
	GOTO        L_lineFollowNormal51
L_lineFollowNormal48:
;Robo2.c,85 :: 		else if( (Scout==0 && Sensor1==1 && Sensor2==1 && Sensor3==1 && Sensor4==1 && Sensor5==1 && Sensor6==1 && Sensor7==0 && Sensor8==0 && Sensor9==0) && (Scout==0 && Sensor1==1 && Sensor2==1 && Sensor3==1 && Sensor4==1 && Sensor5==1 && Sensor6==0 && Sensor7==0 && Sensor8==0 && Sensor9==0)){
	BTFSC       PORTB+0, 5 
	GOTO        L_lineFollowNormal58
	BTFSS       PORTB+0, 4 
	GOTO        L_lineFollowNormal58
	BTFSS       PORTB+0, 3 
	GOTO        L_lineFollowNormal58
	BTFSS       PORTD+0, 4 
	GOTO        L_lineFollowNormal58
	BTFSS       PORTD+0, 5 
	GOTO        L_lineFollowNormal58
	BTFSS       PORTD+0, 6 
	GOTO        L_lineFollowNormal58
	BTFSS       PORTD+0, 7 
	GOTO        L_lineFollowNormal58
	BTFSC       PORTB+0, 2 
	GOTO        L_lineFollowNormal58
	BTFSC       PORTB+0, 6 
	GOTO        L_lineFollowNormal58
	BTFSC       PORTB+0, 7 
	GOTO        L_lineFollowNormal58
L__lineFollowNormal183:
	BTFSC       PORTB+0, 5 
	GOTO        L_lineFollowNormal58
	BTFSS       PORTB+0, 4 
	GOTO        L_lineFollowNormal58
	BTFSS       PORTB+0, 3 
	GOTO        L_lineFollowNormal58
	BTFSS       PORTD+0, 4 
	GOTO        L_lineFollowNormal58
	BTFSS       PORTD+0, 5 
	GOTO        L_lineFollowNormal58
	BTFSS       PORTD+0, 6 
	GOTO        L_lineFollowNormal58
	BTFSC       PORTD+0, 7 
	GOTO        L_lineFollowNormal58
	BTFSC       PORTB+0, 2 
	GOTO        L_lineFollowNormal58
	BTFSC       PORTB+0, 6 
	GOTO        L_lineFollowNormal58
	BTFSC       PORTB+0, 7 
	GOTO        L_lineFollowNormal58
L__lineFollowNormal182:
L__lineFollowNormal181:
;Robo2.c,87 :: 		while(Scout==0){
L_lineFollowNormal59:
	BTFSC       PORTB+0, 5 
	GOTO        L_lineFollowNormal60
;Robo2.c,88 :: 		rotateAntiClockwise(TEST_RPM);
	MOVF        _TEST_RPM+0, 0 
	MOVWF       FARG_rotateAntiClockwise_pwm+0 
	MOVF        _TEST_RPM+1, 0 
	MOVWF       FARG_rotateAntiClockwise_pwm+1 
	CALL        _rotateAntiClockwise+0, 0
;Robo2.c,89 :: 		}
	GOTO        L_lineFollowNormal59
L_lineFollowNormal60:
;Robo2.c,90 :: 		}
	GOTO        L_lineFollowNormal61
L_lineFollowNormal58:
;Robo2.c,91 :: 		else if( Sensor4==1 && Sensor5==1){
	BTFSS       PORTD+0, 5 
	GOTO        L_lineFollowNormal64
	BTFSS       PORTD+0, 6 
	GOTO        L_lineFollowNormal64
L__lineFollowNormal180:
;Robo2.c,93 :: 		moveForward(TEST_RPM,TEST_RPM);
	MOVF        _TEST_RPM+0, 0 
	MOVWF       FARG_moveForward_pwmLeft+0 
	MOVF        _TEST_RPM+1, 0 
	MOVWF       FARG_moveForward_pwmLeft+1 
	MOVF        _TEST_RPM+0, 0 
	MOVWF       FARG_moveForward_pwmRight+0 
	MOVF        _TEST_RPM+1, 0 
	MOVWF       FARG_moveForward_pwmRight+1 
	CALL        _moveForward+0, 0
;Robo2.c,94 :: 		}
	GOTO        L_lineFollowNormal65
L_lineFollowNormal64:
;Robo2.c,95 :: 		else if( Sensor4==1 && Sensor5==0 && Scout==1){
	BTFSS       PORTD+0, 5 
	GOTO        L_lineFollowNormal68
	BTFSC       PORTD+0, 6 
	GOTO        L_lineFollowNormal68
	BTFSS       PORTB+0, 5 
	GOTO        L_lineFollowNormal68
L__lineFollowNormal179:
;Robo2.c,97 :: 		turnLeft(TEST_RPM);
	MOVF        _TEST_RPM+0, 0 
	MOVWF       FARG_turnLeft_pwmRight+0 
	MOVF        _TEST_RPM+1, 0 
	MOVWF       FARG_turnLeft_pwmRight+1 
	CALL        _turnLeft+0, 0
;Robo2.c,98 :: 		}
	GOTO        L_lineFollowNormal69
L_lineFollowNormal68:
;Robo2.c,99 :: 		else if( Sensor4==0 && Sensor5==1 && Scout==1){
	BTFSC       PORTD+0, 5 
	GOTO        L_lineFollowNormal72
	BTFSS       PORTD+0, 6 
	GOTO        L_lineFollowNormal72
	BTFSS       PORTB+0, 5 
	GOTO        L_lineFollowNormal72
L__lineFollowNormal178:
;Robo2.c,101 :: 		turnRight(TEST_RPM);
	MOVF        _TEST_RPM+0, 0 
	MOVWF       FARG_turnRight_pwmLeft+0 
	MOVF        _TEST_RPM+1, 0 
	MOVWF       FARG_turnRight_pwmLeft+1 
	CALL        _turnRight+0, 0
;Robo2.c,102 :: 		}
	GOTO        L_lineFollowNormal73
L_lineFollowNormal72:
;Robo2.c,103 :: 		else if( Sensor4==1 && Sensor5==0 && Scout==0){
	BTFSS       PORTD+0, 5 
	GOTO        L_lineFollowNormal76
	BTFSC       PORTD+0, 6 
	GOTO        L_lineFollowNormal76
	BTFSC       PORTB+0, 5 
	GOTO        L_lineFollowNormal76
L__lineFollowNormal177:
;Robo2.c,105 :: 		stop();
	CALL        _stop+0, 0
;Robo2.c,107 :: 		rotateAntiClockwise(TEST_RPM);
	MOVF        _TEST_RPM+0, 0 
	MOVWF       FARG_rotateAntiClockwise_pwm+0 
	MOVF        _TEST_RPM+1, 0 
	MOVWF       FARG_rotateAntiClockwise_pwm+1 
	CALL        _rotateAntiClockwise+0, 0
;Robo2.c,108 :: 		}
	GOTO        L_lineFollowNormal77
L_lineFollowNormal76:
;Robo2.c,109 :: 		else if( Sensor4==0 && Sensor5==1 && Scout==0){
	BTFSC       PORTD+0, 5 
	GOTO        L_lineFollowNormal80
	BTFSS       PORTD+0, 6 
	GOTO        L_lineFollowNormal80
	BTFSC       PORTB+0, 5 
	GOTO        L_lineFollowNormal80
L__lineFollowNormal176:
;Robo2.c,111 :: 		stop();
	CALL        _stop+0, 0
;Robo2.c,113 :: 		rotateClockwise(TEST_RPM);
	MOVF        _TEST_RPM+0, 0 
	MOVWF       FARG_rotateClockwise_pwm+0 
	MOVF        _TEST_RPM+1, 0 
	MOVWF       FARG_rotateClockwise_pwm+1 
	CALL        _rotateClockwise+0, 0
;Robo2.c,114 :: 		}
	GOTO        L_lineFollowNormal81
L_lineFollowNormal80:
;Robo2.c,115 :: 		else if( Sensor4==0 && Sensor5==0 ){
	BTFSC       PORTD+0, 5 
	GOTO        L_lineFollowNormal84
	BTFSC       PORTD+0, 6 
	GOTO        L_lineFollowNormal84
L__lineFollowNormal175:
;Robo2.c,116 :: 		if(Sensor3 ==1){
	BTFSS       PORTD+0, 4 
	GOTO        L_lineFollowNormal85
;Robo2.c,117 :: 		rotateAntiClockwise(TEST_RPM);
	MOVF        _TEST_RPM+0, 0 
	MOVWF       FARG_rotateAntiClockwise_pwm+0 
	MOVF        _TEST_RPM+1, 0 
	MOVWF       FARG_rotateAntiClockwise_pwm+1 
	CALL        _rotateAntiClockwise+0, 0
;Robo2.c,118 :: 		}
	GOTO        L_lineFollowNormal86
L_lineFollowNormal85:
;Robo2.c,119 :: 		else if(Sensor6 ==1){
	BTFSS       PORTD+0, 7 
	GOTO        L_lineFollowNormal87
;Robo2.c,120 :: 		rotateClockwise(TEST_RPM);
	MOVF        _TEST_RPM+0, 0 
	MOVWF       FARG_rotateClockwise_pwm+0 
	MOVF        _TEST_RPM+1, 0 
	MOVWF       FARG_rotateClockwise_pwm+1 
	CALL        _rotateClockwise+0, 0
;Robo2.c,121 :: 		}
	GOTO        L_lineFollowNormal88
L_lineFollowNormal87:
;Robo2.c,122 :: 		else if(Sensor2 ==1){
	BTFSS       PORTB+0, 3 
	GOTO        L_lineFollowNormal89
;Robo2.c,123 :: 		rotateAntiClockwise(TEST_RPM);
	MOVF        _TEST_RPM+0, 0 
	MOVWF       FARG_rotateAntiClockwise_pwm+0 
	MOVF        _TEST_RPM+1, 0 
	MOVWF       FARG_rotateAntiClockwise_pwm+1 
	CALL        _rotateAntiClockwise+0, 0
;Robo2.c,124 :: 		}
	GOTO        L_lineFollowNormal90
L_lineFollowNormal89:
;Robo2.c,125 :: 		else if(Sensor7 ==1){
	BTFSS       PORTB+0, 2 
	GOTO        L_lineFollowNormal91
;Robo2.c,126 :: 		rotateClockwise(TEST_RPM);
	MOVF        _TEST_RPM+0, 0 
	MOVWF       FARG_rotateClockwise_pwm+0 
	MOVF        _TEST_RPM+1, 0 
	MOVWF       FARG_rotateClockwise_pwm+1 
	CALL        _rotateClockwise+0, 0
;Robo2.c,127 :: 		}
	GOTO        L_lineFollowNormal92
L_lineFollowNormal91:
;Robo2.c,130 :: 		stop();
	CALL        _stop+0, 0
;Robo2.c,131 :: 		sendSensorStatus();
	CALL        _sendSensorStatus+0, 0
;Robo2.c,133 :: 		}
L_lineFollowNormal92:
L_lineFollowNormal90:
L_lineFollowNormal88:
L_lineFollowNormal86:
;Robo2.c,134 :: 		}
L_lineFollowNormal84:
L_lineFollowNormal81:
L_lineFollowNormal77:
L_lineFollowNormal73:
L_lineFollowNormal69:
L_lineFollowNormal65:
L_lineFollowNormal61:
L_lineFollowNormal51:
L_lineFollowNormal41:
;Robo2.c,136 :: 		}
	GOTO        L_lineFollowNormal32
L_lineFollowNormal33:
;Robo2.c,137 :: 		}
	RETURN      0
; end of _lineFollowNormal

_setPID:

;Robo2.c,139 :: 		void setPID(){
;Robo2.c,140 :: 		MIN_RPM = 185;       //155
	MOVLW       185
	MOVWF       _MIN_RPM+0 
	MOVLW       0
	MOVWF       _MIN_RPM+1 
;Robo2.c,141 :: 		MID_RPM = 180;
	MOVLW       180
	MOVWF       _MID_RPM+0 
	MOVLW       0
	MOVWF       _MID_RPM+1 
;Robo2.c,142 :: 		MAX_RPM = 255;
	MOVLW       255
	MOVWF       _MAX_RPM+0 
	MOVLW       0
	MOVWF       _MAX_RPM+1 
;Robo2.c,143 :: 		TEST_RPM = 200;
	MOVLW       200
	MOVWF       _TEST_RPM+0 
	MOVLW       0
	MOVWF       _TEST_RPM+1 
;Robo2.c,145 :: 		Kp = 9;
	MOVLW       0
	MOVWF       _Kp+0 
	MOVLW       0
	MOVWF       _Kp+1 
	MOVLW       16
	MOVWF       _Kp+2 
	MOVLW       130
	MOVWF       _Kp+3 
;Robo2.c,146 :: 		Ki = 0;
	CLRF        _Ki+0 
	CLRF        _Ki+1 
	CLRF        _Ki+2 
	CLRF        _Ki+3 
;Robo2.c,147 :: 		Kd = 0;
	CLRF        _Kd+0 
	CLRF        _Kd+1 
	CLRF        _Kd+2 
	CLRF        _Kd+3 
;Robo2.c,149 :: 		totalError = 0;
	CLRF        _totalError+0 
	CLRF        _totalError+1 
	CLRF        _totalError+2 
	CLRF        _totalError+3 
;Robo2.c,150 :: 		previousDeviation = 0;
	CLRF        _previousDeviation+0 
	CLRF        _previousDeviation+1 
;Robo2.c,151 :: 		PID_LeftRPM = 0;
	CLRF        _PID_LeftRPM+0 
	CLRF        _PID_LeftRPM+1 
;Robo2.c,152 :: 		PID_RightRPM = 0;
	CLRF        _PID_RightRPM+0 
	CLRF        _PID_RightRPM+1 
;Robo2.c,154 :: 		Pwm1_Set_Duty(MID_RPM);
	MOVLW       180
	MOVWF       FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;Robo2.c,155 :: 		Pwm2_Set_Duty(MID_RPM);
	MOVF        _MID_RPM+0, 0 
	MOVWF       FARG_PWM2_Set_Duty_new_duty+0 
	CALL        _PWM2_Set_Duty+0, 0
;Robo2.c,156 :: 		}
	RETURN      0
; end of _setPID

_lineFollowPID:

;Robo2.c,158 :: 		void lineFollowPID(){
;Robo2.c,159 :: 		while( !(Sensor3==0 && Sensor4==0 && Sensor5==0 && Sensor6==0 && Sensor7==0)){
L_lineFollowPID93:
	BTFSC       PORTD+0, 4 
	GOTO        L_lineFollowPID96
	BTFSC       PORTD+0, 5 
	GOTO        L_lineFollowPID96
	BTFSC       PORTD+0, 6 
	GOTO        L_lineFollowPID96
	BTFSC       PORTD+0, 7 
	GOTO        L_lineFollowPID96
	BTFSC       PORTB+0, 2 
	GOTO        L_lineFollowPID96
	MOVLW       1
	MOVWF       R0 
	GOTO        L_lineFollowPID95
L_lineFollowPID96:
	CLRF        R0 
L_lineFollowPID95:
	MOVF        R0, 1 
	BTFSS       STATUS+0, 2 
	GOTO        L_lineFollowPID94
;Robo2.c,162 :: 		if( Sensor3==1 && Sensor4==0 && Sensor5==0 && Sensor6==0 && Sensor7==0)
	BTFSS       PORTD+0, 4 
	GOTO        L_lineFollowPID99
	BTFSC       PORTD+0, 5 
	GOTO        L_lineFollowPID99
	BTFSC       PORTD+0, 6 
	GOTO        L_lineFollowPID99
	BTFSC       PORTD+0, 7 
	GOTO        L_lineFollowPID99
	BTFSC       PORTB+0, 2 
	GOTO        L_lineFollowPID99
L__lineFollowPID200:
;Robo2.c,163 :: 		deviation = 4;
	MOVLW       4
	MOVWF       _deviation+0 
	MOVLW       0
	MOVWF       _deviation+1 
L_lineFollowPID99:
;Robo2.c,164 :: 		if( Sensor3==1 && Sensor4==1 && Sensor5==0 && Sensor6==0 && Sensor7==0)
	BTFSS       PORTD+0, 4 
	GOTO        L_lineFollowPID102
	BTFSS       PORTD+0, 5 
	GOTO        L_lineFollowPID102
	BTFSC       PORTD+0, 6 
	GOTO        L_lineFollowPID102
	BTFSC       PORTD+0, 7 
	GOTO        L_lineFollowPID102
	BTFSC       PORTB+0, 2 
	GOTO        L_lineFollowPID102
L__lineFollowPID199:
;Robo2.c,165 :: 		deviation = 3;
	MOVLW       3
	MOVWF       _deviation+0 
	MOVLW       0
	MOVWF       _deviation+1 
L_lineFollowPID102:
;Robo2.c,166 :: 		if( Sensor3==1 && Sensor4==1 && Sensor5==1 && Sensor6==0 && Sensor7==0)
	BTFSS       PORTD+0, 4 
	GOTO        L_lineFollowPID105
	BTFSS       PORTD+0, 5 
	GOTO        L_lineFollowPID105
	BTFSS       PORTD+0, 6 
	GOTO        L_lineFollowPID105
	BTFSC       PORTD+0, 7 
	GOTO        L_lineFollowPID105
	BTFSC       PORTB+0, 2 
	GOTO        L_lineFollowPID105
L__lineFollowPID198:
;Robo2.c,167 :: 		deviation = 2;
	MOVLW       2
	MOVWF       _deviation+0 
	MOVLW       0
	MOVWF       _deviation+1 
L_lineFollowPID105:
;Robo2.c,168 :: 		if( Sensor3==0 && Sensor4==1 && Sensor5==0 && Sensor6==0 && Sensor7==0)
	BTFSC       PORTD+0, 4 
	GOTO        L_lineFollowPID108
	BTFSS       PORTD+0, 5 
	GOTO        L_lineFollowPID108
	BTFSC       PORTD+0, 6 
	GOTO        L_lineFollowPID108
	BTFSC       PORTD+0, 7 
	GOTO        L_lineFollowPID108
	BTFSC       PORTB+0, 2 
	GOTO        L_lineFollowPID108
L__lineFollowPID197:
;Robo2.c,169 :: 		deviation = 1;
	MOVLW       1
	MOVWF       _deviation+0 
	MOVLW       0
	MOVWF       _deviation+1 
L_lineFollowPID108:
;Robo2.c,171 :: 		if( Sensor3==0 && Sensor4==1 && Sensor5==1 && Sensor6==0 && Sensor7==0)
	BTFSC       PORTD+0, 4 
	GOTO        L_lineFollowPID111
	BTFSS       PORTD+0, 5 
	GOTO        L_lineFollowPID111
	BTFSS       PORTD+0, 6 
	GOTO        L_lineFollowPID111
	BTFSC       PORTD+0, 7 
	GOTO        L_lineFollowPID111
	BTFSC       PORTB+0, 2 
	GOTO        L_lineFollowPID111
L__lineFollowPID196:
;Robo2.c,172 :: 		deviation = 0;
	CLRF        _deviation+0 
	CLRF        _deviation+1 
L_lineFollowPID111:
;Robo2.c,173 :: 		if( Sensor3==0 && Sensor4==1 && Sensor5==1 && Sensor6==1 && Sensor7==0)
	BTFSC       PORTD+0, 4 
	GOTO        L_lineFollowPID114
	BTFSS       PORTD+0, 5 
	GOTO        L_lineFollowPID114
	BTFSS       PORTD+0, 6 
	GOTO        L_lineFollowPID114
	BTFSS       PORTD+0, 7 
	GOTO        L_lineFollowPID114
	BTFSC       PORTB+0, 2 
	GOTO        L_lineFollowPID114
L__lineFollowPID195:
;Robo2.c,174 :: 		deviation = 0;
	CLRF        _deviation+0 
	CLRF        _deviation+1 
L_lineFollowPID114:
;Robo2.c,175 :: 		if( Sensor3==0 && Sensor4==0 && Sensor5==1 && Sensor6==0 && Sensor7==0)
	BTFSC       PORTD+0, 4 
	GOTO        L_lineFollowPID117
	BTFSC       PORTD+0, 5 
	GOTO        L_lineFollowPID117
	BTFSS       PORTD+0, 6 
	GOTO        L_lineFollowPID117
	BTFSC       PORTD+0, 7 
	GOTO        L_lineFollowPID117
	BTFSC       PORTB+0, 2 
	GOTO        L_lineFollowPID117
L__lineFollowPID194:
;Robo2.c,176 :: 		deviation = 0;
	CLRF        _deviation+0 
	CLRF        _deviation+1 
L_lineFollowPID117:
;Robo2.c,177 :: 		if( Sensor3==0 && Sensor4==0 && Sensor5==1 && Sensor6==1 && Sensor7==0)
	BTFSC       PORTD+0, 4 
	GOTO        L_lineFollowPID120
	BTFSC       PORTD+0, 5 
	GOTO        L_lineFollowPID120
	BTFSS       PORTD+0, 6 
	GOTO        L_lineFollowPID120
	BTFSS       PORTD+0, 7 
	GOTO        L_lineFollowPID120
	BTFSC       PORTB+0, 2 
	GOTO        L_lineFollowPID120
L__lineFollowPID193:
;Robo2.c,178 :: 		deviation = 0;
	CLRF        _deviation+0 
	CLRF        _deviation+1 
L_lineFollowPID120:
;Robo2.c,180 :: 		if( Sensor3==0 && Sensor4==0 && Sensor5==0 && Sensor6==1 && Sensor7==0)
	BTFSC       PORTD+0, 4 
	GOTO        L_lineFollowPID123
	BTFSC       PORTD+0, 5 
	GOTO        L_lineFollowPID123
	BTFSC       PORTD+0, 6 
	GOTO        L_lineFollowPID123
	BTFSS       PORTD+0, 7 
	GOTO        L_lineFollowPID123
	BTFSC       PORTB+0, 2 
	GOTO        L_lineFollowPID123
L__lineFollowPID192:
;Robo2.c,181 :: 		deviation = -1;
	MOVLW       255
	MOVWF       _deviation+0 
	MOVLW       255
	MOVWF       _deviation+1 
L_lineFollowPID123:
;Robo2.c,182 :: 		if( Sensor3==0 && Sensor4==0 && Sensor5==1 && Sensor6==1 && Sensor7==1)
	BTFSC       PORTD+0, 4 
	GOTO        L_lineFollowPID126
	BTFSC       PORTD+0, 5 
	GOTO        L_lineFollowPID126
	BTFSS       PORTD+0, 6 
	GOTO        L_lineFollowPID126
	BTFSS       PORTD+0, 7 
	GOTO        L_lineFollowPID126
	BTFSS       PORTB+0, 2 
	GOTO        L_lineFollowPID126
L__lineFollowPID191:
;Robo2.c,183 :: 		deviation = -2;
	MOVLW       254
	MOVWF       _deviation+0 
	MOVLW       255
	MOVWF       _deviation+1 
L_lineFollowPID126:
;Robo2.c,184 :: 		if( Sensor3==0 && Sensor4==0 && Sensor5==0 && Sensor6==1 && Sensor7==1)
	BTFSC       PORTD+0, 4 
	GOTO        L_lineFollowPID129
	BTFSC       PORTD+0, 5 
	GOTO        L_lineFollowPID129
	BTFSC       PORTD+0, 6 
	GOTO        L_lineFollowPID129
	BTFSS       PORTD+0, 7 
	GOTO        L_lineFollowPID129
	BTFSS       PORTB+0, 2 
	GOTO        L_lineFollowPID129
L__lineFollowPID190:
;Robo2.c,185 :: 		deviation = -3;
	MOVLW       253
	MOVWF       _deviation+0 
	MOVLW       255
	MOVWF       _deviation+1 
L_lineFollowPID129:
;Robo2.c,186 :: 		if( Sensor3==0 && Sensor4==0 && Sensor5==0 && Sensor6==0 && Sensor7==1)
	BTFSC       PORTD+0, 4 
	GOTO        L_lineFollowPID132
	BTFSC       PORTD+0, 5 
	GOTO        L_lineFollowPID132
	BTFSC       PORTD+0, 6 
	GOTO        L_lineFollowPID132
	BTFSC       PORTD+0, 7 
	GOTO        L_lineFollowPID132
	BTFSS       PORTB+0, 2 
	GOTO        L_lineFollowPID132
L__lineFollowPID189:
;Robo2.c,187 :: 		deviation = -4;
	MOVLW       252
	MOVWF       _deviation+0 
	MOVLW       255
	MOVWF       _deviation+1 
L_lineFollowPID132:
;Robo2.c,189 :: 		correction =  Kp*deviation + Ki*totalError + Kd*(deviation-previousDeviation);
	MOVF        _deviation+0, 0 
	MOVWF       R0 
	MOVF        _deviation+1, 0 
	MOVWF       R1 
	CALL        _Int2Double+0, 0
	MOVF        _Kp+0, 0 
	MOVWF       R4 
	MOVF        _Kp+1, 0 
	MOVWF       R5 
	MOVF        _Kp+2, 0 
	MOVWF       R6 
	MOVF        _Kp+3, 0 
	MOVWF       R7 
	CALL        _Mul_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       FLOC__lineFollowPID+0 
	MOVF        R1, 0 
	MOVWF       FLOC__lineFollowPID+1 
	MOVF        R2, 0 
	MOVWF       FLOC__lineFollowPID+2 
	MOVF        R3, 0 
	MOVWF       FLOC__lineFollowPID+3 
	MOVF        _Ki+0, 0 
	MOVWF       R0 
	MOVF        _Ki+1, 0 
	MOVWF       R1 
	MOVF        _Ki+2, 0 
	MOVWF       R2 
	MOVF        _Ki+3, 0 
	MOVWF       R3 
	MOVF        _totalError+0, 0 
	MOVWF       R4 
	MOVF        _totalError+1, 0 
	MOVWF       R5 
	MOVF        _totalError+2, 0 
	MOVWF       R6 
	MOVF        _totalError+3, 0 
	MOVWF       R7 
	CALL        _Mul_32x32_FP+0, 0
	MOVF        FLOC__lineFollowPID+0, 0 
	MOVWF       R4 
	MOVF        FLOC__lineFollowPID+1, 0 
	MOVWF       R5 
	MOVF        FLOC__lineFollowPID+2, 0 
	MOVWF       R6 
	MOVF        FLOC__lineFollowPID+3, 0 
	MOVWF       R7 
	CALL        _Add_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       FLOC__lineFollowPID+0 
	MOVF        R1, 0 
	MOVWF       FLOC__lineFollowPID+1 
	MOVF        R2, 0 
	MOVWF       FLOC__lineFollowPID+2 
	MOVF        R3, 0 
	MOVWF       FLOC__lineFollowPID+3 
	MOVF        _previousDeviation+0, 0 
	SUBWF       _deviation+0, 0 
	MOVWF       R0 
	MOVF        _previousDeviation+1, 0 
	SUBWFB      _deviation+1, 0 
	MOVWF       R1 
	CALL        _Int2Double+0, 0
	MOVF        _Kd+0, 0 
	MOVWF       R4 
	MOVF        _Kd+1, 0 
	MOVWF       R5 
	MOVF        _Kd+2, 0 
	MOVWF       R6 
	MOVF        _Kd+3, 0 
	MOVWF       R7 
	CALL        _Mul_32x32_FP+0, 0
	MOVF        FLOC__lineFollowPID+0, 0 
	MOVWF       R4 
	MOVF        FLOC__lineFollowPID+1, 0 
	MOVWF       R5 
	MOVF        FLOC__lineFollowPID+2, 0 
	MOVWF       R6 
	MOVF        FLOC__lineFollowPID+3, 0 
	MOVWF       R7 
	CALL        _Add_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       FLOC__lineFollowPID+8 
	MOVF        R1, 0 
	MOVWF       FLOC__lineFollowPID+9 
	MOVF        R2, 0 
	MOVWF       FLOC__lineFollowPID+10 
	MOVF        R3, 0 
	MOVWF       FLOC__lineFollowPID+11 
	MOVF        FLOC__lineFollowPID+8, 0 
	MOVWF       _correction+0 
	MOVF        FLOC__lineFollowPID+9, 0 
	MOVWF       _correction+1 
	MOVF        FLOC__lineFollowPID+10, 0 
	MOVWF       _correction+2 
	MOVF        FLOC__lineFollowPID+11, 0 
	MOVWF       _correction+3 
;Robo2.c,190 :: 		totalError += correction;
	MOVF        _totalError+0, 0 
	MOVWF       R0 
	MOVF        _totalError+1, 0 
	MOVWF       R1 
	MOVF        _totalError+2, 0 
	MOVWF       R2 
	MOVF        _totalError+3, 0 
	MOVWF       R3 
	MOVF        FLOC__lineFollowPID+8, 0 
	MOVWF       R4 
	MOVF        FLOC__lineFollowPID+9, 0 
	MOVWF       R5 
	MOVF        FLOC__lineFollowPID+10, 0 
	MOVWF       R6 
	MOVF        FLOC__lineFollowPID+11, 0 
	MOVWF       R7 
	CALL        _Add_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       _totalError+0 
	MOVF        R1, 0 
	MOVWF       _totalError+1 
	MOVF        R2, 0 
	MOVWF       _totalError+2 
	MOVF        R3, 0 
	MOVWF       _totalError+3 
;Robo2.c,191 :: 		previousDeviation = deviation;
	MOVF        _deviation+0, 0 
	MOVWF       _previousDeviation+0 
	MOVF        _deviation+1, 0 
	MOVWF       _previousDeviation+1 
;Robo2.c,193 :: 		PID_LeftRPM = MID_RPM - correction;
	MOVF        _MID_RPM+0, 0 
	MOVWF       R0 
	MOVF        _MID_RPM+1, 0 
	MOVWF       R1 
	CALL        _Int2Double+0, 0
	MOVF        R0, 0 
	MOVWF       FLOC__lineFollowPID+4 
	MOVF        R1, 0 
	MOVWF       FLOC__lineFollowPID+5 
	MOVF        R2, 0 
	MOVWF       FLOC__lineFollowPID+6 
	MOVF        R3, 0 
	MOVWF       FLOC__lineFollowPID+7 
	MOVF        FLOC__lineFollowPID+8, 0 
	MOVWF       R4 
	MOVF        FLOC__lineFollowPID+9, 0 
	MOVWF       R5 
	MOVF        FLOC__lineFollowPID+10, 0 
	MOVWF       R6 
	MOVF        FLOC__lineFollowPID+11, 0 
	MOVWF       R7 
	MOVF        FLOC__lineFollowPID+4, 0 
	MOVWF       R0 
	MOVF        FLOC__lineFollowPID+5, 0 
	MOVWF       R1 
	MOVF        FLOC__lineFollowPID+6, 0 
	MOVWF       R2 
	MOVF        FLOC__lineFollowPID+7, 0 
	MOVWF       R3 
	CALL        _Sub_32x32_FP+0, 0
	CALL        _Double2Int+0, 0
	MOVF        R0, 0 
	MOVWF       FLOC__lineFollowPID+0 
	MOVF        R1, 0 
	MOVWF       FLOC__lineFollowPID+1 
	MOVF        FLOC__lineFollowPID+0, 0 
	MOVWF       _PID_LeftRPM+0 
	MOVF        FLOC__lineFollowPID+1, 0 
	MOVWF       _PID_LeftRPM+1 
;Robo2.c,194 :: 		PID_RightRPM = MID_RPM + correction;
	MOVF        FLOC__lineFollowPID+4, 0 
	MOVWF       R0 
	MOVF        FLOC__lineFollowPID+5, 0 
	MOVWF       R1 
	MOVF        FLOC__lineFollowPID+6, 0 
	MOVWF       R2 
	MOVF        FLOC__lineFollowPID+7, 0 
	MOVWF       R3 
	MOVF        FLOC__lineFollowPID+8, 0 
	MOVWF       R4 
	MOVF        FLOC__lineFollowPID+9, 0 
	MOVWF       R5 
	MOVF        FLOC__lineFollowPID+10, 0 
	MOVWF       R6 
	MOVF        FLOC__lineFollowPID+11, 0 
	MOVWF       R7 
	CALL        _Add_32x32_FP+0, 0
	CALL        _Double2Int+0, 0
	MOVF        R0, 0 
	MOVWF       _PID_RightRPM+0 
	MOVF        R1, 0 
	MOVWF       _PID_RightRPM+1 
;Robo2.c,196 :: 		moveForward(PID_LeftRPM, PID_RightRPM);
	MOVF        FLOC__lineFollowPID+0, 0 
	MOVWF       FARG_moveForward_pwmLeft+0 
	MOVF        FLOC__lineFollowPID+1, 0 
	MOVWF       FARG_moveForward_pwmLeft+1 
	MOVF        R0, 0 
	MOVWF       FARG_moveForward_pwmRight+0 
	MOVF        R1, 0 
	MOVWF       FARG_moveForward_pwmRight+1 
	CALL        _moveForward+0, 0
;Robo2.c,198 :: 		}
	GOTO        L_lineFollowPID93
L_lineFollowPID94:
;Robo2.c,199 :: 		correction = 0;
	CLRF        _correction+0 
	CLRF        _correction+1 
	CLRF        _correction+2 
	CLRF        _correction+3 
;Robo2.c,200 :: 		totalError = 0;
	CLRF        _totalError+0 
	CLRF        _totalError+1 
	CLRF        _totalError+2 
	CLRF        _totalError+3 
;Robo2.c,201 :: 		}
	RETURN      0
; end of _lineFollowPID

_sendSensorStatus:

;Robo2.c,203 :: 		void sendSensorStatus(){
;Robo2.c,204 :: 		if( Sensor1 == 1){
	BTFSS       PORTB+0, 4 
	GOTO        L_sendSensorStatus133
;Robo2.c,205 :: 		debugText = "1";
	MOVLW       ?lstr8_Robo2+0
	MOVWF       _debugText+0 
	MOVLW       hi_addr(?lstr8_Robo2+0)
	MOVWF       _debugText+1 
;Robo2.c,206 :: 		UART1_Write_Text(debugText);
	MOVF        _debugText+0, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVF        _debugText+1, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;Robo2.c,207 :: 		}
	GOTO        L_sendSensorStatus134
L_sendSensorStatus133:
;Robo2.c,208 :: 		else if( Sensor1 == 0){
	BTFSC       PORTB+0, 4 
	GOTO        L_sendSensorStatus135
;Robo2.c,209 :: 		debugText = "0";
	MOVLW       ?lstr9_Robo2+0
	MOVWF       _debugText+0 
	MOVLW       hi_addr(?lstr9_Robo2+0)
	MOVWF       _debugText+1 
;Robo2.c,210 :: 		UART1_Write_Text(debugText);
	MOVF        _debugText+0, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVF        _debugText+1, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;Robo2.c,211 :: 		}
L_sendSensorStatus135:
L_sendSensorStatus134:
;Robo2.c,213 :: 		if( Sensor2 == 1){
	BTFSS       PORTB+0, 3 
	GOTO        L_sendSensorStatus136
;Robo2.c,214 :: 		debugText = "1";
	MOVLW       ?lstr10_Robo2+0
	MOVWF       _debugText+0 
	MOVLW       hi_addr(?lstr10_Robo2+0)
	MOVWF       _debugText+1 
;Robo2.c,215 :: 		UART1_Write_Text(debugText);
	MOVF        _debugText+0, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVF        _debugText+1, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;Robo2.c,216 :: 		}
	GOTO        L_sendSensorStatus137
L_sendSensorStatus136:
;Robo2.c,217 :: 		else if( Sensor2 == 0){
	BTFSC       PORTB+0, 3 
	GOTO        L_sendSensorStatus138
;Robo2.c,218 :: 		debugText = "0";
	MOVLW       ?lstr11_Robo2+0
	MOVWF       _debugText+0 
	MOVLW       hi_addr(?lstr11_Robo2+0)
	MOVWF       _debugText+1 
;Robo2.c,219 :: 		UART1_Write_Text(debugText);
	MOVF        _debugText+0, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVF        _debugText+1, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;Robo2.c,220 :: 		}
L_sendSensorStatus138:
L_sendSensorStatus137:
;Robo2.c,222 :: 		if( Sensor3 == 1){
	BTFSS       PORTD+0, 4 
	GOTO        L_sendSensorStatus139
;Robo2.c,223 :: 		debugText = "1";
	MOVLW       ?lstr12_Robo2+0
	MOVWF       _debugText+0 
	MOVLW       hi_addr(?lstr12_Robo2+0)
	MOVWF       _debugText+1 
;Robo2.c,224 :: 		UART1_Write_Text(debugText);
	MOVF        _debugText+0, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVF        _debugText+1, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;Robo2.c,225 :: 		}
	GOTO        L_sendSensorStatus140
L_sendSensorStatus139:
;Robo2.c,226 :: 		else if( Sensor3 == 0){
	BTFSC       PORTD+0, 4 
	GOTO        L_sendSensorStatus141
;Robo2.c,227 :: 		debugText = "0";
	MOVLW       ?lstr13_Robo2+0
	MOVWF       _debugText+0 
	MOVLW       hi_addr(?lstr13_Robo2+0)
	MOVWF       _debugText+1 
;Robo2.c,228 :: 		UART1_Write_Text(debugText);
	MOVF        _debugText+0, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVF        _debugText+1, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;Robo2.c,229 :: 		}
L_sendSensorStatus141:
L_sendSensorStatus140:
;Robo2.c,231 :: 		if( Sensor4 == 1){
	BTFSS       PORTD+0, 5 
	GOTO        L_sendSensorStatus142
;Robo2.c,232 :: 		debugText = "1";
	MOVLW       ?lstr14_Robo2+0
	MOVWF       _debugText+0 
	MOVLW       hi_addr(?lstr14_Robo2+0)
	MOVWF       _debugText+1 
;Robo2.c,233 :: 		UART1_Write_Text(debugText);
	MOVF        _debugText+0, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVF        _debugText+1, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;Robo2.c,234 :: 		}
	GOTO        L_sendSensorStatus143
L_sendSensorStatus142:
;Robo2.c,235 :: 		else if( Sensor4 == 0){
	BTFSC       PORTD+0, 5 
	GOTO        L_sendSensorStatus144
;Robo2.c,236 :: 		debugText = "0";
	MOVLW       ?lstr15_Robo2+0
	MOVWF       _debugText+0 
	MOVLW       hi_addr(?lstr15_Robo2+0)
	MOVWF       _debugText+1 
;Robo2.c,237 :: 		UART1_Write_Text(debugText);
	MOVF        _debugText+0, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVF        _debugText+1, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;Robo2.c,238 :: 		}
L_sendSensorStatus144:
L_sendSensorStatus143:
;Robo2.c,240 :: 		if( Sensor5 == 1){
	BTFSS       PORTD+0, 6 
	GOTO        L_sendSensorStatus145
;Robo2.c,241 :: 		debugText = "1";
	MOVLW       ?lstr16_Robo2+0
	MOVWF       _debugText+0 
	MOVLW       hi_addr(?lstr16_Robo2+0)
	MOVWF       _debugText+1 
;Robo2.c,242 :: 		UART1_Write_Text(debugText);
	MOVF        _debugText+0, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVF        _debugText+1, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;Robo2.c,243 :: 		}
	GOTO        L_sendSensorStatus146
L_sendSensorStatus145:
;Robo2.c,244 :: 		else if( Sensor5 == 0){
	BTFSC       PORTD+0, 6 
	GOTO        L_sendSensorStatus147
;Robo2.c,245 :: 		debugText = "0";
	MOVLW       ?lstr17_Robo2+0
	MOVWF       _debugText+0 
	MOVLW       hi_addr(?lstr17_Robo2+0)
	MOVWF       _debugText+1 
;Robo2.c,246 :: 		UART1_Write_Text(debugText);
	MOVF        _debugText+0, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVF        _debugText+1, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;Robo2.c,247 :: 		}
L_sendSensorStatus147:
L_sendSensorStatus146:
;Robo2.c,249 :: 		if( Sensor6 == 1){
	BTFSS       PORTD+0, 7 
	GOTO        L_sendSensorStatus148
;Robo2.c,250 :: 		debugText = "1";
	MOVLW       ?lstr18_Robo2+0
	MOVWF       _debugText+0 
	MOVLW       hi_addr(?lstr18_Robo2+0)
	MOVWF       _debugText+1 
;Robo2.c,251 :: 		UART1_Write_Text(debugText);
	MOVF        _debugText+0, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVF        _debugText+1, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;Robo2.c,252 :: 		}
	GOTO        L_sendSensorStatus149
L_sendSensorStatus148:
;Robo2.c,253 :: 		else if( Sensor6 == 0){
	BTFSC       PORTD+0, 7 
	GOTO        L_sendSensorStatus150
;Robo2.c,254 :: 		debugText = "0";
	MOVLW       ?lstr19_Robo2+0
	MOVWF       _debugText+0 
	MOVLW       hi_addr(?lstr19_Robo2+0)
	MOVWF       _debugText+1 
;Robo2.c,255 :: 		UART1_Write_Text(debugText);
	MOVF        _debugText+0, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVF        _debugText+1, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;Robo2.c,256 :: 		}
L_sendSensorStatus150:
L_sendSensorStatus149:
;Robo2.c,258 :: 		if( Sensor7 == 1){
	BTFSS       PORTB+0, 2 
	GOTO        L_sendSensorStatus151
;Robo2.c,259 :: 		debugText = "1";
	MOVLW       ?lstr20_Robo2+0
	MOVWF       _debugText+0 
	MOVLW       hi_addr(?lstr20_Robo2+0)
	MOVWF       _debugText+1 
;Robo2.c,260 :: 		UART1_Write_Text(debugText);
	MOVF        _debugText+0, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVF        _debugText+1, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;Robo2.c,261 :: 		}
	GOTO        L_sendSensorStatus152
L_sendSensorStatus151:
;Robo2.c,262 :: 		else if( Sensor7 == 0){
	BTFSC       PORTB+0, 2 
	GOTO        L_sendSensorStatus153
;Robo2.c,263 :: 		debugText = "0";
	MOVLW       ?lstr21_Robo2+0
	MOVWF       _debugText+0 
	MOVLW       hi_addr(?lstr21_Robo2+0)
	MOVWF       _debugText+1 
;Robo2.c,264 :: 		UART1_Write_Text(debugText);
	MOVF        _debugText+0, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVF        _debugText+1, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;Robo2.c,265 :: 		}
L_sendSensorStatus153:
L_sendSensorStatus152:
;Robo2.c,267 :: 		if( Sensor8 == 1){
	BTFSS       PORTB+0, 6 
	GOTO        L_sendSensorStatus154
;Robo2.c,268 :: 		debugText = "1";
	MOVLW       ?lstr22_Robo2+0
	MOVWF       _debugText+0 
	MOVLW       hi_addr(?lstr22_Robo2+0)
	MOVWF       _debugText+1 
;Robo2.c,269 :: 		UART1_Write_Text(debugText);
	MOVF        _debugText+0, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVF        _debugText+1, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;Robo2.c,270 :: 		}
	GOTO        L_sendSensorStatus155
L_sendSensorStatus154:
;Robo2.c,271 :: 		else if( Sensor8 == 0){
	BTFSC       PORTB+0, 6 
	GOTO        L_sendSensorStatus156
;Robo2.c,272 :: 		debugText = "0";
	MOVLW       ?lstr23_Robo2+0
	MOVWF       _debugText+0 
	MOVLW       hi_addr(?lstr23_Robo2+0)
	MOVWF       _debugText+1 
;Robo2.c,273 :: 		UART1_Write_Text(debugText);
	MOVF        _debugText+0, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVF        _debugText+1, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;Robo2.c,274 :: 		}
L_sendSensorStatus156:
L_sendSensorStatus155:
;Robo2.c,276 :: 		if( Sensor9 == 1){
	BTFSS       PORTB+0, 7 
	GOTO        L_sendSensorStatus157
;Robo2.c,277 :: 		debugText = "1";
	MOVLW       ?lstr24_Robo2+0
	MOVWF       _debugText+0 
	MOVLW       hi_addr(?lstr24_Robo2+0)
	MOVWF       _debugText+1 
;Robo2.c,278 :: 		UART1_Write_Text(debugText);
	MOVF        _debugText+0, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVF        _debugText+1, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;Robo2.c,279 :: 		}
	GOTO        L_sendSensorStatus158
L_sendSensorStatus157:
;Robo2.c,280 :: 		else if( Sensor9 == 0){
	BTFSC       PORTB+0, 7 
	GOTO        L_sendSensorStatus159
;Robo2.c,281 :: 		debugText = "0";
	MOVLW       ?lstr25_Robo2+0
	MOVWF       _debugText+0 
	MOVLW       hi_addr(?lstr25_Robo2+0)
	MOVWF       _debugText+1 
;Robo2.c,282 :: 		UART1_Write_Text(debugText);
	MOVF        _debugText+0, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVF        _debugText+1, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;Robo2.c,283 :: 		}
L_sendSensorStatus159:
L_sendSensorStatus158:
;Robo2.c,285 :: 		if( Scout == 1){
	BTFSS       PORTB+0, 5 
	GOTO        L_sendSensorStatus160
;Robo2.c,286 :: 		debugText = " 1; ";
	MOVLW       ?lstr26_Robo2+0
	MOVWF       _debugText+0 
	MOVLW       hi_addr(?lstr26_Robo2+0)
	MOVWF       _debugText+1 
;Robo2.c,287 :: 		UART1_Write_Text(debugText);
	MOVF        _debugText+0, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVF        _debugText+1, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;Robo2.c,288 :: 		}
	GOTO        L_sendSensorStatus161
L_sendSensorStatus160:
;Robo2.c,289 :: 		else if( Scout == 0){
	BTFSC       PORTB+0, 5 
	GOTO        L_sendSensorStatus162
;Robo2.c,290 :: 		debugText = " 0; ";
	MOVLW       ?lstr27_Robo2+0
	MOVWF       _debugText+0 
	MOVLW       hi_addr(?lstr27_Robo2+0)
	MOVWF       _debugText+1 
;Robo2.c,291 :: 		UART1_Write_Text(debugText);
	MOVF        _debugText+0, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVF        _debugText+1, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;Robo2.c,292 :: 		}
L_sendSensorStatus162:
L_sendSensorStatus161:
;Robo2.c,293 :: 		}
	RETURN      0
; end of _sendSensorStatus

_testPIC:

;Robo2.c,295 :: 		void testPIC(){
;Robo2.c,296 :: 		moveForward(200,200);
	MOVLW       200
	MOVWF       FARG_moveForward_pwmLeft+0 
	MOVLW       0
	MOVWF       FARG_moveForward_pwmLeft+1 
	MOVLW       200
	MOVWF       FARG_moveForward_pwmRight+0 
	MOVLW       0
	MOVWF       FARG_moveForward_pwmRight+1 
	CALL        _moveForward+0, 0
;Robo2.c,297 :: 		debugText = "move Forward  ";
	MOVLW       ?lstr28_Robo2+0
	MOVWF       _debugText+0 
	MOVLW       hi_addr(?lstr28_Robo2+0)
	MOVWF       _debugText+1 
;Robo2.c,298 :: 		UART1_Write_Text(debugText);
	MOVF        _debugText+0, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVF        _debugText+1, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;Robo2.c,299 :: 		delay_ms(5000);
	MOVLW       127
	MOVWF       R11, 0
	MOVLW       212
	MOVWF       R12, 0
	MOVLW       49
	MOVWF       R13, 0
L_testPIC163:
	DECFSZ      R13, 1, 0
	BRA         L_testPIC163
	DECFSZ      R12, 1, 0
	BRA         L_testPIC163
	DECFSZ      R11, 1, 0
	BRA         L_testPIC163
	NOP
	NOP
;Robo2.c,301 :: 		motorRight_foward(255);
	MOVLW       255
	MOVWF       FARG_motorRight_foward_pwm+0 
	MOVLW       0
	MOVWF       FARG_motorRight_foward_pwm+1 
	CALL        _motorRight_foward+0, 0
;Robo2.c,302 :: 		debugText = "turn Left";
	MOVLW       ?lstr29_Robo2+0
	MOVWF       _debugText+0 
	MOVLW       hi_addr(?lstr29_Robo2+0)
	MOVWF       _debugText+1 
;Robo2.c,303 :: 		UART1_Write_Text(debugText);
	MOVF        _debugText+0, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVF        _debugText+1, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;Robo2.c,304 :: 		motorLeft_stop();
	CALL        _motorLeft_stop+0, 0
;Robo2.c,305 :: 		delay_ms(5000);
	MOVLW       127
	MOVWF       R11, 0
	MOVLW       212
	MOVWF       R12, 0
	MOVLW       49
	MOVWF       R13, 0
L_testPIC164:
	DECFSZ      R13, 1, 0
	BRA         L_testPIC164
	DECFSZ      R12, 1, 0
	BRA         L_testPIC164
	DECFSZ      R11, 1, 0
	BRA         L_testPIC164
	NOP
	NOP
;Robo2.c,307 :: 		motorLeft_foward(255);
	MOVLW       255
	MOVWF       FARG_motorLeft_foward_pwm+0 
	MOVLW       0
	MOVWF       FARG_motorLeft_foward_pwm+1 
	CALL        _motorLeft_foward+0, 0
;Robo2.c,308 :: 		debugText = "turn Right";
	MOVLW       ?lstr30_Robo2+0
	MOVWF       _debugText+0 
	MOVLW       hi_addr(?lstr30_Robo2+0)
	MOVWF       _debugText+1 
;Robo2.c,309 :: 		UART1_Write_Text(debugText);
	MOVF        _debugText+0, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVF        _debugText+1, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;Robo2.c,310 :: 		motorRight_stop();
	CALL        _motorRight_stop+0, 0
;Robo2.c,311 :: 		delay_ms(5000);
	MOVLW       127
	MOVWF       R11, 0
	MOVLW       212
	MOVWF       R12, 0
	MOVLW       49
	MOVWF       R13, 0
L_testPIC165:
	DECFSZ      R13, 1, 0
	BRA         L_testPIC165
	DECFSZ      R12, 1, 0
	BRA         L_testPIC165
	DECFSZ      R11, 1, 0
	BRA         L_testPIC165
	NOP
	NOP
;Robo2.c,313 :: 		stop();
	CALL        _stop+0, 0
;Robo2.c,314 :: 		debugText = "Stopping..   ";
	MOVLW       ?lstr31_Robo2+0
	MOVWF       _debugText+0 
	MOVLW       hi_addr(?lstr31_Robo2+0)
	MOVWF       _debugText+1 
;Robo2.c,315 :: 		UART1_Write_Text(debugText);
	MOVF        _debugText+0, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVF        _debugText+1, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;Robo2.c,317 :: 		debugText = "Decrease PWM..   ";
	MOVLW       ?lstr32_Robo2+0
	MOVWF       _debugText+0 
	MOVLW       hi_addr(?lstr32_Robo2+0)
	MOVWF       _debugText+1 
;Robo2.c,318 :: 		UART1_Write_Text(debugText);
	MOVF        _debugText+0, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVF        _debugText+1, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;Robo2.c,320 :: 		for( count=255; count>0; count--){
	MOVLW       255
	MOVWF       _count+0 
	MOVLW       0
	MOVWF       _count+1 
L_testPIC166:
	MOVLW       128
	MOVWF       R0 
	MOVLW       128
	XORWF       _count+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__testPIC202
	MOVF        _count+0, 0 
	SUBLW       0
L__testPIC202:
	BTFSC       STATUS+0, 0 
	GOTO        L_testPIC167
;Robo2.c,321 :: 		moveForward(count,count);
	MOVF        _count+0, 0 
	MOVWF       FARG_moveForward_pwmLeft+0 
	MOVF        _count+1, 0 
	MOVWF       FARG_moveForward_pwmLeft+1 
	MOVF        _count+0, 0 
	MOVWF       FARG_moveForward_pwmRight+0 
	MOVF        _count+1, 0 
	MOVWF       FARG_moveForward_pwmRight+1 
	CALL        _moveForward+0, 0
;Robo2.c,322 :: 		delay_ms(100);
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       138
	MOVWF       R12, 0
	MOVLW       85
	MOVWF       R13, 0
L_testPIC169:
	DECFSZ      R13, 1, 0
	BRA         L_testPIC169
	DECFSZ      R12, 1, 0
	BRA         L_testPIC169
	DECFSZ      R11, 1, 0
	BRA         L_testPIC169
	NOP
	NOP
;Robo2.c,320 :: 		for( count=255; count>0; count--){
	MOVLW       1
	SUBWF       _count+0, 1 
	MOVLW       0
	SUBWFB      _count+1, 1 
;Robo2.c,325 :: 		}
	GOTO        L_testPIC166
L_testPIC167:
;Robo2.c,326 :: 		}
	RETURN      0
; end of _testPIC
