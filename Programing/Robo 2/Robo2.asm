
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

;Robo2.c,21 :: 		void main() {
;Robo2.c,22 :: 		configure();
	CALL        _configure+0, 0
;Robo2.c,24 :: 		UART1_Write_Text(ConnectionEstablished);
	MOVF        _ConnectionEstablished+0, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVF        _ConnectionEstablished+1, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;Robo2.c,25 :: 		setPID();
	CALL        _setPID+0, 0
;Robo2.c,31 :: 		debugText = "          Starting..  ";
	MOVLW       ?lstr3_Robo2+0
	MOVWF       _debugText+0 
	MOVLW       hi_addr(?lstr3_Robo2+0)
	MOVWF       _debugText+1 
;Robo2.c,32 :: 		UART1_Write_Text(debugText);
	MOVF        _debugText+0, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVF        _debugText+1, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;Robo2.c,34 :: 		delay_ms(1000);
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
;Robo2.c,35 :: 		debugText = "Test Sensors   ";
	MOVLW       ?lstr4_Robo2+0
	MOVWF       _debugText+0 
	MOVLW       hi_addr(?lstr4_Robo2+0)
	MOVWF       _debugText+1 
;Robo2.c,36 :: 		UART1_Write_Text(debugText);
	MOVF        _debugText+0, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVF        _debugText+1, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;Robo2.c,38 :: 		for(count=0; count<2; count++){
	CLRF        _count+0 
	CLRF        _count+1 
L_main4:
	MOVLW       128
	XORWF       _count+1, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main83
	MOVLW       2
	SUBWF       _count+0, 0 
L__main83:
	BTFSC       STATUS+0, 0 
	GOTO        L_main5
;Robo2.c,39 :: 		receiveCommand = UART1_Read();
	CALL        _UART1_Read+0, 0
	MOVF        R0, 0 
	MOVWF       _receiveCommand+0 
;Robo2.c,40 :: 		sendSensorStatus();
	CALL        _sendSensorStatus+0, 0
;Robo2.c,41 :: 		delay_ms(1000);
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
;Robo2.c,38 :: 		for(count=0; count<2; count++){
	INFSNZ      _count+0, 1 
	INCF        _count+1, 1 
;Robo2.c,42 :: 		}                                                  //while( receiveCommand != 'A' && receiveCommand != 'a' );
	GOTO        L_main4
L_main5:
;Robo2.c,44 :: 		debugText = "Start Line follow..   ";
	MOVLW       ?lstr5_Robo2+0
	MOVWF       _debugText+0 
	MOVLW       hi_addr(?lstr5_Robo2+0)
	MOVWF       _debugText+1 
;Robo2.c,45 :: 		UART1_Write_Text(debugText);
	MOVF        _debugText+0, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVF        _debugText+1, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;Robo2.c,46 :: 		lineFollowNormal();
	CALL        _lineFollowNormal+0, 0
;Robo2.c,47 :: 		}
	GOTO        $+0
; end of _main

_setPID:

;Robo2.c,49 :: 		void setPID(){
;Robo2.c,50 :: 		MIN_RPM = 155;       //185
	MOVLW       155
	MOVWF       _MIN_RPM+0 
	MOVLW       0
	MOVWF       _MIN_RPM+1 
;Robo2.c,51 :: 		MID_RPM = 210;
	MOVLW       210
	MOVWF       _MID_RPM+0 
	MOVLW       0
	MOVWF       _MID_RPM+1 
;Robo2.c,52 :: 		MAX_RPM = 255;
	MOVLW       255
	MOVWF       _MAX_RPM+0 
	MOVLW       0
	MOVWF       _MAX_RPM+1 
;Robo2.c,53 :: 		TEST_RPM = 200;
	MOVLW       200
	MOVWF       _TEST_RPM+0 
	MOVLW       0
	MOVWF       _TEST_RPM+1 
;Robo2.c,55 :: 		Kp = 10;
	MOVLW       0
	MOVWF       _Kp+0 
	MOVLW       0
	MOVWF       _Kp+1 
	MOVLW       32
	MOVWF       _Kp+2 
	MOVLW       130
	MOVWF       _Kp+3 
;Robo2.c,56 :: 		Kd = 0;
	CLRF        _Kd+0 
	CLRF        _Kd+1 
	CLRF        _Kd+2 
	CLRF        _Kd+3 
;Robo2.c,58 :: 		Pwm1_Set_Duty(MID_RPM);
	MOVLW       210
	MOVWF       FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;Robo2.c,59 :: 		Pwm2_Set_Duty(MID_RPM);
	MOVF        _MID_RPM+0, 0 
	MOVWF       FARG_PWM2_Set_Duty_new_duty+0 
	CALL        _PWM2_Set_Duty+0, 0
;Robo2.c,60 :: 		}
	RETURN      0
; end of _setPID

_lineFollowNormal:

;Robo2.c,62 :: 		void lineFollowNormal(){
;Robo2.c,63 :: 		while(1){
L_lineFollowNormal8:
;Robo2.c,64 :: 		if( Sensor4==1 && Sensor5==1){
	BTFSS       PORTD+0, 5 
	GOTO        L_lineFollowNormal12
	BTFSS       PORTD+0, 6 
	GOTO        L_lineFollowNormal12
L__lineFollowNormal82:
;Robo2.c,66 :: 		moveForward(TEST_RPM,TEST_RPM);
	MOVF        _TEST_RPM+0, 0 
	MOVWF       FARG_moveForward_pwmLeft+0 
	MOVF        _TEST_RPM+1, 0 
	MOVWF       FARG_moveForward_pwmLeft+1 
	MOVF        _TEST_RPM+0, 0 
	MOVWF       FARG_moveForward_pwmRight+0 
	MOVF        _TEST_RPM+1, 0 
	MOVWF       FARG_moveForward_pwmRight+1 
	CALL        _moveForward+0, 0
;Robo2.c,67 :: 		}
	GOTO        L_lineFollowNormal13
L_lineFollowNormal12:
;Robo2.c,68 :: 		else if( Sensor4==1 && Sensor5==0 && Scout==1){
	BTFSS       PORTD+0, 5 
	GOTO        L_lineFollowNormal16
	BTFSC       PORTD+0, 6 
	GOTO        L_lineFollowNormal16
	BTFSS       PORTB+0, 5 
	GOTO        L_lineFollowNormal16
L__lineFollowNormal81:
;Robo2.c,70 :: 		turnLeft(TEST_RPM);
	MOVF        _TEST_RPM+0, 0 
	MOVWF       FARG_turnLeft_pwmRight+0 
	MOVF        _TEST_RPM+1, 0 
	MOVWF       FARG_turnLeft_pwmRight+1 
	CALL        _turnLeft+0, 0
;Robo2.c,71 :: 		}
	GOTO        L_lineFollowNormal17
L_lineFollowNormal16:
;Robo2.c,72 :: 		else if( Sensor4==0 && Sensor5==1 && Scout==1){
	BTFSC       PORTD+0, 5 
	GOTO        L_lineFollowNormal20
	BTFSS       PORTD+0, 6 
	GOTO        L_lineFollowNormal20
	BTFSS       PORTB+0, 5 
	GOTO        L_lineFollowNormal20
L__lineFollowNormal80:
;Robo2.c,74 :: 		turnRight(TEST_RPM);
	MOVF        _TEST_RPM+0, 0 
	MOVWF       FARG_turnRight_pwmLeft+0 
	MOVF        _TEST_RPM+1, 0 
	MOVWF       FARG_turnRight_pwmLeft+1 
	CALL        _turnRight+0, 0
;Robo2.c,75 :: 		}
	GOTO        L_lineFollowNormal21
L_lineFollowNormal20:
;Robo2.c,76 :: 		else if( Sensor4==1 && Sensor5==0 && Scout==0){
	BTFSS       PORTD+0, 5 
	GOTO        L_lineFollowNormal24
	BTFSC       PORTD+0, 6 
	GOTO        L_lineFollowNormal24
	BTFSC       PORTB+0, 5 
	GOTO        L_lineFollowNormal24
L__lineFollowNormal79:
;Robo2.c,78 :: 		turnLeft(TEST_RPM);
	MOVF        _TEST_RPM+0, 0 
	MOVWF       FARG_turnLeft_pwmRight+0 
	MOVF        _TEST_RPM+1, 0 
	MOVWF       FARG_turnLeft_pwmRight+1 
	CALL        _turnLeft+0, 0
;Robo2.c,79 :: 		}
	GOTO        L_lineFollowNormal25
L_lineFollowNormal24:
;Robo2.c,80 :: 		else if( Sensor4==0 && Sensor5==1 && Scout==0){
	BTFSC       PORTD+0, 5 
	GOTO        L_lineFollowNormal28
	BTFSS       PORTD+0, 6 
	GOTO        L_lineFollowNormal28
	BTFSC       PORTB+0, 5 
	GOTO        L_lineFollowNormal28
L__lineFollowNormal78:
;Robo2.c,82 :: 		turnRight(TEST_RPM);
	MOVF        _TEST_RPM+0, 0 
	MOVWF       FARG_turnRight_pwmLeft+0 
	MOVF        _TEST_RPM+1, 0 
	MOVWF       FARG_turnRight_pwmLeft+1 
	CALL        _turnRight+0, 0
;Robo2.c,83 :: 		}
	GOTO        L_lineFollowNormal29
L_lineFollowNormal28:
;Robo2.c,84 :: 		else if( Sensor4==0 && Sensor5==0 ){
	BTFSC       PORTD+0, 5 
	GOTO        L_lineFollowNormal32
	BTFSC       PORTD+0, 6 
	GOTO        L_lineFollowNormal32
L__lineFollowNormal77:
;Robo2.c,85 :: 		if(Sensor3 ==1){
	BTFSS       PORTD+0, 4 
	GOTO        L_lineFollowNormal33
;Robo2.c,86 :: 		turnLeft(TEST_RPM);
	MOVF        _TEST_RPM+0, 0 
	MOVWF       FARG_turnLeft_pwmRight+0 
	MOVF        _TEST_RPM+1, 0 
	MOVWF       FARG_turnLeft_pwmRight+1 
	CALL        _turnLeft+0, 0
;Robo2.c,87 :: 		}
	GOTO        L_lineFollowNormal34
L_lineFollowNormal33:
;Robo2.c,88 :: 		else if(Sensor6 ==1){
	BTFSS       PORTD+0, 7 
	GOTO        L_lineFollowNormal35
;Robo2.c,89 :: 		turnRight(TEST_RPM);
	MOVF        _TEST_RPM+0, 0 
	MOVWF       FARG_turnRight_pwmLeft+0 
	MOVF        _TEST_RPM+1, 0 
	MOVWF       FARG_turnRight_pwmLeft+1 
	CALL        _turnRight+0, 0
;Robo2.c,90 :: 		}
	GOTO        L_lineFollowNormal36
L_lineFollowNormal35:
;Robo2.c,91 :: 		else if(Sensor2 ==1){
	BTFSS       PORTB+0, 3 
	GOTO        L_lineFollowNormal37
;Robo2.c,92 :: 		rotateAntiClockwise(TEST_RPM);
	MOVF        _TEST_RPM+0, 0 
	MOVWF       FARG_rotateAntiClockwise_pwm+0 
	MOVF        _TEST_RPM+1, 0 
	MOVWF       FARG_rotateAntiClockwise_pwm+1 
	CALL        _rotateAntiClockwise+0, 0
;Robo2.c,93 :: 		}
	GOTO        L_lineFollowNormal38
L_lineFollowNormal37:
;Robo2.c,94 :: 		else if(Sensor7 ==1){
	BTFSS       PORTB+0, 2 
	GOTO        L_lineFollowNormal39
;Robo2.c,95 :: 		rotateClockwise(TEST_RPM);
	MOVF        _TEST_RPM+0, 0 
	MOVWF       FARG_rotateClockwise_pwm+0 
	MOVF        _TEST_RPM+1, 0 
	MOVWF       FARG_rotateClockwise_pwm+1 
	CALL        _rotateClockwise+0, 0
;Robo2.c,96 :: 		}
L_lineFollowNormal39:
L_lineFollowNormal38:
L_lineFollowNormal36:
L_lineFollowNormal34:
;Robo2.c,98 :: 		stop();
	CALL        _stop+0, 0
;Robo2.c,99 :: 		}
L_lineFollowNormal32:
L_lineFollowNormal29:
L_lineFollowNormal25:
L_lineFollowNormal21:
L_lineFollowNormal17:
L_lineFollowNormal13:
;Robo2.c,101 :: 		}
	GOTO        L_lineFollowNormal8
;Robo2.c,102 :: 		}
	RETURN      0
; end of _lineFollowNormal

_lineFollowPID:

;Robo2.c,104 :: 		void lineFollowPID(){
;Robo2.c,108 :: 		}
	RETURN      0
; end of _lineFollowPID

_sendSensorStatus:

;Robo2.c,110 :: 		void sendSensorStatus(){
;Robo2.c,111 :: 		if( Sensor1 == 1){
	BTFSS       PORTB+0, 4 
	GOTO        L_sendSensorStatus40
;Robo2.c,112 :: 		debugText = "1";
	MOVLW       ?lstr6_Robo2+0
	MOVWF       _debugText+0 
	MOVLW       hi_addr(?lstr6_Robo2+0)
	MOVWF       _debugText+1 
;Robo2.c,113 :: 		UART1_Write_Text(debugText);
	MOVF        _debugText+0, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVF        _debugText+1, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;Robo2.c,114 :: 		}
	GOTO        L_sendSensorStatus41
L_sendSensorStatus40:
;Robo2.c,115 :: 		else if( Sensor1 == 0){
	BTFSC       PORTB+0, 4 
	GOTO        L_sendSensorStatus42
;Robo2.c,116 :: 		debugText = "0";
	MOVLW       ?lstr7_Robo2+0
	MOVWF       _debugText+0 
	MOVLW       hi_addr(?lstr7_Robo2+0)
	MOVWF       _debugText+1 
;Robo2.c,117 :: 		UART1_Write_Text(debugText);
	MOVF        _debugText+0, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVF        _debugText+1, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;Robo2.c,118 :: 		}
L_sendSensorStatus42:
L_sendSensorStatus41:
;Robo2.c,120 :: 		if( Sensor2 == 1){
	BTFSS       PORTB+0, 3 
	GOTO        L_sendSensorStatus43
;Robo2.c,121 :: 		debugText = "1";
	MOVLW       ?lstr8_Robo2+0
	MOVWF       _debugText+0 
	MOVLW       hi_addr(?lstr8_Robo2+0)
	MOVWF       _debugText+1 
;Robo2.c,122 :: 		UART1_Write_Text(debugText);
	MOVF        _debugText+0, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVF        _debugText+1, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;Robo2.c,123 :: 		}
	GOTO        L_sendSensorStatus44
L_sendSensorStatus43:
;Robo2.c,124 :: 		else if( Sensor2 == 0){
	BTFSC       PORTB+0, 3 
	GOTO        L_sendSensorStatus45
;Robo2.c,125 :: 		debugText = "0";
	MOVLW       ?lstr9_Robo2+0
	MOVWF       _debugText+0 
	MOVLW       hi_addr(?lstr9_Robo2+0)
	MOVWF       _debugText+1 
;Robo2.c,126 :: 		UART1_Write_Text(debugText);
	MOVF        _debugText+0, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVF        _debugText+1, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;Robo2.c,127 :: 		}
L_sendSensorStatus45:
L_sendSensorStatus44:
;Robo2.c,129 :: 		if( Sensor3 == 1){
	BTFSS       PORTD+0, 4 
	GOTO        L_sendSensorStatus46
;Robo2.c,130 :: 		debugText = "1";
	MOVLW       ?lstr10_Robo2+0
	MOVWF       _debugText+0 
	MOVLW       hi_addr(?lstr10_Robo2+0)
	MOVWF       _debugText+1 
;Robo2.c,131 :: 		UART1_Write_Text(debugText);
	MOVF        _debugText+0, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVF        _debugText+1, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;Robo2.c,132 :: 		}
	GOTO        L_sendSensorStatus47
L_sendSensorStatus46:
;Robo2.c,133 :: 		else if( Sensor3 == 0){
	BTFSC       PORTD+0, 4 
	GOTO        L_sendSensorStatus48
;Robo2.c,134 :: 		debugText = "0";
	MOVLW       ?lstr11_Robo2+0
	MOVWF       _debugText+0 
	MOVLW       hi_addr(?lstr11_Robo2+0)
	MOVWF       _debugText+1 
;Robo2.c,135 :: 		UART1_Write_Text(debugText);
	MOVF        _debugText+0, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVF        _debugText+1, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;Robo2.c,136 :: 		}
L_sendSensorStatus48:
L_sendSensorStatus47:
;Robo2.c,138 :: 		if( Sensor4 == 1){
	BTFSS       PORTD+0, 5 
	GOTO        L_sendSensorStatus49
;Robo2.c,139 :: 		debugText = "1";
	MOVLW       ?lstr12_Robo2+0
	MOVWF       _debugText+0 
	MOVLW       hi_addr(?lstr12_Robo2+0)
	MOVWF       _debugText+1 
;Robo2.c,140 :: 		UART1_Write_Text(debugText);
	MOVF        _debugText+0, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVF        _debugText+1, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;Robo2.c,141 :: 		}
	GOTO        L_sendSensorStatus50
L_sendSensorStatus49:
;Robo2.c,142 :: 		else if( Sensor4 == 0){
	BTFSC       PORTD+0, 5 
	GOTO        L_sendSensorStatus51
;Robo2.c,143 :: 		debugText = "0";
	MOVLW       ?lstr13_Robo2+0
	MOVWF       _debugText+0 
	MOVLW       hi_addr(?lstr13_Robo2+0)
	MOVWF       _debugText+1 
;Robo2.c,144 :: 		UART1_Write_Text(debugText);
	MOVF        _debugText+0, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVF        _debugText+1, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;Robo2.c,145 :: 		}
L_sendSensorStatus51:
L_sendSensorStatus50:
;Robo2.c,147 :: 		if( Sensor5 == 1){
	BTFSS       PORTD+0, 6 
	GOTO        L_sendSensorStatus52
;Robo2.c,148 :: 		debugText = "1";
	MOVLW       ?lstr14_Robo2+0
	MOVWF       _debugText+0 
	MOVLW       hi_addr(?lstr14_Robo2+0)
	MOVWF       _debugText+1 
;Robo2.c,149 :: 		UART1_Write_Text(debugText);
	MOVF        _debugText+0, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVF        _debugText+1, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;Robo2.c,150 :: 		}
	GOTO        L_sendSensorStatus53
L_sendSensorStatus52:
;Robo2.c,151 :: 		else if( Sensor5 == 0){
	BTFSC       PORTD+0, 6 
	GOTO        L_sendSensorStatus54
;Robo2.c,152 :: 		debugText = "0";
	MOVLW       ?lstr15_Robo2+0
	MOVWF       _debugText+0 
	MOVLW       hi_addr(?lstr15_Robo2+0)
	MOVWF       _debugText+1 
;Robo2.c,153 :: 		UART1_Write_Text(debugText);
	MOVF        _debugText+0, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVF        _debugText+1, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;Robo2.c,154 :: 		}
L_sendSensorStatus54:
L_sendSensorStatus53:
;Robo2.c,156 :: 		if( Sensor6 == 1){
	BTFSS       PORTD+0, 7 
	GOTO        L_sendSensorStatus55
;Robo2.c,157 :: 		debugText = "1";
	MOVLW       ?lstr16_Robo2+0
	MOVWF       _debugText+0 
	MOVLW       hi_addr(?lstr16_Robo2+0)
	MOVWF       _debugText+1 
;Robo2.c,158 :: 		UART1_Write_Text(debugText);
	MOVF        _debugText+0, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVF        _debugText+1, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;Robo2.c,159 :: 		}
	GOTO        L_sendSensorStatus56
L_sendSensorStatus55:
;Robo2.c,160 :: 		else if( Sensor6 == 0){
	BTFSC       PORTD+0, 7 
	GOTO        L_sendSensorStatus57
;Robo2.c,161 :: 		debugText = "0";
	MOVLW       ?lstr17_Robo2+0
	MOVWF       _debugText+0 
	MOVLW       hi_addr(?lstr17_Robo2+0)
	MOVWF       _debugText+1 
;Robo2.c,162 :: 		UART1_Write_Text(debugText);
	MOVF        _debugText+0, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVF        _debugText+1, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;Robo2.c,163 :: 		}
L_sendSensorStatus57:
L_sendSensorStatus56:
;Robo2.c,165 :: 		if( Sensor7 == 1){
	BTFSS       PORTB+0, 2 
	GOTO        L_sendSensorStatus58
;Robo2.c,166 :: 		debugText = "1";
	MOVLW       ?lstr18_Robo2+0
	MOVWF       _debugText+0 
	MOVLW       hi_addr(?lstr18_Robo2+0)
	MOVWF       _debugText+1 
;Robo2.c,167 :: 		UART1_Write_Text(debugText);
	MOVF        _debugText+0, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVF        _debugText+1, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;Robo2.c,168 :: 		}
	GOTO        L_sendSensorStatus59
L_sendSensorStatus58:
;Robo2.c,169 :: 		else if( Sensor7 == 0){
	BTFSC       PORTB+0, 2 
	GOTO        L_sendSensorStatus60
;Robo2.c,170 :: 		debugText = "0";
	MOVLW       ?lstr19_Robo2+0
	MOVWF       _debugText+0 
	MOVLW       hi_addr(?lstr19_Robo2+0)
	MOVWF       _debugText+1 
;Robo2.c,171 :: 		UART1_Write_Text(debugText);
	MOVF        _debugText+0, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVF        _debugText+1, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;Robo2.c,172 :: 		}
L_sendSensorStatus60:
L_sendSensorStatus59:
;Robo2.c,174 :: 		if( Sensor8 == 1){
	BTFSS       PORTB+0, 6 
	GOTO        L_sendSensorStatus61
;Robo2.c,175 :: 		debugText = "1";
	MOVLW       ?lstr20_Robo2+0
	MOVWF       _debugText+0 
	MOVLW       hi_addr(?lstr20_Robo2+0)
	MOVWF       _debugText+1 
;Robo2.c,176 :: 		UART1_Write_Text(debugText);
	MOVF        _debugText+0, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVF        _debugText+1, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;Robo2.c,177 :: 		}
	GOTO        L_sendSensorStatus62
L_sendSensorStatus61:
;Robo2.c,178 :: 		else if( Sensor8 == 0){
	BTFSC       PORTB+0, 6 
	GOTO        L_sendSensorStatus63
;Robo2.c,179 :: 		debugText = "0";
	MOVLW       ?lstr21_Robo2+0
	MOVWF       _debugText+0 
	MOVLW       hi_addr(?lstr21_Robo2+0)
	MOVWF       _debugText+1 
;Robo2.c,180 :: 		UART1_Write_Text(debugText);
	MOVF        _debugText+0, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVF        _debugText+1, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;Robo2.c,181 :: 		}
L_sendSensorStatus63:
L_sendSensorStatus62:
;Robo2.c,183 :: 		if( Sensor9 == 1){
	BTFSS       PORTB+0, 7 
	GOTO        L_sendSensorStatus64
;Robo2.c,184 :: 		debugText = "1";
	MOVLW       ?lstr22_Robo2+0
	MOVWF       _debugText+0 
	MOVLW       hi_addr(?lstr22_Robo2+0)
	MOVWF       _debugText+1 
;Robo2.c,185 :: 		UART1_Write_Text(debugText);
	MOVF        _debugText+0, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVF        _debugText+1, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;Robo2.c,186 :: 		}
	GOTO        L_sendSensorStatus65
L_sendSensorStatus64:
;Robo2.c,187 :: 		else if( Sensor9 == 0){
	BTFSC       PORTB+0, 7 
	GOTO        L_sendSensorStatus66
;Robo2.c,188 :: 		debugText = "0";
	MOVLW       ?lstr23_Robo2+0
	MOVWF       _debugText+0 
	MOVLW       hi_addr(?lstr23_Robo2+0)
	MOVWF       _debugText+1 
;Robo2.c,189 :: 		UART1_Write_Text(debugText);
	MOVF        _debugText+0, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVF        _debugText+1, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;Robo2.c,190 :: 		}
L_sendSensorStatus66:
L_sendSensorStatus65:
;Robo2.c,192 :: 		if( Scout == 1){
	BTFSS       PORTB+0, 5 
	GOTO        L_sendSensorStatus67
;Robo2.c,193 :: 		debugText = " 1; ";
	MOVLW       ?lstr24_Robo2+0
	MOVWF       _debugText+0 
	MOVLW       hi_addr(?lstr24_Robo2+0)
	MOVWF       _debugText+1 
;Robo2.c,194 :: 		UART1_Write_Text(debugText);
	MOVF        _debugText+0, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVF        _debugText+1, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;Robo2.c,195 :: 		}
	GOTO        L_sendSensorStatus68
L_sendSensorStatus67:
;Robo2.c,196 :: 		else if( Scout == 0){
	BTFSC       PORTB+0, 5 
	GOTO        L_sendSensorStatus69
;Robo2.c,197 :: 		debugText = " 0; ";
	MOVLW       ?lstr25_Robo2+0
	MOVWF       _debugText+0 
	MOVLW       hi_addr(?lstr25_Robo2+0)
	MOVWF       _debugText+1 
;Robo2.c,198 :: 		UART1_Write_Text(debugText);
	MOVF        _debugText+0, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVF        _debugText+1, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;Robo2.c,199 :: 		}
L_sendSensorStatus69:
L_sendSensorStatus68:
;Robo2.c,200 :: 		}
	RETURN      0
; end of _sendSensorStatus

_testPIC:

;Robo2.c,202 :: 		void testPIC(){
;Robo2.c,203 :: 		moveForward(200,200);
	MOVLW       200
	MOVWF       FARG_moveForward_pwmLeft+0 
	MOVLW       0
	MOVWF       FARG_moveForward_pwmLeft+1 
	MOVLW       200
	MOVWF       FARG_moveForward_pwmRight+0 
	MOVLW       0
	MOVWF       FARG_moveForward_pwmRight+1 
	CALL        _moveForward+0, 0
;Robo2.c,204 :: 		debugText = "move Forward  ";
	MOVLW       ?lstr26_Robo2+0
	MOVWF       _debugText+0 
	MOVLW       hi_addr(?lstr26_Robo2+0)
	MOVWF       _debugText+1 
;Robo2.c,205 :: 		UART1_Write_Text(debugText);
	MOVF        _debugText+0, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVF        _debugText+1, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;Robo2.c,206 :: 		delay_ms(5000);
	MOVLW       127
	MOVWF       R11, 0
	MOVLW       212
	MOVWF       R12, 0
	MOVLW       49
	MOVWF       R13, 0
L_testPIC70:
	DECFSZ      R13, 1, 0
	BRA         L_testPIC70
	DECFSZ      R12, 1, 0
	BRA         L_testPIC70
	DECFSZ      R11, 1, 0
	BRA         L_testPIC70
	NOP
	NOP
;Robo2.c,208 :: 		motorRight_foward(255);
	MOVLW       255
	MOVWF       FARG_motorRight_foward_pwm+0 
	MOVLW       0
	MOVWF       FARG_motorRight_foward_pwm+1 
	CALL        _motorRight_foward+0, 0
;Robo2.c,209 :: 		debugText = "turn Left";
	MOVLW       ?lstr27_Robo2+0
	MOVWF       _debugText+0 
	MOVLW       hi_addr(?lstr27_Robo2+0)
	MOVWF       _debugText+1 
;Robo2.c,210 :: 		UART1_Write_Text(debugText);
	MOVF        _debugText+0, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVF        _debugText+1, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;Robo2.c,211 :: 		motorLeft_stop();
	CALL        _motorLeft_stop+0, 0
;Robo2.c,212 :: 		delay_ms(5000);
	MOVLW       127
	MOVWF       R11, 0
	MOVLW       212
	MOVWF       R12, 0
	MOVLW       49
	MOVWF       R13, 0
L_testPIC71:
	DECFSZ      R13, 1, 0
	BRA         L_testPIC71
	DECFSZ      R12, 1, 0
	BRA         L_testPIC71
	DECFSZ      R11, 1, 0
	BRA         L_testPIC71
	NOP
	NOP
;Robo2.c,214 :: 		motorLeft_foward(255);
	MOVLW       255
	MOVWF       FARG_motorLeft_foward_pwm+0 
	MOVLW       0
	MOVWF       FARG_motorLeft_foward_pwm+1 
	CALL        _motorLeft_foward+0, 0
;Robo2.c,215 :: 		debugText = "turn Right";
	MOVLW       ?lstr28_Robo2+0
	MOVWF       _debugText+0 
	MOVLW       hi_addr(?lstr28_Robo2+0)
	MOVWF       _debugText+1 
;Robo2.c,216 :: 		UART1_Write_Text(debugText);
	MOVF        _debugText+0, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVF        _debugText+1, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;Robo2.c,217 :: 		motorRight_stop();
	CALL        _motorRight_stop+0, 0
;Robo2.c,218 :: 		delay_ms(5000);
	MOVLW       127
	MOVWF       R11, 0
	MOVLW       212
	MOVWF       R12, 0
	MOVLW       49
	MOVWF       R13, 0
L_testPIC72:
	DECFSZ      R13, 1, 0
	BRA         L_testPIC72
	DECFSZ      R12, 1, 0
	BRA         L_testPIC72
	DECFSZ      R11, 1, 0
	BRA         L_testPIC72
	NOP
	NOP
;Robo2.c,220 :: 		stop();
	CALL        _stop+0, 0
;Robo2.c,221 :: 		debugText = "Stopping..   ";
	MOVLW       ?lstr29_Robo2+0
	MOVWF       _debugText+0 
	MOVLW       hi_addr(?lstr29_Robo2+0)
	MOVWF       _debugText+1 
;Robo2.c,222 :: 		UART1_Write_Text(debugText);
	MOVF        _debugText+0, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVF        _debugText+1, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;Robo2.c,224 :: 		debugText = "Decrease PWM..   ";
	MOVLW       ?lstr30_Robo2+0
	MOVWF       _debugText+0 
	MOVLW       hi_addr(?lstr30_Robo2+0)
	MOVWF       _debugText+1 
;Robo2.c,225 :: 		UART1_Write_Text(debugText);
	MOVF        _debugText+0, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVF        _debugText+1, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;Robo2.c,227 :: 		for( count=255; count>0; count--){
	MOVLW       255
	MOVWF       _count+0 
	MOVLW       0
	MOVWF       _count+1 
L_testPIC73:
	MOVLW       128
	MOVWF       R0 
	MOVLW       128
	XORWF       _count+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__testPIC84
	MOVF        _count+0, 0 
	SUBLW       0
L__testPIC84:
	BTFSC       STATUS+0, 0 
	GOTO        L_testPIC74
;Robo2.c,228 :: 		moveForward(count,count);
	MOVF        _count+0, 0 
	MOVWF       FARG_moveForward_pwmLeft+0 
	MOVF        _count+1, 0 
	MOVWF       FARG_moveForward_pwmLeft+1 
	MOVF        _count+0, 0 
	MOVWF       FARG_moveForward_pwmRight+0 
	MOVF        _count+1, 0 
	MOVWF       FARG_moveForward_pwmRight+1 
	CALL        _moveForward+0, 0
;Robo2.c,229 :: 		delay_ms(100);
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       138
	MOVWF       R12, 0
	MOVLW       85
	MOVWF       R13, 0
L_testPIC76:
	DECFSZ      R13, 1, 0
	BRA         L_testPIC76
	DECFSZ      R12, 1, 0
	BRA         L_testPIC76
	DECFSZ      R11, 1, 0
	BRA         L_testPIC76
	NOP
	NOP
;Robo2.c,227 :: 		for( count=255; count>0; count--){
	MOVLW       1
	SUBWF       _count+0, 1 
	MOVLW       0
	SUBWFB      _count+1, 1 
;Robo2.c,232 :: 		}
	GOTO        L_testPIC73
L_testPIC74:
;Robo2.c,233 :: 		}
	RETURN      0
; end of _testPIC
