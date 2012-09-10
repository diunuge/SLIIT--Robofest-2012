
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

_sendSensorStatus:

;debug.h,12 :: 		void sendSensorStatus(){
;debug.h,13 :: 		if( Sensor1 == 1){
	BTFSS       PORTB+0, 4 
	GOTO        L_sendSensorStatus3
;debug.h,14 :: 		debugText = "1";
	MOVLW       ?lstr3_Main_322.0V+0
	MOVWF       _debugText+0 
	MOVLW       hi_addr(?lstr3_Main_322.0V+0)
	MOVWF       _debugText+1 
;debug.h,15 :: 		UART1_Write_Text(debugText);
	MOVF        _debugText+0, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVF        _debugText+1, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;debug.h,16 :: 		}
	GOTO        L_sendSensorStatus4
L_sendSensorStatus3:
;debug.h,17 :: 		else if( Sensor1 == 0){
	BTFSC       PORTB+0, 4 
	GOTO        L_sendSensorStatus5
;debug.h,18 :: 		debugText = "0";
	MOVLW       ?lstr4_Main_322.0V+0
	MOVWF       _debugText+0 
	MOVLW       hi_addr(?lstr4_Main_322.0V+0)
	MOVWF       _debugText+1 
;debug.h,19 :: 		UART1_Write_Text(debugText);
	MOVF        _debugText+0, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVF        _debugText+1, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;debug.h,20 :: 		}
L_sendSensorStatus5:
L_sendSensorStatus4:
;debug.h,22 :: 		if( Sensor2 == 1){
	BTFSS       PORTB+0, 3 
	GOTO        L_sendSensorStatus6
;debug.h,23 :: 		debugText = "1";
	MOVLW       ?lstr5_Main_322.0V+0
	MOVWF       _debugText+0 
	MOVLW       hi_addr(?lstr5_Main_322.0V+0)
	MOVWF       _debugText+1 
;debug.h,24 :: 		UART1_Write_Text(debugText);
	MOVF        _debugText+0, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVF        _debugText+1, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;debug.h,25 :: 		}
	GOTO        L_sendSensorStatus7
L_sendSensorStatus6:
;debug.h,26 :: 		else if( Sensor2 == 0){
	BTFSC       PORTB+0, 3 
	GOTO        L_sendSensorStatus8
;debug.h,27 :: 		debugText = "0";
	MOVLW       ?lstr6_Main_322.0V+0
	MOVWF       _debugText+0 
	MOVLW       hi_addr(?lstr6_Main_322.0V+0)
	MOVWF       _debugText+1 
;debug.h,28 :: 		UART1_Write_Text(debugText);
	MOVF        _debugText+0, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVF        _debugText+1, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;debug.h,29 :: 		}
L_sendSensorStatus8:
L_sendSensorStatus7:
;debug.h,31 :: 		if( Sensor3 == 1){
	BTFSS       PORTD+0, 4 
	GOTO        L_sendSensorStatus9
;debug.h,32 :: 		debugText = "1";
	MOVLW       ?lstr7_Main_322.0V+0
	MOVWF       _debugText+0 
	MOVLW       hi_addr(?lstr7_Main_322.0V+0)
	MOVWF       _debugText+1 
;debug.h,33 :: 		UART1_Write_Text(debugText);
	MOVF        _debugText+0, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVF        _debugText+1, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;debug.h,34 :: 		}
	GOTO        L_sendSensorStatus10
L_sendSensorStatus9:
;debug.h,35 :: 		else if( Sensor3 == 0){
	BTFSC       PORTD+0, 4 
	GOTO        L_sendSensorStatus11
;debug.h,36 :: 		debugText = "0";
	MOVLW       ?lstr8_Main_322.0V+0
	MOVWF       _debugText+0 
	MOVLW       hi_addr(?lstr8_Main_322.0V+0)
	MOVWF       _debugText+1 
;debug.h,37 :: 		UART1_Write_Text(debugText);
	MOVF        _debugText+0, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVF        _debugText+1, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;debug.h,38 :: 		}
L_sendSensorStatus11:
L_sendSensorStatus10:
;debug.h,40 :: 		if( Sensor4 == 1){
	BTFSS       PORTD+0, 5 
	GOTO        L_sendSensorStatus12
;debug.h,41 :: 		debugText = "1";
	MOVLW       ?lstr9_Main_322.0V+0
	MOVWF       _debugText+0 
	MOVLW       hi_addr(?lstr9_Main_322.0V+0)
	MOVWF       _debugText+1 
;debug.h,42 :: 		UART1_Write_Text(debugText);
	MOVF        _debugText+0, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVF        _debugText+1, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;debug.h,43 :: 		}
	GOTO        L_sendSensorStatus13
L_sendSensorStatus12:
;debug.h,44 :: 		else if( Sensor4 == 0){
	BTFSC       PORTD+0, 5 
	GOTO        L_sendSensorStatus14
;debug.h,45 :: 		debugText = "0";
	MOVLW       ?lstr10_Main_322.0V+0
	MOVWF       _debugText+0 
	MOVLW       hi_addr(?lstr10_Main_322.0V+0)
	MOVWF       _debugText+1 
;debug.h,46 :: 		UART1_Write_Text(debugText);
	MOVF        _debugText+0, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVF        _debugText+1, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;debug.h,47 :: 		}
L_sendSensorStatus14:
L_sendSensorStatus13:
;debug.h,49 :: 		if( Sensor5 == 1){
	BTFSS       PORTD+0, 6 
	GOTO        L_sendSensorStatus15
;debug.h,50 :: 		debugText = "1";
	MOVLW       ?lstr11_Main_322.0V+0
	MOVWF       _debugText+0 
	MOVLW       hi_addr(?lstr11_Main_322.0V+0)
	MOVWF       _debugText+1 
;debug.h,51 :: 		UART1_Write_Text(debugText);
	MOVF        _debugText+0, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVF        _debugText+1, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;debug.h,52 :: 		}
	GOTO        L_sendSensorStatus16
L_sendSensorStatus15:
;debug.h,53 :: 		else if( Sensor5 == 0){
	BTFSC       PORTD+0, 6 
	GOTO        L_sendSensorStatus17
;debug.h,54 :: 		debugText = "0";
	MOVLW       ?lstr12_Main_322.0V+0
	MOVWF       _debugText+0 
	MOVLW       hi_addr(?lstr12_Main_322.0V+0)
	MOVWF       _debugText+1 
;debug.h,55 :: 		UART1_Write_Text(debugText);
	MOVF        _debugText+0, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVF        _debugText+1, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;debug.h,56 :: 		}
L_sendSensorStatus17:
L_sendSensorStatus16:
;debug.h,58 :: 		if( Sensor6 == 1){
	BTFSS       PORTD+0, 7 
	GOTO        L_sendSensorStatus18
;debug.h,59 :: 		debugText = "1";
	MOVLW       ?lstr13_Main_322.0V+0
	MOVWF       _debugText+0 
	MOVLW       hi_addr(?lstr13_Main_322.0V+0)
	MOVWF       _debugText+1 
;debug.h,60 :: 		UART1_Write_Text(debugText);
	MOVF        _debugText+0, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVF        _debugText+1, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;debug.h,61 :: 		}
	GOTO        L_sendSensorStatus19
L_sendSensorStatus18:
;debug.h,62 :: 		else if( Sensor6 == 0){
	BTFSC       PORTD+0, 7 
	GOTO        L_sendSensorStatus20
;debug.h,63 :: 		debugText = "0";
	MOVLW       ?lstr14_Main_322.0V+0
	MOVWF       _debugText+0 
	MOVLW       hi_addr(?lstr14_Main_322.0V+0)
	MOVWF       _debugText+1 
;debug.h,64 :: 		UART1_Write_Text(debugText);
	MOVF        _debugText+0, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVF        _debugText+1, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;debug.h,65 :: 		}
L_sendSensorStatus20:
L_sendSensorStatus19:
;debug.h,67 :: 		if( Sensor7 == 1){
	BTFSS       PORTB+0, 2 
	GOTO        L_sendSensorStatus21
;debug.h,68 :: 		debugText = "1";
	MOVLW       ?lstr15_Main_322.0V+0
	MOVWF       _debugText+0 
	MOVLW       hi_addr(?lstr15_Main_322.0V+0)
	MOVWF       _debugText+1 
;debug.h,69 :: 		UART1_Write_Text(debugText);
	MOVF        _debugText+0, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVF        _debugText+1, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;debug.h,70 :: 		}
	GOTO        L_sendSensorStatus22
L_sendSensorStatus21:
;debug.h,71 :: 		else if( Sensor7 == 0){
	BTFSC       PORTB+0, 2 
	GOTO        L_sendSensorStatus23
;debug.h,72 :: 		debugText = "0";
	MOVLW       ?lstr16_Main_322.0V+0
	MOVWF       _debugText+0 
	MOVLW       hi_addr(?lstr16_Main_322.0V+0)
	MOVWF       _debugText+1 
;debug.h,73 :: 		UART1_Write_Text(debugText);
	MOVF        _debugText+0, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVF        _debugText+1, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;debug.h,74 :: 		}
L_sendSensorStatus23:
L_sendSensorStatus22:
;debug.h,76 :: 		if( Sensor8 == 1){
	BTFSS       PORTB+0, 6 
	GOTO        L_sendSensorStatus24
;debug.h,77 :: 		debugText = "1";
	MOVLW       ?lstr17_Main_322.0V+0
	MOVWF       _debugText+0 
	MOVLW       hi_addr(?lstr17_Main_322.0V+0)
	MOVWF       _debugText+1 
;debug.h,78 :: 		UART1_Write_Text(debugText);
	MOVF        _debugText+0, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVF        _debugText+1, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;debug.h,79 :: 		}
	GOTO        L_sendSensorStatus25
L_sendSensorStatus24:
;debug.h,80 :: 		else if( Sensor8 == 0){
	BTFSC       PORTB+0, 6 
	GOTO        L_sendSensorStatus26
;debug.h,81 :: 		debugText = "0";
	MOVLW       ?lstr18_Main_322.0V+0
	MOVWF       _debugText+0 
	MOVLW       hi_addr(?lstr18_Main_322.0V+0)
	MOVWF       _debugText+1 
;debug.h,82 :: 		UART1_Write_Text(debugText);
	MOVF        _debugText+0, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVF        _debugText+1, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;debug.h,83 :: 		}
L_sendSensorStatus26:
L_sendSensorStatus25:
;debug.h,85 :: 		if( Sensor9 == 1){
	BTFSS       PORTB+0, 7 
	GOTO        L_sendSensorStatus27
;debug.h,86 :: 		debugText = "1";
	MOVLW       ?lstr19_Main_322.0V+0
	MOVWF       _debugText+0 
	MOVLW       hi_addr(?lstr19_Main_322.0V+0)
	MOVWF       _debugText+1 
;debug.h,87 :: 		UART1_Write_Text(debugText);
	MOVF        _debugText+0, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVF        _debugText+1, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;debug.h,88 :: 		}
	GOTO        L_sendSensorStatus28
L_sendSensorStatus27:
;debug.h,89 :: 		else if( Sensor9 == 0){
	BTFSC       PORTB+0, 7 
	GOTO        L_sendSensorStatus29
;debug.h,90 :: 		debugText = "0";
	MOVLW       ?lstr20_Main_322.0V+0
	MOVWF       _debugText+0 
	MOVLW       hi_addr(?lstr20_Main_322.0V+0)
	MOVWF       _debugText+1 
;debug.h,91 :: 		UART1_Write_Text(debugText);
	MOVF        _debugText+0, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVF        _debugText+1, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;debug.h,92 :: 		}
L_sendSensorStatus29:
L_sendSensorStatus28:
;debug.h,94 :: 		if( Scout == 1){
	BTFSS       PORTB+0, 5 
	GOTO        L_sendSensorStatus30
;debug.h,95 :: 		debugText = " 1; ";
	MOVLW       ?lstr21_Main_322.0V+0
	MOVWF       _debugText+0 
	MOVLW       hi_addr(?lstr21_Main_322.0V+0)
	MOVWF       _debugText+1 
;debug.h,96 :: 		UART1_Write_Text(debugText);
	MOVF        _debugText+0, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVF        _debugText+1, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;debug.h,97 :: 		}
	GOTO        L_sendSensorStatus31
L_sendSensorStatus30:
;debug.h,98 :: 		else if( Scout == 0){
	BTFSC       PORTB+0, 5 
	GOTO        L_sendSensorStatus32
;debug.h,99 :: 		debugText = " 0; ";
	MOVLW       ?lstr22_Main_322.0V+0
	MOVWF       _debugText+0 
	MOVLW       hi_addr(?lstr22_Main_322.0V+0)
	MOVWF       _debugText+1 
;debug.h,100 :: 		UART1_Write_Text(debugText);
	MOVF        _debugText+0, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVF        _debugText+1, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;debug.h,101 :: 		}
L_sendSensorStatus32:
L_sendSensorStatus31:
;debug.h,102 :: 		}
	RETURN      0
; end of _sendSensorStatus

_testPIC:

;debug.h,104 :: 		void testPIC(){
;debug.h,105 :: 		moveForward(200,200);
	MOVLW       200
	MOVWF       FARG_moveForward_pwmLeft+0 
	MOVLW       0
	MOVWF       FARG_moveForward_pwmLeft+1 
	MOVLW       200
	MOVWF       FARG_moveForward_pwmRight+0 
	MOVLW       0
	MOVWF       FARG_moveForward_pwmRight+1 
	CALL        _moveForward+0, 0
;debug.h,106 :: 		debugText = "move Forward  ";
	MOVLW       ?lstr23_Main_322.0V+0
	MOVWF       _debugText+0 
	MOVLW       hi_addr(?lstr23_Main_322.0V+0)
	MOVWF       _debugText+1 
;debug.h,107 :: 		UART1_Write_Text(debugText);
	MOVF        _debugText+0, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVF        _debugText+1, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;debug.h,108 :: 		delay_ms(5000);
	MOVLW       127
	MOVWF       R11, 0
	MOVLW       212
	MOVWF       R12, 0
	MOVLW       49
	MOVWF       R13, 0
L_testPIC33:
	DECFSZ      R13, 1, 0
	BRA         L_testPIC33
	DECFSZ      R12, 1, 0
	BRA         L_testPIC33
	DECFSZ      R11, 1, 0
	BRA         L_testPIC33
	NOP
	NOP
;debug.h,110 :: 		motorRight_foward(255);
	MOVLW       255
	MOVWF       FARG_motorRight_foward_pwm+0 
	MOVLW       0
	MOVWF       FARG_motorRight_foward_pwm+1 
	CALL        _motorRight_foward+0, 0
;debug.h,111 :: 		debugText = "turn Left";
	MOVLW       ?lstr24_Main_322.0V+0
	MOVWF       _debugText+0 
	MOVLW       hi_addr(?lstr24_Main_322.0V+0)
	MOVWF       _debugText+1 
;debug.h,112 :: 		UART1_Write_Text(debugText);
	MOVF        _debugText+0, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVF        _debugText+1, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;debug.h,113 :: 		motorLeft_stop();
	CALL        _motorLeft_stop+0, 0
;debug.h,114 :: 		delay_ms(5000);
	MOVLW       127
	MOVWF       R11, 0
	MOVLW       212
	MOVWF       R12, 0
	MOVLW       49
	MOVWF       R13, 0
L_testPIC34:
	DECFSZ      R13, 1, 0
	BRA         L_testPIC34
	DECFSZ      R12, 1, 0
	BRA         L_testPIC34
	DECFSZ      R11, 1, 0
	BRA         L_testPIC34
	NOP
	NOP
;debug.h,116 :: 		motorLeft_foward(255);
	MOVLW       255
	MOVWF       FARG_motorLeft_foward_pwm+0 
	MOVLW       0
	MOVWF       FARG_motorLeft_foward_pwm+1 
	CALL        _motorLeft_foward+0, 0
;debug.h,117 :: 		debugText = "turn Right";
	MOVLW       ?lstr25_Main_322.0V+0
	MOVWF       _debugText+0 
	MOVLW       hi_addr(?lstr25_Main_322.0V+0)
	MOVWF       _debugText+1 
;debug.h,118 :: 		UART1_Write_Text(debugText);
	MOVF        _debugText+0, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVF        _debugText+1, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;debug.h,119 :: 		motorRight_stop();
	CALL        _motorRight_stop+0, 0
;debug.h,120 :: 		delay_ms(5000);
	MOVLW       127
	MOVWF       R11, 0
	MOVLW       212
	MOVWF       R12, 0
	MOVLW       49
	MOVWF       R13, 0
L_testPIC35:
	DECFSZ      R13, 1, 0
	BRA         L_testPIC35
	DECFSZ      R12, 1, 0
	BRA         L_testPIC35
	DECFSZ      R11, 1, 0
	BRA         L_testPIC35
	NOP
	NOP
;debug.h,122 :: 		stop();
	CALL        _stop+0, 0
;debug.h,123 :: 		debugText = "Stopping..   ";
	MOVLW       ?lstr26_Main_322.0V+0
	MOVWF       _debugText+0 
	MOVLW       hi_addr(?lstr26_Main_322.0V+0)
	MOVWF       _debugText+1 
;debug.h,124 :: 		UART1_Write_Text(debugText);
	MOVF        _debugText+0, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVF        _debugText+1, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;debug.h,126 :: 		debugText = "Decrease PWM..   ";
	MOVLW       ?lstr27_Main_322.0V+0
	MOVWF       _debugText+0 
	MOVLW       hi_addr(?lstr27_Main_322.0V+0)
	MOVWF       _debugText+1 
;debug.h,127 :: 		UART1_Write_Text(debugText);
	MOVF        _debugText+0, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVF        _debugText+1, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;debug.h,129 :: 		for( count=255; count>0; count--){
	MOVLW       255
	MOVWF       _count+0 
	MOVLW       0
	MOVWF       _count+1 
L_testPIC36:
	MOVLW       128
	MOVWF       R0 
	MOVLW       128
	XORWF       _count+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__testPIC315
	MOVF        _count+0, 0 
	SUBLW       0
L__testPIC315:
	BTFSC       STATUS+0, 0 
	GOTO        L_testPIC37
;debug.h,130 :: 		moveForward(count,count);
	MOVF        _count+0, 0 
	MOVWF       FARG_moveForward_pwmLeft+0 
	MOVF        _count+1, 0 
	MOVWF       FARG_moveForward_pwmLeft+1 
	MOVF        _count+0, 0 
	MOVWF       FARG_moveForward_pwmRight+0 
	MOVF        _count+1, 0 
	MOVWF       FARG_moveForward_pwmRight+1 
	CALL        _moveForward+0, 0
;debug.h,131 :: 		delay_ms(100);
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       138
	MOVWF       R12, 0
	MOVLW       85
	MOVWF       R13, 0
L_testPIC39:
	DECFSZ      R13, 1, 0
	BRA         L_testPIC39
	DECFSZ      R12, 1, 0
	BRA         L_testPIC39
	DECFSZ      R11, 1, 0
	BRA         L_testPIC39
	NOP
	NOP
;debug.h,129 :: 		for( count=255; count>0; count--){
	MOVLW       1
	SUBWF       _count+0, 1 
	MOVLW       0
	SUBWFB      _count+1, 1 
;debug.h,134 :: 		}
	GOTO        L_testPIC36
L_testPIC37:
;debug.h,135 :: 		}
	RETURN      0
; end of _testPIC

_lineFollow:

;linefollow.h,14 :: 		void lineFollow(){
;linefollow.h,16 :: 		while(1){
L_lineFollow40:
;linefollow.h,17 :: 		if( (Sensor3==1 || Sensor4==1 || Sensor5==1 || Sensor6==1 || Sensor7==1) && Sensor1==0 && Sensor2==0 && Sensor8==0 && Sensor9==0 ){
	BTFSC       PORTD+0, 4 
	GOTO        L__lineFollow265
	BTFSC       PORTD+0, 5 
	GOTO        L__lineFollow265
	BTFSC       PORTD+0, 6 
	GOTO        L__lineFollow265
	BTFSC       PORTD+0, 7 
	GOTO        L__lineFollow265
	BTFSC       PORTB+0, 2 
	GOTO        L__lineFollow265
	GOTO        L_lineFollow46
L__lineFollow265:
	BTFSC       PORTB+0, 4 
	GOTO        L_lineFollow46
	BTFSC       PORTB+0, 3 
	GOTO        L_lineFollow46
	BTFSC       PORTB+0, 6 
	GOTO        L_lineFollow46
	BTFSC       PORTB+0, 7 
	GOTO        L_lineFollow46
L__lineFollow264:
;linefollow.h,19 :: 		debugText = "Line follow PID..   ";
	MOVLW       ?lstr28_Main_322.0V+0
	MOVWF       _debugText+0 
	MOVLW       hi_addr(?lstr28_Main_322.0V+0)
	MOVWF       _debugText+1 
;linefollow.h,20 :: 		UART1_Write_Text(debugText);
	MOVF        _debugText+0, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVF        _debugText+1, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;linefollow.h,21 :: 		sendSensorStatus();
	CALL        _sendSensorStatus+0, 0
;linefollow.h,22 :: 		lineFollowPID();
	CALL        _lineFollowPID+0, 0
;linefollow.h,23 :: 		}
	GOTO        L_lineFollow47
L_lineFollow46:
;linefollow.h,24 :: 		else if( !( Scout==1 && Sensor1==1 && Sensor2==1 && Sensor3==1 && Sensor4==1 && Sensor5==1 && Sensor6==1 && Sensor7==1 && Sensor8==1 && Sensor9==1) || !( Scout==0 && Sensor1==0 && Sensor2==0 && Sensor3==0 && Sensor4==0 && Sensor5==0 && Sensor6==0 && Sensor7==0 && Sensor8==0 && Sensor9==0)){
	BTFSS       PORTB+0, 5 
	GOTO        L_lineFollow49
	BTFSS       PORTB+0, 4 
	GOTO        L_lineFollow49
	BTFSS       PORTB+0, 3 
	GOTO        L_lineFollow49
	BTFSS       PORTD+0, 4 
	GOTO        L_lineFollow49
	BTFSS       PORTD+0, 5 
	GOTO        L_lineFollow49
	BTFSS       PORTD+0, 6 
	GOTO        L_lineFollow49
	BTFSS       PORTD+0, 7 
	GOTO        L_lineFollow49
	BTFSS       PORTB+0, 2 
	GOTO        L_lineFollow49
	BTFSS       PORTB+0, 6 
	GOTO        L_lineFollow49
	BTFSS       PORTB+0, 7 
	GOTO        L_lineFollow49
	MOVLW       1
	MOVWF       R0 
	GOTO        L_lineFollow48
L_lineFollow49:
	CLRF        R0 
L_lineFollow48:
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L__lineFollow263
	BTFSC       PORTB+0, 5 
	GOTO        L_lineFollow51
	BTFSC       PORTB+0, 4 
	GOTO        L_lineFollow51
	BTFSC       PORTB+0, 3 
	GOTO        L_lineFollow51
	BTFSC       PORTD+0, 4 
	GOTO        L_lineFollow51
	BTFSC       PORTD+0, 5 
	GOTO        L_lineFollow51
	BTFSC       PORTD+0, 6 
	GOTO        L_lineFollow51
	BTFSC       PORTD+0, 7 
	GOTO        L_lineFollow51
	BTFSC       PORTB+0, 2 
	GOTO        L_lineFollow51
	BTFSC       PORTB+0, 6 
	GOTO        L_lineFollow51
	BTFSC       PORTB+0, 7 
	GOTO        L_lineFollow51
	MOVLW       1
	MOVWF       R0 
	GOTO        L_lineFollow50
L_lineFollow51:
	CLRF        R0 
L_lineFollow50:
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L__lineFollow263
	GOTO        L_lineFollow54
L__lineFollow263:
;linefollow.h,26 :: 		debugText = "Line follow Normal..   ";
	MOVLW       ?lstr29_Main_322.0V+0
	MOVWF       _debugText+0 
	MOVLW       hi_addr(?lstr29_Main_322.0V+0)
	MOVWF       _debugText+1 
;linefollow.h,27 :: 		UART1_Write_Text(debugText);
	MOVF        _debugText+0, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVF        _debugText+1, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;linefollow.h,28 :: 		sendSensorStatus();
	CALL        _sendSensorStatus+0, 0
;linefollow.h,29 :: 		lineFollowNormal();
	CALL        _lineFollowNormal+0, 0
;linefollow.h,30 :: 		}
	GOTO        L_lineFollow55
L_lineFollow54:
;linefollow.h,31 :: 		else if(( Scout==1 && Sensor1==1 && Sensor2==1 && Sensor3==1 && Sensor4==1 && Sensor5==1 && Sensor6==1 && Sensor7==1 && Sensor8==1 && Sensor9==1) || !( Scout==0 && Sensor1==0 && Sensor2==0 && Sensor3==0 && Sensor4==0 && Sensor5==0 && Sensor6==0 && Sensor7==0 && Sensor8==0 && Sensor9==0)){
	BTFSS       PORTB+0, 5 
	GOTO        L__lineFollow262
	BTFSS       PORTB+0, 4 
	GOTO        L__lineFollow262
	BTFSS       PORTB+0, 3 
	GOTO        L__lineFollow262
	BTFSS       PORTD+0, 4 
	GOTO        L__lineFollow262
	BTFSS       PORTD+0, 5 
	GOTO        L__lineFollow262
	BTFSS       PORTD+0, 6 
	GOTO        L__lineFollow262
	BTFSS       PORTD+0, 7 
	GOTO        L__lineFollow262
	BTFSS       PORTB+0, 2 
	GOTO        L__lineFollow262
	BTFSS       PORTB+0, 6 
	GOTO        L__lineFollow262
	BTFSS       PORTB+0, 7 
	GOTO        L__lineFollow262
	GOTO        L__lineFollow261
L__lineFollow262:
	BTFSC       PORTB+0, 5 
	GOTO        L_lineFollow59
	BTFSC       PORTB+0, 4 
	GOTO        L_lineFollow59
	BTFSC       PORTB+0, 3 
	GOTO        L_lineFollow59
	BTFSC       PORTD+0, 4 
	GOTO        L_lineFollow59
	BTFSC       PORTD+0, 5 
	GOTO        L_lineFollow59
	BTFSC       PORTD+0, 6 
	GOTO        L_lineFollow59
	BTFSC       PORTD+0, 7 
	GOTO        L_lineFollow59
	BTFSC       PORTB+0, 2 
	GOTO        L_lineFollow59
	BTFSC       PORTB+0, 6 
	GOTO        L_lineFollow59
	BTFSC       PORTB+0, 7 
	GOTO        L_lineFollow59
	MOVLW       1
	MOVWF       R0 
	GOTO        L_lineFollow58
L_lineFollow59:
	CLRF        R0 
L_lineFollow58:
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L__lineFollow261
	GOTO        L_lineFollow62
L__lineFollow261:
;linefollow.h,33 :: 		stop();
	CALL        _stop+0, 0
;linefollow.h,34 :: 		sendSensorStatus();
	CALL        _sendSensorStatus+0, 0
;linefollow.h,36 :: 		}
L_lineFollow62:
L_lineFollow55:
L_lineFollow47:
;linefollow.h,37 :: 		}
	GOTO        L_lineFollow40
;linefollow.h,38 :: 		}
	RETURN      0
; end of _lineFollow

_lineFollowNormal:

;linefollow.h,40 :: 		void lineFollowNormal(){
;linefollow.h,41 :: 		while(1){              //!((Sensor3==1 || Sensor4==1 || Sensor5==1 || Sensor6==1 || Sensor7==1) && Sensor1==0 && Sensor2==0 && Sensor8==0 && Sensor9==0)
L_lineFollowNormal63:
;linefollow.h,42 :: 		if( Scout==1 && Sensor1==1 && Sensor2==1 && Sensor3==1 && Sensor4==1 && Sensor5==1 && Sensor6==1 && Sensor7==1 && Sensor8==1 && Sensor9==1){
	BTFSS       PORTB+0, 5 
	GOTO        L_lineFollowNormal67
	BTFSS       PORTB+0, 4 
	GOTO        L_lineFollowNormal67
	BTFSS       PORTB+0, 3 
	GOTO        L_lineFollowNormal67
	BTFSS       PORTD+0, 4 
	GOTO        L_lineFollowNormal67
	BTFSS       PORTD+0, 5 
	GOTO        L_lineFollowNormal67
	BTFSS       PORTD+0, 6 
	GOTO        L_lineFollowNormal67
	BTFSS       PORTD+0, 7 
	GOTO        L_lineFollowNormal67
	BTFSS       PORTB+0, 2 
	GOTO        L_lineFollowNormal67
	BTFSS       PORTB+0, 6 
	GOTO        L_lineFollowNormal67
	BTFSS       PORTB+0, 7 
	GOTO        L_lineFollowNormal67
L__lineFollowNormal278:
;linefollow.h,43 :: 		stop();
	CALL        _stop+0, 0
;linefollow.h,44 :: 		}
	GOTO        L_lineFollowNormal68
L_lineFollowNormal67:
;linefollow.h,45 :: 		else if( (Scout==0 && Sensor1==0 && Sensor2==0 && Sensor3==0 && Sensor4==1 && Sensor5==1 && Sensor6==1 && Sensor7==1 && Sensor8==1 && Sensor9==1) || (Scout==0 && Sensor1==0 && Sensor2==0 && Sensor3==0 && Sensor4==0 && Sensor5==1 && Sensor6==1 && Sensor7==1 && Sensor8==1 && Sensor9==1)){
	BTFSC       PORTB+0, 5 
	GOTO        L__lineFollowNormal277
	BTFSC       PORTB+0, 4 
	GOTO        L__lineFollowNormal277
	BTFSC       PORTB+0, 3 
	GOTO        L__lineFollowNormal277
	BTFSC       PORTD+0, 4 
	GOTO        L__lineFollowNormal277
	BTFSS       PORTD+0, 5 
	GOTO        L__lineFollowNormal277
	BTFSS       PORTD+0, 6 
	GOTO        L__lineFollowNormal277
	BTFSS       PORTD+0, 7 
	GOTO        L__lineFollowNormal277
	BTFSS       PORTB+0, 2 
	GOTO        L__lineFollowNormal277
	BTFSS       PORTB+0, 6 
	GOTO        L__lineFollowNormal277
	BTFSS       PORTB+0, 7 
	GOTO        L__lineFollowNormal277
	GOTO        L__lineFollowNormal275
L__lineFollowNormal277:
	BTFSC       PORTB+0, 5 
	GOTO        L__lineFollowNormal276
	BTFSC       PORTB+0, 4 
	GOTO        L__lineFollowNormal276
	BTFSC       PORTB+0, 3 
	GOTO        L__lineFollowNormal276
	BTFSC       PORTD+0, 4 
	GOTO        L__lineFollowNormal276
	BTFSC       PORTD+0, 5 
	GOTO        L__lineFollowNormal276
	BTFSS       PORTD+0, 6 
	GOTO        L__lineFollowNormal276
	BTFSS       PORTD+0, 7 
	GOTO        L__lineFollowNormal276
	BTFSS       PORTB+0, 2 
	GOTO        L__lineFollowNormal276
	BTFSS       PORTB+0, 6 
	GOTO        L__lineFollowNormal276
	BTFSS       PORTB+0, 7 
	GOTO        L__lineFollowNormal276
	GOTO        L__lineFollowNormal275
L__lineFollowNormal276:
	GOTO        L_lineFollowNormal75
L__lineFollowNormal275:
;linefollow.h,47 :: 		debugText = "90 to right..   ";
	MOVLW       ?lstr30_Main_322.0V+0
	MOVWF       _debugText+0 
	MOVLW       hi_addr(?lstr30_Main_322.0V+0)
	MOVWF       _debugText+1 
;linefollow.h,48 :: 		UART1_Write_Text(debugText);
	MOVF        _debugText+0, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVF        _debugText+1, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;linefollow.h,49 :: 		sendSensorStatus();
	CALL        _sendSensorStatus+0, 0
;linefollow.h,50 :: 		while(Scout==0){
L_lineFollowNormal76:
	BTFSC       PORTB+0, 5 
	GOTO        L_lineFollowNormal77
;linefollow.h,51 :: 		rotateClockwise(TEST_RPM);
	MOVF        _TEST_RPM+0, 0 
	MOVWF       FARG_rotateClockwise_pwm+0 
	MOVF        _TEST_RPM+1, 0 
	MOVWF       FARG_rotateClockwise_pwm+1 
	CALL        _rotateClockwise+0, 0
;linefollow.h,52 :: 		}
	GOTO        L_lineFollowNormal76
L_lineFollowNormal77:
;linefollow.h,53 :: 		}
	GOTO        L_lineFollowNormal78
L_lineFollowNormal75:
;linefollow.h,54 :: 		else if( (Scout==0 && Sensor1==1 && Sensor2==1 && Sensor3==1 && Sensor4==1 && Sensor5==1 && Sensor6==0 && Sensor7==0 && Sensor8==0 && Sensor9==0) && (Scout==0 && Sensor1==1 && Sensor2==1 && Sensor3==1 && Sensor4==1 && Sensor5==0 && Sensor6==0 && Sensor7==0 && Sensor8==0 && Sensor9==0)){
	BTFSC       PORTB+0, 5 
	GOTO        L_lineFollowNormal85
	BTFSS       PORTB+0, 4 
	GOTO        L_lineFollowNormal85
	BTFSS       PORTB+0, 3 
	GOTO        L_lineFollowNormal85
	BTFSS       PORTD+0, 4 
	GOTO        L_lineFollowNormal85
	BTFSS       PORTD+0, 5 
	GOTO        L_lineFollowNormal85
	BTFSS       PORTD+0, 6 
	GOTO        L_lineFollowNormal85
	BTFSC       PORTD+0, 7 
	GOTO        L_lineFollowNormal85
	BTFSC       PORTB+0, 2 
	GOTO        L_lineFollowNormal85
	BTFSC       PORTB+0, 6 
	GOTO        L_lineFollowNormal85
	BTFSC       PORTB+0, 7 
	GOTO        L_lineFollowNormal85
L__lineFollowNormal274:
	BTFSC       PORTB+0, 5 
	GOTO        L_lineFollowNormal85
	BTFSS       PORTB+0, 4 
	GOTO        L_lineFollowNormal85
	BTFSS       PORTB+0, 3 
	GOTO        L_lineFollowNormal85
	BTFSS       PORTD+0, 4 
	GOTO        L_lineFollowNormal85
	BTFSS       PORTD+0, 5 
	GOTO        L_lineFollowNormal85
	BTFSC       PORTD+0, 6 
	GOTO        L_lineFollowNormal85
	BTFSC       PORTD+0, 7 
	GOTO        L_lineFollowNormal85
	BTFSC       PORTB+0, 2 
	GOTO        L_lineFollowNormal85
	BTFSC       PORTB+0, 6 
	GOTO        L_lineFollowNormal85
	BTFSC       PORTB+0, 7 
	GOTO        L_lineFollowNormal85
L__lineFollowNormal273:
L__lineFollowNormal272:
;linefollow.h,56 :: 		debugText = "90 to left..   ";
	MOVLW       ?lstr31_Main_322.0V+0
	MOVWF       _debugText+0 
	MOVLW       hi_addr(?lstr31_Main_322.0V+0)
	MOVWF       _debugText+1 
;linefollow.h,57 :: 		UART1_Write_Text(debugText);
	MOVF        _debugText+0, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVF        _debugText+1, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;linefollow.h,58 :: 		sendSensorStatus();
	CALL        _sendSensorStatus+0, 0
;linefollow.h,59 :: 		while(Scout==0){
L_lineFollowNormal86:
	BTFSC       PORTB+0, 5 
	GOTO        L_lineFollowNormal87
;linefollow.h,60 :: 		rotateAntiClockwise(TEST_RPM);
	MOVF        _TEST_RPM+0, 0 
	MOVWF       FARG_rotateAntiClockwise_pwm+0 
	MOVF        _TEST_RPM+1, 0 
	MOVWF       FARG_rotateAntiClockwise_pwm+1 
	CALL        _rotateAntiClockwise+0, 0
;linefollow.h,61 :: 		}
	GOTO        L_lineFollowNormal86
L_lineFollowNormal87:
;linefollow.h,62 :: 		}
	GOTO        L_lineFollowNormal88
L_lineFollowNormal85:
;linefollow.h,63 :: 		else if( Sensor4==1 && Sensor5==1){
	BTFSS       PORTD+0, 5 
	GOTO        L_lineFollowNormal91
	BTFSS       PORTD+0, 6 
	GOTO        L_lineFollowNormal91
L__lineFollowNormal271:
;linefollow.h,65 :: 		moveForward(TEST_RPM,TEST_RPM);
	MOVF        _TEST_RPM+0, 0 
	MOVWF       FARG_moveForward_pwmLeft+0 
	MOVF        _TEST_RPM+1, 0 
	MOVWF       FARG_moveForward_pwmLeft+1 
	MOVF        _TEST_RPM+0, 0 
	MOVWF       FARG_moveForward_pwmRight+0 
	MOVF        _TEST_RPM+1, 0 
	MOVWF       FARG_moveForward_pwmRight+1 
	CALL        _moveForward+0, 0
;linefollow.h,66 :: 		}
	GOTO        L_lineFollowNormal92
L_lineFollowNormal91:
;linefollow.h,67 :: 		else if( Sensor4==1 && Sensor5==0 && Scout==1){
	BTFSS       PORTD+0, 5 
	GOTO        L_lineFollowNormal95
	BTFSC       PORTD+0, 6 
	GOTO        L_lineFollowNormal95
	BTFSS       PORTB+0, 5 
	GOTO        L_lineFollowNormal95
L__lineFollowNormal270:
;linefollow.h,69 :: 		turnLeft(TEST_RPM);
	MOVF        _TEST_RPM+0, 0 
	MOVWF       FARG_turnLeft_pwmRight+0 
	MOVF        _TEST_RPM+1, 0 
	MOVWF       FARG_turnLeft_pwmRight+1 
	CALL        _turnLeft+0, 0
;linefollow.h,70 :: 		}
	GOTO        L_lineFollowNormal96
L_lineFollowNormal95:
;linefollow.h,71 :: 		else if( Sensor4==0 && Sensor5==1 && Scout==1){
	BTFSC       PORTD+0, 5 
	GOTO        L_lineFollowNormal99
	BTFSS       PORTD+0, 6 
	GOTO        L_lineFollowNormal99
	BTFSS       PORTB+0, 5 
	GOTO        L_lineFollowNormal99
L__lineFollowNormal269:
;linefollow.h,73 :: 		turnRight(TEST_RPM);
	MOVF        _TEST_RPM+0, 0 
	MOVWF       FARG_turnRight_pwmLeft+0 
	MOVF        _TEST_RPM+1, 0 
	MOVWF       FARG_turnRight_pwmLeft+1 
	CALL        _turnRight+0, 0
;linefollow.h,74 :: 		}
	GOTO        L_lineFollowNormal100
L_lineFollowNormal99:
;linefollow.h,75 :: 		else if( Sensor4==1 && Sensor5==0 && Scout==0){
	BTFSS       PORTD+0, 5 
	GOTO        L_lineFollowNormal103
	BTFSC       PORTD+0, 6 
	GOTO        L_lineFollowNormal103
	BTFSC       PORTB+0, 5 
	GOTO        L_lineFollowNormal103
L__lineFollowNormal268:
;linefollow.h,77 :: 		stop();
	CALL        _stop+0, 0
;linefollow.h,79 :: 		rotateAntiClockwise(TEST_RPM);
	MOVF        _TEST_RPM+0, 0 
	MOVWF       FARG_rotateAntiClockwise_pwm+0 
	MOVF        _TEST_RPM+1, 0 
	MOVWF       FARG_rotateAntiClockwise_pwm+1 
	CALL        _rotateAntiClockwise+0, 0
;linefollow.h,80 :: 		}
	GOTO        L_lineFollowNormal104
L_lineFollowNormal103:
;linefollow.h,81 :: 		else if( Sensor4==0 && Sensor5==1 && Scout==0){
	BTFSC       PORTD+0, 5 
	GOTO        L_lineFollowNormal107
	BTFSS       PORTD+0, 6 
	GOTO        L_lineFollowNormal107
	BTFSC       PORTB+0, 5 
	GOTO        L_lineFollowNormal107
L__lineFollowNormal267:
;linefollow.h,83 :: 		stop();
	CALL        _stop+0, 0
;linefollow.h,85 :: 		rotateClockwise(TEST_RPM);
	MOVF        _TEST_RPM+0, 0 
	MOVWF       FARG_rotateClockwise_pwm+0 
	MOVF        _TEST_RPM+1, 0 
	MOVWF       FARG_rotateClockwise_pwm+1 
	CALL        _rotateClockwise+0, 0
;linefollow.h,86 :: 		}
	GOTO        L_lineFollowNormal108
L_lineFollowNormal107:
;linefollow.h,87 :: 		else if( Sensor4==0 && Sensor5==0 ){
	BTFSC       PORTD+0, 5 
	GOTO        L_lineFollowNormal111
	BTFSC       PORTD+0, 6 
	GOTO        L_lineFollowNormal111
L__lineFollowNormal266:
;linefollow.h,88 :: 		if(Sensor3 ==1){
	BTFSS       PORTD+0, 4 
	GOTO        L_lineFollowNormal112
;linefollow.h,89 :: 		rotateAntiClockwise(TEST_RPM);
	MOVF        _TEST_RPM+0, 0 
	MOVWF       FARG_rotateAntiClockwise_pwm+0 
	MOVF        _TEST_RPM+1, 0 
	MOVWF       FARG_rotateAntiClockwise_pwm+1 
	CALL        _rotateAntiClockwise+0, 0
;linefollow.h,90 :: 		}
	GOTO        L_lineFollowNormal113
L_lineFollowNormal112:
;linefollow.h,91 :: 		else if(Sensor6 ==1){
	BTFSS       PORTD+0, 7 
	GOTO        L_lineFollowNormal114
;linefollow.h,92 :: 		rotateClockwise(TEST_RPM);
	MOVF        _TEST_RPM+0, 0 
	MOVWF       FARG_rotateClockwise_pwm+0 
	MOVF        _TEST_RPM+1, 0 
	MOVWF       FARG_rotateClockwise_pwm+1 
	CALL        _rotateClockwise+0, 0
;linefollow.h,93 :: 		}
	GOTO        L_lineFollowNormal115
L_lineFollowNormal114:
;linefollow.h,94 :: 		else if(Sensor2 ==1){
	BTFSS       PORTB+0, 3 
	GOTO        L_lineFollowNormal116
;linefollow.h,95 :: 		rotateAntiClockwise(TEST_RPM);
	MOVF        _TEST_RPM+0, 0 
	MOVWF       FARG_rotateAntiClockwise_pwm+0 
	MOVF        _TEST_RPM+1, 0 
	MOVWF       FARG_rotateAntiClockwise_pwm+1 
	CALL        _rotateAntiClockwise+0, 0
;linefollow.h,96 :: 		}
	GOTO        L_lineFollowNormal117
L_lineFollowNormal116:
;linefollow.h,97 :: 		else if(Sensor7 ==1){
	BTFSS       PORTB+0, 2 
	GOTO        L_lineFollowNormal118
;linefollow.h,98 :: 		rotateClockwise(TEST_RPM);
	MOVF        _TEST_RPM+0, 0 
	MOVWF       FARG_rotateClockwise_pwm+0 
	MOVF        _TEST_RPM+1, 0 
	MOVWF       FARG_rotateClockwise_pwm+1 
	CALL        _rotateClockwise+0, 0
;linefollow.h,99 :: 		}
	GOTO        L_lineFollowNormal119
L_lineFollowNormal118:
;linefollow.h,102 :: 		stop();
	CALL        _stop+0, 0
;linefollow.h,105 :: 		}
L_lineFollowNormal119:
L_lineFollowNormal117:
L_lineFollowNormal115:
L_lineFollowNormal113:
;linefollow.h,106 :: 		}
L_lineFollowNormal111:
L_lineFollowNormal108:
L_lineFollowNormal104:
L_lineFollowNormal100:
L_lineFollowNormal96:
L_lineFollowNormal92:
L_lineFollowNormal88:
L_lineFollowNormal78:
L_lineFollowNormal68:
;linefollow.h,108 :: 		}
	GOTO        L_lineFollowNormal63
;linefollow.h,110 :: 		}
	RETURN      0
; end of _lineFollowNormal

_setPID:

;linefollow.h,112 :: 		void setPID(){
;linefollow.h,113 :: 		MIN_RPM = 185;       //155
	MOVLW       185
	MOVWF       _MIN_RPM+0 
	MOVLW       0
	MOVWF       _MIN_RPM+1 
;linefollow.h,114 :: 		MID_RPM = 200;
	MOVLW       200
	MOVWF       _MID_RPM+0 
	MOVLW       0
	MOVWF       _MID_RPM+1 
;linefollow.h,115 :: 		MAX_RPM = 255;
	MOVLW       255
	MOVWF       _MAX_RPM+0 
	MOVLW       0
	MOVWF       _MAX_RPM+1 
;linefollow.h,116 :: 		TEST_RPM = 220;
	MOVLW       220
	MOVWF       _TEST_RPM+0 
	MOVLW       0
	MOVWF       _TEST_RPM+1 
;linefollow.h,118 :: 		Kp = 6;
	MOVLW       0
	MOVWF       _Kp+0 
	MOVLW       0
	MOVWF       _Kp+1 
	MOVLW       64
	MOVWF       _Kp+2 
	MOVLW       129
	MOVWF       _Kp+3 
;linefollow.h,119 :: 		Ki = 0;
	CLRF        _Ki+0 
	CLRF        _Ki+1 
	CLRF        _Ki+2 
	CLRF        _Ki+3 
;linefollow.h,120 :: 		Kd = 0;
	CLRF        _Kd+0 
	CLRF        _Kd+1 
	CLRF        _Kd+2 
	CLRF        _Kd+3 
;linefollow.h,122 :: 		totalError = 0;
	CLRF        _totalError+0 
	CLRF        _totalError+1 
	CLRF        _totalError+2 
	CLRF        _totalError+3 
;linefollow.h,123 :: 		previousDeviation = 0;
	CLRF        _previousDeviation+0 
	CLRF        _previousDeviation+1 
;linefollow.h,124 :: 		PID_LeftRPM = 0;
	CLRF        _PID_LeftRPM+0 
	CLRF        _PID_LeftRPM+1 
;linefollow.h,125 :: 		PID_RightRPM = 0;
	CLRF        _PID_RightRPM+0 
	CLRF        _PID_RightRPM+1 
;linefollow.h,127 :: 		Pwm1_Set_Duty(MID_RPM);
	MOVLW       200
	MOVWF       FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;linefollow.h,128 :: 		Pwm2_Set_Duty(MID_RPM);
	MOVF        _MID_RPM+0, 0 
	MOVWF       FARG_PWM2_Set_Duty_new_duty+0 
	CALL        _PWM2_Set_Duty+0, 0
;linefollow.h,129 :: 		}
	RETURN      0
; end of _setPID

_lineFollowPID:

;linefollow.h,131 :: 		void lineFollowPID(){
;linefollow.h,132 :: 		while( !(Sensor3==0 && Sensor4==0 && Sensor5==0 && Sensor6==0 && Sensor7==0) ){
L_lineFollowPID120:
	BTFSC       PORTD+0, 4 
	GOTO        L_lineFollowPID123
	BTFSC       PORTD+0, 5 
	GOTO        L_lineFollowPID123
	BTFSC       PORTD+0, 6 
	GOTO        L_lineFollowPID123
	BTFSC       PORTD+0, 7 
	GOTO        L_lineFollowPID123
	BTFSC       PORTB+0, 2 
	GOTO        L_lineFollowPID123
	MOVLW       1
	MOVWF       R0 
	GOTO        L_lineFollowPID122
L_lineFollowPID123:
	CLRF        R0 
L_lineFollowPID122:
	MOVF        R0, 1 
	BTFSS       STATUS+0, 2 
	GOTO        L_lineFollowPID121
;linefollow.h,134 :: 		if( (Scout==0 && Sensor1==0 && Sensor2==0 && Sensor3==0 && Sensor4==1 && Sensor5==1 && Sensor6==1 && Sensor7==1 && Sensor8==1 && Sensor9==1) || (Scout==0 && Sensor1==0 && Sensor2==0 && Sensor3==0 && Sensor4==0 && Sensor5==1 && Sensor6==1 && Sensor7==1 && Sensor8==1 && Sensor9==1)){
	BTFSC       PORTB+0, 5 
	GOTO        L__lineFollowPID296
	BTFSC       PORTB+0, 4 
	GOTO        L__lineFollowPID296
	BTFSC       PORTB+0, 3 
	GOTO        L__lineFollowPID296
	BTFSC       PORTD+0, 4 
	GOTO        L__lineFollowPID296
	BTFSS       PORTD+0, 5 
	GOTO        L__lineFollowPID296
	BTFSS       PORTD+0, 6 
	GOTO        L__lineFollowPID296
	BTFSS       PORTD+0, 7 
	GOTO        L__lineFollowPID296
	BTFSS       PORTB+0, 2 
	GOTO        L__lineFollowPID296
	BTFSS       PORTB+0, 6 
	GOTO        L__lineFollowPID296
	BTFSS       PORTB+0, 7 
	GOTO        L__lineFollowPID296
	GOTO        L__lineFollowPID294
L__lineFollowPID296:
	BTFSC       PORTB+0, 5 
	GOTO        L__lineFollowPID295
	BTFSC       PORTB+0, 4 
	GOTO        L__lineFollowPID295
	BTFSC       PORTB+0, 3 
	GOTO        L__lineFollowPID295
	BTFSC       PORTD+0, 4 
	GOTO        L__lineFollowPID295
	BTFSC       PORTD+0, 5 
	GOTO        L__lineFollowPID295
	BTFSS       PORTD+0, 6 
	GOTO        L__lineFollowPID295
	BTFSS       PORTD+0, 7 
	GOTO        L__lineFollowPID295
	BTFSS       PORTB+0, 2 
	GOTO        L__lineFollowPID295
	BTFSS       PORTB+0, 6 
	GOTO        L__lineFollowPID295
	BTFSS       PORTB+0, 7 
	GOTO        L__lineFollowPID295
	GOTO        L__lineFollowPID294
L__lineFollowPID295:
	GOTO        L_lineFollowPID130
L__lineFollowPID294:
;linefollow.h,136 :: 		debugText = "90 to right..   ";
	MOVLW       ?lstr32_Main_322.0V+0
	MOVWF       _debugText+0 
	MOVLW       hi_addr(?lstr32_Main_322.0V+0)
	MOVWF       _debugText+1 
;linefollow.h,137 :: 		UART1_Write_Text(debugText);
	MOVF        _debugText+0, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVF        _debugText+1, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;linefollow.h,138 :: 		sendSensorStatus();
	CALL        _sendSensorStatus+0, 0
;linefollow.h,139 :: 		while(Scout==0){
L_lineFollowPID131:
	BTFSC       PORTB+0, 5 
	GOTO        L_lineFollowPID132
;linefollow.h,140 :: 		rotateClockwise(TEST_RPM);
	MOVF        _TEST_RPM+0, 0 
	MOVWF       FARG_rotateClockwise_pwm+0 
	MOVF        _TEST_RPM+1, 0 
	MOVWF       FARG_rotateClockwise_pwm+1 
	CALL        _rotateClockwise+0, 0
;linefollow.h,141 :: 		}
	GOTO        L_lineFollowPID131
L_lineFollowPID132:
;linefollow.h,142 :: 		}
	GOTO        L_lineFollowPID133
L_lineFollowPID130:
;linefollow.h,143 :: 		else if( (Scout==0 && Sensor1==1 && Sensor2==1 && Sensor3==1 && Sensor4==1 && Sensor7==0 && Sensor8==0 && Sensor9==0) && (Scout==0 && Sensor1==1 && Sensor2==1 && Sensor3==1 && Sensor4==1 && Sensor7==0 && Sensor8==0 && Sensor9==0)){
	BTFSC       PORTB+0, 5 
	GOTO        L_lineFollowPID140
	BTFSS       PORTB+0, 4 
	GOTO        L_lineFollowPID140
	BTFSS       PORTB+0, 3 
	GOTO        L_lineFollowPID140
	BTFSS       PORTD+0, 4 
	GOTO        L_lineFollowPID140
	BTFSS       PORTD+0, 5 
	GOTO        L_lineFollowPID140
	BTFSC       PORTB+0, 2 
	GOTO        L_lineFollowPID140
	BTFSC       PORTB+0, 6 
	GOTO        L_lineFollowPID140
	BTFSC       PORTB+0, 7 
	GOTO        L_lineFollowPID140
L__lineFollowPID293:
	BTFSC       PORTB+0, 5 
	GOTO        L_lineFollowPID140
	BTFSS       PORTB+0, 4 
	GOTO        L_lineFollowPID140
	BTFSS       PORTB+0, 3 
	GOTO        L_lineFollowPID140
	BTFSS       PORTD+0, 4 
	GOTO        L_lineFollowPID140
	BTFSS       PORTD+0, 5 
	GOTO        L_lineFollowPID140
	BTFSC       PORTB+0, 2 
	GOTO        L_lineFollowPID140
	BTFSC       PORTB+0, 6 
	GOTO        L_lineFollowPID140
	BTFSC       PORTB+0, 7 
	GOTO        L_lineFollowPID140
L__lineFollowPID292:
L__lineFollowPID291:
;linefollow.h,145 :: 		debugText = "90 to left..   ";
	MOVLW       ?lstr33_Main_322.0V+0
	MOVWF       _debugText+0 
	MOVLW       hi_addr(?lstr33_Main_322.0V+0)
	MOVWF       _debugText+1 
;linefollow.h,146 :: 		UART1_Write_Text(debugText);
	MOVF        _debugText+0, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVF        _debugText+1, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;linefollow.h,147 :: 		sendSensorStatus();
	CALL        _sendSensorStatus+0, 0
;linefollow.h,148 :: 		while(Scout==0){
L_lineFollowPID141:
	BTFSC       PORTB+0, 5 
	GOTO        L_lineFollowPID142
;linefollow.h,149 :: 		rotateAntiClockwise(TEST_RPM);
	MOVF        _TEST_RPM+0, 0 
	MOVWF       FARG_rotateAntiClockwise_pwm+0 
	MOVF        _TEST_RPM+1, 0 
	MOVWF       FARG_rotateAntiClockwise_pwm+1 
	CALL        _rotateAntiClockwise+0, 0
;linefollow.h,150 :: 		}
	GOTO        L_lineFollowPID141
L_lineFollowPID142:
;linefollow.h,151 :: 		}
L_lineFollowPID140:
L_lineFollowPID133:
;linefollow.h,154 :: 		if( Sensor3==1 && Sensor4==0 && Sensor5==0 && Sensor6==0 && Sensor7==0)
	BTFSS       PORTD+0, 4 
	GOTO        L_lineFollowPID145
	BTFSC       PORTD+0, 5 
	GOTO        L_lineFollowPID145
	BTFSC       PORTD+0, 6 
	GOTO        L_lineFollowPID145
	BTFSC       PORTD+0, 7 
	GOTO        L_lineFollowPID145
	BTFSC       PORTB+0, 2 
	GOTO        L_lineFollowPID145
L__lineFollowPID290:
;linefollow.h,155 :: 		deviation = 4;
	MOVLW       4
	MOVWF       _deviation+0 
	MOVLW       0
	MOVWF       _deviation+1 
L_lineFollowPID145:
;linefollow.h,156 :: 		if( Sensor3==1 && Sensor4==1 && Sensor5==0 && Sensor6==0 && Sensor7==0)
	BTFSS       PORTD+0, 4 
	GOTO        L_lineFollowPID148
	BTFSS       PORTD+0, 5 
	GOTO        L_lineFollowPID148
	BTFSC       PORTD+0, 6 
	GOTO        L_lineFollowPID148
	BTFSC       PORTD+0, 7 
	GOTO        L_lineFollowPID148
	BTFSC       PORTB+0, 2 
	GOTO        L_lineFollowPID148
L__lineFollowPID289:
;linefollow.h,157 :: 		deviation = 3;
	MOVLW       3
	MOVWF       _deviation+0 
	MOVLW       0
	MOVWF       _deviation+1 
L_lineFollowPID148:
;linefollow.h,158 :: 		if( Sensor3==1 && Sensor4==1 && Sensor5==1 && Sensor6==0 && Sensor7==0)
	BTFSS       PORTD+0, 4 
	GOTO        L_lineFollowPID151
	BTFSS       PORTD+0, 5 
	GOTO        L_lineFollowPID151
	BTFSS       PORTD+0, 6 
	GOTO        L_lineFollowPID151
	BTFSC       PORTD+0, 7 
	GOTO        L_lineFollowPID151
	BTFSC       PORTB+0, 2 
	GOTO        L_lineFollowPID151
L__lineFollowPID288:
;linefollow.h,159 :: 		deviation = 2;
	MOVLW       2
	MOVWF       _deviation+0 
	MOVLW       0
	MOVWF       _deviation+1 
L_lineFollowPID151:
;linefollow.h,160 :: 		if( Sensor3==0 && Sensor4==1 && Sensor5==0 && Sensor6==0 && Sensor7==0)
	BTFSC       PORTD+0, 4 
	GOTO        L_lineFollowPID154
	BTFSS       PORTD+0, 5 
	GOTO        L_lineFollowPID154
	BTFSC       PORTD+0, 6 
	GOTO        L_lineFollowPID154
	BTFSC       PORTD+0, 7 
	GOTO        L_lineFollowPID154
	BTFSC       PORTB+0, 2 
	GOTO        L_lineFollowPID154
L__lineFollowPID287:
;linefollow.h,161 :: 		deviation = 1;
	MOVLW       1
	MOVWF       _deviation+0 
	MOVLW       0
	MOVWF       _deviation+1 
L_lineFollowPID154:
;linefollow.h,163 :: 		if( Sensor3==0 && Sensor4==1 && Sensor5==1 && Sensor6==0 && Sensor7==0)
	BTFSC       PORTD+0, 4 
	GOTO        L_lineFollowPID157
	BTFSS       PORTD+0, 5 
	GOTO        L_lineFollowPID157
	BTFSS       PORTD+0, 6 
	GOTO        L_lineFollowPID157
	BTFSC       PORTD+0, 7 
	GOTO        L_lineFollowPID157
	BTFSC       PORTB+0, 2 
	GOTO        L_lineFollowPID157
L__lineFollowPID286:
;linefollow.h,164 :: 		deviation = 0;
	CLRF        _deviation+0 
	CLRF        _deviation+1 
L_lineFollowPID157:
;linefollow.h,165 :: 		if( Sensor3==0 && Sensor4==1 && Sensor5==1 && Sensor6==1 && Sensor7==0)
	BTFSC       PORTD+0, 4 
	GOTO        L_lineFollowPID160
	BTFSS       PORTD+0, 5 
	GOTO        L_lineFollowPID160
	BTFSS       PORTD+0, 6 
	GOTO        L_lineFollowPID160
	BTFSS       PORTD+0, 7 
	GOTO        L_lineFollowPID160
	BTFSC       PORTB+0, 2 
	GOTO        L_lineFollowPID160
L__lineFollowPID285:
;linefollow.h,166 :: 		deviation = 0;
	CLRF        _deviation+0 
	CLRF        _deviation+1 
L_lineFollowPID160:
;linefollow.h,167 :: 		if( Sensor3==0 && Sensor4==0 && Sensor5==1 && Sensor6==0 && Sensor7==0)
	BTFSC       PORTD+0, 4 
	GOTO        L_lineFollowPID163
	BTFSC       PORTD+0, 5 
	GOTO        L_lineFollowPID163
	BTFSS       PORTD+0, 6 
	GOTO        L_lineFollowPID163
	BTFSC       PORTD+0, 7 
	GOTO        L_lineFollowPID163
	BTFSC       PORTB+0, 2 
	GOTO        L_lineFollowPID163
L__lineFollowPID284:
;linefollow.h,168 :: 		deviation = 0;
	CLRF        _deviation+0 
	CLRF        _deviation+1 
L_lineFollowPID163:
;linefollow.h,169 :: 		if( Sensor3==0 && Sensor4==0 && Sensor5==1 && Sensor6==1 && Sensor7==0)
	BTFSC       PORTD+0, 4 
	GOTO        L_lineFollowPID166
	BTFSC       PORTD+0, 5 
	GOTO        L_lineFollowPID166
	BTFSS       PORTD+0, 6 
	GOTO        L_lineFollowPID166
	BTFSS       PORTD+0, 7 
	GOTO        L_lineFollowPID166
	BTFSC       PORTB+0, 2 
	GOTO        L_lineFollowPID166
L__lineFollowPID283:
;linefollow.h,170 :: 		deviation = 0;
	CLRF        _deviation+0 
	CLRF        _deviation+1 
L_lineFollowPID166:
;linefollow.h,172 :: 		if( Sensor3==0 && Sensor4==0 && Sensor5==0 && Sensor6==1 && Sensor7==0)
	BTFSC       PORTD+0, 4 
	GOTO        L_lineFollowPID169
	BTFSC       PORTD+0, 5 
	GOTO        L_lineFollowPID169
	BTFSC       PORTD+0, 6 
	GOTO        L_lineFollowPID169
	BTFSS       PORTD+0, 7 
	GOTO        L_lineFollowPID169
	BTFSC       PORTB+0, 2 
	GOTO        L_lineFollowPID169
L__lineFollowPID282:
;linefollow.h,173 :: 		deviation = -1;
	MOVLW       255
	MOVWF       _deviation+0 
	MOVLW       255
	MOVWF       _deviation+1 
L_lineFollowPID169:
;linefollow.h,174 :: 		if( Sensor3==0 && Sensor4==0 && Sensor5==1 && Sensor6==1 && Sensor7==1)
	BTFSC       PORTD+0, 4 
	GOTO        L_lineFollowPID172
	BTFSC       PORTD+0, 5 
	GOTO        L_lineFollowPID172
	BTFSS       PORTD+0, 6 
	GOTO        L_lineFollowPID172
	BTFSS       PORTD+0, 7 
	GOTO        L_lineFollowPID172
	BTFSS       PORTB+0, 2 
	GOTO        L_lineFollowPID172
L__lineFollowPID281:
;linefollow.h,175 :: 		deviation = -2;
	MOVLW       254
	MOVWF       _deviation+0 
	MOVLW       255
	MOVWF       _deviation+1 
L_lineFollowPID172:
;linefollow.h,176 :: 		if( Sensor3==0 && Sensor4==0 && Sensor5==0 && Sensor6==1 && Sensor7==1)
	BTFSC       PORTD+0, 4 
	GOTO        L_lineFollowPID175
	BTFSC       PORTD+0, 5 
	GOTO        L_lineFollowPID175
	BTFSC       PORTD+0, 6 
	GOTO        L_lineFollowPID175
	BTFSS       PORTD+0, 7 
	GOTO        L_lineFollowPID175
	BTFSS       PORTB+0, 2 
	GOTO        L_lineFollowPID175
L__lineFollowPID280:
;linefollow.h,177 :: 		deviation = -3;
	MOVLW       253
	MOVWF       _deviation+0 
	MOVLW       255
	MOVWF       _deviation+1 
L_lineFollowPID175:
;linefollow.h,178 :: 		if( Sensor3==0 && Sensor4==0 && Sensor5==0 && Sensor6==0 && Sensor7==1)
	BTFSC       PORTD+0, 4 
	GOTO        L_lineFollowPID178
	BTFSC       PORTD+0, 5 
	GOTO        L_lineFollowPID178
	BTFSC       PORTD+0, 6 
	GOTO        L_lineFollowPID178
	BTFSC       PORTD+0, 7 
	GOTO        L_lineFollowPID178
	BTFSS       PORTB+0, 2 
	GOTO        L_lineFollowPID178
L__lineFollowPID279:
;linefollow.h,179 :: 		deviation = -4;
	MOVLW       252
	MOVWF       _deviation+0 
	MOVLW       255
	MOVWF       _deviation+1 
L_lineFollowPID178:
;linefollow.h,181 :: 		correction =  Kp*deviation + Ki*totalError + Kd*(deviation-previousDeviation);
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
;linefollow.h,182 :: 		totalError += correction;
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
;linefollow.h,183 :: 		previousDeviation = deviation;
	MOVF        _deviation+0, 0 
	MOVWF       _previousDeviation+0 
	MOVF        _deviation+1, 0 
	MOVWF       _previousDeviation+1 
;linefollow.h,185 :: 		PID_LeftRPM = MID_RPM - correction;
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
;linefollow.h,186 :: 		PID_RightRPM = MID_RPM + correction;
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
;linefollow.h,188 :: 		moveForward(PID_LeftRPM, PID_RightRPM);
	MOVF        FLOC__lineFollowPID+0, 0 
	MOVWF       FARG_moveForward_pwmLeft+0 
	MOVF        FLOC__lineFollowPID+1, 0 
	MOVWF       FARG_moveForward_pwmLeft+1 
	MOVF        R0, 0 
	MOVWF       FARG_moveForward_pwmRight+0 
	MOVF        R1, 0 
	MOVWF       FARG_moveForward_pwmRight+1 
	CALL        _moveForward+0, 0
;linefollow.h,190 :: 		}
	GOTO        L_lineFollowPID120
L_lineFollowPID121:
;linefollow.h,191 :: 		correction = 0;
	CLRF        _correction+0 
	CLRF        _correction+1 
	CLRF        _correction+2 
	CLRF        _correction+3 
;linefollow.h,192 :: 		totalError = 0;
	CLRF        _totalError+0 
	CLRF        _totalError+1 
	CLRF        _totalError+2 
	CLRF        _totalError+3 
;linefollow.h,194 :: 		}
	RETURN      0
; end of _lineFollowPID

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
;configuration.h,7 :: 		TRISD = 0b11110010;
	MOVLW       242
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
;configuration.h,38 :: 		}
	RETURN      0
; end of _configure

_getDistanceIR_GP2D120:

;ir.h,7 :: 		float getDistanceIR_GP2D120(unsigned int ir_value){           //10-bit results
;ir.h,8 :: 		float voltage = ir_value/1024*5;
	CLRF        getDistanceIR_GP2D120_voltage_L0+0 
	CLRF        getDistanceIR_GP2D120_voltage_L0+1 
	CLRF        getDistanceIR_GP2D120_voltage_L0+2 
	CLRF        getDistanceIR_GP2D120_voltage_L0+3 
;ir.h,9 :: 		if( 610<=ir_value && ir_value<623)         //3cm - 3.75cm
	MOVLW       2
	SUBWF       FARG_getDistanceIR_GP2D120_ir_value+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__getDistanceIR_GP2D120316
	MOVLW       98
	SUBWF       FARG_getDistanceIR_GP2D120_ir_value+0, 0 
L__getDistanceIR_GP2D120316:
	BTFSS       STATUS+0, 0 
	GOTO        L_getDistanceIR_GP2D120181
	MOVLW       2
	SUBWF       FARG_getDistanceIR_GP2D120_ir_value+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__getDistanceIR_GP2D120317
	MOVLW       111
	SUBWF       FARG_getDistanceIR_GP2D120_ir_value+0, 0 
L__getDistanceIR_GP2D120317:
	BTFSC       STATUS+0, 0 
	GOTO        L_getDistanceIR_GP2D120181
L__getDistanceIR_GP2D120313:
;ir.h,10 :: 		return 3.0 - 12.5*(voltage - 3.04);
	MOVLW       92
	MOVWF       R4 
	MOVLW       143
	MOVWF       R5 
	MOVLW       66
	MOVWF       R6 
	MOVLW       128
	MOVWF       R7 
	MOVF        getDistanceIR_GP2D120_voltage_L0+0, 0 
	MOVWF       R0 
	MOVF        getDistanceIR_GP2D120_voltage_L0+1, 0 
	MOVWF       R1 
	MOVF        getDistanceIR_GP2D120_voltage_L0+2, 0 
	MOVWF       R2 
	MOVF        getDistanceIR_GP2D120_voltage_L0+3, 0 
	MOVWF       R3 
	CALL        _Sub_32x32_FP+0, 0
	MOVLW       0
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVLW       72
	MOVWF       R6 
	MOVLW       130
	MOVWF       R7 
	CALL        _Mul_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       R4 
	MOVF        R1, 0 
	MOVWF       R5 
	MOVF        R2, 0 
	MOVWF       R6 
	MOVF        R3, 0 
	MOVWF       R7 
	MOVLW       0
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	MOVLW       64
	MOVWF       R2 
	MOVLW       128
	MOVWF       R3 
	CALL        _Sub_32x32_FP+0, 0
	RETURN      0
L_getDistanceIR_GP2D120181:
;ir.h,12 :: 		else if( 557<=ir_value && ir_value<610 )
	MOVLW       2
	SUBWF       FARG_getDistanceIR_GP2D120_ir_value+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__getDistanceIR_GP2D120318
	MOVLW       45
	SUBWF       FARG_getDistanceIR_GP2D120_ir_value+0, 0 
L__getDistanceIR_GP2D120318:
	BTFSS       STATUS+0, 0 
	GOTO        L_getDistanceIR_GP2D120185
	MOVLW       2
	SUBWF       FARG_getDistanceIR_GP2D120_ir_value+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__getDistanceIR_GP2D120319
	MOVLW       98
	SUBWF       FARG_getDistanceIR_GP2D120_ir_value+0, 0 
L__getDistanceIR_GP2D120319:
	BTFSC       STATUS+0, 0 
	GOTO        L_getDistanceIR_GP2D120185
L__getDistanceIR_GP2D120312:
;ir.h,13 :: 		return 3.75 - 1.04*(voltage - 2.98);  //3.75 - 4cm
	MOVLW       82
	MOVWF       R4 
	MOVLW       184
	MOVWF       R5 
	MOVLW       62
	MOVWF       R6 
	MOVLW       128
	MOVWF       R7 
	MOVF        getDistanceIR_GP2D120_voltage_L0+0, 0 
	MOVWF       R0 
	MOVF        getDistanceIR_GP2D120_voltage_L0+1, 0 
	MOVWF       R1 
	MOVF        getDistanceIR_GP2D120_voltage_L0+2, 0 
	MOVWF       R2 
	MOVF        getDistanceIR_GP2D120_voltage_L0+3, 0 
	MOVWF       R3 
	CALL        _Sub_32x32_FP+0, 0
	MOVLW       184
	MOVWF       R4 
	MOVLW       30
	MOVWF       R5 
	MOVLW       5
	MOVWF       R6 
	MOVLW       127
	MOVWF       R7 
	CALL        _Mul_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       R4 
	MOVF        R1, 0 
	MOVWF       R5 
	MOVF        R2, 0 
	MOVWF       R6 
	MOVF        R3, 0 
	MOVWF       R7 
	MOVLW       0
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	MOVLW       112
	MOVWF       R2 
	MOVLW       128
	MOVWF       R3 
	CALL        _Sub_32x32_FP+0, 0
	RETURN      0
L_getDistanceIR_GP2D120185:
;ir.h,15 :: 		else if( 481<=ir_value && ir_value<557 )
	MOVLW       1
	SUBWF       FARG_getDistanceIR_GP2D120_ir_value+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__getDistanceIR_GP2D120320
	MOVLW       225
	SUBWF       FARG_getDistanceIR_GP2D120_ir_value+0, 0 
L__getDistanceIR_GP2D120320:
	BTFSS       STATUS+0, 0 
	GOTO        L_getDistanceIR_GP2D120189
	MOVLW       2
	SUBWF       FARG_getDistanceIR_GP2D120_ir_value+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__getDistanceIR_GP2D120321
	MOVLW       45
	SUBWF       FARG_getDistanceIR_GP2D120_ir_value+0, 0 
L__getDistanceIR_GP2D120321:
	BTFSC       STATUS+0, 0 
	GOTO        L_getDistanceIR_GP2D120189
L__getDistanceIR_GP2D120311:
;ir.h,16 :: 		return 5 - 2.5*(voltage - 2.75);       //4cm - 5cm
	MOVLW       0
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVLW       48
	MOVWF       R6 
	MOVLW       128
	MOVWF       R7 
	MOVF        getDistanceIR_GP2D120_voltage_L0+0, 0 
	MOVWF       R0 
	MOVF        getDistanceIR_GP2D120_voltage_L0+1, 0 
	MOVWF       R1 
	MOVF        getDistanceIR_GP2D120_voltage_L0+2, 0 
	MOVWF       R2 
	MOVF        getDistanceIR_GP2D120_voltage_L0+3, 0 
	MOVWF       R3 
	CALL        _Sub_32x32_FP+0, 0
	MOVLW       0
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVLW       32
	MOVWF       R6 
	MOVLW       128
	MOVWF       R7 
	CALL        _Mul_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       R4 
	MOVF        R1, 0 
	MOVWF       R5 
	MOVF        R2, 0 
	MOVWF       R6 
	MOVF        R3, 0 
	MOVWF       R7 
	MOVLW       0
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	MOVLW       32
	MOVWF       R2 
	MOVLW       129
	MOVWF       R3 
	CALL        _Sub_32x32_FP+0, 0
	RETURN      0
L_getDistanceIR_GP2D120189:
;ir.h,18 :: 		else if( 409<=ir_value && ir_value<481 )
	MOVLW       1
	SUBWF       FARG_getDistanceIR_GP2D120_ir_value+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__getDistanceIR_GP2D120322
	MOVLW       153
	SUBWF       FARG_getDistanceIR_GP2D120_ir_value+0, 0 
L__getDistanceIR_GP2D120322:
	BTFSS       STATUS+0, 0 
	GOTO        L_getDistanceIR_GP2D120193
	MOVLW       1
	SUBWF       FARG_getDistanceIR_GP2D120_ir_value+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__getDistanceIR_GP2D120323
	MOVLW       225
	SUBWF       FARG_getDistanceIR_GP2D120_ir_value+0, 0 
L__getDistanceIR_GP2D120323:
	BTFSC       STATUS+0, 0 
	GOTO        L_getDistanceIR_GP2D120193
L__getDistanceIR_GP2D120310:
;ir.h,19 :: 		return 6 - 2.85*(voltage - 2.35);       //5cm - 6cm
	MOVLW       102
	MOVWF       R4 
	MOVLW       102
	MOVWF       R5 
	MOVLW       22
	MOVWF       R6 
	MOVLW       128
	MOVWF       R7 
	MOVF        getDistanceIR_GP2D120_voltage_L0+0, 0 
	MOVWF       R0 
	MOVF        getDistanceIR_GP2D120_voltage_L0+1, 0 
	MOVWF       R1 
	MOVF        getDistanceIR_GP2D120_voltage_L0+2, 0 
	MOVWF       R2 
	MOVF        getDistanceIR_GP2D120_voltage_L0+3, 0 
	MOVWF       R3 
	CALL        _Sub_32x32_FP+0, 0
	MOVLW       102
	MOVWF       R4 
	MOVLW       102
	MOVWF       R5 
	MOVLW       54
	MOVWF       R6 
	MOVLW       128
	MOVWF       R7 
	CALL        _Mul_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       R4 
	MOVF        R1, 0 
	MOVWF       R5 
	MOVF        R2, 0 
	MOVWF       R6 
	MOVF        R3, 0 
	MOVWF       R7 
	MOVLW       0
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	MOVLW       64
	MOVWF       R2 
	MOVLW       129
	MOVWF       R3 
	CALL        _Sub_32x32_FP+0, 0
	RETURN      0
L_getDistanceIR_GP2D120193:
;ir.h,21 :: 		else if( 364<=ir_value && ir_value<409 )
	MOVLW       1
	SUBWF       FARG_getDistanceIR_GP2D120_ir_value+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__getDistanceIR_GP2D120324
	MOVLW       108
	SUBWF       FARG_getDistanceIR_GP2D120_ir_value+0, 0 
L__getDistanceIR_GP2D120324:
	BTFSS       STATUS+0, 0 
	GOTO        L_getDistanceIR_GP2D120197
	MOVLW       1
	SUBWF       FARG_getDistanceIR_GP2D120_ir_value+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__getDistanceIR_GP2D120325
	MOVLW       153
	SUBWF       FARG_getDistanceIR_GP2D120_ir_value+0, 0 
L__getDistanceIR_GP2D120325:
	BTFSC       STATUS+0, 0 
	GOTO        L_getDistanceIR_GP2D120197
L__getDistanceIR_GP2D120309:
;ir.h,22 :: 		return 7 - 4*(voltage - 2);             //6cm - 7cm
	MOVLW       0
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVLW       0
	MOVWF       R6 
	MOVLW       128
	MOVWF       R7 
	MOVF        getDistanceIR_GP2D120_voltage_L0+0, 0 
	MOVWF       R0 
	MOVF        getDistanceIR_GP2D120_voltage_L0+1, 0 
	MOVWF       R1 
	MOVF        getDistanceIR_GP2D120_voltage_L0+2, 0 
	MOVWF       R2 
	MOVF        getDistanceIR_GP2D120_voltage_L0+3, 0 
	MOVWF       R3 
	CALL        _Sub_32x32_FP+0, 0
	MOVLW       0
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVLW       0
	MOVWF       R6 
	MOVLW       129
	MOVWF       R7 
	CALL        _Mul_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       R4 
	MOVF        R1, 0 
	MOVWF       R5 
	MOVF        R2, 0 
	MOVWF       R6 
	MOVF        R3, 0 
	MOVWF       R7 
	MOVLW       0
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	MOVLW       96
	MOVWF       R2 
	MOVLW       129
	MOVWF       R3 
	CALL        _Sub_32x32_FP+0, 0
	RETURN      0
L_getDistanceIR_GP2D120197:
;ir.h,24 :: 		else if( 317<=ir_value && ir_value<364 )
	MOVLW       1
	SUBWF       FARG_getDistanceIR_GP2D120_ir_value+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__getDistanceIR_GP2D120326
	MOVLW       61
	SUBWF       FARG_getDistanceIR_GP2D120_ir_value+0, 0 
L__getDistanceIR_GP2D120326:
	BTFSS       STATUS+0, 0 
	GOTO        L_getDistanceIR_GP2D120201
	MOVLW       1
	SUBWF       FARG_getDistanceIR_GP2D120_ir_value+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__getDistanceIR_GP2D120327
	MOVLW       108
	SUBWF       FARG_getDistanceIR_GP2D120_ir_value+0, 0 
L__getDistanceIR_GP2D120327:
	BTFSC       STATUS+0, 0 
	GOTO        L_getDistanceIR_GP2D120201
L__getDistanceIR_GP2D120308:
;ir.h,25 :: 		return 8 - 5*(voltage - 1.75);          //7cm - 8cm
	MOVLW       0
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVLW       96
	MOVWF       R6 
	MOVLW       127
	MOVWF       R7 
	MOVF        getDistanceIR_GP2D120_voltage_L0+0, 0 
	MOVWF       R0 
	MOVF        getDistanceIR_GP2D120_voltage_L0+1, 0 
	MOVWF       R1 
	MOVF        getDistanceIR_GP2D120_voltage_L0+2, 0 
	MOVWF       R2 
	MOVF        getDistanceIR_GP2D120_voltage_L0+3, 0 
	MOVWF       R3 
	CALL        _Sub_32x32_FP+0, 0
	MOVLW       0
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVLW       32
	MOVWF       R6 
	MOVLW       129
	MOVWF       R7 
	CALL        _Mul_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       R4 
	MOVF        R1, 0 
	MOVWF       R5 
	MOVF        R2, 0 
	MOVWF       R6 
	MOVF        R3, 0 
	MOVWF       R7 
	MOVLW       0
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	MOVLW       0
	MOVWF       R2 
	MOVLW       130
	MOVWF       R3 
	CALL        _Sub_32x32_FP+0, 0
	RETURN      0
L_getDistanceIR_GP2D120201:
;ir.h,27 :: 		else if( 286<=ir_value && ir_value<317 )
	MOVLW       1
	SUBWF       FARG_getDistanceIR_GP2D120_ir_value+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__getDistanceIR_GP2D120328
	MOVLW       30
	SUBWF       FARG_getDistanceIR_GP2D120_ir_value+0, 0 
L__getDistanceIR_GP2D120328:
	BTFSS       STATUS+0, 0 
	GOTO        L_getDistanceIR_GP2D120205
	MOVLW       1
	SUBWF       FARG_getDistanceIR_GP2D120_ir_value+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__getDistanceIR_GP2D120329
	MOVLW       61
	SUBWF       FARG_getDistanceIR_GP2D120_ir_value+0, 0 
L__getDistanceIR_GP2D120329:
	BTFSC       STATUS+0, 0 
	GOTO        L_getDistanceIR_GP2D120205
L__getDistanceIR_GP2D120307:
;ir.h,28 :: 		return 9 - 6.667*(voltage - 1.55);      //8cm - 9cm
	MOVLW       102
	MOVWF       R4 
	MOVLW       102
	MOVWF       R5 
	MOVLW       70
	MOVWF       R6 
	MOVLW       127
	MOVWF       R7 
	MOVF        getDistanceIR_GP2D120_voltage_L0+0, 0 
	MOVWF       R0 
	MOVF        getDistanceIR_GP2D120_voltage_L0+1, 0 
	MOVWF       R1 
	MOVF        getDistanceIR_GP2D120_voltage_L0+2, 0 
	MOVWF       R2 
	MOVF        getDistanceIR_GP2D120_voltage_L0+3, 0 
	MOVWF       R3 
	CALL        _Sub_32x32_FP+0, 0
	MOVLW       16
	MOVWF       R4 
	MOVLW       88
	MOVWF       R5 
	MOVLW       85
	MOVWF       R6 
	MOVLW       129
	MOVWF       R7 
	CALL        _Mul_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       R4 
	MOVF        R1, 0 
	MOVWF       R5 
	MOVF        R2, 0 
	MOVWF       R6 
	MOVF        R3, 0 
	MOVWF       R7 
	MOVLW       0
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	MOVLW       16
	MOVWF       R2 
	MOVLW       130
	MOVWF       R3 
	CALL        _Sub_32x32_FP+0, 0
	RETURN      0
L_getDistanceIR_GP2D120205:
;ir.h,30 :: 		else if( 256<=ir_value && ir_value<286 )
	MOVLW       1
	SUBWF       FARG_getDistanceIR_GP2D120_ir_value+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__getDistanceIR_GP2D120330
	MOVLW       0
	SUBWF       FARG_getDistanceIR_GP2D120_ir_value+0, 0 
L__getDistanceIR_GP2D120330:
	BTFSS       STATUS+0, 0 
	GOTO        L_getDistanceIR_GP2D120209
	MOVLW       1
	SUBWF       FARG_getDistanceIR_GP2D120_ir_value+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__getDistanceIR_GP2D120331
	MOVLW       30
	SUBWF       FARG_getDistanceIR_GP2D120_ir_value+0, 0 
L__getDistanceIR_GP2D120331:
	BTFSC       STATUS+0, 0 
	GOTO        L_getDistanceIR_GP2D120209
L__getDistanceIR_GP2D120306:
;ir.h,31 :: 		return 10 - 6.667*(voltage - 1.4);       //9cm - 10cm
	MOVLW       51
	MOVWF       R4 
	MOVLW       51
	MOVWF       R5 
	MOVLW       51
	MOVWF       R6 
	MOVLW       127
	MOVWF       R7 
	MOVF        getDistanceIR_GP2D120_voltage_L0+0, 0 
	MOVWF       R0 
	MOVF        getDistanceIR_GP2D120_voltage_L0+1, 0 
	MOVWF       R1 
	MOVF        getDistanceIR_GP2D120_voltage_L0+2, 0 
	MOVWF       R2 
	MOVF        getDistanceIR_GP2D120_voltage_L0+3, 0 
	MOVWF       R3 
	CALL        _Sub_32x32_FP+0, 0
	MOVLW       16
	MOVWF       R4 
	MOVLW       88
	MOVWF       R5 
	MOVLW       85
	MOVWF       R6 
	MOVLW       129
	MOVWF       R7 
	CALL        _Mul_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       R4 
	MOVF        R1, 0 
	MOVWF       R5 
	MOVF        R2, 0 
	MOVWF       R6 
	MOVF        R3, 0 
	MOVWF       R7 
	MOVLW       0
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	MOVLW       32
	MOVWF       R2 
	MOVLW       130
	MOVWF       R3 
	CALL        _Sub_32x32_FP+0, 0
	RETURN      0
L_getDistanceIR_GP2D120209:
;ir.h,33 :: 		else if( 215<=ir_value && ir_value<256 )
	MOVLW       0
	SUBWF       FARG_getDistanceIR_GP2D120_ir_value+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__getDistanceIR_GP2D120332
	MOVLW       215
	SUBWF       FARG_getDistanceIR_GP2D120_ir_value+0, 0 
L__getDistanceIR_GP2D120332:
	BTFSS       STATUS+0, 0 
	GOTO        L_getDistanceIR_GP2D120213
	MOVLW       1
	SUBWF       FARG_getDistanceIR_GP2D120_ir_value+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__getDistanceIR_GP2D120333
	MOVLW       0
	SUBWF       FARG_getDistanceIR_GP2D120_ir_value+0, 0 
L__getDistanceIR_GP2D120333:
	BTFSC       STATUS+0, 0 
	GOTO        L_getDistanceIR_GP2D120213
L__getDistanceIR_GP2D120305:
;ir.h,34 :: 		return 12 - 10*(voltage - 1.25);         //10cm - 12cm
	MOVLW       0
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVLW       32
	MOVWF       R6 
	MOVLW       127
	MOVWF       R7 
	MOVF        getDistanceIR_GP2D120_voltage_L0+0, 0 
	MOVWF       R0 
	MOVF        getDistanceIR_GP2D120_voltage_L0+1, 0 
	MOVWF       R1 
	MOVF        getDistanceIR_GP2D120_voltage_L0+2, 0 
	MOVWF       R2 
	MOVF        getDistanceIR_GP2D120_voltage_L0+3, 0 
	MOVWF       R3 
	CALL        _Sub_32x32_FP+0, 0
	MOVLW       0
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVLW       32
	MOVWF       R6 
	MOVLW       130
	MOVWF       R7 
	CALL        _Mul_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       R4 
	MOVF        R1, 0 
	MOVWF       R5 
	MOVF        R2, 0 
	MOVWF       R6 
	MOVF        R3, 0 
	MOVWF       R7 
	MOVLW       0
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	MOVLW       64
	MOVWF       R2 
	MOVLW       130
	MOVWF       R3 
	CALL        _Sub_32x32_FP+0, 0
	RETURN      0
L_getDistanceIR_GP2D120213:
;ir.h,36 :: 		else if( 186<=ir_value && ir_value<215 )
	MOVLW       0
	SUBWF       FARG_getDistanceIR_GP2D120_ir_value+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__getDistanceIR_GP2D120334
	MOVLW       186
	SUBWF       FARG_getDistanceIR_GP2D120_ir_value+0, 0 
L__getDistanceIR_GP2D120334:
	BTFSS       STATUS+0, 0 
	GOTO        L_getDistanceIR_GP2D120217
	MOVLW       0
	SUBWF       FARG_getDistanceIR_GP2D120_ir_value+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__getDistanceIR_GP2D120335
	MOVLW       215
	SUBWF       FARG_getDistanceIR_GP2D120_ir_value+0, 0 
L__getDistanceIR_GP2D120335:
	BTFSC       STATUS+0, 0 
	GOTO        L_getDistanceIR_GP2D120217
L__getDistanceIR_GP2D120304:
;ir.h,37 :: 		return 14 - 15.38*(voltage - 1.05);      //12cm - 14cm
	MOVLW       102
	MOVWF       R4 
	MOVLW       102
	MOVWF       R5 
	MOVLW       6
	MOVWF       R6 
	MOVLW       127
	MOVWF       R7 
	MOVF        getDistanceIR_GP2D120_voltage_L0+0, 0 
	MOVWF       R0 
	MOVF        getDistanceIR_GP2D120_voltage_L0+1, 0 
	MOVWF       R1 
	MOVF        getDistanceIR_GP2D120_voltage_L0+2, 0 
	MOVWF       R2 
	MOVF        getDistanceIR_GP2D120_voltage_L0+3, 0 
	MOVWF       R3 
	CALL        _Sub_32x32_FP+0, 0
	MOVLW       123
	MOVWF       R4 
	MOVLW       20
	MOVWF       R5 
	MOVLW       118
	MOVWF       R6 
	MOVLW       130
	MOVWF       R7 
	CALL        _Mul_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       R4 
	MOVF        R1, 0 
	MOVWF       R5 
	MOVF        R2, 0 
	MOVWF       R6 
	MOVF        R3, 0 
	MOVWF       R7 
	MOVLW       0
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	MOVLW       96
	MOVWF       R2 
	MOVLW       130
	MOVWF       R3 
	CALL        _Sub_32x32_FP+0, 0
	RETURN      0
L_getDistanceIR_GP2D120217:
;ir.h,39 :: 		else if( 166<=ir_value && ir_value<186 )
	MOVLW       0
	SUBWF       FARG_getDistanceIR_GP2D120_ir_value+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__getDistanceIR_GP2D120336
	MOVLW       166
	SUBWF       FARG_getDistanceIR_GP2D120_ir_value+0, 0 
L__getDistanceIR_GP2D120336:
	BTFSS       STATUS+0, 0 
	GOTO        L_getDistanceIR_GP2D120221
	MOVLW       0
	SUBWF       FARG_getDistanceIR_GP2D120_ir_value+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__getDistanceIR_GP2D120337
	MOVLW       186
	SUBWF       FARG_getDistanceIR_GP2D120_ir_value+0, 0 
L__getDistanceIR_GP2D120337:
	BTFSC       STATUS+0, 0 
	GOTO        L_getDistanceIR_GP2D120221
L__getDistanceIR_GP2D120303:
;ir.h,40 :: 		return 16 - 20*(voltage - 0.94);         //14cm - 16cm
	MOVLW       215
	MOVWF       R4 
	MOVLW       163
	MOVWF       R5 
	MOVLW       112
	MOVWF       R6 
	MOVLW       126
	MOVWF       R7 
	MOVF        getDistanceIR_GP2D120_voltage_L0+0, 0 
	MOVWF       R0 
	MOVF        getDistanceIR_GP2D120_voltage_L0+1, 0 
	MOVWF       R1 
	MOVF        getDistanceIR_GP2D120_voltage_L0+2, 0 
	MOVWF       R2 
	MOVF        getDistanceIR_GP2D120_voltage_L0+3, 0 
	MOVWF       R3 
	CALL        _Sub_32x32_FP+0, 0
	MOVLW       0
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVLW       32
	MOVWF       R6 
	MOVLW       131
	MOVWF       R7 
	CALL        _Mul_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       R4 
	MOVF        R1, 0 
	MOVWF       R5 
	MOVF        R2, 0 
	MOVWF       R6 
	MOVF        R3, 0 
	MOVWF       R7 
	MOVLW       0
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	MOVLW       0
	MOVWF       R2 
	MOVLW       131
	MOVWF       R3 
	CALL        _Sub_32x32_FP+0, 0
	RETURN      0
L_getDistanceIR_GP2D120221:
;ir.h,42 :: 		else if( 147<=ir_value && ir_value<166 )
	MOVLW       0
	SUBWF       FARG_getDistanceIR_GP2D120_ir_value+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__getDistanceIR_GP2D120338
	MOVLW       147
	SUBWF       FARG_getDistanceIR_GP2D120_ir_value+0, 0 
L__getDistanceIR_GP2D120338:
	BTFSS       STATUS+0, 0 
	GOTO        L_getDistanceIR_GP2D120225
	MOVLW       0
	SUBWF       FARG_getDistanceIR_GP2D120_ir_value+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__getDistanceIR_GP2D120339
	MOVLW       166
	SUBWF       FARG_getDistanceIR_GP2D120_ir_value+0, 0 
L__getDistanceIR_GP2D120339:
	BTFSC       STATUS+0, 0 
	GOTO        L_getDistanceIR_GP2D120225
L__getDistanceIR_GP2D120302:
;ir.h,43 :: 		return 18 - 22.23*(voltage - 0.81);      //16cm - 18cm
	MOVLW       41
	MOVWF       R4 
	MOVLW       92
	MOVWF       R5 
	MOVLW       79
	MOVWF       R6 
	MOVLW       126
	MOVWF       R7 
	MOVF        getDistanceIR_GP2D120_voltage_L0+0, 0 
	MOVWF       R0 
	MOVF        getDistanceIR_GP2D120_voltage_L0+1, 0 
	MOVWF       R1 
	MOVF        getDistanceIR_GP2D120_voltage_L0+2, 0 
	MOVWF       R2 
	MOVF        getDistanceIR_GP2D120_voltage_L0+3, 0 
	MOVWF       R3 
	CALL        _Sub_32x32_FP+0, 0
	MOVLW       10
	MOVWF       R4 
	MOVLW       215
	MOVWF       R5 
	MOVLW       49
	MOVWF       R6 
	MOVLW       131
	MOVWF       R7 
	CALL        _Mul_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       R4 
	MOVF        R1, 0 
	MOVWF       R5 
	MOVF        R2, 0 
	MOVWF       R6 
	MOVF        R3, 0 
	MOVWF       R7 
	MOVLW       0
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	MOVLW       16
	MOVWF       R2 
	MOVLW       131
	MOVWF       R3 
	CALL        _Sub_32x32_FP+0, 0
	RETURN      0
L_getDistanceIR_GP2D120225:
;ir.h,45 :: 		else if( 133<=ir_value && ir_value<147 )
	MOVLW       0
	SUBWF       FARG_getDistanceIR_GP2D120_ir_value+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__getDistanceIR_GP2D120340
	MOVLW       133
	SUBWF       FARG_getDistanceIR_GP2D120_ir_value+0, 0 
L__getDistanceIR_GP2D120340:
	BTFSS       STATUS+0, 0 
	GOTO        L_getDistanceIR_GP2D120229
	MOVLW       0
	SUBWF       FARG_getDistanceIR_GP2D120_ir_value+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__getDistanceIR_GP2D120341
	MOVLW       147
	SUBWF       FARG_getDistanceIR_GP2D120_ir_value+0, 0 
L__getDistanceIR_GP2D120341:
	BTFSC       STATUS+0, 0 
	GOTO        L_getDistanceIR_GP2D120229
L__getDistanceIR_GP2D120301:
;ir.h,46 :: 		return 20 - 28.57*(voltage - 0.65);       //18cm - 20cm
	MOVLW       102
	MOVWF       R4 
	MOVLW       102
	MOVWF       R5 
	MOVLW       38
	MOVWF       R6 
	MOVLW       126
	MOVWF       R7 
	MOVF        getDistanceIR_GP2D120_voltage_L0+0, 0 
	MOVWF       R0 
	MOVF        getDistanceIR_GP2D120_voltage_L0+1, 0 
	MOVWF       R1 
	MOVF        getDistanceIR_GP2D120_voltage_L0+2, 0 
	MOVWF       R2 
	MOVF        getDistanceIR_GP2D120_voltage_L0+3, 0 
	MOVWF       R3 
	CALL        _Sub_32x32_FP+0, 0
	MOVLW       92
	MOVWF       R4 
	MOVLW       143
	MOVWF       R5 
	MOVLW       100
	MOVWF       R6 
	MOVLW       131
	MOVWF       R7 
	CALL        _Mul_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       R4 
	MOVF        R1, 0 
	MOVWF       R5 
	MOVF        R2, 0 
	MOVWF       R6 
	MOVF        R3, 0 
	MOVWF       R7 
	MOVLW       0
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	MOVLW       32
	MOVWF       R2 
	MOVLW       131
	MOVWF       R3 
	CALL        _Sub_32x32_FP+0, 0
	RETURN      0
L_getDistanceIR_GP2D120229:
;ir.h,48 :: 		else if( 106<=ir_value && ir_value<133 )
	MOVLW       0
	SUBWF       FARG_getDistanceIR_GP2D120_ir_value+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__getDistanceIR_GP2D120342
	MOVLW       106
	SUBWF       FARG_getDistanceIR_GP2D120_ir_value+0, 0 
L__getDistanceIR_GP2D120342:
	BTFSS       STATUS+0, 0 
	GOTO        L_getDistanceIR_GP2D120233
	MOVLW       0
	SUBWF       FARG_getDistanceIR_GP2D120_ir_value+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__getDistanceIR_GP2D120343
	MOVLW       133
	SUBWF       FARG_getDistanceIR_GP2D120_ir_value+0, 0 
L__getDistanceIR_GP2D120343:
	BTFSC       STATUS+0, 0 
	GOTO        L_getDistanceIR_GP2D120233
L__getDistanceIR_GP2D120300:
;ir.h,49 :: 		return 25 - 45.45*(voltage - 0.52);       //20cm - 25cm
	MOVLW       184
	MOVWF       R4 
	MOVLW       30
	MOVWF       R5 
	MOVLW       5
	MOVWF       R6 
	MOVLW       126
	MOVWF       R7 
	MOVF        getDistanceIR_GP2D120_voltage_L0+0, 0 
	MOVWF       R0 
	MOVF        getDistanceIR_GP2D120_voltage_L0+1, 0 
	MOVWF       R1 
	MOVF        getDistanceIR_GP2D120_voltage_L0+2, 0 
	MOVWF       R2 
	MOVF        getDistanceIR_GP2D120_voltage_L0+3, 0 
	MOVWF       R3 
	CALL        _Sub_32x32_FP+0, 0
	MOVLW       205
	MOVWF       R4 
	MOVLW       204
	MOVWF       R5 
	MOVLW       53
	MOVWF       R6 
	MOVLW       132
	MOVWF       R7 
	CALL        _Mul_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       R4 
	MOVF        R1, 0 
	MOVWF       R5 
	MOVF        R2, 0 
	MOVWF       R6 
	MOVF        R3, 0 
	MOVWF       R7 
	MOVLW       0
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	MOVLW       72
	MOVWF       R2 
	MOVLW       131
	MOVWF       R3 
	CALL        _Sub_32x32_FP+0, 0
	RETURN      0
L_getDistanceIR_GP2D120233:
;ir.h,51 :: 		else if( 88<=ir_value && ir_value<106 )
	MOVLW       0
	SUBWF       FARG_getDistanceIR_GP2D120_ir_value+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__getDistanceIR_GP2D120344
	MOVLW       88
	SUBWF       FARG_getDistanceIR_GP2D120_ir_value+0, 0 
L__getDistanceIR_GP2D120344:
	BTFSS       STATUS+0, 0 
	GOTO        L_getDistanceIR_GP2D120237
	MOVLW       0
	SUBWF       FARG_getDistanceIR_GP2D120_ir_value+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__getDistanceIR_GP2D120345
	MOVLW       106
	SUBWF       FARG_getDistanceIR_GP2D120_ir_value+0, 0 
L__getDistanceIR_GP2D120345:
	BTFSC       STATUS+0, 0 
	GOTO        L_getDistanceIR_GP2D120237
L__getDistanceIR_GP2D120299:
;ir.h,52 :: 		return 30 - 55*(voltage - 0.43);           //25cm - 30cm
	MOVLW       246
	MOVWF       R4 
	MOVLW       40
	MOVWF       R5 
	MOVLW       92
	MOVWF       R6 
	MOVLW       125
	MOVWF       R7 
	MOVF        getDistanceIR_GP2D120_voltage_L0+0, 0 
	MOVWF       R0 
	MOVF        getDistanceIR_GP2D120_voltage_L0+1, 0 
	MOVWF       R1 
	MOVF        getDistanceIR_GP2D120_voltage_L0+2, 0 
	MOVWF       R2 
	MOVF        getDistanceIR_GP2D120_voltage_L0+3, 0 
	MOVWF       R3 
	CALL        _Sub_32x32_FP+0, 0
	MOVLW       0
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVLW       92
	MOVWF       R6 
	MOVLW       132
	MOVWF       R7 
	CALL        _Mul_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       R4 
	MOVF        R1, 0 
	MOVWF       R5 
	MOVF        R2, 0 
	MOVWF       R6 
	MOVF        R3, 0 
	MOVWF       R7 
	MOVLW       0
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	MOVLW       112
	MOVWF       R2 
	MOVLW       131
	MOVWF       R3 
	CALL        _Sub_32x32_FP+0, 0
	RETURN      0
L_getDistanceIR_GP2D120237:
;ir.h,54 :: 		else if( 78<=ir_value && ir_value<88 )
	MOVLW       0
	SUBWF       FARG_getDistanceIR_GP2D120_ir_value+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__getDistanceIR_GP2D120346
	MOVLW       78
	SUBWF       FARG_getDistanceIR_GP2D120_ir_value+0, 0 
L__getDistanceIR_GP2D120346:
	BTFSS       STATUS+0, 0 
	GOTO        L_getDistanceIR_GP2D120241
	MOVLW       0
	SUBWF       FARG_getDistanceIR_GP2D120_ir_value+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__getDistanceIR_GP2D120347
	MOVLW       88
	SUBWF       FARG_getDistanceIR_GP2D120_ir_value+0, 0 
L__getDistanceIR_GP2D120347:
	BTFSC       STATUS+0, 0 
	GOTO        L_getDistanceIR_GP2D120241
L__getDistanceIR_GP2D120298:
;ir.h,55 :: 		return 35 - 100*(voltage - 0.38);         //30cm - 35cm
	MOVLW       92
	MOVWF       R4 
	MOVLW       143
	MOVWF       R5 
	MOVLW       66
	MOVWF       R6 
	MOVLW       125
	MOVWF       R7 
	MOVF        getDistanceIR_GP2D120_voltage_L0+0, 0 
	MOVWF       R0 
	MOVF        getDistanceIR_GP2D120_voltage_L0+1, 0 
	MOVWF       R1 
	MOVF        getDistanceIR_GP2D120_voltage_L0+2, 0 
	MOVWF       R2 
	MOVF        getDistanceIR_GP2D120_voltage_L0+3, 0 
	MOVWF       R3 
	CALL        _Sub_32x32_FP+0, 0
	MOVLW       0
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVLW       72
	MOVWF       R6 
	MOVLW       133
	MOVWF       R7 
	CALL        _Mul_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       R4 
	MOVF        R1, 0 
	MOVWF       R5 
	MOVF        R2, 0 
	MOVWF       R6 
	MOVF        R3, 0 
	MOVWF       R7 
	MOVLW       0
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	MOVLW       12
	MOVWF       R2 
	MOVLW       132
	MOVWF       R3 
	CALL        _Sub_32x32_FP+0, 0
	RETURN      0
L_getDistanceIR_GP2D120241:
;ir.h,57 :: 		else if( 65<=ir_value && ir_value<78 )
	MOVLW       0
	SUBWF       FARG_getDistanceIR_GP2D120_ir_value+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__getDistanceIR_GP2D120348
	MOVLW       65
	SUBWF       FARG_getDistanceIR_GP2D120_ir_value+0, 0 
L__getDistanceIR_GP2D120348:
	BTFSS       STATUS+0, 0 
	GOTO        L_getDistanceIR_GP2D120245
	MOVLW       0
	SUBWF       FARG_getDistanceIR_GP2D120_ir_value+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__getDistanceIR_GP2D120349
	MOVLW       78
	SUBWF       FARG_getDistanceIR_GP2D120_ir_value+0, 0 
L__getDistanceIR_GP2D120349:
	BTFSC       STATUS+0, 0 
	GOTO        L_getDistanceIR_GP2D120245
L__getDistanceIR_GP2D120297:
;ir.h,58 :: 		return 40 - 83.33*(voltage - 0.32);       //35cm - 40cm
	MOVLW       10
	MOVWF       R4 
	MOVLW       215
	MOVWF       R5 
	MOVLW       35
	MOVWF       R6 
	MOVLW       125
	MOVWF       R7 
	MOVF        getDistanceIR_GP2D120_voltage_L0+0, 0 
	MOVWF       R0 
	MOVF        getDistanceIR_GP2D120_voltage_L0+1, 0 
	MOVWF       R1 
	MOVF        getDistanceIR_GP2D120_voltage_L0+2, 0 
	MOVWF       R2 
	MOVF        getDistanceIR_GP2D120_voltage_L0+3, 0 
	MOVWF       R3 
	CALL        _Sub_32x32_FP+0, 0
	MOVLW       246
	MOVWF       R4 
	MOVLW       168
	MOVWF       R5 
	MOVLW       38
	MOVWF       R6 
	MOVLW       133
	MOVWF       R7 
	CALL        _Mul_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       R4 
	MOVF        R1, 0 
	MOVWF       R5 
	MOVF        R2, 0 
	MOVWF       R6 
	MOVF        R3, 0 
	MOVWF       R7 
	MOVLW       0
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	MOVLW       32
	MOVWF       R2 
	MOVLW       132
	MOVWF       R3 
	CALL        _Sub_32x32_FP+0, 0
	RETURN      0
L_getDistanceIR_GP2D120245:
;ir.h,60 :: 		return 50;
	MOVLW       0
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	MOVLW       72
	MOVWF       R2 
	MOVLW       132
	MOVWF       R3 
;ir.h,61 :: 		}
	RETURN      0
; end of _getDistanceIR_GP2D120

_updateDistance:

;Main 2.0V.c,14 :: 		void updateDistance(){
;Main 2.0V.c,15 :: 		TRIG = 0;
	BCF         PORTD+0, 0 
;Main 2.0V.c,16 :: 		delay_us(10);
	MOVLW       16
	MOVWF       R13, 0
L_updateDistance247:
	DECFSZ      R13, 1, 0
	BRA         L_updateDistance247
	NOP
;Main 2.0V.c,17 :: 		TRIG = 1;
	BSF         PORTD+0, 0 
;Main 2.0V.c,18 :: 		delay_us(10);
	MOVLW       16
	MOVWF       R13, 0
L_updateDistance248:
	DECFSZ      R13, 1, 0
	BRA         L_updateDistance248
	NOP
;Main 2.0V.c,19 :: 		TRIG = 0;
	BCF         PORTD+0, 0 
;Main 2.0V.c,21 :: 		while(ECHO==0);
L_updateDistance249:
	BTFSC       PORTD+0, 1 
	GOTO        L_updateDistance250
	GOTO        L_updateDistance249
L_updateDistance250:
;Main 2.0V.c,22 :: 		counter = 0;
	CLRF        _counter+0 
	CLRF        _counter+1 
;Main 2.0V.c,24 :: 		while(ECHO==1){
L_updateDistance251:
	BTFSS       PORTD+0, 1 
	GOTO        L_updateDistance252
;Main 2.0V.c,25 :: 		counter++;
	INFSNZ      _counter+0, 1 
	INCF        _counter+1, 1 
;Main 2.0V.c,26 :: 		}
	GOTO        L_updateDistance251
L_updateDistance252:
;Main 2.0V.c,27 :: 		responseTime = counter * 0.2 * 0.000001; //in s
	MOVF        _counter+0, 0 
	MOVWF       R0 
	MOVF        _counter+1, 0 
	MOVWF       R1 
	CALL        _Int2Double+0, 0
	MOVLW       205
	MOVWF       R4 
	MOVLW       204
	MOVWF       R5 
	MOVLW       76
	MOVWF       R6 
	MOVLW       124
	MOVWF       R7 
	CALL        _Mul_32x32_FP+0, 0
	MOVLW       189
	MOVWF       R4 
	MOVLW       55
	MOVWF       R5 
	MOVLW       6
	MOVWF       R6 
	MOVLW       107
	MOVWF       R7 
	CALL        _Mul_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       _responseTime+0 
	MOVF        R1, 0 
	MOVWF       _responseTime+1 
	MOVF        R2, 0 
	MOVWF       _responseTime+2 
	MOVF        R3, 0 
	MOVWF       _responseTime+3 
;Main 2.0V.c,28 :: 		distance = 340 * responseTime * 100 /2;// in cm
	MOVLW       0
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVLW       42
	MOVWF       R6 
	MOVLW       135
	MOVWF       R7 
	CALL        _Mul_32x32_FP+0, 0
	MOVLW       0
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVLW       72
	MOVWF       R6 
	MOVLW       133
	MOVWF       R7 
	CALL        _Mul_32x32_FP+0, 0
	MOVLW       0
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVLW       0
	MOVWF       R6 
	MOVLW       128
	MOVWF       R7 
	CALL        _Div_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       _distance+0 
	MOVF        R1, 0 
	MOVWF       _distance+1 
	MOVF        R2, 0 
	MOVWF       _distance+2 
	MOVF        R3, 0 
	MOVWF       _distance+3 
;Main 2.0V.c,29 :: 		distanceInt = distance;
	CALL        _Double2Int+0, 0
	MOVF        R0, 0 
	MOVWF       _distanceInt+0 
	MOVF        R1, 0 
	MOVWF       _distanceInt+1 
;Main 2.0V.c,30 :: 		}
	RETURN      0
; end of _updateDistance

_main:

;Main 2.0V.c,33 :: 		void main() {
;Main 2.0V.c,34 :: 		configure();
	CALL        _configure+0, 0
;Main 2.0V.c,36 :: 		UART1_Write_Text(ConnectionEstablished);
	MOVF        _ConnectionEstablished+0, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVF        _ConnectionEstablished+1, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;Main 2.0V.c,37 :: 		setPID();
	CALL        _setPID+0, 0
;Main 2.0V.c,41 :: 		debugText = "          Starting..  ";
	MOVLW       ?lstr34_Main_322.0V+0
	MOVWF       _debugText+0 
	MOVLW       hi_addr(?lstr34_Main_322.0V+0)
	MOVWF       _debugText+1 
;Main 2.0V.c,42 :: 		UART1_Write_Text(debugText);
	MOVF        _debugText+0, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVF        _debugText+1, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;Main 2.0V.c,43 :: 		count = 0;
	CLRF        _count+0 
	CLRF        _count+1 
;Main 2.0V.c,44 :: 		while(1){
L_main253:
;Main 2.0V.c,45 :: 		moveForward(200,200);
	MOVLW       200
	MOVWF       FARG_moveForward_pwmLeft+0 
	MOVLW       0
	MOVWF       FARG_moveForward_pwmLeft+1 
	MOVLW       200
	MOVWF       FARG_moveForward_pwmRight+0 
	MOVLW       0
	MOVWF       FARG_moveForward_pwmRight+1 
	CALL        _moveForward+0, 0
;Main 2.0V.c,46 :: 		delay_ms(10);
	MOVLW       65
	MOVWF       R12, 0
	MOVLW       238
	MOVWF       R13, 0
L_main255:
	DECFSZ      R13, 1, 0
	BRA         L_main255
	DECFSZ      R12, 1, 0
	BRA         L_main255
	NOP
;Main 2.0V.c,48 :: 		ir_value = ADC_Read(0);
	CLRF        FARG_ADC_Read_channel+0 
	CALL        _ADC_Read+0, 0
	MOVF        R0, 0 
	MOVWF       _ir_value+0 
	MOVF        R1, 0 
	MOVWF       _ir_value+1 
;Main 2.0V.c,49 :: 		if(300<=ir_value && ir_value<623){                         // 2 --> 14cm
	MOVLW       1
	SUBWF       R1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main350
	MOVLW       44
	SUBWF       R0, 0 
L__main350:
	BTFSS       STATUS+0, 0 
	GOTO        L_main258
	MOVLW       2
	SUBWF       _ir_value+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main351
	MOVLW       111
	SUBWF       _ir_value+0, 0 
L__main351:
	BTFSC       STATUS+0, 0 
	GOTO        L_main258
L__main314:
;Main 2.0V.c,50 :: 		stop();
	CALL        _stop+0, 0
;Main 2.0V.c,51 :: 		debugText = " Obstacle! ";
	MOVLW       ?lstr35_Main_322.0V+0
	MOVWF       _debugText+0 
	MOVLW       hi_addr(?lstr35_Main_322.0V+0)
	MOVWF       _debugText+1 
;Main 2.0V.c,52 :: 		UART1_Write_Text(debugText);
	MOVF        _debugText+0, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVF        _debugText+1, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;Main 2.0V.c,53 :: 		rotateAntiClockwise(255);
	MOVLW       255
	MOVWF       FARG_rotateAntiClockwise_pwm+0 
	MOVLW       0
	MOVWF       FARG_rotateAntiClockwise_pwm+1 
	CALL        _rotateAntiClockwise+0, 0
;Main 2.0V.c,54 :: 		delay_ms(220);
	MOVLW       6
	MOVWF       R11, 0
	MOVLW       149
	MOVWF       R12, 0
	MOVLW       140
	MOVWF       R13, 0
L_main259:
	DECFSZ      R13, 1, 0
	BRA         L_main259
	DECFSZ      R12, 1, 0
	BRA         L_main259
	DECFSZ      R11, 1, 0
	BRA         L_main259
	NOP
;Main 2.0V.c,55 :: 		}
L_main258:
;Main 2.0V.c,56 :: 		count++;
	INFSNZ      _count+0, 1 
	INCF        _count+1, 1 
;Main 2.0V.c,57 :: 		if(count ==100){
	MOVLW       0
	XORWF       _count+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main352
	MOVLW       100
	XORWF       _count+0, 0 
L__main352:
	BTFSS       STATUS+0, 2 
	GOTO        L_main260
;Main 2.0V.c,58 :: 		count = 0;
	CLRF        _count+0 
	CLRF        _count+1 
;Main 2.0V.c,59 :: 		debugText = " Clear";
	MOVLW       ?lstr36_Main_322.0V+0
	MOVWF       _debugText+0 
	MOVLW       hi_addr(?lstr36_Main_322.0V+0)
	MOVWF       _debugText+1 
;Main 2.0V.c,60 :: 		UART1_Write_Text(debugText);
	MOVF        _debugText+0, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVF        _debugText+1, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;Main 2.0V.c,61 :: 		}
L_main260:
;Main 2.0V.c,62 :: 		}
	GOTO        L_main253
;Main 2.0V.c,99 :: 		}
	GOTO        $+0
; end of _main
