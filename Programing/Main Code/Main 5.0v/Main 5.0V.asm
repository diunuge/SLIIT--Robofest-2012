
_isAllBlack:

;sensorpanel.h,15 :: 		int isAllBlack(){
;sensorpanel.h,16 :: 		if( Scout==1 && Sensor1==1 && Sensor2==1 && Sensor3==1 && Sensor4==1 && Sensor5==1 && Sensor6==1 && Sensor7==1 && Sensor8==1 && Sensor9==1){
	BTFSS       PORTB+0, 5 
	GOTO        L_isAllBlack2
	BTFSS       PORTB+0, 4 
	GOTO        L_isAllBlack2
	BTFSS       PORTB+0, 3 
	GOTO        L_isAllBlack2
	BTFSS       PORTD+0, 4 
	GOTO        L_isAllBlack2
	BTFSS       PORTD+0, 5 
	GOTO        L_isAllBlack2
	BTFSS       PORTD+0, 6 
	GOTO        L_isAllBlack2
	BTFSS       PORTD+0, 7 
	GOTO        L_isAllBlack2
	BTFSS       PORTB+0, 2 
	GOTO        L_isAllBlack2
	BTFSS       PORTB+0, 6 
	GOTO        L_isAllBlack2
	BTFSS       PORTB+0, 7 
	GOTO        L_isAllBlack2
L__isAllBlack461:
;sensorpanel.h,17 :: 		return 1;
	MOVLW       1
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	RETURN      0
;sensorpanel.h,18 :: 		}
L_isAllBlack2:
;sensorpanel.h,20 :: 		return 0;
	CLRF        R0 
	CLRF        R1 
;sensorpanel.h,21 :: 		}
	RETURN      0
; end of _isAllBlack

_isAllWhite:

;sensorpanel.h,23 :: 		int isAllWhite(){
;sensorpanel.h,24 :: 		if( Scout==0 && Sensor1==0 && Sensor2==0 && Sensor3==0 && Sensor4==0 && Sensor5==0 && Sensor6==0 && Sensor7==0 && Sensor8==0 && Sensor9==0){
	BTFSC       PORTB+0, 5 
	GOTO        L_isAllWhite6
	BTFSC       PORTB+0, 4 
	GOTO        L_isAllWhite6
	BTFSC       PORTB+0, 3 
	GOTO        L_isAllWhite6
	BTFSC       PORTD+0, 4 
	GOTO        L_isAllWhite6
	BTFSC       PORTD+0, 5 
	GOTO        L_isAllWhite6
	BTFSC       PORTD+0, 6 
	GOTO        L_isAllWhite6
	BTFSC       PORTD+0, 7 
	GOTO        L_isAllWhite6
	BTFSC       PORTB+0, 2 
	GOTO        L_isAllWhite6
	BTFSC       PORTB+0, 6 
	GOTO        L_isAllWhite6
	BTFSC       PORTB+0, 7 
	GOTO        L_isAllWhite6
L__isAllWhite462:
;sensorpanel.h,25 :: 		return 1;
	MOVLW       1
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	RETURN      0
;sensorpanel.h,26 :: 		}
L_isAllWhite6:
;sensorpanel.h,28 :: 		return 0;
	CLRF        R0 
	CLRF        R1 
;sensorpanel.h,29 :: 		}
	RETURN      0
; end of _isAllWhite

_motorLeft_foward:

;motion.h,31 :: 		void motorLeft_foward(int pwm){
;motion.h,32 :: 		Motor_Left_Forward = 1;
	BSF         PORTD+0, 2 
;motion.h,33 :: 		Motor_Left_Reverse = 0;
	BCF         PORTD+0, 3 
;motion.h,34 :: 		PWM2_Set_Duty(pwm);
	MOVF        FARG_motorLeft_foward_pwm+0, 0 
	MOVWF       FARG_PWM2_Set_Duty_new_duty+0 
	CALL        _PWM2_Set_Duty+0, 0
;motion.h,35 :: 		}
	RETURN      0
; end of _motorLeft_foward

_motorRight_foward:

;motion.h,37 :: 		void motorRight_foward(int pwm){
;motion.h,38 :: 		Motor_Right_Forward = 1;
	BSF         PORTC+0, 4 
;motion.h,39 :: 		Motor_Right_Reverse = 0;
	BCF         PORTC+0, 5 
;motion.h,40 :: 		PWM1_Set_Duty(pwm);
	MOVF        FARG_motorRight_foward_pwm+0, 0 
	MOVWF       FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;motion.h,41 :: 		}
	RETURN      0
; end of _motorRight_foward

_motorLeft_reverse:

;motion.h,43 :: 		void motorLeft_reverse(int pwm){
;motion.h,44 :: 		Motor_Left_Forward = 0;
	BCF         PORTD+0, 2 
;motion.h,45 :: 		Motor_Left_Reverse = 1;
	BSF         PORTD+0, 3 
;motion.h,46 :: 		PWM2_Set_Duty(pwm);
	MOVF        FARG_motorLeft_reverse_pwm+0, 0 
	MOVWF       FARG_PWM2_Set_Duty_new_duty+0 
	CALL        _PWM2_Set_Duty+0, 0
;motion.h,47 :: 		}
	RETURN      0
; end of _motorLeft_reverse

_motorRight_reverse:

;motion.h,49 :: 		void motorRight_reverse(int pwm){
;motion.h,50 :: 		Motor_Right_Forward = 0;
	BCF         PORTC+0, 4 
;motion.h,51 :: 		Motor_Right_Reverse = 1;
	BSF         PORTC+0, 5 
;motion.h,52 :: 		PWM1_Set_Duty(pwm);
	MOVF        FARG_motorRight_reverse_pwm+0, 0 
	MOVWF       FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;motion.h,53 :: 		}
	RETURN      0
; end of _motorRight_reverse

_motorLeft_stop:

;motion.h,55 :: 		void motorLeft_stop(){
;motion.h,56 :: 		Motor_Left_Forward = 1;
	BSF         PORTD+0, 2 
;motion.h,57 :: 		Motor_Left_Reverse = 1;
	BSF         PORTD+0, 3 
;motion.h,58 :: 		}
	RETURN      0
; end of _motorLeft_stop

_motorRight_stop:

;motion.h,60 :: 		void motorRight_stop(){
;motion.h,61 :: 		Motor_Right_Forward = 1;
	BSF         PORTC+0, 4 
;motion.h,62 :: 		Motor_Right_Reverse = 1;
	BSF         PORTC+0, 5 
;motion.h,63 :: 		}
	RETURN      0
; end of _motorRight_stop

_moveForward:

;motion.h,65 :: 		void moveForward(int pwmLeft, int pwmRight){
;motion.h,66 :: 		motorLeft_foward(pwmLeft);
	MOVF        FARG_moveForward_pwmLeft+0, 0 
	MOVWF       FARG_motorLeft_foward_pwm+0 
	MOVF        FARG_moveForward_pwmLeft+1, 0 
	MOVWF       FARG_motorLeft_foward_pwm+1 
	CALL        _motorLeft_foward+0, 0
;motion.h,67 :: 		motorRight_foward(pwmRight);
	MOVF        FARG_moveForward_pwmRight+0, 0 
	MOVWF       FARG_motorRight_foward_pwm+0 
	MOVF        FARG_moveForward_pwmRight+1, 0 
	MOVWF       FARG_motorRight_foward_pwm+1 
	CALL        _motorRight_foward+0, 0
;motion.h,68 :: 		}
	RETURN      0
; end of _moveForward

_turnRight:

;motion.h,70 :: 		void turnRight(int pwmLeft){
;motion.h,71 :: 		motorLeft_foward(pwmLeft);
	MOVF        FARG_turnRight_pwmLeft+0, 0 
	MOVWF       FARG_motorLeft_foward_pwm+0 
	MOVF        FARG_turnRight_pwmLeft+1, 0 
	MOVWF       FARG_motorLeft_foward_pwm+1 
	CALL        _motorLeft_foward+0, 0
;motion.h,72 :: 		motorRight_stop();
	CALL        _motorRight_stop+0, 0
;motion.h,73 :: 		}
	RETURN      0
; end of _turnRight

_turnLeft:

;motion.h,75 :: 		void turnLeft(int pwmRight){
;motion.h,76 :: 		motorRight_foward(pwmRight);
	MOVF        FARG_turnLeft_pwmRight+0, 0 
	MOVWF       FARG_motorRight_foward_pwm+0 
	MOVF        FARG_turnLeft_pwmRight+1, 0 
	MOVWF       FARG_motorRight_foward_pwm+1 
	CALL        _motorRight_foward+0, 0
;motion.h,77 :: 		motorLeft_stop();
	CALL        _motorLeft_stop+0, 0
;motion.h,78 :: 		}
	RETURN      0
; end of _turnLeft

_rotateClockwise:

;motion.h,80 :: 		void rotateClockwise(int pwm){
;motion.h,81 :: 		motorLeft_foward(pwm);
	MOVF        FARG_rotateClockwise_pwm+0, 0 
	MOVWF       FARG_motorLeft_foward_pwm+0 
	MOVF        FARG_rotateClockwise_pwm+1, 0 
	MOVWF       FARG_motorLeft_foward_pwm+1 
	CALL        _motorLeft_foward+0, 0
;motion.h,82 :: 		motorRight_reverse(pwm);
	MOVF        FARG_rotateClockwise_pwm+0, 0 
	MOVWF       FARG_motorRight_reverse_pwm+0 
	MOVF        FARG_rotateClockwise_pwm+1, 0 
	MOVWF       FARG_motorRight_reverse_pwm+1 
	CALL        _motorRight_reverse+0, 0
;motion.h,83 :: 		}
	RETURN      0
; end of _rotateClockwise

_rotateAntiClockwise:

;motion.h,85 :: 		void rotateAntiClockwise(int pwm){
;motion.h,86 :: 		motorLeft_reverse(pwm);
	MOVF        FARG_rotateAntiClockwise_pwm+0, 0 
	MOVWF       FARG_motorLeft_reverse_pwm+0 
	MOVF        FARG_rotateAntiClockwise_pwm+1, 0 
	MOVWF       FARG_motorLeft_reverse_pwm+1 
	CALL        _motorLeft_reverse+0, 0
;motion.h,87 :: 		motorRight_foward(pwm);
	MOVF        FARG_rotateAntiClockwise_pwm+0, 0 
	MOVWF       FARG_motorRight_foward_pwm+0 
	MOVF        FARG_rotateAntiClockwise_pwm+1, 0 
	MOVWF       FARG_motorRight_foward_pwm+1 
	CALL        _motorRight_foward+0, 0
;motion.h,88 :: 		}
	RETURN      0
; end of _rotateAntiClockwise

_stop:

;motion.h,90 :: 		void stop(){
;motion.h,91 :: 		motorLeft_stop();
	CALL        _motorLeft_stop+0, 0
;motion.h,92 :: 		motorRight_stop();
	CALL        _motorRight_stop+0, 0
;motion.h,93 :: 		}
	RETURN      0
; end of _stop

_rotateByDegree:

;motion.h,95 :: 		void rotateByDegree(int degree){
;motion.h,96 :: 		if( degree == -90 ){
	MOVLW       255
	XORWF       FARG_rotateByDegree_degree+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__rotateByDegree563
	MOVLW       166
	XORWF       FARG_rotateByDegree_degree+0, 0 
L__rotateByDegree563:
	BTFSS       STATUS+0, 2 
	GOTO        L_rotateByDegree8
;motion.h,97 :: 		rotateAntiClockwise(255);
	MOVLW       255
	MOVWF       FARG_rotateAntiClockwise_pwm+0 
	MOVLW       0
	MOVWF       FARG_rotateAntiClockwise_pwm+1 
	CALL        _rotateAntiClockwise+0, 0
;motion.h,98 :: 		delay_ms(220);
	MOVLW       6
	MOVWF       R11, 0
	MOVLW       149
	MOVWF       R12, 0
	MOVLW       140
	MOVWF       R13, 0
L_rotateByDegree9:
	DECFSZ      R13, 1, 0
	BRA         L_rotateByDegree9
	DECFSZ      R12, 1, 0
	BRA         L_rotateByDegree9
	DECFSZ      R11, 1, 0
	BRA         L_rotateByDegree9
	NOP
;motion.h,99 :: 		stop();
	CALL        _stop+0, 0
;motion.h,100 :: 		}
	GOTO        L_rotateByDegree10
L_rotateByDegree8:
;motion.h,101 :: 		else if( degree == 90 ){
	MOVLW       0
	XORWF       FARG_rotateByDegree_degree+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__rotateByDegree564
	MOVLW       90
	XORWF       FARG_rotateByDegree_degree+0, 0 
L__rotateByDegree564:
	BTFSS       STATUS+0, 2 
	GOTO        L_rotateByDegree11
;motion.h,102 :: 		rotateClockwise(255);
	MOVLW       255
	MOVWF       FARG_rotateClockwise_pwm+0 
	MOVLW       0
	MOVWF       FARG_rotateClockwise_pwm+1 
	CALL        _rotateClockwise+0, 0
;motion.h,103 :: 		delay_ms(220);
	MOVLW       6
	MOVWF       R11, 0
	MOVLW       149
	MOVWF       R12, 0
	MOVLW       140
	MOVWF       R13, 0
L_rotateByDegree12:
	DECFSZ      R13, 1, 0
	BRA         L_rotateByDegree12
	DECFSZ      R12, 1, 0
	BRA         L_rotateByDegree12
	DECFSZ      R11, 1, 0
	BRA         L_rotateByDegree12
	NOP
;motion.h,104 :: 		stop();
	CALL        _stop+0, 0
;motion.h,105 :: 		}
L_rotateByDegree11:
L_rotateByDegree10:
;motion.h,106 :: 		}
	RETURN      0
; end of _rotateByDegree

_testMotion:

;motion.h,108 :: 		void testMotion(int pwm){
;motion.h,109 :: 		rotateClockwise(pwm);
	MOVF        FARG_testMotion_pwm+0, 0 
	MOVWF       FARG_rotateClockwise_pwm+0 
	MOVF        FARG_testMotion_pwm+1, 0 
	MOVWF       FARG_rotateClockwise_pwm+1 
	CALL        _rotateClockwise+0, 0
;motion.h,110 :: 		delay_ms(1000);
	MOVLW       26
	MOVWF       R11, 0
	MOVLW       94
	MOVWF       R12, 0
	MOVLW       110
	MOVWF       R13, 0
L_testMotion13:
	DECFSZ      R13, 1, 0
	BRA         L_testMotion13
	DECFSZ      R12, 1, 0
	BRA         L_testMotion13
	DECFSZ      R11, 1, 0
	BRA         L_testMotion13
	NOP
;motion.h,111 :: 		rotateAntiClockwise(pwm);
	MOVF        FARG_testMotion_pwm+0, 0 
	MOVWF       FARG_rotateAntiClockwise_pwm+0 
	MOVF        FARG_testMotion_pwm+1, 0 
	MOVWF       FARG_rotateAntiClockwise_pwm+1 
	CALL        _rotateAntiClockwise+0, 0
;motion.h,112 :: 		delay_ms(1000);
	MOVLW       26
	MOVWF       R11, 0
	MOVLW       94
	MOVWF       R12, 0
	MOVLW       110
	MOVWF       R13, 0
L_testMotion14:
	DECFSZ      R13, 1, 0
	BRA         L_testMotion14
	DECFSZ      R12, 1, 0
	BRA         L_testMotion14
	DECFSZ      R11, 1, 0
	BRA         L_testMotion14
	NOP
;motion.h,113 :: 		moveForward(pwm,pwm);
	MOVF        FARG_testMotion_pwm+0, 0 
	MOVWF       FARG_moveForward_pwmLeft+0 
	MOVF        FARG_testMotion_pwm+1, 0 
	MOVWF       FARG_moveForward_pwmLeft+1 
	MOVF        FARG_testMotion_pwm+0, 0 
	MOVWF       FARG_moveForward_pwmRight+0 
	MOVF        FARG_testMotion_pwm+1, 0 
	MOVWF       FARG_moveForward_pwmRight+1 
	CALL        _moveForward+0, 0
;motion.h,114 :: 		delay_ms(1000);
	MOVLW       26
	MOVWF       R11, 0
	MOVLW       94
	MOVWF       R12, 0
	MOVLW       110
	MOVWF       R13, 0
L_testMotion15:
	DECFSZ      R13, 1, 0
	BRA         L_testMotion15
	DECFSZ      R12, 1, 0
	BRA         L_testMotion15
	DECFSZ      R11, 1, 0
	BRA         L_testMotion15
	NOP
;motion.h,115 :: 		}
	RETURN      0
; end of _testMotion

_sendSensorStatus:

;debug.h,13 :: 		void sendSensorStatus(){
;debug.h,14 :: 		if( Sensor1 == 1){
	BTFSS       PORTB+0, 4 
	GOTO        L_sendSensorStatus16
;debug.h,15 :: 		debugText = "1";
	MOVLW       ?lstr3_Main_325.0V+0
	MOVWF       _debugText+0 
	MOVLW       hi_addr(?lstr3_Main_325.0V+0)
	MOVWF       _debugText+1 
;debug.h,16 :: 		UART1_Write_Text(debugText);
	MOVF        _debugText+0, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVF        _debugText+1, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;debug.h,17 :: 		}
	GOTO        L_sendSensorStatus17
L_sendSensorStatus16:
;debug.h,18 :: 		else if( Sensor1 == 0){
	BTFSC       PORTB+0, 4 
	GOTO        L_sendSensorStatus18
;debug.h,19 :: 		debugText = "0";
	MOVLW       ?lstr4_Main_325.0V+0
	MOVWF       _debugText+0 
	MOVLW       hi_addr(?lstr4_Main_325.0V+0)
	MOVWF       _debugText+1 
;debug.h,20 :: 		UART1_Write_Text(debugText);
	MOVF        _debugText+0, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVF        _debugText+1, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;debug.h,21 :: 		}
L_sendSensorStatus18:
L_sendSensorStatus17:
;debug.h,23 :: 		if( Sensor2 == 1){
	BTFSS       PORTB+0, 3 
	GOTO        L_sendSensorStatus19
;debug.h,24 :: 		debugText = "1";
	MOVLW       ?lstr5_Main_325.0V+0
	MOVWF       _debugText+0 
	MOVLW       hi_addr(?lstr5_Main_325.0V+0)
	MOVWF       _debugText+1 
;debug.h,25 :: 		UART1_Write_Text(debugText);
	MOVF        _debugText+0, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVF        _debugText+1, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;debug.h,26 :: 		}
	GOTO        L_sendSensorStatus20
L_sendSensorStatus19:
;debug.h,27 :: 		else if( Sensor2 == 0){
	BTFSC       PORTB+0, 3 
	GOTO        L_sendSensorStatus21
;debug.h,28 :: 		debugText = "0";
	MOVLW       ?lstr6_Main_325.0V+0
	MOVWF       _debugText+0 
	MOVLW       hi_addr(?lstr6_Main_325.0V+0)
	MOVWF       _debugText+1 
;debug.h,29 :: 		UART1_Write_Text(debugText);
	MOVF        _debugText+0, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVF        _debugText+1, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;debug.h,30 :: 		}
L_sendSensorStatus21:
L_sendSensorStatus20:
;debug.h,32 :: 		if( Sensor3 == 1){
	BTFSS       PORTD+0, 4 
	GOTO        L_sendSensorStatus22
;debug.h,33 :: 		debugText = "1";
	MOVLW       ?lstr7_Main_325.0V+0
	MOVWF       _debugText+0 
	MOVLW       hi_addr(?lstr7_Main_325.0V+0)
	MOVWF       _debugText+1 
;debug.h,34 :: 		UART1_Write_Text(debugText);
	MOVF        _debugText+0, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVF        _debugText+1, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;debug.h,35 :: 		}
	GOTO        L_sendSensorStatus23
L_sendSensorStatus22:
;debug.h,36 :: 		else if( Sensor3 == 0){
	BTFSC       PORTD+0, 4 
	GOTO        L_sendSensorStatus24
;debug.h,37 :: 		debugText = "0";
	MOVLW       ?lstr8_Main_325.0V+0
	MOVWF       _debugText+0 
	MOVLW       hi_addr(?lstr8_Main_325.0V+0)
	MOVWF       _debugText+1 
;debug.h,38 :: 		UART1_Write_Text(debugText);
	MOVF        _debugText+0, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVF        _debugText+1, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;debug.h,39 :: 		}
L_sendSensorStatus24:
L_sendSensorStatus23:
;debug.h,41 :: 		if( Sensor4 == 1){
	BTFSS       PORTD+0, 5 
	GOTO        L_sendSensorStatus25
;debug.h,42 :: 		debugText = "1";
	MOVLW       ?lstr9_Main_325.0V+0
	MOVWF       _debugText+0 
	MOVLW       hi_addr(?lstr9_Main_325.0V+0)
	MOVWF       _debugText+1 
;debug.h,43 :: 		UART1_Write_Text(debugText);
	MOVF        _debugText+0, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVF        _debugText+1, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;debug.h,44 :: 		}
	GOTO        L_sendSensorStatus26
L_sendSensorStatus25:
;debug.h,45 :: 		else if( Sensor4 == 0){
	BTFSC       PORTD+0, 5 
	GOTO        L_sendSensorStatus27
;debug.h,46 :: 		debugText = "0";
	MOVLW       ?lstr10_Main_325.0V+0
	MOVWF       _debugText+0 
	MOVLW       hi_addr(?lstr10_Main_325.0V+0)
	MOVWF       _debugText+1 
;debug.h,47 :: 		UART1_Write_Text(debugText);
	MOVF        _debugText+0, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVF        _debugText+1, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;debug.h,48 :: 		}
L_sendSensorStatus27:
L_sendSensorStatus26:
;debug.h,50 :: 		if( Sensor5 == 1){
	BTFSS       PORTD+0, 6 
	GOTO        L_sendSensorStatus28
;debug.h,51 :: 		debugText = "1";
	MOVLW       ?lstr11_Main_325.0V+0
	MOVWF       _debugText+0 
	MOVLW       hi_addr(?lstr11_Main_325.0V+0)
	MOVWF       _debugText+1 
;debug.h,52 :: 		UART1_Write_Text(debugText);
	MOVF        _debugText+0, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVF        _debugText+1, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;debug.h,53 :: 		}
	GOTO        L_sendSensorStatus29
L_sendSensorStatus28:
;debug.h,54 :: 		else if( Sensor5 == 0){
	BTFSC       PORTD+0, 6 
	GOTO        L_sendSensorStatus30
;debug.h,55 :: 		debugText = "0";
	MOVLW       ?lstr12_Main_325.0V+0
	MOVWF       _debugText+0 
	MOVLW       hi_addr(?lstr12_Main_325.0V+0)
	MOVWF       _debugText+1 
;debug.h,56 :: 		UART1_Write_Text(debugText);
	MOVF        _debugText+0, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVF        _debugText+1, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;debug.h,57 :: 		}
L_sendSensorStatus30:
L_sendSensorStatus29:
;debug.h,59 :: 		if( Sensor6 == 1){
	BTFSS       PORTD+0, 7 
	GOTO        L_sendSensorStatus31
;debug.h,60 :: 		debugText = "1";
	MOVLW       ?lstr13_Main_325.0V+0
	MOVWF       _debugText+0 
	MOVLW       hi_addr(?lstr13_Main_325.0V+0)
	MOVWF       _debugText+1 
;debug.h,61 :: 		UART1_Write_Text(debugText);
	MOVF        _debugText+0, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVF        _debugText+1, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;debug.h,62 :: 		}
	GOTO        L_sendSensorStatus32
L_sendSensorStatus31:
;debug.h,63 :: 		else if( Sensor6 == 0){
	BTFSC       PORTD+0, 7 
	GOTO        L_sendSensorStatus33
;debug.h,64 :: 		debugText = "0";
	MOVLW       ?lstr14_Main_325.0V+0
	MOVWF       _debugText+0 
	MOVLW       hi_addr(?lstr14_Main_325.0V+0)
	MOVWF       _debugText+1 
;debug.h,65 :: 		UART1_Write_Text(debugText);
	MOVF        _debugText+0, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVF        _debugText+1, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;debug.h,66 :: 		}
L_sendSensorStatus33:
L_sendSensorStatus32:
;debug.h,68 :: 		if( Sensor7 == 1){
	BTFSS       PORTB+0, 2 
	GOTO        L_sendSensorStatus34
;debug.h,69 :: 		debugText = "1";
	MOVLW       ?lstr15_Main_325.0V+0
	MOVWF       _debugText+0 
	MOVLW       hi_addr(?lstr15_Main_325.0V+0)
	MOVWF       _debugText+1 
;debug.h,70 :: 		UART1_Write_Text(debugText);
	MOVF        _debugText+0, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVF        _debugText+1, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;debug.h,71 :: 		}
	GOTO        L_sendSensorStatus35
L_sendSensorStatus34:
;debug.h,72 :: 		else if( Sensor7 == 0){
	BTFSC       PORTB+0, 2 
	GOTO        L_sendSensorStatus36
;debug.h,73 :: 		debugText = "0";
	MOVLW       ?lstr16_Main_325.0V+0
	MOVWF       _debugText+0 
	MOVLW       hi_addr(?lstr16_Main_325.0V+0)
	MOVWF       _debugText+1 
;debug.h,74 :: 		UART1_Write_Text(debugText);
	MOVF        _debugText+0, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVF        _debugText+1, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;debug.h,75 :: 		}
L_sendSensorStatus36:
L_sendSensorStatus35:
;debug.h,77 :: 		if( Sensor8 == 1){
	BTFSS       PORTB+0, 6 
	GOTO        L_sendSensorStatus37
;debug.h,78 :: 		debugText = "1";
	MOVLW       ?lstr17_Main_325.0V+0
	MOVWF       _debugText+0 
	MOVLW       hi_addr(?lstr17_Main_325.0V+0)
	MOVWF       _debugText+1 
;debug.h,79 :: 		UART1_Write_Text(debugText);
	MOVF        _debugText+0, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVF        _debugText+1, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;debug.h,80 :: 		}
	GOTO        L_sendSensorStatus38
L_sendSensorStatus37:
;debug.h,81 :: 		else if( Sensor8 == 0){
	BTFSC       PORTB+0, 6 
	GOTO        L_sendSensorStatus39
;debug.h,82 :: 		debugText = "0";
	MOVLW       ?lstr18_Main_325.0V+0
	MOVWF       _debugText+0 
	MOVLW       hi_addr(?lstr18_Main_325.0V+0)
	MOVWF       _debugText+1 
;debug.h,83 :: 		UART1_Write_Text(debugText);
	MOVF        _debugText+0, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVF        _debugText+1, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;debug.h,84 :: 		}
L_sendSensorStatus39:
L_sendSensorStatus38:
;debug.h,86 :: 		if( Sensor9 == 1){
	BTFSS       PORTB+0, 7 
	GOTO        L_sendSensorStatus40
;debug.h,87 :: 		debugText = "1";
	MOVLW       ?lstr19_Main_325.0V+0
	MOVWF       _debugText+0 
	MOVLW       hi_addr(?lstr19_Main_325.0V+0)
	MOVWF       _debugText+1 
;debug.h,88 :: 		UART1_Write_Text(debugText);
	MOVF        _debugText+0, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVF        _debugText+1, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;debug.h,89 :: 		}
	GOTO        L_sendSensorStatus41
L_sendSensorStatus40:
;debug.h,90 :: 		else if( Sensor9 == 0){
	BTFSC       PORTB+0, 7 
	GOTO        L_sendSensorStatus42
;debug.h,91 :: 		debugText = "0";
	MOVLW       ?lstr20_Main_325.0V+0
	MOVWF       _debugText+0 
	MOVLW       hi_addr(?lstr20_Main_325.0V+0)
	MOVWF       _debugText+1 
;debug.h,92 :: 		UART1_Write_Text(debugText);
	MOVF        _debugText+0, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVF        _debugText+1, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;debug.h,93 :: 		}
L_sendSensorStatus42:
L_sendSensorStatus41:
;debug.h,95 :: 		if( Scout == 1){
	BTFSS       PORTB+0, 5 
	GOTO        L_sendSensorStatus43
;debug.h,96 :: 		debugText = " 1; ";
	MOVLW       ?lstr21_Main_325.0V+0
	MOVWF       _debugText+0 
	MOVLW       hi_addr(?lstr21_Main_325.0V+0)
	MOVWF       _debugText+1 
;debug.h,97 :: 		UART1_Write_Text(debugText);
	MOVF        _debugText+0, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVF        _debugText+1, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;debug.h,98 :: 		}
	GOTO        L_sendSensorStatus44
L_sendSensorStatus43:
;debug.h,99 :: 		else if( Scout == 0){
	BTFSC       PORTB+0, 5 
	GOTO        L_sendSensorStatus45
;debug.h,100 :: 		debugText = " 0; ";
	MOVLW       ?lstr22_Main_325.0V+0
	MOVWF       _debugText+0 
	MOVLW       hi_addr(?lstr22_Main_325.0V+0)
	MOVWF       _debugText+1 
;debug.h,101 :: 		UART1_Write_Text(debugText);
	MOVF        _debugText+0, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVF        _debugText+1, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;debug.h,102 :: 		}
L_sendSensorStatus45:
L_sendSensorStatus44:
;debug.h,103 :: 		}
	RETURN      0
; end of _sendSensorStatus

_sendText:

;debug.h,105 :: 		void sendText(char* aText){
;debug.h,106 :: 		UART1_Write_Text(aText);
	MOVF        FARG_sendText_aText+0, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVF        FARG_sendText_aText+1, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;debug.h,107 :: 		}
	RETURN      0
; end of _sendText

_testPIC:

;debug.h,109 :: 		void testPIC(){
;debug.h,110 :: 		moveForward(200,200);
	MOVLW       200
	MOVWF       FARG_moveForward_pwmLeft+0 
	MOVLW       0
	MOVWF       FARG_moveForward_pwmLeft+1 
	MOVLW       200
	MOVWF       FARG_moveForward_pwmRight+0 
	MOVLW       0
	MOVWF       FARG_moveForward_pwmRight+1 
	CALL        _moveForward+0, 0
;debug.h,111 :: 		debugText = "move Forward  ";
	MOVLW       ?lstr23_Main_325.0V+0
	MOVWF       _debugText+0 
	MOVLW       hi_addr(?lstr23_Main_325.0V+0)
	MOVWF       _debugText+1 
;debug.h,112 :: 		UART1_Write_Text(debugText);
	MOVF        _debugText+0, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVF        _debugText+1, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;debug.h,113 :: 		delay_ms(5000);
	MOVLW       127
	MOVWF       R11, 0
	MOVLW       212
	MOVWF       R12, 0
	MOVLW       49
	MOVWF       R13, 0
L_testPIC46:
	DECFSZ      R13, 1, 0
	BRA         L_testPIC46
	DECFSZ      R12, 1, 0
	BRA         L_testPIC46
	DECFSZ      R11, 1, 0
	BRA         L_testPIC46
	NOP
	NOP
;debug.h,115 :: 		motorRight_foward(255);
	MOVLW       255
	MOVWF       FARG_motorRight_foward_pwm+0 
	MOVLW       0
	MOVWF       FARG_motorRight_foward_pwm+1 
	CALL        _motorRight_foward+0, 0
;debug.h,116 :: 		debugText = "turn Left";
	MOVLW       ?lstr24_Main_325.0V+0
	MOVWF       _debugText+0 
	MOVLW       hi_addr(?lstr24_Main_325.0V+0)
	MOVWF       _debugText+1 
;debug.h,117 :: 		UART1_Write_Text(debugText);
	MOVF        _debugText+0, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVF        _debugText+1, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;debug.h,118 :: 		motorLeft_stop();
	CALL        _motorLeft_stop+0, 0
;debug.h,119 :: 		delay_ms(5000);
	MOVLW       127
	MOVWF       R11, 0
	MOVLW       212
	MOVWF       R12, 0
	MOVLW       49
	MOVWF       R13, 0
L_testPIC47:
	DECFSZ      R13, 1, 0
	BRA         L_testPIC47
	DECFSZ      R12, 1, 0
	BRA         L_testPIC47
	DECFSZ      R11, 1, 0
	BRA         L_testPIC47
	NOP
	NOP
;debug.h,121 :: 		motorLeft_foward(255);
	MOVLW       255
	MOVWF       FARG_motorLeft_foward_pwm+0 
	MOVLW       0
	MOVWF       FARG_motorLeft_foward_pwm+1 
	CALL        _motorLeft_foward+0, 0
;debug.h,122 :: 		debugText = "turn Right";
	MOVLW       ?lstr25_Main_325.0V+0
	MOVWF       _debugText+0 
	MOVLW       hi_addr(?lstr25_Main_325.0V+0)
	MOVWF       _debugText+1 
;debug.h,123 :: 		UART1_Write_Text(debugText);
	MOVF        _debugText+0, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVF        _debugText+1, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;debug.h,124 :: 		motorRight_stop();
	CALL        _motorRight_stop+0, 0
;debug.h,125 :: 		delay_ms(5000);
	MOVLW       127
	MOVWF       R11, 0
	MOVLW       212
	MOVWF       R12, 0
	MOVLW       49
	MOVWF       R13, 0
L_testPIC48:
	DECFSZ      R13, 1, 0
	BRA         L_testPIC48
	DECFSZ      R12, 1, 0
	BRA         L_testPIC48
	DECFSZ      R11, 1, 0
	BRA         L_testPIC48
	NOP
	NOP
;debug.h,127 :: 		stop();
	CALL        _stop+0, 0
;debug.h,128 :: 		debugText = "Stopping..   ";
	MOVLW       ?lstr26_Main_325.0V+0
	MOVWF       _debugText+0 
	MOVLW       hi_addr(?lstr26_Main_325.0V+0)
	MOVWF       _debugText+1 
;debug.h,129 :: 		UART1_Write_Text(debugText);
	MOVF        _debugText+0, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVF        _debugText+1, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;debug.h,131 :: 		debugText = "Decrease PWM..   ";
	MOVLW       ?lstr27_Main_325.0V+0
	MOVWF       _debugText+0 
	MOVLW       hi_addr(?lstr27_Main_325.0V+0)
	MOVWF       _debugText+1 
;debug.h,132 :: 		UART1_Write_Text(debugText);
	MOVF        _debugText+0, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVF        _debugText+1, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;debug.h,134 :: 		for( count=255; count>0; count--){
	MOVLW       255
	MOVWF       _count+0 
	MOVLW       0
	MOVWF       _count+1 
L_testPIC49:
	MOVLW       128
	MOVWF       R0 
	MOVLW       128
	XORWF       _count+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__testPIC565
	MOVF        _count+0, 0 
	SUBLW       0
L__testPIC565:
	BTFSC       STATUS+0, 0 
	GOTO        L_testPIC50
;debug.h,135 :: 		moveForward(count,count);
	MOVF        _count+0, 0 
	MOVWF       FARG_moveForward_pwmLeft+0 
	MOVF        _count+1, 0 
	MOVWF       FARG_moveForward_pwmLeft+1 
	MOVF        _count+0, 0 
	MOVWF       FARG_moveForward_pwmRight+0 
	MOVF        _count+1, 0 
	MOVWF       FARG_moveForward_pwmRight+1 
	CALL        _moveForward+0, 0
;debug.h,136 :: 		delay_ms(100);
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       138
	MOVWF       R12, 0
	MOVLW       85
	MOVWF       R13, 0
L_testPIC52:
	DECFSZ      R13, 1, 0
	BRA         L_testPIC52
	DECFSZ      R12, 1, 0
	BRA         L_testPIC52
	DECFSZ      R11, 1, 0
	BRA         L_testPIC52
	NOP
	NOP
;debug.h,134 :: 		for( count=255; count>0; count--){
	MOVLW       1
	SUBWF       _count+0, 1 
	MOVLW       0
	SUBWFB      _count+1, 1 
;debug.h,139 :: 		}
	GOTO        L_testPIC49
L_testPIC50:
;debug.h,140 :: 		}
	RETURN      0
; end of _testPIC

_lineFollowNormalWorked:

;linefollow.h,18 :: 		void lineFollowNormalWorked(){
;linefollow.h,19 :: 		if(Scout == 1){
	BTFSS       PORTB+0, 5 
	GOTO        L_lineFollowNormalWorked53
;linefollow.h,21 :: 		if( Sensor3==0 && Sensor4==1 && Sensor5==1 && Sensor6==0 && Sensor7==0)
	BTFSC       PORTD+0, 4 
	GOTO        L_lineFollowNormalWorked56
	BTFSS       PORTD+0, 5 
	GOTO        L_lineFollowNormalWorked56
	BTFSS       PORTD+0, 6 
	GOTO        L_lineFollowNormalWorked56
	BTFSC       PORTD+0, 7 
	GOTO        L_lineFollowNormalWorked56
	BTFSC       PORTB+0, 2 
	GOTO        L_lineFollowNormalWorked56
L__lineFollowNormalWorked496:
;linefollow.h,22 :: 		moveForward(SLOW_PWM,FAST_PWM);
	MOVF        _SLOW_PWM+0, 0 
	MOVWF       FARG_moveForward_pwmLeft+0 
	MOVF        _SLOW_PWM+1, 0 
	MOVWF       FARG_moveForward_pwmLeft+1 
	MOVF        _FAST_PWM+0, 0 
	MOVWF       FARG_moveForward_pwmRight+0 
	MOVF        _FAST_PWM+1, 0 
	MOVWF       FARG_moveForward_pwmRight+1 
	CALL        _moveForward+0, 0
	GOTO        L_lineFollowNormalWorked57
L_lineFollowNormalWorked56:
;linefollow.h,23 :: 		else if( Sensor3==0 && Sensor4==1 && Sensor5==1 && Sensor6==1 && Sensor7==0)
	BTFSC       PORTD+0, 4 
	GOTO        L_lineFollowNormalWorked60
	BTFSS       PORTD+0, 5 
	GOTO        L_lineFollowNormalWorked60
	BTFSS       PORTD+0, 6 
	GOTO        L_lineFollowNormalWorked60
	BTFSS       PORTD+0, 7 
	GOTO        L_lineFollowNormalWorked60
	BTFSC       PORTB+0, 2 
	GOTO        L_lineFollowNormalWorked60
L__lineFollowNormalWorked495:
;linefollow.h,24 :: 		moveForward(FAST_PWM,FAST_PWM);
	MOVF        _FAST_PWM+0, 0 
	MOVWF       FARG_moveForward_pwmLeft+0 
	MOVF        _FAST_PWM+1, 0 
	MOVWF       FARG_moveForward_pwmLeft+1 
	MOVF        _FAST_PWM+0, 0 
	MOVWF       FARG_moveForward_pwmRight+0 
	MOVF        _FAST_PWM+1, 0 
	MOVWF       FARG_moveForward_pwmRight+1 
	CALL        _moveForward+0, 0
	GOTO        L_lineFollowNormalWorked61
L_lineFollowNormalWorked60:
;linefollow.h,25 :: 		else if( Sensor3==0 && Sensor4==0 && Sensor5==1 && Sensor6==0 && Sensor7==0)
	BTFSC       PORTD+0, 4 
	GOTO        L_lineFollowNormalWorked64
	BTFSC       PORTD+0, 5 
	GOTO        L_lineFollowNormalWorked64
	BTFSS       PORTD+0, 6 
	GOTO        L_lineFollowNormalWorked64
	BTFSC       PORTD+0, 7 
	GOTO        L_lineFollowNormalWorked64
	BTFSC       PORTB+0, 2 
	GOTO        L_lineFollowNormalWorked64
L__lineFollowNormalWorked494:
;linefollow.h,26 :: 		moveForward(FAST_PWM,FAST_PWM);
	MOVF        _FAST_PWM+0, 0 
	MOVWF       FARG_moveForward_pwmLeft+0 
	MOVF        _FAST_PWM+1, 0 
	MOVWF       FARG_moveForward_pwmLeft+1 
	MOVF        _FAST_PWM+0, 0 
	MOVWF       FARG_moveForward_pwmRight+0 
	MOVF        _FAST_PWM+1, 0 
	MOVWF       FARG_moveForward_pwmRight+1 
	CALL        _moveForward+0, 0
	GOTO        L_lineFollowNormalWorked65
L_lineFollowNormalWorked64:
;linefollow.h,27 :: 		else if( Sensor3==0 && Sensor4==0 && Sensor5==1 && Sensor6==1 && Sensor7==0)
	BTFSC       PORTD+0, 4 
	GOTO        L_lineFollowNormalWorked68
	BTFSC       PORTD+0, 5 
	GOTO        L_lineFollowNormalWorked68
	BTFSS       PORTD+0, 6 
	GOTO        L_lineFollowNormalWorked68
	BTFSS       PORTD+0, 7 
	GOTO        L_lineFollowNormalWorked68
	BTFSC       PORTB+0, 2 
	GOTO        L_lineFollowNormalWorked68
L__lineFollowNormalWorked493:
;linefollow.h,28 :: 		moveForward(FAST_PWM,SLOW_PWM);
	MOVF        _FAST_PWM+0, 0 
	MOVWF       FARG_moveForward_pwmLeft+0 
	MOVF        _FAST_PWM+1, 0 
	MOVWF       FARG_moveForward_pwmLeft+1 
	MOVF        _SLOW_PWM+0, 0 
	MOVWF       FARG_moveForward_pwmRight+0 
	MOVF        _SLOW_PWM+1, 0 
	MOVWF       FARG_moveForward_pwmRight+1 
	CALL        _moveForward+0, 0
	GOTO        L_lineFollowNormalWorked69
L_lineFollowNormalWorked68:
;linefollow.h,33 :: 		else if( Sensor3==1 && Sensor4==0 && Sensor5==0 && Sensor6==0 && Sensor7==0)
	BTFSS       PORTD+0, 4 
	GOTO        L_lineFollowNormalWorked72
	BTFSC       PORTD+0, 5 
	GOTO        L_lineFollowNormalWorked72
	BTFSC       PORTD+0, 6 
	GOTO        L_lineFollowNormalWorked72
	BTFSC       PORTD+0, 7 
	GOTO        L_lineFollowNormalWorked72
	BTFSC       PORTB+0, 2 
	GOTO        L_lineFollowNormalWorked72
L__lineFollowNormalWorked492:
;linefollow.h,35 :: 		turnLeft(FAST_PWM);
	MOVF        _FAST_PWM+0, 0 
	MOVWF       FARG_turnLeft_pwmRight+0 
	MOVF        _FAST_PWM+1, 0 
	MOVWF       FARG_turnLeft_pwmRight+1 
	CALL        _turnLeft+0, 0
	GOTO        L_lineFollowNormalWorked73
L_lineFollowNormalWorked72:
;linefollow.h,36 :: 		else if( Sensor3==1 && Sensor4==1 && Sensor5==0 && Sensor6==0 && Sensor7==0)
	BTFSS       PORTD+0, 4 
	GOTO        L_lineFollowNormalWorked76
	BTFSS       PORTD+0, 5 
	GOTO        L_lineFollowNormalWorked76
	BTFSC       PORTD+0, 6 
	GOTO        L_lineFollowNormalWorked76
	BTFSC       PORTD+0, 7 
	GOTO        L_lineFollowNormalWorked76
	BTFSC       PORTB+0, 2 
	GOTO        L_lineFollowNormalWorked76
L__lineFollowNormalWorked491:
;linefollow.h,38 :: 		turnLeft(FAST_PWM);
	MOVF        _FAST_PWM+0, 0 
	MOVWF       FARG_turnLeft_pwmRight+0 
	MOVF        _FAST_PWM+1, 0 
	MOVWF       FARG_turnLeft_pwmRight+1 
	CALL        _turnLeft+0, 0
	GOTO        L_lineFollowNormalWorked77
L_lineFollowNormalWorked76:
;linefollow.h,39 :: 		else if( Sensor3==1 && Sensor4==1 && Sensor5==1 && Sensor6==0 && Sensor7==0)
	BTFSS       PORTD+0, 4 
	GOTO        L_lineFollowNormalWorked80
	BTFSS       PORTD+0, 5 
	GOTO        L_lineFollowNormalWorked80
	BTFSS       PORTD+0, 6 
	GOTO        L_lineFollowNormalWorked80
	BTFSC       PORTD+0, 7 
	GOTO        L_lineFollowNormalWorked80
	BTFSC       PORTB+0, 2 
	GOTO        L_lineFollowNormalWorked80
L__lineFollowNormalWorked490:
;linefollow.h,41 :: 		turnLeft(FAST_PWM);
	MOVF        _FAST_PWM+0, 0 
	MOVWF       FARG_turnLeft_pwmRight+0 
	MOVF        _FAST_PWM+1, 0 
	MOVWF       FARG_turnLeft_pwmRight+1 
	CALL        _turnLeft+0, 0
	GOTO        L_lineFollowNormalWorked81
L_lineFollowNormalWorked80:
;linefollow.h,42 :: 		else if( Sensor3==0 && Sensor4==1 && Sensor5==0 && Sensor6==0 && Sensor7==0)
	BTFSC       PORTD+0, 4 
	GOTO        L_lineFollowNormalWorked84
	BTFSS       PORTD+0, 5 
	GOTO        L_lineFollowNormalWorked84
	BTFSC       PORTD+0, 6 
	GOTO        L_lineFollowNormalWorked84
	BTFSC       PORTD+0, 7 
	GOTO        L_lineFollowNormalWorked84
	BTFSC       PORTB+0, 2 
	GOTO        L_lineFollowNormalWorked84
L__lineFollowNormalWorked489:
;linefollow.h,44 :: 		turnLeft(FAST_PWM);
	MOVF        _FAST_PWM+0, 0 
	MOVWF       FARG_turnLeft_pwmRight+0 
	MOVF        _FAST_PWM+1, 0 
	MOVWF       FARG_turnLeft_pwmRight+1 
	CALL        _turnLeft+0, 0
	GOTO        L_lineFollowNormalWorked85
L_lineFollowNormalWorked84:
;linefollow.h,47 :: 		else if( Sensor3==0 && Sensor4==0 && Sensor5==0 && Sensor6==1 && Sensor7==0)
	BTFSC       PORTD+0, 4 
	GOTO        L_lineFollowNormalWorked88
	BTFSC       PORTD+0, 5 
	GOTO        L_lineFollowNormalWorked88
	BTFSC       PORTD+0, 6 
	GOTO        L_lineFollowNormalWorked88
	BTFSS       PORTD+0, 7 
	GOTO        L_lineFollowNormalWorked88
	BTFSC       PORTB+0, 2 
	GOTO        L_lineFollowNormalWorked88
L__lineFollowNormalWorked488:
;linefollow.h,49 :: 		turnRight(FAST_PWM);
	MOVF        _FAST_PWM+0, 0 
	MOVWF       FARG_turnRight_pwmLeft+0 
	MOVF        _FAST_PWM+1, 0 
	MOVWF       FARG_turnRight_pwmLeft+1 
	CALL        _turnRight+0, 0
	GOTO        L_lineFollowNormalWorked89
L_lineFollowNormalWorked88:
;linefollow.h,50 :: 		else if( Sensor3==0 && Sensor4==0 && Sensor5==1 && Sensor6==1 && Sensor7==1)
	BTFSC       PORTD+0, 4 
	GOTO        L_lineFollowNormalWorked92
	BTFSC       PORTD+0, 5 
	GOTO        L_lineFollowNormalWorked92
	BTFSS       PORTD+0, 6 
	GOTO        L_lineFollowNormalWorked92
	BTFSS       PORTD+0, 7 
	GOTO        L_lineFollowNormalWorked92
	BTFSS       PORTB+0, 2 
	GOTO        L_lineFollowNormalWorked92
L__lineFollowNormalWorked487:
;linefollow.h,52 :: 		turnRight(FAST_PWM);
	MOVF        _FAST_PWM+0, 0 
	MOVWF       FARG_turnRight_pwmLeft+0 
	MOVF        _FAST_PWM+1, 0 
	MOVWF       FARG_turnRight_pwmLeft+1 
	CALL        _turnRight+0, 0
	GOTO        L_lineFollowNormalWorked93
L_lineFollowNormalWorked92:
;linefollow.h,53 :: 		else if( Sensor3==0 && Sensor4==0 && Sensor5==0 && Sensor6==1 && Sensor7==1)
	BTFSC       PORTD+0, 4 
	GOTO        L_lineFollowNormalWorked96
	BTFSC       PORTD+0, 5 
	GOTO        L_lineFollowNormalWorked96
	BTFSC       PORTD+0, 6 
	GOTO        L_lineFollowNormalWorked96
	BTFSS       PORTD+0, 7 
	GOTO        L_lineFollowNormalWorked96
	BTFSS       PORTB+0, 2 
	GOTO        L_lineFollowNormalWorked96
L__lineFollowNormalWorked486:
;linefollow.h,55 :: 		turnRight(FAST_PWM);
	MOVF        _FAST_PWM+0, 0 
	MOVWF       FARG_turnRight_pwmLeft+0 
	MOVF        _FAST_PWM+1, 0 
	MOVWF       FARG_turnRight_pwmLeft+1 
	CALL        _turnRight+0, 0
	GOTO        L_lineFollowNormalWorked97
L_lineFollowNormalWorked96:
;linefollow.h,56 :: 		else if( Sensor3==0 && Sensor4==0 && Sensor5==0 && Sensor6==0 && Sensor7==1)
	BTFSC       PORTD+0, 4 
	GOTO        L_lineFollowNormalWorked100
	BTFSC       PORTD+0, 5 
	GOTO        L_lineFollowNormalWorked100
	BTFSC       PORTD+0, 6 
	GOTO        L_lineFollowNormalWorked100
	BTFSC       PORTD+0, 7 
	GOTO        L_lineFollowNormalWorked100
	BTFSS       PORTB+0, 2 
	GOTO        L_lineFollowNormalWorked100
L__lineFollowNormalWorked485:
;linefollow.h,58 :: 		turnRight(FAST_PWM);
	MOVF        _FAST_PWM+0, 0 
	MOVWF       FARG_turnRight_pwmLeft+0 
	MOVF        _FAST_PWM+1, 0 
	MOVWF       FARG_turnRight_pwmLeft+1 
	CALL        _turnRight+0, 0
	GOTO        L_lineFollowNormalWorked101
L_lineFollowNormalWorked100:
;linefollow.h,61 :: 		else if( Sensor3==1 && Sensor4==1 && Sensor5==1 && Sensor6==1 && Sensor7==0)
	BTFSS       PORTD+0, 4 
	GOTO        L_lineFollowNormalWorked104
	BTFSS       PORTD+0, 5 
	GOTO        L_lineFollowNormalWorked104
	BTFSS       PORTD+0, 6 
	GOTO        L_lineFollowNormalWorked104
	BTFSS       PORTD+0, 7 
	GOTO        L_lineFollowNormalWorked104
	BTFSC       PORTB+0, 2 
	GOTO        L_lineFollowNormalWorked104
L__lineFollowNormalWorked484:
;linefollow.h,62 :: 		moveForward(FAST_PWM,FAST_PWM);
	MOVF        _FAST_PWM+0, 0 
	MOVWF       FARG_moveForward_pwmLeft+0 
	MOVF        _FAST_PWM+1, 0 
	MOVWF       FARG_moveForward_pwmLeft+1 
	MOVF        _FAST_PWM+0, 0 
	MOVWF       FARG_moveForward_pwmRight+0 
	MOVF        _FAST_PWM+1, 0 
	MOVWF       FARG_moveForward_pwmRight+1 
	CALL        _moveForward+0, 0
	GOTO        L_lineFollowNormalWorked105
L_lineFollowNormalWorked104:
;linefollow.h,63 :: 		else if( Sensor3==0 && Sensor4==1 && Sensor5==1 && Sensor6==1 && Sensor7==1)
	BTFSC       PORTD+0, 4 
	GOTO        L_lineFollowNormalWorked108
	BTFSS       PORTD+0, 5 
	GOTO        L_lineFollowNormalWorked108
	BTFSS       PORTD+0, 6 
	GOTO        L_lineFollowNormalWorked108
	BTFSS       PORTD+0, 7 
	GOTO        L_lineFollowNormalWorked108
	BTFSS       PORTB+0, 2 
	GOTO        L_lineFollowNormalWorked108
L__lineFollowNormalWorked483:
;linefollow.h,64 :: 		moveForward(FAST_PWM,FAST_PWM);
	MOVF        _FAST_PWM+0, 0 
	MOVWF       FARG_moveForward_pwmLeft+0 
	MOVF        _FAST_PWM+1, 0 
	MOVWF       FARG_moveForward_pwmLeft+1 
	MOVF        _FAST_PWM+0, 0 
	MOVWF       FARG_moveForward_pwmRight+0 
	MOVF        _FAST_PWM+1, 0 
	MOVWF       FARG_moveForward_pwmRight+1 
	CALL        _moveForward+0, 0
	GOTO        L_lineFollowNormalWorked109
L_lineFollowNormalWorked108:
;linefollow.h,66 :: 		else if(isAllBlack()){
	CALL        _isAllBlack+0, 0
	MOVF        R0, 0 
	IORWF       R1, 0 
	BTFSC       STATUS+0, 2 
	GOTO        L_lineFollowNormalWorked110
;linefollow.h,69 :: 		sendSensorStatus();
	CALL        _sendSensorStatus+0, 0
;linefollow.h,70 :: 		}
	GOTO        L_lineFollowNormalWorked111
L_lineFollowNormalWorked110:
;linefollow.h,72 :: 		stop();
	CALL        _stop+0, 0
;linefollow.h,73 :: 		sendSensorStatus();
	CALL        _sendSensorStatus+0, 0
;linefollow.h,75 :: 		}
L_lineFollowNormalWorked111:
L_lineFollowNormalWorked109:
L_lineFollowNormalWorked105:
L_lineFollowNormalWorked101:
L_lineFollowNormalWorked97:
L_lineFollowNormalWorked93:
L_lineFollowNormalWorked89:
L_lineFollowNormalWorked85:
L_lineFollowNormalWorked81:
L_lineFollowNormalWorked77:
L_lineFollowNormalWorked73:
L_lineFollowNormalWorked69:
L_lineFollowNormalWorked65:
L_lineFollowNormalWorked61:
L_lineFollowNormalWorked57:
;linefollow.h,76 :: 		}
	GOTO        L_lineFollowNormalWorked112
L_lineFollowNormalWorked53:
;linefollow.h,83 :: 		if( Sensor1==1 && Sensor2==1 && Sensor3==1 && Sensor4==1 && Sensor5==1 && Sensor6==0 && Sensor7==0 && Sensor8==0 && Sensor9==0)
	BTFSS       PORTB+0, 4 
	GOTO        L_lineFollowNormalWorked115
	BTFSS       PORTB+0, 3 
	GOTO        L_lineFollowNormalWorked115
	BTFSS       PORTD+0, 4 
	GOTO        L_lineFollowNormalWorked115
	BTFSS       PORTD+0, 5 
	GOTO        L_lineFollowNormalWorked115
	BTFSS       PORTD+0, 6 
	GOTO        L_lineFollowNormalWorked115
	BTFSC       PORTD+0, 7 
	GOTO        L_lineFollowNormalWorked115
	BTFSC       PORTB+0, 2 
	GOTO        L_lineFollowNormalWorked115
	BTFSC       PORTB+0, 6 
	GOTO        L_lineFollowNormalWorked115
	BTFSC       PORTB+0, 7 
	GOTO        L_lineFollowNormalWorked115
L__lineFollowNormalWorked482:
;linefollow.h,84 :: 		rotateByDegree(-90);
	MOVLW       166
	MOVWF       FARG_rotateByDegree_degree+0 
	MOVLW       255
	MOVWF       FARG_rotateByDegree_degree+1 
	CALL        _rotateByDegree+0, 0
	GOTO        L_lineFollowNormalWorked116
L_lineFollowNormalWorked115:
;linefollow.h,85 :: 		else if( Sensor1==1 && Sensor2==1 && Sensor3==1 && Sensor4==1 && Sensor5==1 && Sensor6==1 && Sensor7==0 && Sensor8==0 && Sensor9==0)
	BTFSS       PORTB+0, 4 
	GOTO        L_lineFollowNormalWorked119
	BTFSS       PORTB+0, 3 
	GOTO        L_lineFollowNormalWorked119
	BTFSS       PORTD+0, 4 
	GOTO        L_lineFollowNormalWorked119
	BTFSS       PORTD+0, 5 
	GOTO        L_lineFollowNormalWorked119
	BTFSS       PORTD+0, 6 
	GOTO        L_lineFollowNormalWorked119
	BTFSS       PORTD+0, 7 
	GOTO        L_lineFollowNormalWorked119
	BTFSC       PORTB+0, 2 
	GOTO        L_lineFollowNormalWorked119
	BTFSC       PORTB+0, 6 
	GOTO        L_lineFollowNormalWorked119
	BTFSC       PORTB+0, 7 
	GOTO        L_lineFollowNormalWorked119
L__lineFollowNormalWorked481:
;linefollow.h,86 :: 		rotateByDegree(-90);
	MOVLW       166
	MOVWF       FARG_rotateByDegree_degree+0 
	MOVLW       255
	MOVWF       FARG_rotateByDegree_degree+1 
	CALL        _rotateByDegree+0, 0
	GOTO        L_lineFollowNormalWorked120
L_lineFollowNormalWorked119:
;linefollow.h,87 :: 		else if( Sensor1==1 && Sensor2==1 && Sensor3==1 && Sensor4==1 && Sensor5==1 && Sensor6==1 && Sensor7==1 && Sensor8==0 && Sensor9==0)
	BTFSS       PORTB+0, 4 
	GOTO        L_lineFollowNormalWorked123
	BTFSS       PORTB+0, 3 
	GOTO        L_lineFollowNormalWorked123
	BTFSS       PORTD+0, 4 
	GOTO        L_lineFollowNormalWorked123
	BTFSS       PORTD+0, 5 
	GOTO        L_lineFollowNormalWorked123
	BTFSS       PORTD+0, 6 
	GOTO        L_lineFollowNormalWorked123
	BTFSS       PORTD+0, 7 
	GOTO        L_lineFollowNormalWorked123
	BTFSS       PORTB+0, 2 
	GOTO        L_lineFollowNormalWorked123
	BTFSC       PORTB+0, 6 
	GOTO        L_lineFollowNormalWorked123
	BTFSC       PORTB+0, 7 
	GOTO        L_lineFollowNormalWorked123
L__lineFollowNormalWorked480:
;linefollow.h,88 :: 		rotateByDegree(-90);
	MOVLW       166
	MOVWF       FARG_rotateByDegree_degree+0 
	MOVLW       255
	MOVWF       FARG_rotateByDegree_degree+1 
	CALL        _rotateByDegree+0, 0
	GOTO        L_lineFollowNormalWorked124
L_lineFollowNormalWorked123:
;linefollow.h,91 :: 		else if( Sensor1==0 && Sensor2==0 && Sensor3==1 && Sensor4==1 && Sensor5==1 && Sensor6==1 && Sensor7==1 && Sensor8==1 && Sensor9==1)
	BTFSC       PORTB+0, 4 
	GOTO        L_lineFollowNormalWorked127
	BTFSC       PORTB+0, 3 
	GOTO        L_lineFollowNormalWorked127
	BTFSS       PORTD+0, 4 
	GOTO        L_lineFollowNormalWorked127
	BTFSS       PORTD+0, 5 
	GOTO        L_lineFollowNormalWorked127
	BTFSS       PORTD+0, 6 
	GOTO        L_lineFollowNormalWorked127
	BTFSS       PORTD+0, 7 
	GOTO        L_lineFollowNormalWorked127
	BTFSS       PORTB+0, 2 
	GOTO        L_lineFollowNormalWorked127
	BTFSS       PORTB+0, 6 
	GOTO        L_lineFollowNormalWorked127
	BTFSS       PORTB+0, 7 
	GOTO        L_lineFollowNormalWorked127
L__lineFollowNormalWorked479:
;linefollow.h,92 :: 		rotateByDegree(90);
	MOVLW       90
	MOVWF       FARG_rotateByDegree_degree+0 
	MOVLW       0
	MOVWF       FARG_rotateByDegree_degree+1 
	CALL        _rotateByDegree+0, 0
	GOTO        L_lineFollowNormalWorked128
L_lineFollowNormalWorked127:
;linefollow.h,93 :: 		else if( Sensor1==0 && Sensor2==0 && Sensor3==0 && Sensor4==1 && Sensor5==1 && Sensor6==1 && Sensor7==1 && Sensor8==1 && Sensor9==1)
	BTFSC       PORTB+0, 4 
	GOTO        L_lineFollowNormalWorked131
	BTFSC       PORTB+0, 3 
	GOTO        L_lineFollowNormalWorked131
	BTFSC       PORTD+0, 4 
	GOTO        L_lineFollowNormalWorked131
	BTFSS       PORTD+0, 5 
	GOTO        L_lineFollowNormalWorked131
	BTFSS       PORTD+0, 6 
	GOTO        L_lineFollowNormalWorked131
	BTFSS       PORTD+0, 7 
	GOTO        L_lineFollowNormalWorked131
	BTFSS       PORTB+0, 2 
	GOTO        L_lineFollowNormalWorked131
	BTFSS       PORTB+0, 6 
	GOTO        L_lineFollowNormalWorked131
	BTFSS       PORTB+0, 7 
	GOTO        L_lineFollowNormalWorked131
L__lineFollowNormalWorked478:
;linefollow.h,94 :: 		rotateByDegree(90);
	MOVLW       90
	MOVWF       FARG_rotateByDegree_degree+0 
	MOVLW       0
	MOVWF       FARG_rotateByDegree_degree+1 
	CALL        _rotateByDegree+0, 0
	GOTO        L_lineFollowNormalWorked132
L_lineFollowNormalWorked131:
;linefollow.h,95 :: 		else if( Sensor1==0 && Sensor2==0 && Sensor3==0 && Sensor4==0 && Sensor5==1 && Sensor6==1 && Sensor7==1 && Sensor8==1 && Sensor9==1)
	BTFSC       PORTB+0, 4 
	GOTO        L_lineFollowNormalWorked135
	BTFSC       PORTB+0, 3 
	GOTO        L_lineFollowNormalWorked135
	BTFSC       PORTD+0, 4 
	GOTO        L_lineFollowNormalWorked135
	BTFSC       PORTD+0, 5 
	GOTO        L_lineFollowNormalWorked135
	BTFSS       PORTD+0, 6 
	GOTO        L_lineFollowNormalWorked135
	BTFSS       PORTD+0, 7 
	GOTO        L_lineFollowNormalWorked135
	BTFSS       PORTB+0, 2 
	GOTO        L_lineFollowNormalWorked135
	BTFSS       PORTB+0, 6 
	GOTO        L_lineFollowNormalWorked135
	BTFSS       PORTB+0, 7 
	GOTO        L_lineFollowNormalWorked135
L__lineFollowNormalWorked477:
;linefollow.h,96 :: 		rotateByDegree(90);
	MOVLW       90
	MOVWF       FARG_rotateByDegree_degree+0 
	MOVLW       0
	MOVWF       FARG_rotateByDegree_degree+1 
	CALL        _rotateByDegree+0, 0
	GOTO        L_lineFollowNormalWorked136
L_lineFollowNormalWorked135:
;linefollow.h,101 :: 		else if( Sensor3==1 && Sensor4==0 && Sensor5==0 && Sensor6==0 && Sensor7==0)
	BTFSS       PORTD+0, 4 
	GOTO        L_lineFollowNormalWorked139
	BTFSC       PORTD+0, 5 
	GOTO        L_lineFollowNormalWorked139
	BTFSC       PORTD+0, 6 
	GOTO        L_lineFollowNormalWorked139
	BTFSC       PORTD+0, 7 
	GOTO        L_lineFollowNormalWorked139
	BTFSC       PORTB+0, 2 
	GOTO        L_lineFollowNormalWorked139
L__lineFollowNormalWorked476:
;linefollow.h,103 :: 		turnLeft(FAST_PWM);
	MOVF        _FAST_PWM+0, 0 
	MOVWF       FARG_turnLeft_pwmRight+0 
	MOVF        _FAST_PWM+1, 0 
	MOVWF       FARG_turnLeft_pwmRight+1 
	CALL        _turnLeft+0, 0
	GOTO        L_lineFollowNormalWorked140
L_lineFollowNormalWorked139:
;linefollow.h,104 :: 		else if( Sensor3==1 && Sensor4==1 && Sensor5==0 && Sensor6==0 && Sensor7==0)
	BTFSS       PORTD+0, 4 
	GOTO        L_lineFollowNormalWorked143
	BTFSS       PORTD+0, 5 
	GOTO        L_lineFollowNormalWorked143
	BTFSC       PORTD+0, 6 
	GOTO        L_lineFollowNormalWorked143
	BTFSC       PORTD+0, 7 
	GOTO        L_lineFollowNormalWorked143
	BTFSC       PORTB+0, 2 
	GOTO        L_lineFollowNormalWorked143
L__lineFollowNormalWorked475:
;linefollow.h,106 :: 		turnLeft(FAST_PWM);
	MOVF        _FAST_PWM+0, 0 
	MOVWF       FARG_turnLeft_pwmRight+0 
	MOVF        _FAST_PWM+1, 0 
	MOVWF       FARG_turnLeft_pwmRight+1 
	CALL        _turnLeft+0, 0
	GOTO        L_lineFollowNormalWorked144
L_lineFollowNormalWorked143:
;linefollow.h,107 :: 		else if( Sensor3==1 && Sensor4==1 && Sensor5==1 && Sensor6==0 && Sensor7==0)
	BTFSS       PORTD+0, 4 
	GOTO        L_lineFollowNormalWorked147
	BTFSS       PORTD+0, 5 
	GOTO        L_lineFollowNormalWorked147
	BTFSS       PORTD+0, 6 
	GOTO        L_lineFollowNormalWorked147
	BTFSC       PORTD+0, 7 
	GOTO        L_lineFollowNormalWorked147
	BTFSC       PORTB+0, 2 
	GOTO        L_lineFollowNormalWorked147
L__lineFollowNormalWorked474:
;linefollow.h,109 :: 		turnLeft(FAST_PWM);
	MOVF        _FAST_PWM+0, 0 
	MOVWF       FARG_turnLeft_pwmRight+0 
	MOVF        _FAST_PWM+1, 0 
	MOVWF       FARG_turnLeft_pwmRight+1 
	CALL        _turnLeft+0, 0
	GOTO        L_lineFollowNormalWorked148
L_lineFollowNormalWorked147:
;linefollow.h,110 :: 		else if( Sensor3==0 && Sensor4==1 && Sensor5==0 && Sensor6==0 && Sensor7==0)
	BTFSC       PORTD+0, 4 
	GOTO        L_lineFollowNormalWorked151
	BTFSS       PORTD+0, 5 
	GOTO        L_lineFollowNormalWorked151
	BTFSC       PORTD+0, 6 
	GOTO        L_lineFollowNormalWorked151
	BTFSC       PORTD+0, 7 
	GOTO        L_lineFollowNormalWorked151
	BTFSC       PORTB+0, 2 
	GOTO        L_lineFollowNormalWorked151
L__lineFollowNormalWorked473:
;linefollow.h,112 :: 		turnLeft(FAST_PWM);
	MOVF        _FAST_PWM+0, 0 
	MOVWF       FARG_turnLeft_pwmRight+0 
	MOVF        _FAST_PWM+1, 0 
	MOVWF       FARG_turnLeft_pwmRight+1 
	CALL        _turnLeft+0, 0
	GOTO        L_lineFollowNormalWorked152
L_lineFollowNormalWorked151:
;linefollow.h,115 :: 		else if( Sensor3==0 && Sensor4==0 && Sensor5==0 && Sensor6==1 && Sensor7==0)
	BTFSC       PORTD+0, 4 
	GOTO        L_lineFollowNormalWorked155
	BTFSC       PORTD+0, 5 
	GOTO        L_lineFollowNormalWorked155
	BTFSC       PORTD+0, 6 
	GOTO        L_lineFollowNormalWorked155
	BTFSS       PORTD+0, 7 
	GOTO        L_lineFollowNormalWorked155
	BTFSC       PORTB+0, 2 
	GOTO        L_lineFollowNormalWorked155
L__lineFollowNormalWorked472:
;linefollow.h,117 :: 		turnRight(FAST_PWM);
	MOVF        _FAST_PWM+0, 0 
	MOVWF       FARG_turnRight_pwmLeft+0 
	MOVF        _FAST_PWM+1, 0 
	MOVWF       FARG_turnRight_pwmLeft+1 
	CALL        _turnRight+0, 0
	GOTO        L_lineFollowNormalWorked156
L_lineFollowNormalWorked155:
;linefollow.h,118 :: 		else if( Sensor3==0 && Sensor4==0 && Sensor5==1 && Sensor6==1 && Sensor7==1)
	BTFSC       PORTD+0, 4 
	GOTO        L_lineFollowNormalWorked159
	BTFSC       PORTD+0, 5 
	GOTO        L_lineFollowNormalWorked159
	BTFSS       PORTD+0, 6 
	GOTO        L_lineFollowNormalWorked159
	BTFSS       PORTD+0, 7 
	GOTO        L_lineFollowNormalWorked159
	BTFSS       PORTB+0, 2 
	GOTO        L_lineFollowNormalWorked159
L__lineFollowNormalWorked471:
;linefollow.h,120 :: 		turnRight(FAST_PWM);
	MOVF        _FAST_PWM+0, 0 
	MOVWF       FARG_turnRight_pwmLeft+0 
	MOVF        _FAST_PWM+1, 0 
	MOVWF       FARG_turnRight_pwmLeft+1 
	CALL        _turnRight+0, 0
	GOTO        L_lineFollowNormalWorked160
L_lineFollowNormalWorked159:
;linefollow.h,121 :: 		else if( Sensor3==0 && Sensor4==0 && Sensor5==0 && Sensor6==1 && Sensor7==1)
	BTFSC       PORTD+0, 4 
	GOTO        L_lineFollowNormalWorked163
	BTFSC       PORTD+0, 5 
	GOTO        L_lineFollowNormalWorked163
	BTFSC       PORTD+0, 6 
	GOTO        L_lineFollowNormalWorked163
	BTFSS       PORTD+0, 7 
	GOTO        L_lineFollowNormalWorked163
	BTFSS       PORTB+0, 2 
	GOTO        L_lineFollowNormalWorked163
L__lineFollowNormalWorked470:
;linefollow.h,123 :: 		turnRight(FAST_PWM);
	MOVF        _FAST_PWM+0, 0 
	MOVWF       FARG_turnRight_pwmLeft+0 
	MOVF        _FAST_PWM+1, 0 
	MOVWF       FARG_turnRight_pwmLeft+1 
	CALL        _turnRight+0, 0
	GOTO        L_lineFollowNormalWorked164
L_lineFollowNormalWorked163:
;linefollow.h,124 :: 		else if( Sensor3==0 && Sensor4==0 && Sensor5==0 && Sensor6==0 && Sensor7==1)
	BTFSC       PORTD+0, 4 
	GOTO        L_lineFollowNormalWorked167
	BTFSC       PORTD+0, 5 
	GOTO        L_lineFollowNormalWorked167
	BTFSC       PORTD+0, 6 
	GOTO        L_lineFollowNormalWorked167
	BTFSC       PORTD+0, 7 
	GOTO        L_lineFollowNormalWorked167
	BTFSS       PORTB+0, 2 
	GOTO        L_lineFollowNormalWorked167
L__lineFollowNormalWorked469:
;linefollow.h,126 :: 		turnRight(FAST_PWM);
	MOVF        _FAST_PWM+0, 0 
	MOVWF       FARG_turnRight_pwmLeft+0 
	MOVF        _FAST_PWM+1, 0 
	MOVWF       FARG_turnRight_pwmLeft+1 
	CALL        _turnRight+0, 0
	GOTO        L_lineFollowNormalWorked168
L_lineFollowNormalWorked167:
;linefollow.h,129 :: 		else if( Sensor3==1 && Sensor4==1 && Sensor5==1 && Sensor6==1 && Sensor7==0)
	BTFSS       PORTD+0, 4 
	GOTO        L_lineFollowNormalWorked171
	BTFSS       PORTD+0, 5 
	GOTO        L_lineFollowNormalWorked171
	BTFSS       PORTD+0, 6 
	GOTO        L_lineFollowNormalWorked171
	BTFSS       PORTD+0, 7 
	GOTO        L_lineFollowNormalWorked171
	BTFSC       PORTB+0, 2 
	GOTO        L_lineFollowNormalWorked171
L__lineFollowNormalWorked468:
;linefollow.h,130 :: 		moveForward(SLOW_PWM,FAST_PWM);
	MOVF        _SLOW_PWM+0, 0 
	MOVWF       FARG_moveForward_pwmLeft+0 
	MOVF        _SLOW_PWM+1, 0 
	MOVWF       FARG_moveForward_pwmLeft+1 
	MOVF        _FAST_PWM+0, 0 
	MOVWF       FARG_moveForward_pwmRight+0 
	MOVF        _FAST_PWM+1, 0 
	MOVWF       FARG_moveForward_pwmRight+1 
	CALL        _moveForward+0, 0
	GOTO        L_lineFollowNormalWorked172
L_lineFollowNormalWorked171:
;linefollow.h,131 :: 		else if( Sensor3==0 && Sensor4==1 && Sensor5==1 && Sensor6==1 && Sensor7==1)
	BTFSC       PORTD+0, 4 
	GOTO        L_lineFollowNormalWorked175
	BTFSS       PORTD+0, 5 
	GOTO        L_lineFollowNormalWorked175
	BTFSS       PORTD+0, 6 
	GOTO        L_lineFollowNormalWorked175
	BTFSS       PORTD+0, 7 
	GOTO        L_lineFollowNormalWorked175
	BTFSS       PORTB+0, 2 
	GOTO        L_lineFollowNormalWorked175
L__lineFollowNormalWorked467:
;linefollow.h,132 :: 		moveForward(FAST_PWM,SLOW_PWM);
	MOVF        _FAST_PWM+0, 0 
	MOVWF       FARG_moveForward_pwmLeft+0 
	MOVF        _FAST_PWM+1, 0 
	MOVWF       FARG_moveForward_pwmLeft+1 
	MOVF        _SLOW_PWM+0, 0 
	MOVWF       FARG_moveForward_pwmRight+0 
	MOVF        _SLOW_PWM+1, 0 
	MOVWF       FARG_moveForward_pwmRight+1 
	CALL        _moveForward+0, 0
	GOTO        L_lineFollowNormalWorked176
L_lineFollowNormalWorked175:
;linefollow.h,135 :: 		else if( Sensor3==0 && Sensor4==1 && Sensor5==1 && Sensor6==0 && Sensor7==0)
	BTFSC       PORTD+0, 4 
	GOTO        L_lineFollowNormalWorked179
	BTFSS       PORTD+0, 5 
	GOTO        L_lineFollowNormalWorked179
	BTFSS       PORTD+0, 6 
	GOTO        L_lineFollowNormalWorked179
	BTFSC       PORTD+0, 7 
	GOTO        L_lineFollowNormalWorked179
	BTFSC       PORTB+0, 2 
	GOTO        L_lineFollowNormalWorked179
L__lineFollowNormalWorked466:
;linefollow.h,136 :: 		moveForward(SLOW_PWM,FAST_PWM);
	MOVF        _SLOW_PWM+0, 0 
	MOVWF       FARG_moveForward_pwmLeft+0 
	MOVF        _SLOW_PWM+1, 0 
	MOVWF       FARG_moveForward_pwmLeft+1 
	MOVF        _FAST_PWM+0, 0 
	MOVWF       FARG_moveForward_pwmRight+0 
	MOVF        _FAST_PWM+1, 0 
	MOVWF       FARG_moveForward_pwmRight+1 
	CALL        _moveForward+0, 0
	GOTO        L_lineFollowNormalWorked180
L_lineFollowNormalWorked179:
;linefollow.h,137 :: 		else if( Sensor3==0 && Sensor4==1 && Sensor5==1 && Sensor6==1 && Sensor7==0)
	BTFSC       PORTD+0, 4 
	GOTO        L_lineFollowNormalWorked183
	BTFSS       PORTD+0, 5 
	GOTO        L_lineFollowNormalWorked183
	BTFSS       PORTD+0, 6 
	GOTO        L_lineFollowNormalWorked183
	BTFSS       PORTD+0, 7 
	GOTO        L_lineFollowNormalWorked183
	BTFSC       PORTB+0, 2 
	GOTO        L_lineFollowNormalWorked183
L__lineFollowNormalWorked465:
;linefollow.h,138 :: 		moveForward(FAST_PWM,FAST_PWM);
	MOVF        _FAST_PWM+0, 0 
	MOVWF       FARG_moveForward_pwmLeft+0 
	MOVF        _FAST_PWM+1, 0 
	MOVWF       FARG_moveForward_pwmLeft+1 
	MOVF        _FAST_PWM+0, 0 
	MOVWF       FARG_moveForward_pwmRight+0 
	MOVF        _FAST_PWM+1, 0 
	MOVWF       FARG_moveForward_pwmRight+1 
	CALL        _moveForward+0, 0
	GOTO        L_lineFollowNormalWorked184
L_lineFollowNormalWorked183:
;linefollow.h,139 :: 		else if( Sensor3==0 && Sensor4==0 && Sensor5==1 && Sensor6==0 && Sensor7==0)
	BTFSC       PORTD+0, 4 
	GOTO        L_lineFollowNormalWorked187
	BTFSC       PORTD+0, 5 
	GOTO        L_lineFollowNormalWorked187
	BTFSS       PORTD+0, 6 
	GOTO        L_lineFollowNormalWorked187
	BTFSC       PORTD+0, 7 
	GOTO        L_lineFollowNormalWorked187
	BTFSC       PORTB+0, 2 
	GOTO        L_lineFollowNormalWorked187
L__lineFollowNormalWorked464:
;linefollow.h,140 :: 		moveForward(FAST_PWM,FAST_PWM);
	MOVF        _FAST_PWM+0, 0 
	MOVWF       FARG_moveForward_pwmLeft+0 
	MOVF        _FAST_PWM+1, 0 
	MOVWF       FARG_moveForward_pwmLeft+1 
	MOVF        _FAST_PWM+0, 0 
	MOVWF       FARG_moveForward_pwmRight+0 
	MOVF        _FAST_PWM+1, 0 
	MOVWF       FARG_moveForward_pwmRight+1 
	CALL        _moveForward+0, 0
	GOTO        L_lineFollowNormalWorked188
L_lineFollowNormalWorked187:
;linefollow.h,141 :: 		else if( Sensor3==0 && Sensor4==0 && Sensor5==1 && Sensor6==1 && Sensor7==0)
	BTFSC       PORTD+0, 4 
	GOTO        L_lineFollowNormalWorked191
	BTFSC       PORTD+0, 5 
	GOTO        L_lineFollowNormalWorked191
	BTFSS       PORTD+0, 6 
	GOTO        L_lineFollowNormalWorked191
	BTFSS       PORTD+0, 7 
	GOTO        L_lineFollowNormalWorked191
	BTFSC       PORTB+0, 2 
	GOTO        L_lineFollowNormalWorked191
L__lineFollowNormalWorked463:
;linefollow.h,142 :: 		moveForward(FAST_PWM,SLOW_PWM);
	MOVF        _FAST_PWM+0, 0 
	MOVWF       FARG_moveForward_pwmLeft+0 
	MOVF        _FAST_PWM+1, 0 
	MOVWF       FARG_moveForward_pwmLeft+1 
	MOVF        _SLOW_PWM+0, 0 
	MOVWF       FARG_moveForward_pwmRight+0 
	MOVF        _SLOW_PWM+1, 0 
	MOVWF       FARG_moveForward_pwmRight+1 
	CALL        _moveForward+0, 0
	GOTO        L_lineFollowNormalWorked192
L_lineFollowNormalWorked191:
;linefollow.h,145 :: 		else if(isAllWhite()){
	CALL        _isAllWhite+0, 0
	MOVF        R0, 0 
	IORWF       R1, 0 
	BTFSC       STATUS+0, 2 
	GOTO        L_lineFollowNormalWorked193
;linefollow.h,148 :: 		sendSensorStatus();
	CALL        _sendSensorStatus+0, 0
;linefollow.h,149 :: 		}
	GOTO        L_lineFollowNormalWorked194
L_lineFollowNormalWorked193:
;linefollow.h,151 :: 		stop();
	CALL        _stop+0, 0
;linefollow.h,152 :: 		sendSensorStatus();
	CALL        _sendSensorStatus+0, 0
;linefollow.h,154 :: 		}
L_lineFollowNormalWorked194:
L_lineFollowNormalWorked192:
L_lineFollowNormalWorked188:
L_lineFollowNormalWorked184:
L_lineFollowNormalWorked180:
L_lineFollowNormalWorked176:
L_lineFollowNormalWorked172:
L_lineFollowNormalWorked168:
L_lineFollowNormalWorked164:
L_lineFollowNormalWorked160:
L_lineFollowNormalWorked156:
L_lineFollowNormalWorked152:
L_lineFollowNormalWorked148:
L_lineFollowNormalWorked144:
L_lineFollowNormalWorked140:
L_lineFollowNormalWorked136:
L_lineFollowNormalWorked132:
L_lineFollowNormalWorked128:
L_lineFollowNormalWorked124:
L_lineFollowNormalWorked120:
L_lineFollowNormalWorked116:
;linefollow.h,155 :: 		}
L_lineFollowNormalWorked112:
;linefollow.h,156 :: 		}
	RETURN      0
; end of _lineFollowNormalWorked

_isOnThePath:

;linefollow.h,158 :: 		int isOnThePath(){
;linefollow.h,159 :: 		if(((Sensor3==0 && Sensor4==1 && Sensor5==1 && Sensor6==0 && Sensor7==0) || ( Sensor3==0 && Sensor4==1 && Sensor5==1 && Sensor6==1 && Sensor7==0) || ( Sensor3==0 && Sensor4==0 && Sensor5==1 && Sensor6==0 && Sensor7==0) || ( Sensor3==0 && Sensor4==0 && Sensor5==1 && Sensor6==1 && Sensor7==0)) && Sensor1==0 && Sensor2==0 && Sensor8==0 && Sensor9==0)
	BTFSC       PORTD+0, 4 
	GOTO        L__isOnThePath502
	BTFSS       PORTD+0, 5 
	GOTO        L__isOnThePath502
	BTFSS       PORTD+0, 6 
	GOTO        L__isOnThePath502
	BTFSC       PORTD+0, 7 
	GOTO        L__isOnThePath502
	BTFSC       PORTB+0, 2 
	GOTO        L__isOnThePath502
	GOTO        L__isOnThePath498
L__isOnThePath502:
	BTFSC       PORTD+0, 4 
	GOTO        L__isOnThePath501
	BTFSS       PORTD+0, 5 
	GOTO        L__isOnThePath501
	BTFSS       PORTD+0, 6 
	GOTO        L__isOnThePath501
	BTFSS       PORTD+0, 7 
	GOTO        L__isOnThePath501
	BTFSC       PORTB+0, 2 
	GOTO        L__isOnThePath501
	GOTO        L__isOnThePath498
L__isOnThePath501:
	BTFSC       PORTD+0, 4 
	GOTO        L__isOnThePath500
	BTFSC       PORTD+0, 5 
	GOTO        L__isOnThePath500
	BTFSS       PORTD+0, 6 
	GOTO        L__isOnThePath500
	BTFSC       PORTD+0, 7 
	GOTO        L__isOnThePath500
	BTFSC       PORTB+0, 2 
	GOTO        L__isOnThePath500
	GOTO        L__isOnThePath498
L__isOnThePath500:
	BTFSC       PORTD+0, 4 
	GOTO        L__isOnThePath499
	BTFSC       PORTD+0, 5 
	GOTO        L__isOnThePath499
	BTFSS       PORTD+0, 6 
	GOTO        L__isOnThePath499
	BTFSS       PORTD+0, 7 
	GOTO        L__isOnThePath499
	BTFSC       PORTB+0, 2 
	GOTO        L__isOnThePath499
	GOTO        L__isOnThePath498
L__isOnThePath499:
	GOTO        L_isOnThePath207
L__isOnThePath498:
	BTFSC       PORTB+0, 4 
	GOTO        L_isOnThePath207
	BTFSC       PORTB+0, 3 
	GOTO        L_isOnThePath207
	BTFSC       PORTB+0, 6 
	GOTO        L_isOnThePath207
	BTFSC       PORTB+0, 7 
	GOTO        L_isOnThePath207
L__isOnThePath497:
;linefollow.h,160 :: 		return 1;
	MOVLW       1
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	RETURN      0
L_isOnThePath207:
;linefollow.h,162 :: 		return 0;
	CLRF        R0 
	CLRF        R1 
;linefollow.h,163 :: 		}
	RETURN      0
; end of _isOnThePath

_lineFollow:

;linefollow.h,165 :: 		void lineFollow(){
;linefollow.h,167 :: 		while(1){
L_lineFollow209:
;linefollow.h,168 :: 		if( (Sensor3==1 || Sensor4==1 || Sensor5==1 || Sensor6==1 || Sensor7==1) && Sensor1==0 && Sensor2==0 && Sensor8==0 && Sensor9==0 ){
	BTFSC       PORTD+0, 4 
	GOTO        L__lineFollow507
	BTFSC       PORTD+0, 5 
	GOTO        L__lineFollow507
	BTFSC       PORTD+0, 6 
	GOTO        L__lineFollow507
	BTFSC       PORTD+0, 7 
	GOTO        L__lineFollow507
	BTFSC       PORTB+0, 2 
	GOTO        L__lineFollow507
	GOTO        L_lineFollow215
L__lineFollow507:
	BTFSC       PORTB+0, 4 
	GOTO        L_lineFollow215
	BTFSC       PORTB+0, 3 
	GOTO        L_lineFollow215
	BTFSC       PORTB+0, 6 
	GOTO        L_lineFollow215
	BTFSC       PORTB+0, 7 
	GOTO        L_lineFollow215
L__lineFollow506:
;linefollow.h,170 :: 		debugText = "Line follow PID..   ";
	MOVLW       ?lstr28_Main_325.0V+0
	MOVWF       _debugText+0 
	MOVLW       hi_addr(?lstr28_Main_325.0V+0)
	MOVWF       _debugText+1 
;linefollow.h,171 :: 		UART1_Write_Text(debugText);
	MOVF        _debugText+0, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVF        _debugText+1, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;linefollow.h,172 :: 		sendSensorStatus();
	CALL        _sendSensorStatus+0, 0
;linefollow.h,173 :: 		lineFollowPID();
	CALL        _lineFollowPID+0, 0
;linefollow.h,174 :: 		}
	GOTO        L_lineFollow216
L_lineFollow215:
;linefollow.h,175 :: 		else if( !( Scout==1 && Sensor1==1 && Sensor2==1 && Sensor3==1 && Sensor4==1 && Sensor5==1 && Sensor6==1 && Sensor7==1 && Sensor8==1 && Sensor9==1) || !( Scout==0 && Sensor1==0 && Sensor2==0 && Sensor3==0 && Sensor4==0 && Sensor5==0 && Sensor6==0 && Sensor7==0 && Sensor8==0 && Sensor9==0)){
	BTFSS       PORTB+0, 5 
	GOTO        L_lineFollow218
	BTFSS       PORTB+0, 4 
	GOTO        L_lineFollow218
	BTFSS       PORTB+0, 3 
	GOTO        L_lineFollow218
	BTFSS       PORTD+0, 4 
	GOTO        L_lineFollow218
	BTFSS       PORTD+0, 5 
	GOTO        L_lineFollow218
	BTFSS       PORTD+0, 6 
	GOTO        L_lineFollow218
	BTFSS       PORTD+0, 7 
	GOTO        L_lineFollow218
	BTFSS       PORTB+0, 2 
	GOTO        L_lineFollow218
	BTFSS       PORTB+0, 6 
	GOTO        L_lineFollow218
	BTFSS       PORTB+0, 7 
	GOTO        L_lineFollow218
	MOVLW       1
	MOVWF       R0 
	GOTO        L_lineFollow217
L_lineFollow218:
	CLRF        R0 
L_lineFollow217:
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L__lineFollow505
	BTFSC       PORTB+0, 5 
	GOTO        L_lineFollow220
	BTFSC       PORTB+0, 4 
	GOTO        L_lineFollow220
	BTFSC       PORTB+0, 3 
	GOTO        L_lineFollow220
	BTFSC       PORTD+0, 4 
	GOTO        L_lineFollow220
	BTFSC       PORTD+0, 5 
	GOTO        L_lineFollow220
	BTFSC       PORTD+0, 6 
	GOTO        L_lineFollow220
	BTFSC       PORTD+0, 7 
	GOTO        L_lineFollow220
	BTFSC       PORTB+0, 2 
	GOTO        L_lineFollow220
	BTFSC       PORTB+0, 6 
	GOTO        L_lineFollow220
	BTFSC       PORTB+0, 7 
	GOTO        L_lineFollow220
	MOVLW       1
	MOVWF       R0 
	GOTO        L_lineFollow219
L_lineFollow220:
	CLRF        R0 
L_lineFollow219:
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L__lineFollow505
	GOTO        L_lineFollow223
L__lineFollow505:
;linefollow.h,177 :: 		debugText = "Line follow Normal..   ";
	MOVLW       ?lstr29_Main_325.0V+0
	MOVWF       _debugText+0 
	MOVLW       hi_addr(?lstr29_Main_325.0V+0)
	MOVWF       _debugText+1 
;linefollow.h,178 :: 		UART1_Write_Text(debugText);
	MOVF        _debugText+0, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVF        _debugText+1, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;linefollow.h,179 :: 		sendSensorStatus();
	CALL        _sendSensorStatus+0, 0
;linefollow.h,180 :: 		lineFollowNormal();
	CALL        _lineFollowNormal+0, 0
;linefollow.h,181 :: 		}
	GOTO        L_lineFollow224
L_lineFollow223:
;linefollow.h,182 :: 		else if(( Scout==1 && Sensor1==1 && Sensor2==1 && Sensor3==1 && Sensor4==1 && Sensor5==1 && Sensor6==1 && Sensor7==1 && Sensor8==1 && Sensor9==1) || !( Scout==0 && Sensor1==0 && Sensor2==0 && Sensor3==0 && Sensor4==0 && Sensor5==0 && Sensor6==0 && Sensor7==0 && Sensor8==0 && Sensor9==0)){
	BTFSS       PORTB+0, 5 
	GOTO        L__lineFollow504
	BTFSS       PORTB+0, 4 
	GOTO        L__lineFollow504
	BTFSS       PORTB+0, 3 
	GOTO        L__lineFollow504
	BTFSS       PORTD+0, 4 
	GOTO        L__lineFollow504
	BTFSS       PORTD+0, 5 
	GOTO        L__lineFollow504
	BTFSS       PORTD+0, 6 
	GOTO        L__lineFollow504
	BTFSS       PORTD+0, 7 
	GOTO        L__lineFollow504
	BTFSS       PORTB+0, 2 
	GOTO        L__lineFollow504
	BTFSS       PORTB+0, 6 
	GOTO        L__lineFollow504
	BTFSS       PORTB+0, 7 
	GOTO        L__lineFollow504
	GOTO        L__lineFollow503
L__lineFollow504:
	BTFSC       PORTB+0, 5 
	GOTO        L_lineFollow228
	BTFSC       PORTB+0, 4 
	GOTO        L_lineFollow228
	BTFSC       PORTB+0, 3 
	GOTO        L_lineFollow228
	BTFSC       PORTD+0, 4 
	GOTO        L_lineFollow228
	BTFSC       PORTD+0, 5 
	GOTO        L_lineFollow228
	BTFSC       PORTD+0, 6 
	GOTO        L_lineFollow228
	BTFSC       PORTD+0, 7 
	GOTO        L_lineFollow228
	BTFSC       PORTB+0, 2 
	GOTO        L_lineFollow228
	BTFSC       PORTB+0, 6 
	GOTO        L_lineFollow228
	BTFSC       PORTB+0, 7 
	GOTO        L_lineFollow228
	MOVLW       1
	MOVWF       R0 
	GOTO        L_lineFollow227
L_lineFollow228:
	CLRF        R0 
L_lineFollow227:
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L__lineFollow503
	GOTO        L_lineFollow231
L__lineFollow503:
;linefollow.h,184 :: 		stop();
	CALL        _stop+0, 0
;linefollow.h,185 :: 		sendSensorStatus();
	CALL        _sendSensorStatus+0, 0
;linefollow.h,187 :: 		}
L_lineFollow231:
L_lineFollow224:
L_lineFollow216:
;linefollow.h,188 :: 		}
	GOTO        L_lineFollow209
;linefollow.h,189 :: 		}
	RETURN      0
; end of _lineFollow

_lineFollowNormal:

;linefollow.h,191 :: 		void lineFollowNormal(){
;linefollow.h,192 :: 		while(1){              //!((Sensor3==1 || Sensor4==1 || Sensor5==1 || Sensor6==1 || Sensor7==1) && Sensor1==0 && Sensor2==0 && Sensor8==0 && Sensor9==0)
L_lineFollowNormal232:
;linefollow.h,193 :: 		if( Scout==1 && Sensor1==1 && Sensor2==1 && Sensor3==1 && Sensor4==1 && Sensor5==1 && Sensor6==1 && Sensor7==1 && Sensor8==1 && Sensor9==1){
	BTFSS       PORTB+0, 5 
	GOTO        L_lineFollowNormal236
	BTFSS       PORTB+0, 4 
	GOTO        L_lineFollowNormal236
	BTFSS       PORTB+0, 3 
	GOTO        L_lineFollowNormal236
	BTFSS       PORTD+0, 4 
	GOTO        L_lineFollowNormal236
	BTFSS       PORTD+0, 5 
	GOTO        L_lineFollowNormal236
	BTFSS       PORTD+0, 6 
	GOTO        L_lineFollowNormal236
	BTFSS       PORTD+0, 7 
	GOTO        L_lineFollowNormal236
	BTFSS       PORTB+0, 2 
	GOTO        L_lineFollowNormal236
	BTFSS       PORTB+0, 6 
	GOTO        L_lineFollowNormal236
	BTFSS       PORTB+0, 7 
	GOTO        L_lineFollowNormal236
L__lineFollowNormal520:
;linefollow.h,194 :: 		stop();
	CALL        _stop+0, 0
;linefollow.h,195 :: 		}
	GOTO        L_lineFollowNormal237
L_lineFollowNormal236:
;linefollow.h,196 :: 		else if( (Scout==0 && Sensor1==0 && Sensor2==0 && Sensor3==0 && Sensor4==1 && Sensor5==1 && Sensor6==1 && Sensor7==1 && Sensor8==1 && Sensor9==1) || (Scout==0 && Sensor1==0 && Sensor2==0 && Sensor3==0 && Sensor4==0 && Sensor5==1 && Sensor6==1 && Sensor7==1 && Sensor8==1 && Sensor9==1)){
	BTFSC       PORTB+0, 5 
	GOTO        L__lineFollowNormal519
	BTFSC       PORTB+0, 4 
	GOTO        L__lineFollowNormal519
	BTFSC       PORTB+0, 3 
	GOTO        L__lineFollowNormal519
	BTFSC       PORTD+0, 4 
	GOTO        L__lineFollowNormal519
	BTFSS       PORTD+0, 5 
	GOTO        L__lineFollowNormal519
	BTFSS       PORTD+0, 6 
	GOTO        L__lineFollowNormal519
	BTFSS       PORTD+0, 7 
	GOTO        L__lineFollowNormal519
	BTFSS       PORTB+0, 2 
	GOTO        L__lineFollowNormal519
	BTFSS       PORTB+0, 6 
	GOTO        L__lineFollowNormal519
	BTFSS       PORTB+0, 7 
	GOTO        L__lineFollowNormal519
	GOTO        L__lineFollowNormal517
L__lineFollowNormal519:
	BTFSC       PORTB+0, 5 
	GOTO        L__lineFollowNormal518
	BTFSC       PORTB+0, 4 
	GOTO        L__lineFollowNormal518
	BTFSC       PORTB+0, 3 
	GOTO        L__lineFollowNormal518
	BTFSC       PORTD+0, 4 
	GOTO        L__lineFollowNormal518
	BTFSC       PORTD+0, 5 
	GOTO        L__lineFollowNormal518
	BTFSS       PORTD+0, 6 
	GOTO        L__lineFollowNormal518
	BTFSS       PORTD+0, 7 
	GOTO        L__lineFollowNormal518
	BTFSS       PORTB+0, 2 
	GOTO        L__lineFollowNormal518
	BTFSS       PORTB+0, 6 
	GOTO        L__lineFollowNormal518
	BTFSS       PORTB+0, 7 
	GOTO        L__lineFollowNormal518
	GOTO        L__lineFollowNormal517
L__lineFollowNormal518:
	GOTO        L_lineFollowNormal244
L__lineFollowNormal517:
;linefollow.h,198 :: 		debugText = "90 to right..   ";
	MOVLW       ?lstr30_Main_325.0V+0
	MOVWF       _debugText+0 
	MOVLW       hi_addr(?lstr30_Main_325.0V+0)
	MOVWF       _debugText+1 
;linefollow.h,199 :: 		UART1_Write_Text(debugText);
	MOVF        _debugText+0, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVF        _debugText+1, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;linefollow.h,200 :: 		sendSensorStatus();
	CALL        _sendSensorStatus+0, 0
;linefollow.h,201 :: 		while(Scout==0){
L_lineFollowNormal245:
	BTFSC       PORTB+0, 5 
	GOTO        L_lineFollowNormal246
;linefollow.h,202 :: 		rotateClockwise(TEST_RPM);
	MOVF        _TEST_RPM+0, 0 
	MOVWF       FARG_rotateClockwise_pwm+0 
	MOVF        _TEST_RPM+1, 0 
	MOVWF       FARG_rotateClockwise_pwm+1 
	CALL        _rotateClockwise+0, 0
;linefollow.h,203 :: 		}
	GOTO        L_lineFollowNormal245
L_lineFollowNormal246:
;linefollow.h,204 :: 		}
	GOTO        L_lineFollowNormal247
L_lineFollowNormal244:
;linefollow.h,205 :: 		else if( (Scout==0 && Sensor1==1 && Sensor2==1 && Sensor3==1 && Sensor4==1 && Sensor5==1 && Sensor6==0 && Sensor7==0 && Sensor8==0 && Sensor9==0) && (Scout==0 && Sensor1==1 && Sensor2==1 && Sensor3==1 && Sensor4==1 && Sensor5==0 && Sensor6==0 && Sensor7==0 && Sensor8==0 && Sensor9==0)){
	BTFSC       PORTB+0, 5 
	GOTO        L_lineFollowNormal254
	BTFSS       PORTB+0, 4 
	GOTO        L_lineFollowNormal254
	BTFSS       PORTB+0, 3 
	GOTO        L_lineFollowNormal254
	BTFSS       PORTD+0, 4 
	GOTO        L_lineFollowNormal254
	BTFSS       PORTD+0, 5 
	GOTO        L_lineFollowNormal254
	BTFSS       PORTD+0, 6 
	GOTO        L_lineFollowNormal254
	BTFSC       PORTD+0, 7 
	GOTO        L_lineFollowNormal254
	BTFSC       PORTB+0, 2 
	GOTO        L_lineFollowNormal254
	BTFSC       PORTB+0, 6 
	GOTO        L_lineFollowNormal254
	BTFSC       PORTB+0, 7 
	GOTO        L_lineFollowNormal254
L__lineFollowNormal516:
	BTFSC       PORTB+0, 5 
	GOTO        L_lineFollowNormal254
	BTFSS       PORTB+0, 4 
	GOTO        L_lineFollowNormal254
	BTFSS       PORTB+0, 3 
	GOTO        L_lineFollowNormal254
	BTFSS       PORTD+0, 4 
	GOTO        L_lineFollowNormal254
	BTFSS       PORTD+0, 5 
	GOTO        L_lineFollowNormal254
	BTFSC       PORTD+0, 6 
	GOTO        L_lineFollowNormal254
	BTFSC       PORTD+0, 7 
	GOTO        L_lineFollowNormal254
	BTFSC       PORTB+0, 2 
	GOTO        L_lineFollowNormal254
	BTFSC       PORTB+0, 6 
	GOTO        L_lineFollowNormal254
	BTFSC       PORTB+0, 7 
	GOTO        L_lineFollowNormal254
L__lineFollowNormal515:
L__lineFollowNormal514:
;linefollow.h,207 :: 		debugText = "90 to left..   ";
	MOVLW       ?lstr31_Main_325.0V+0
	MOVWF       _debugText+0 
	MOVLW       hi_addr(?lstr31_Main_325.0V+0)
	MOVWF       _debugText+1 
;linefollow.h,208 :: 		UART1_Write_Text(debugText);
	MOVF        _debugText+0, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVF        _debugText+1, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;linefollow.h,209 :: 		sendSensorStatus();
	CALL        _sendSensorStatus+0, 0
;linefollow.h,210 :: 		while(Scout==0){
L_lineFollowNormal255:
	BTFSC       PORTB+0, 5 
	GOTO        L_lineFollowNormal256
;linefollow.h,211 :: 		rotateAntiClockwise(TEST_RPM);
	MOVF        _TEST_RPM+0, 0 
	MOVWF       FARG_rotateAntiClockwise_pwm+0 
	MOVF        _TEST_RPM+1, 0 
	MOVWF       FARG_rotateAntiClockwise_pwm+1 
	CALL        _rotateAntiClockwise+0, 0
;linefollow.h,212 :: 		}
	GOTO        L_lineFollowNormal255
L_lineFollowNormal256:
;linefollow.h,213 :: 		}
	GOTO        L_lineFollowNormal257
L_lineFollowNormal254:
;linefollow.h,214 :: 		else if( Sensor4==1 && Sensor5==1){
	BTFSS       PORTD+0, 5 
	GOTO        L_lineFollowNormal260
	BTFSS       PORTD+0, 6 
	GOTO        L_lineFollowNormal260
L__lineFollowNormal513:
;linefollow.h,216 :: 		moveForward(TEST_RPM,TEST_RPM);
	MOVF        _TEST_RPM+0, 0 
	MOVWF       FARG_moveForward_pwmLeft+0 
	MOVF        _TEST_RPM+1, 0 
	MOVWF       FARG_moveForward_pwmLeft+1 
	MOVF        _TEST_RPM+0, 0 
	MOVWF       FARG_moveForward_pwmRight+0 
	MOVF        _TEST_RPM+1, 0 
	MOVWF       FARG_moveForward_pwmRight+1 
	CALL        _moveForward+0, 0
;linefollow.h,217 :: 		}
	GOTO        L_lineFollowNormal261
L_lineFollowNormal260:
;linefollow.h,218 :: 		else if( Sensor4==1 && Sensor5==0 && Scout==1){
	BTFSS       PORTD+0, 5 
	GOTO        L_lineFollowNormal264
	BTFSC       PORTD+0, 6 
	GOTO        L_lineFollowNormal264
	BTFSS       PORTB+0, 5 
	GOTO        L_lineFollowNormal264
L__lineFollowNormal512:
;linefollow.h,220 :: 		turnLeft(TEST_RPM);
	MOVF        _TEST_RPM+0, 0 
	MOVWF       FARG_turnLeft_pwmRight+0 
	MOVF        _TEST_RPM+1, 0 
	MOVWF       FARG_turnLeft_pwmRight+1 
	CALL        _turnLeft+0, 0
;linefollow.h,221 :: 		}
	GOTO        L_lineFollowNormal265
L_lineFollowNormal264:
;linefollow.h,222 :: 		else if( Sensor4==0 && Sensor5==1 && Scout==1){
	BTFSC       PORTD+0, 5 
	GOTO        L_lineFollowNormal268
	BTFSS       PORTD+0, 6 
	GOTO        L_lineFollowNormal268
	BTFSS       PORTB+0, 5 
	GOTO        L_lineFollowNormal268
L__lineFollowNormal511:
;linefollow.h,224 :: 		turnRight(TEST_RPM);
	MOVF        _TEST_RPM+0, 0 
	MOVWF       FARG_turnRight_pwmLeft+0 
	MOVF        _TEST_RPM+1, 0 
	MOVWF       FARG_turnRight_pwmLeft+1 
	CALL        _turnRight+0, 0
;linefollow.h,225 :: 		}
	GOTO        L_lineFollowNormal269
L_lineFollowNormal268:
;linefollow.h,226 :: 		else if( Sensor4==1 && Sensor5==0 && Scout==0){
	BTFSS       PORTD+0, 5 
	GOTO        L_lineFollowNormal272
	BTFSC       PORTD+0, 6 
	GOTO        L_lineFollowNormal272
	BTFSC       PORTB+0, 5 
	GOTO        L_lineFollowNormal272
L__lineFollowNormal510:
;linefollow.h,228 :: 		stop();
	CALL        _stop+0, 0
;linefollow.h,230 :: 		rotateAntiClockwise(TEST_RPM);
	MOVF        _TEST_RPM+0, 0 
	MOVWF       FARG_rotateAntiClockwise_pwm+0 
	MOVF        _TEST_RPM+1, 0 
	MOVWF       FARG_rotateAntiClockwise_pwm+1 
	CALL        _rotateAntiClockwise+0, 0
;linefollow.h,231 :: 		}
	GOTO        L_lineFollowNormal273
L_lineFollowNormal272:
;linefollow.h,232 :: 		else if( Sensor4==0 && Sensor5==1 && Scout==0){
	BTFSC       PORTD+0, 5 
	GOTO        L_lineFollowNormal276
	BTFSS       PORTD+0, 6 
	GOTO        L_lineFollowNormal276
	BTFSC       PORTB+0, 5 
	GOTO        L_lineFollowNormal276
L__lineFollowNormal509:
;linefollow.h,234 :: 		stop();
	CALL        _stop+0, 0
;linefollow.h,236 :: 		rotateClockwise(TEST_RPM);
	MOVF        _TEST_RPM+0, 0 
	MOVWF       FARG_rotateClockwise_pwm+0 
	MOVF        _TEST_RPM+1, 0 
	MOVWF       FARG_rotateClockwise_pwm+1 
	CALL        _rotateClockwise+0, 0
;linefollow.h,237 :: 		}
	GOTO        L_lineFollowNormal277
L_lineFollowNormal276:
;linefollow.h,238 :: 		else if( Sensor4==0 && Sensor5==0 ){
	BTFSC       PORTD+0, 5 
	GOTO        L_lineFollowNormal280
	BTFSC       PORTD+0, 6 
	GOTO        L_lineFollowNormal280
L__lineFollowNormal508:
;linefollow.h,239 :: 		if(Sensor3 ==1){
	BTFSS       PORTD+0, 4 
	GOTO        L_lineFollowNormal281
;linefollow.h,240 :: 		rotateAntiClockwise(TEST_RPM);
	MOVF        _TEST_RPM+0, 0 
	MOVWF       FARG_rotateAntiClockwise_pwm+0 
	MOVF        _TEST_RPM+1, 0 
	MOVWF       FARG_rotateAntiClockwise_pwm+1 
	CALL        _rotateAntiClockwise+0, 0
;linefollow.h,241 :: 		}
	GOTO        L_lineFollowNormal282
L_lineFollowNormal281:
;linefollow.h,242 :: 		else if(Sensor6 ==1){
	BTFSS       PORTD+0, 7 
	GOTO        L_lineFollowNormal283
;linefollow.h,243 :: 		rotateClockwise(TEST_RPM);
	MOVF        _TEST_RPM+0, 0 
	MOVWF       FARG_rotateClockwise_pwm+0 
	MOVF        _TEST_RPM+1, 0 
	MOVWF       FARG_rotateClockwise_pwm+1 
	CALL        _rotateClockwise+0, 0
;linefollow.h,244 :: 		}
	GOTO        L_lineFollowNormal284
L_lineFollowNormal283:
;linefollow.h,245 :: 		else if(Sensor2 ==1){
	BTFSS       PORTB+0, 3 
	GOTO        L_lineFollowNormal285
;linefollow.h,246 :: 		rotateAntiClockwise(TEST_RPM);
	MOVF        _TEST_RPM+0, 0 
	MOVWF       FARG_rotateAntiClockwise_pwm+0 
	MOVF        _TEST_RPM+1, 0 
	MOVWF       FARG_rotateAntiClockwise_pwm+1 
	CALL        _rotateAntiClockwise+0, 0
;linefollow.h,247 :: 		}
	GOTO        L_lineFollowNormal286
L_lineFollowNormal285:
;linefollow.h,248 :: 		else if(Sensor7 ==1){
	BTFSS       PORTB+0, 2 
	GOTO        L_lineFollowNormal287
;linefollow.h,249 :: 		rotateClockwise(TEST_RPM);
	MOVF        _TEST_RPM+0, 0 
	MOVWF       FARG_rotateClockwise_pwm+0 
	MOVF        _TEST_RPM+1, 0 
	MOVWF       FARG_rotateClockwise_pwm+1 
	CALL        _rotateClockwise+0, 0
;linefollow.h,250 :: 		}
	GOTO        L_lineFollowNormal288
L_lineFollowNormal287:
;linefollow.h,253 :: 		stop();
	CALL        _stop+0, 0
;linefollow.h,256 :: 		}
L_lineFollowNormal288:
L_lineFollowNormal286:
L_lineFollowNormal284:
L_lineFollowNormal282:
;linefollow.h,257 :: 		}
L_lineFollowNormal280:
L_lineFollowNormal277:
L_lineFollowNormal273:
L_lineFollowNormal269:
L_lineFollowNormal265:
L_lineFollowNormal261:
L_lineFollowNormal257:
L_lineFollowNormal247:
L_lineFollowNormal237:
;linefollow.h,259 :: 		}
	GOTO        L_lineFollowNormal232
;linefollow.h,261 :: 		}
	RETURN      0
; end of _lineFollowNormal

_setPID:

;linefollow.h,263 :: 		void setPID(){
;linefollow.h,264 :: 		MIN_RPM = 185;       //155
	MOVLW       185
	MOVWF       _MIN_RPM+0 
	MOVLW       0
	MOVWF       _MIN_RPM+1 
;linefollow.h,265 :: 		MID_RPM = 200;
	MOVLW       200
	MOVWF       _MID_RPM+0 
	MOVLW       0
	MOVWF       _MID_RPM+1 
;linefollow.h,266 :: 		MAX_RPM = 255;
	MOVLW       255
	MOVWF       _MAX_RPM+0 
	MOVLW       0
	MOVWF       _MAX_RPM+1 
;linefollow.h,267 :: 		TEST_RPM = 200;
	MOVLW       200
	MOVWF       _TEST_RPM+0 
	MOVLW       0
	MOVWF       _TEST_RPM+1 
;linefollow.h,270 :: 		SLOW_PWM = 240;
	MOVLW       240
	MOVWF       _SLOW_PWM+0 
	MOVLW       0
	MOVWF       _SLOW_PWM+1 
;linefollow.h,271 :: 		MID_PWM = 200;
	MOVLW       200
	MOVWF       _MID_PWM+0 
	MOVLW       0
	MOVWF       _MID_PWM+1 
;linefollow.h,272 :: 		FAST_PWM = 255;
	MOVLW       255
	MOVWF       _FAST_PWM+0 
	MOVLW       0
	MOVWF       _FAST_PWM+1 
;linefollow.h,274 :: 		Kp = 6;
	MOVLW       0
	MOVWF       _Kp+0 
	MOVLW       0
	MOVWF       _Kp+1 
	MOVLW       64
	MOVWF       _Kp+2 
	MOVLW       129
	MOVWF       _Kp+3 
;linefollow.h,275 :: 		Ki = 0;
	CLRF        _Ki+0 
	CLRF        _Ki+1 
	CLRF        _Ki+2 
	CLRF        _Ki+3 
;linefollow.h,276 :: 		Kd = 0;
	CLRF        _Kd+0 
	CLRF        _Kd+1 
	CLRF        _Kd+2 
	CLRF        _Kd+3 
;linefollow.h,278 :: 		totalError = 0;
	CLRF        _totalError+0 
	CLRF        _totalError+1 
	CLRF        _totalError+2 
	CLRF        _totalError+3 
;linefollow.h,279 :: 		previousDeviation = 0;
	CLRF        _previousDeviation+0 
	CLRF        _previousDeviation+1 
;linefollow.h,280 :: 		PID_LeftRPM = 0;
	CLRF        _PID_LeftRPM+0 
	CLRF        _PID_LeftRPM+1 
;linefollow.h,281 :: 		PID_RightRPM = 0;
	CLRF        _PID_RightRPM+0 
	CLRF        _PID_RightRPM+1 
;linefollow.h,283 :: 		Pwm1_Set_Duty(MID_RPM);
	MOVLW       200
	MOVWF       FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;linefollow.h,284 :: 		Pwm2_Set_Duty(MID_RPM);
	MOVF        _MID_RPM+0, 0 
	MOVWF       FARG_PWM2_Set_Duty_new_duty+0 
	CALL        _PWM2_Set_Duty+0, 0
;linefollow.h,285 :: 		}
	RETURN      0
; end of _setPID

_lineFollowPID:

;linefollow.h,287 :: 		void lineFollowPID(){
;linefollow.h,290 :: 		if( (Scout==0 && Sensor1==0 && Sensor2==0 && Sensor3==0 && Sensor4==1 && Sensor5==1 && Sensor6==1 && Sensor7==1 && Sensor8==1 && Sensor9==1) || (Scout==0 && Sensor1==0 && Sensor2==0 && Sensor3==0 && Sensor4==0 && Sensor5==1 && Sensor6==1 && Sensor7==1 && Sensor8==1 && Sensor9==1)){
	BTFSC       PORTB+0, 5 
	GOTO        L__lineFollowPID538
	BTFSC       PORTB+0, 4 
	GOTO        L__lineFollowPID538
	BTFSC       PORTB+0, 3 
	GOTO        L__lineFollowPID538
	BTFSC       PORTD+0, 4 
	GOTO        L__lineFollowPID538
	BTFSS       PORTD+0, 5 
	GOTO        L__lineFollowPID538
	BTFSS       PORTD+0, 6 
	GOTO        L__lineFollowPID538
	BTFSS       PORTD+0, 7 
	GOTO        L__lineFollowPID538
	BTFSS       PORTB+0, 2 
	GOTO        L__lineFollowPID538
	BTFSS       PORTB+0, 6 
	GOTO        L__lineFollowPID538
	BTFSS       PORTB+0, 7 
	GOTO        L__lineFollowPID538
	GOTO        L__lineFollowPID536
L__lineFollowPID538:
	BTFSC       PORTB+0, 5 
	GOTO        L__lineFollowPID537
	BTFSC       PORTB+0, 4 
	GOTO        L__lineFollowPID537
	BTFSC       PORTB+0, 3 
	GOTO        L__lineFollowPID537
	BTFSC       PORTD+0, 4 
	GOTO        L__lineFollowPID537
	BTFSC       PORTD+0, 5 
	GOTO        L__lineFollowPID537
	BTFSS       PORTD+0, 6 
	GOTO        L__lineFollowPID537
	BTFSS       PORTD+0, 7 
	GOTO        L__lineFollowPID537
	BTFSS       PORTB+0, 2 
	GOTO        L__lineFollowPID537
	BTFSS       PORTB+0, 6 
	GOTO        L__lineFollowPID537
	BTFSS       PORTB+0, 7 
	GOTO        L__lineFollowPID537
	GOTO        L__lineFollowPID536
L__lineFollowPID537:
	GOTO        L_lineFollowPID295
L__lineFollowPID536:
;linefollow.h,292 :: 		debugText = "90 to right..   ";
	MOVLW       ?lstr32_Main_325.0V+0
	MOVWF       _debugText+0 
	MOVLW       hi_addr(?lstr32_Main_325.0V+0)
	MOVWF       _debugText+1 
;linefollow.h,293 :: 		UART1_Write_Text(debugText);
	MOVF        _debugText+0, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVF        _debugText+1, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;linefollow.h,294 :: 		sendSensorStatus();
	CALL        _sendSensorStatus+0, 0
;linefollow.h,295 :: 		while(Scout==0){
L_lineFollowPID296:
	BTFSC       PORTB+0, 5 
	GOTO        L_lineFollowPID297
;linefollow.h,296 :: 		rotateClockwise(TEST_RPM);
	MOVF        _TEST_RPM+0, 0 
	MOVWF       FARG_rotateClockwise_pwm+0 
	MOVF        _TEST_RPM+1, 0 
	MOVWF       FARG_rotateClockwise_pwm+1 
	CALL        _rotateClockwise+0, 0
;linefollow.h,297 :: 		}
	GOTO        L_lineFollowPID296
L_lineFollowPID297:
;linefollow.h,298 :: 		}
	GOTO        L_lineFollowPID298
L_lineFollowPID295:
;linefollow.h,299 :: 		else if( (Scout==0 && Sensor1==1 && Sensor2==1 && Sensor3==1 && Sensor4==1 && Sensor7==0 && Sensor8==0 && Sensor9==0) && (Scout==0 && Sensor1==1 && Sensor2==1 && Sensor3==1 && Sensor4==1 && Sensor7==0 && Sensor8==0 && Sensor9==0)){
	BTFSC       PORTB+0, 5 
	GOTO        L_lineFollowPID305
	BTFSS       PORTB+0, 4 
	GOTO        L_lineFollowPID305
	BTFSS       PORTB+0, 3 
	GOTO        L_lineFollowPID305
	BTFSS       PORTD+0, 4 
	GOTO        L_lineFollowPID305
	BTFSS       PORTD+0, 5 
	GOTO        L_lineFollowPID305
	BTFSC       PORTB+0, 2 
	GOTO        L_lineFollowPID305
	BTFSC       PORTB+0, 6 
	GOTO        L_lineFollowPID305
	BTFSC       PORTB+0, 7 
	GOTO        L_lineFollowPID305
L__lineFollowPID535:
	BTFSC       PORTB+0, 5 
	GOTO        L_lineFollowPID305
	BTFSS       PORTB+0, 4 
	GOTO        L_lineFollowPID305
	BTFSS       PORTB+0, 3 
	GOTO        L_lineFollowPID305
	BTFSS       PORTD+0, 4 
	GOTO        L_lineFollowPID305
	BTFSS       PORTD+0, 5 
	GOTO        L_lineFollowPID305
	BTFSC       PORTB+0, 2 
	GOTO        L_lineFollowPID305
	BTFSC       PORTB+0, 6 
	GOTO        L_lineFollowPID305
	BTFSC       PORTB+0, 7 
	GOTO        L_lineFollowPID305
L__lineFollowPID534:
L__lineFollowPID533:
;linefollow.h,301 :: 		debugText = "90 to left..   ";
	MOVLW       ?lstr33_Main_325.0V+0
	MOVWF       _debugText+0 
	MOVLW       hi_addr(?lstr33_Main_325.0V+0)
	MOVWF       _debugText+1 
;linefollow.h,302 :: 		UART1_Write_Text(debugText);
	MOVF        _debugText+0, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVF        _debugText+1, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;linefollow.h,303 :: 		sendSensorStatus();
	CALL        _sendSensorStatus+0, 0
;linefollow.h,304 :: 		while(Scout==0){
L_lineFollowPID306:
	BTFSC       PORTB+0, 5 
	GOTO        L_lineFollowPID307
;linefollow.h,305 :: 		rotateAntiClockwise(TEST_RPM);
	MOVF        _TEST_RPM+0, 0 
	MOVWF       FARG_rotateAntiClockwise_pwm+0 
	MOVF        _TEST_RPM+1, 0 
	MOVWF       FARG_rotateAntiClockwise_pwm+1 
	CALL        _rotateAntiClockwise+0, 0
;linefollow.h,306 :: 		}
	GOTO        L_lineFollowPID306
L_lineFollowPID307:
;linefollow.h,307 :: 		}
L_lineFollowPID305:
L_lineFollowPID298:
;linefollow.h,310 :: 		if( Sensor3==1 && Sensor4==0 && Sensor5==0 && Sensor6==0 && Sensor7==0)
	BTFSS       PORTD+0, 4 
	GOTO        L_lineFollowPID310
	BTFSC       PORTD+0, 5 
	GOTO        L_lineFollowPID310
	BTFSC       PORTD+0, 6 
	GOTO        L_lineFollowPID310
	BTFSC       PORTD+0, 7 
	GOTO        L_lineFollowPID310
	BTFSC       PORTB+0, 2 
	GOTO        L_lineFollowPID310
L__lineFollowPID532:
;linefollow.h,311 :: 		deviation = 4;
	MOVLW       4
	MOVWF       _deviation+0 
	MOVLW       0
	MOVWF       _deviation+1 
L_lineFollowPID310:
;linefollow.h,312 :: 		if( Sensor3==1 && Sensor4==1 && Sensor5==0 && Sensor6==0 && Sensor7==0)
	BTFSS       PORTD+0, 4 
	GOTO        L_lineFollowPID313
	BTFSS       PORTD+0, 5 
	GOTO        L_lineFollowPID313
	BTFSC       PORTD+0, 6 
	GOTO        L_lineFollowPID313
	BTFSC       PORTD+0, 7 
	GOTO        L_lineFollowPID313
	BTFSC       PORTB+0, 2 
	GOTO        L_lineFollowPID313
L__lineFollowPID531:
;linefollow.h,313 :: 		deviation = 3;
	MOVLW       3
	MOVWF       _deviation+0 
	MOVLW       0
	MOVWF       _deviation+1 
L_lineFollowPID313:
;linefollow.h,314 :: 		if( Sensor3==1 && Sensor4==1 && Sensor5==1 && Sensor6==0 && Sensor7==0)
	BTFSS       PORTD+0, 4 
	GOTO        L_lineFollowPID316
	BTFSS       PORTD+0, 5 
	GOTO        L_lineFollowPID316
	BTFSS       PORTD+0, 6 
	GOTO        L_lineFollowPID316
	BTFSC       PORTD+0, 7 
	GOTO        L_lineFollowPID316
	BTFSC       PORTB+0, 2 
	GOTO        L_lineFollowPID316
L__lineFollowPID530:
;linefollow.h,315 :: 		deviation = 2;
	MOVLW       2
	MOVWF       _deviation+0 
	MOVLW       0
	MOVWF       _deviation+1 
L_lineFollowPID316:
;linefollow.h,316 :: 		if( Sensor3==0 && Sensor4==1 && Sensor5==0 && Sensor6==0 && Sensor7==0)
	BTFSC       PORTD+0, 4 
	GOTO        L_lineFollowPID319
	BTFSS       PORTD+0, 5 
	GOTO        L_lineFollowPID319
	BTFSC       PORTD+0, 6 
	GOTO        L_lineFollowPID319
	BTFSC       PORTD+0, 7 
	GOTO        L_lineFollowPID319
	BTFSC       PORTB+0, 2 
	GOTO        L_lineFollowPID319
L__lineFollowPID529:
;linefollow.h,317 :: 		deviation = 1;
	MOVLW       1
	MOVWF       _deviation+0 
	MOVLW       0
	MOVWF       _deviation+1 
L_lineFollowPID319:
;linefollow.h,319 :: 		if( Sensor3==0 && Sensor4==1 && Sensor5==1 && Sensor6==0 && Sensor7==0)
	BTFSC       PORTD+0, 4 
	GOTO        L_lineFollowPID322
	BTFSS       PORTD+0, 5 
	GOTO        L_lineFollowPID322
	BTFSS       PORTD+0, 6 
	GOTO        L_lineFollowPID322
	BTFSC       PORTD+0, 7 
	GOTO        L_lineFollowPID322
	BTFSC       PORTB+0, 2 
	GOTO        L_lineFollowPID322
L__lineFollowPID528:
;linefollow.h,320 :: 		deviation = 0;
	CLRF        _deviation+0 
	CLRF        _deviation+1 
L_lineFollowPID322:
;linefollow.h,321 :: 		if( Sensor3==0 && Sensor4==1 && Sensor5==1 && Sensor6==1 && Sensor7==0)
	BTFSC       PORTD+0, 4 
	GOTO        L_lineFollowPID325
	BTFSS       PORTD+0, 5 
	GOTO        L_lineFollowPID325
	BTFSS       PORTD+0, 6 
	GOTO        L_lineFollowPID325
	BTFSS       PORTD+0, 7 
	GOTO        L_lineFollowPID325
	BTFSC       PORTB+0, 2 
	GOTO        L_lineFollowPID325
L__lineFollowPID527:
;linefollow.h,322 :: 		deviation = 0;
	CLRF        _deviation+0 
	CLRF        _deviation+1 
L_lineFollowPID325:
;linefollow.h,323 :: 		if( Sensor3==0 && Sensor4==0 && Sensor5==1 && Sensor6==0 && Sensor7==0)
	BTFSC       PORTD+0, 4 
	GOTO        L_lineFollowPID328
	BTFSC       PORTD+0, 5 
	GOTO        L_lineFollowPID328
	BTFSS       PORTD+0, 6 
	GOTO        L_lineFollowPID328
	BTFSC       PORTD+0, 7 
	GOTO        L_lineFollowPID328
	BTFSC       PORTB+0, 2 
	GOTO        L_lineFollowPID328
L__lineFollowPID526:
;linefollow.h,324 :: 		deviation = 0;
	CLRF        _deviation+0 
	CLRF        _deviation+1 
L_lineFollowPID328:
;linefollow.h,325 :: 		if( Sensor3==0 && Sensor4==0 && Sensor5==1 && Sensor6==1 && Sensor7==0)
	BTFSC       PORTD+0, 4 
	GOTO        L_lineFollowPID331
	BTFSC       PORTD+0, 5 
	GOTO        L_lineFollowPID331
	BTFSS       PORTD+0, 6 
	GOTO        L_lineFollowPID331
	BTFSS       PORTD+0, 7 
	GOTO        L_lineFollowPID331
	BTFSC       PORTB+0, 2 
	GOTO        L_lineFollowPID331
L__lineFollowPID525:
;linefollow.h,326 :: 		deviation = 0;
	CLRF        _deviation+0 
	CLRF        _deviation+1 
L_lineFollowPID331:
;linefollow.h,328 :: 		if( Sensor3==0 && Sensor4==0 && Sensor5==0 && Sensor6==1 && Sensor7==0)
	BTFSC       PORTD+0, 4 
	GOTO        L_lineFollowPID334
	BTFSC       PORTD+0, 5 
	GOTO        L_lineFollowPID334
	BTFSC       PORTD+0, 6 
	GOTO        L_lineFollowPID334
	BTFSS       PORTD+0, 7 
	GOTO        L_lineFollowPID334
	BTFSC       PORTB+0, 2 
	GOTO        L_lineFollowPID334
L__lineFollowPID524:
;linefollow.h,329 :: 		deviation = -1;
	MOVLW       255
	MOVWF       _deviation+0 
	MOVLW       255
	MOVWF       _deviation+1 
L_lineFollowPID334:
;linefollow.h,330 :: 		if( Sensor3==0 && Sensor4==0 && Sensor5==1 && Sensor6==1 && Sensor7==1)
	BTFSC       PORTD+0, 4 
	GOTO        L_lineFollowPID337
	BTFSC       PORTD+0, 5 
	GOTO        L_lineFollowPID337
	BTFSS       PORTD+0, 6 
	GOTO        L_lineFollowPID337
	BTFSS       PORTD+0, 7 
	GOTO        L_lineFollowPID337
	BTFSS       PORTB+0, 2 
	GOTO        L_lineFollowPID337
L__lineFollowPID523:
;linefollow.h,331 :: 		deviation = -2;
	MOVLW       254
	MOVWF       _deviation+0 
	MOVLW       255
	MOVWF       _deviation+1 
L_lineFollowPID337:
;linefollow.h,332 :: 		if( Sensor3==0 && Sensor4==0 && Sensor5==0 && Sensor6==1 && Sensor7==1)
	BTFSC       PORTD+0, 4 
	GOTO        L_lineFollowPID340
	BTFSC       PORTD+0, 5 
	GOTO        L_lineFollowPID340
	BTFSC       PORTD+0, 6 
	GOTO        L_lineFollowPID340
	BTFSS       PORTD+0, 7 
	GOTO        L_lineFollowPID340
	BTFSS       PORTB+0, 2 
	GOTO        L_lineFollowPID340
L__lineFollowPID522:
;linefollow.h,333 :: 		deviation = -3;
	MOVLW       253
	MOVWF       _deviation+0 
	MOVLW       255
	MOVWF       _deviation+1 
L_lineFollowPID340:
;linefollow.h,334 :: 		if( Sensor3==0 && Sensor4==0 && Sensor5==0 && Sensor6==0 && Sensor7==1)
	BTFSC       PORTD+0, 4 
	GOTO        L_lineFollowPID343
	BTFSC       PORTD+0, 5 
	GOTO        L_lineFollowPID343
	BTFSC       PORTD+0, 6 
	GOTO        L_lineFollowPID343
	BTFSC       PORTD+0, 7 
	GOTO        L_lineFollowPID343
	BTFSS       PORTB+0, 2 
	GOTO        L_lineFollowPID343
L__lineFollowPID521:
;linefollow.h,335 :: 		deviation = -4;
	MOVLW       252
	MOVWF       _deviation+0 
	MOVLW       255
	MOVWF       _deviation+1 
L_lineFollowPID343:
;linefollow.h,337 :: 		correction =  Kp*deviation + Ki*totalError + Kd*(deviation-previousDeviation);
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
;linefollow.h,338 :: 		totalError += correction;
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
;linefollow.h,339 :: 		previousDeviation = deviation;
	MOVF        _deviation+0, 0 
	MOVWF       _previousDeviation+0 
	MOVF        _deviation+1, 0 
	MOVWF       _previousDeviation+1 
;linefollow.h,341 :: 		PID_LeftRPM = MID_RPM - correction;
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
;linefollow.h,342 :: 		PID_RightRPM = MID_RPM + correction;
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
;linefollow.h,344 :: 		moveForward(PID_LeftRPM, PID_RightRPM);
	MOVF        FLOC__lineFollowPID+0, 0 
	MOVWF       FARG_moveForward_pwmLeft+0 
	MOVF        FLOC__lineFollowPID+1, 0 
	MOVWF       FARG_moveForward_pwmLeft+1 
	MOVF        R0, 0 
	MOVWF       FARG_moveForward_pwmRight+0 
	MOVF        R1, 0 
	MOVWF       FARG_moveForward_pwmRight+1 
	CALL        _moveForward+0, 0
;linefollow.h,350 :: 		}
	RETURN      0
; end of _lineFollowPID

_configure:

;configuration.h,9 :: 		void configure(){
;configuration.h,12 :: 		TRISA = 0b11111111;
	MOVLW       255
	MOVWF       TRISA+0 
;configuration.h,13 :: 		TRISB = 0b11111111;
	MOVLW       255
	MOVWF       TRISB+0 
;configuration.h,14 :: 		TRISC = 0b00000000;
	CLRF        TRISC+0 
;configuration.h,15 :: 		TRISD = 0b11110010;
	MOVLW       242
	MOVWF       TRISD+0 
;configuration.h,18 :: 		PORTA = 0;
	CLRF        PORTA+0 
;configuration.h,19 :: 		PORTB = 0;
	CLRF        PORTB+0 
;configuration.h,20 :: 		PORTC = 0;
	CLRF        PORTC+0 
;configuration.h,21 :: 		PORTD = 0;
	CLRF        PORTD+0 
;configuration.h,24 :: 		PWM1_Init(5000);
	BSF         T2CON+0, 0, 0
	BCF         T2CON+0, 1, 0
	MOVLW       249
	MOVWF       PR2+0, 0
	CALL        _PWM1_Init+0, 0
;configuration.h,25 :: 		PWM2_Init(5000);
	BSF         T2CON+0, 0, 0
	BCF         T2CON+0, 1, 0
	MOVLW       249
	MOVWF       PR2+0, 0
	CALL        _PWM2_Init+0, 0
;configuration.h,26 :: 		PWM1_Start();
	CALL        _PWM1_Start+0, 0
;configuration.h,27 :: 		PWM2_Start();
	CALL        _PWM2_Start+0, 0
;configuration.h,28 :: 		UART1_Init(9600);
	MOVLW       129
	MOVWF       SPBRG+0 
	BSF         TXSTA+0, 2, 0
	CALL        _UART1_Init+0, 0
;configuration.h,36 :: 		ADCON0 = 0b11000001;
	MOVLW       193
	MOVWF       ADCON0+0 
;configuration.h,37 :: 		ADCON1 = 0b00000000;
	CLRF        ADCON1+0 
;configuration.h,45 :: 		LEVEL = 0;
	CLRF        _LEVEL+0 
	CLRF        _LEVEL+1 
;configuration.h,46 :: 		LEVEL1_STATE  = NOT_REACHED;
	CLRF        _LEVEL1_STATE+0 
	CLRF        _LEVEL1_STATE+1 
;configuration.h,47 :: 		LEVEL2_STATE  = NOT_REACHED;
	CLRF        _LEVEL2_STATE+0 
	CLRF        _LEVEL2_STATE+1 
;configuration.h,48 :: 		LEVEL3_STATE  = NOT_REACHED;
	CLRF        _LEVEL3_STATE+0 
	CLRF        _LEVEL3_STATE+1 
;configuration.h,51 :: 		T0CON=0xC3;
	MOVLW       195
	MOVWF       T0CON+0 
;configuration.h,52 :: 		TMR0L=0x00;
	CLRF        TMR0L+0 
;configuration.h,53 :: 		INTCON.TMR0IE=1;
	BSF         INTCON+0, 5 
;configuration.h,55 :: 		T1CON=0x80;
	MOVLW       128
	MOVWF       T1CON+0 
;configuration.h,56 :: 		TMR1H=0x00;
	CLRF        TMR1H+0 
;configuration.h,57 :: 		TMR1L=0x00;
	CLRF        TMR1L+0 
;configuration.h,58 :: 		}
	RETURN      0
; end of _configure

_getDistanceIR_GP2D120:

;ir.h,9 :: 		float getDistanceIR_GP2D120(unsigned int ir_value){           //10-bit results
;ir.h,10 :: 		float voltage = ir_value/1024*5;
	CLRF        getDistanceIR_GP2D120_voltage_L0+0 
	CLRF        getDistanceIR_GP2D120_voltage_L0+1 
	CLRF        getDistanceIR_GP2D120_voltage_L0+2 
	CLRF        getDistanceIR_GP2D120_voltage_L0+3 
;ir.h,11 :: 		if( 610<=ir_value && ir_value<623)         //3cm - 3.75cm
	MOVLW       2
	SUBWF       FARG_getDistanceIR_GP2D120_ir_value+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__getDistanceIR_GP2D120566
	MOVLW       98
	SUBWF       FARG_getDistanceIR_GP2D120_ir_value+0, 0 
L__getDistanceIR_GP2D120566:
	BTFSS       STATUS+0, 0 
	GOTO        L_getDistanceIR_GP2D120346
	MOVLW       2
	SUBWF       FARG_getDistanceIR_GP2D120_ir_value+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__getDistanceIR_GP2D120567
	MOVLW       111
	SUBWF       FARG_getDistanceIR_GP2D120_ir_value+0, 0 
L__getDistanceIR_GP2D120567:
	BTFSC       STATUS+0, 0 
	GOTO        L_getDistanceIR_GP2D120346
L__getDistanceIR_GP2D120555:
;ir.h,12 :: 		return 3.0 - 12.5*(voltage - 3.04);
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
L_getDistanceIR_GP2D120346:
;ir.h,14 :: 		else if( 557<=ir_value && ir_value<610 )
	MOVLW       2
	SUBWF       FARG_getDistanceIR_GP2D120_ir_value+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__getDistanceIR_GP2D120568
	MOVLW       45
	SUBWF       FARG_getDistanceIR_GP2D120_ir_value+0, 0 
L__getDistanceIR_GP2D120568:
	BTFSS       STATUS+0, 0 
	GOTO        L_getDistanceIR_GP2D120350
	MOVLW       2
	SUBWF       FARG_getDistanceIR_GP2D120_ir_value+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__getDistanceIR_GP2D120569
	MOVLW       98
	SUBWF       FARG_getDistanceIR_GP2D120_ir_value+0, 0 
L__getDistanceIR_GP2D120569:
	BTFSC       STATUS+0, 0 
	GOTO        L_getDistanceIR_GP2D120350
L__getDistanceIR_GP2D120554:
;ir.h,15 :: 		return 3.75 - 1.04*(voltage - 2.98);  //3.75 - 4cm
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
L_getDistanceIR_GP2D120350:
;ir.h,17 :: 		else if( 481<=ir_value && ir_value<557 )
	MOVLW       1
	SUBWF       FARG_getDistanceIR_GP2D120_ir_value+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__getDistanceIR_GP2D120570
	MOVLW       225
	SUBWF       FARG_getDistanceIR_GP2D120_ir_value+0, 0 
L__getDistanceIR_GP2D120570:
	BTFSS       STATUS+0, 0 
	GOTO        L_getDistanceIR_GP2D120354
	MOVLW       2
	SUBWF       FARG_getDistanceIR_GP2D120_ir_value+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__getDistanceIR_GP2D120571
	MOVLW       45
	SUBWF       FARG_getDistanceIR_GP2D120_ir_value+0, 0 
L__getDistanceIR_GP2D120571:
	BTFSC       STATUS+0, 0 
	GOTO        L_getDistanceIR_GP2D120354
L__getDistanceIR_GP2D120553:
;ir.h,18 :: 		return 5 - 2.5*(voltage - 2.75);       //4cm - 5cm
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
L_getDistanceIR_GP2D120354:
;ir.h,20 :: 		else if( 409<=ir_value && ir_value<481 )
	MOVLW       1
	SUBWF       FARG_getDistanceIR_GP2D120_ir_value+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__getDistanceIR_GP2D120572
	MOVLW       153
	SUBWF       FARG_getDistanceIR_GP2D120_ir_value+0, 0 
L__getDistanceIR_GP2D120572:
	BTFSS       STATUS+0, 0 
	GOTO        L_getDistanceIR_GP2D120358
	MOVLW       1
	SUBWF       FARG_getDistanceIR_GP2D120_ir_value+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__getDistanceIR_GP2D120573
	MOVLW       225
	SUBWF       FARG_getDistanceIR_GP2D120_ir_value+0, 0 
L__getDistanceIR_GP2D120573:
	BTFSC       STATUS+0, 0 
	GOTO        L_getDistanceIR_GP2D120358
L__getDistanceIR_GP2D120552:
;ir.h,21 :: 		return 6 - 2.85*(voltage - 2.35);       //5cm - 6cm
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
L_getDistanceIR_GP2D120358:
;ir.h,23 :: 		else if( 364<=ir_value && ir_value<409 )
	MOVLW       1
	SUBWF       FARG_getDistanceIR_GP2D120_ir_value+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__getDistanceIR_GP2D120574
	MOVLW       108
	SUBWF       FARG_getDistanceIR_GP2D120_ir_value+0, 0 
L__getDistanceIR_GP2D120574:
	BTFSS       STATUS+0, 0 
	GOTO        L_getDistanceIR_GP2D120362
	MOVLW       1
	SUBWF       FARG_getDistanceIR_GP2D120_ir_value+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__getDistanceIR_GP2D120575
	MOVLW       153
	SUBWF       FARG_getDistanceIR_GP2D120_ir_value+0, 0 
L__getDistanceIR_GP2D120575:
	BTFSC       STATUS+0, 0 
	GOTO        L_getDistanceIR_GP2D120362
L__getDistanceIR_GP2D120551:
;ir.h,24 :: 		return 7 - 4*(voltage - 2);             //6cm - 7cm
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
L_getDistanceIR_GP2D120362:
;ir.h,26 :: 		else if( 317<=ir_value && ir_value<364 )
	MOVLW       1
	SUBWF       FARG_getDistanceIR_GP2D120_ir_value+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__getDistanceIR_GP2D120576
	MOVLW       61
	SUBWF       FARG_getDistanceIR_GP2D120_ir_value+0, 0 
L__getDistanceIR_GP2D120576:
	BTFSS       STATUS+0, 0 
	GOTO        L_getDistanceIR_GP2D120366
	MOVLW       1
	SUBWF       FARG_getDistanceIR_GP2D120_ir_value+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__getDistanceIR_GP2D120577
	MOVLW       108
	SUBWF       FARG_getDistanceIR_GP2D120_ir_value+0, 0 
L__getDistanceIR_GP2D120577:
	BTFSC       STATUS+0, 0 
	GOTO        L_getDistanceIR_GP2D120366
L__getDistanceIR_GP2D120550:
;ir.h,27 :: 		return 8 - 5*(voltage - 1.75);          //7cm - 8cm
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
L_getDistanceIR_GP2D120366:
;ir.h,29 :: 		else if( 286<=ir_value && ir_value<317 )
	MOVLW       1
	SUBWF       FARG_getDistanceIR_GP2D120_ir_value+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__getDistanceIR_GP2D120578
	MOVLW       30
	SUBWF       FARG_getDistanceIR_GP2D120_ir_value+0, 0 
L__getDistanceIR_GP2D120578:
	BTFSS       STATUS+0, 0 
	GOTO        L_getDistanceIR_GP2D120370
	MOVLW       1
	SUBWF       FARG_getDistanceIR_GP2D120_ir_value+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__getDistanceIR_GP2D120579
	MOVLW       61
	SUBWF       FARG_getDistanceIR_GP2D120_ir_value+0, 0 
L__getDistanceIR_GP2D120579:
	BTFSC       STATUS+0, 0 
	GOTO        L_getDistanceIR_GP2D120370
L__getDistanceIR_GP2D120549:
;ir.h,30 :: 		return 9 - 6.667*(voltage - 1.55);      //8cm - 9cm
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
L_getDistanceIR_GP2D120370:
;ir.h,32 :: 		else if( 256<=ir_value && ir_value<286 )
	MOVLW       1
	SUBWF       FARG_getDistanceIR_GP2D120_ir_value+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__getDistanceIR_GP2D120580
	MOVLW       0
	SUBWF       FARG_getDistanceIR_GP2D120_ir_value+0, 0 
L__getDistanceIR_GP2D120580:
	BTFSS       STATUS+0, 0 
	GOTO        L_getDistanceIR_GP2D120374
	MOVLW       1
	SUBWF       FARG_getDistanceIR_GP2D120_ir_value+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__getDistanceIR_GP2D120581
	MOVLW       30
	SUBWF       FARG_getDistanceIR_GP2D120_ir_value+0, 0 
L__getDistanceIR_GP2D120581:
	BTFSC       STATUS+0, 0 
	GOTO        L_getDistanceIR_GP2D120374
L__getDistanceIR_GP2D120548:
;ir.h,33 :: 		return 10 - 6.667*(voltage - 1.4);       //9cm - 10cm
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
L_getDistanceIR_GP2D120374:
;ir.h,35 :: 		else if( 215<=ir_value && ir_value<256 )
	MOVLW       0
	SUBWF       FARG_getDistanceIR_GP2D120_ir_value+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__getDistanceIR_GP2D120582
	MOVLW       215
	SUBWF       FARG_getDistanceIR_GP2D120_ir_value+0, 0 
L__getDistanceIR_GP2D120582:
	BTFSS       STATUS+0, 0 
	GOTO        L_getDistanceIR_GP2D120378
	MOVLW       1
	SUBWF       FARG_getDistanceIR_GP2D120_ir_value+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__getDistanceIR_GP2D120583
	MOVLW       0
	SUBWF       FARG_getDistanceIR_GP2D120_ir_value+0, 0 
L__getDistanceIR_GP2D120583:
	BTFSC       STATUS+0, 0 
	GOTO        L_getDistanceIR_GP2D120378
L__getDistanceIR_GP2D120547:
;ir.h,36 :: 		return 12 - 10*(voltage - 1.25);         //10cm - 12cm
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
L_getDistanceIR_GP2D120378:
;ir.h,38 :: 		else if( 186<=ir_value && ir_value<215 )
	MOVLW       0
	SUBWF       FARG_getDistanceIR_GP2D120_ir_value+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__getDistanceIR_GP2D120584
	MOVLW       186
	SUBWF       FARG_getDistanceIR_GP2D120_ir_value+0, 0 
L__getDistanceIR_GP2D120584:
	BTFSS       STATUS+0, 0 
	GOTO        L_getDistanceIR_GP2D120382
	MOVLW       0
	SUBWF       FARG_getDistanceIR_GP2D120_ir_value+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__getDistanceIR_GP2D120585
	MOVLW       215
	SUBWF       FARG_getDistanceIR_GP2D120_ir_value+0, 0 
L__getDistanceIR_GP2D120585:
	BTFSC       STATUS+0, 0 
	GOTO        L_getDistanceIR_GP2D120382
L__getDistanceIR_GP2D120546:
;ir.h,39 :: 		return 14 - 15.38*(voltage - 1.05);      //12cm - 14cm
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
L_getDistanceIR_GP2D120382:
;ir.h,41 :: 		else if( 166<=ir_value && ir_value<186 )
	MOVLW       0
	SUBWF       FARG_getDistanceIR_GP2D120_ir_value+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__getDistanceIR_GP2D120586
	MOVLW       166
	SUBWF       FARG_getDistanceIR_GP2D120_ir_value+0, 0 
L__getDistanceIR_GP2D120586:
	BTFSS       STATUS+0, 0 
	GOTO        L_getDistanceIR_GP2D120386
	MOVLW       0
	SUBWF       FARG_getDistanceIR_GP2D120_ir_value+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__getDistanceIR_GP2D120587
	MOVLW       186
	SUBWF       FARG_getDistanceIR_GP2D120_ir_value+0, 0 
L__getDistanceIR_GP2D120587:
	BTFSC       STATUS+0, 0 
	GOTO        L_getDistanceIR_GP2D120386
L__getDistanceIR_GP2D120545:
;ir.h,42 :: 		return 16 - 20*(voltage - 0.94);         //14cm - 16cm
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
L_getDistanceIR_GP2D120386:
;ir.h,44 :: 		else if( 147<=ir_value && ir_value<166 )
	MOVLW       0
	SUBWF       FARG_getDistanceIR_GP2D120_ir_value+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__getDistanceIR_GP2D120588
	MOVLW       147
	SUBWF       FARG_getDistanceIR_GP2D120_ir_value+0, 0 
L__getDistanceIR_GP2D120588:
	BTFSS       STATUS+0, 0 
	GOTO        L_getDistanceIR_GP2D120390
	MOVLW       0
	SUBWF       FARG_getDistanceIR_GP2D120_ir_value+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__getDistanceIR_GP2D120589
	MOVLW       166
	SUBWF       FARG_getDistanceIR_GP2D120_ir_value+0, 0 
L__getDistanceIR_GP2D120589:
	BTFSC       STATUS+0, 0 
	GOTO        L_getDistanceIR_GP2D120390
L__getDistanceIR_GP2D120544:
;ir.h,45 :: 		return 18 - 22.23*(voltage - 0.81);      //16cm - 18cm
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
L_getDistanceIR_GP2D120390:
;ir.h,47 :: 		else if( 133<=ir_value && ir_value<147 )
	MOVLW       0
	SUBWF       FARG_getDistanceIR_GP2D120_ir_value+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__getDistanceIR_GP2D120590
	MOVLW       133
	SUBWF       FARG_getDistanceIR_GP2D120_ir_value+0, 0 
L__getDistanceIR_GP2D120590:
	BTFSS       STATUS+0, 0 
	GOTO        L_getDistanceIR_GP2D120394
	MOVLW       0
	SUBWF       FARG_getDistanceIR_GP2D120_ir_value+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__getDistanceIR_GP2D120591
	MOVLW       147
	SUBWF       FARG_getDistanceIR_GP2D120_ir_value+0, 0 
L__getDistanceIR_GP2D120591:
	BTFSC       STATUS+0, 0 
	GOTO        L_getDistanceIR_GP2D120394
L__getDistanceIR_GP2D120543:
;ir.h,48 :: 		return 20 - 28.57*(voltage - 0.65);       //18cm - 20cm
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
L_getDistanceIR_GP2D120394:
;ir.h,50 :: 		else if( 106<=ir_value && ir_value<133 )
	MOVLW       0
	SUBWF       FARG_getDistanceIR_GP2D120_ir_value+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__getDistanceIR_GP2D120592
	MOVLW       106
	SUBWF       FARG_getDistanceIR_GP2D120_ir_value+0, 0 
L__getDistanceIR_GP2D120592:
	BTFSS       STATUS+0, 0 
	GOTO        L_getDistanceIR_GP2D120398
	MOVLW       0
	SUBWF       FARG_getDistanceIR_GP2D120_ir_value+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__getDistanceIR_GP2D120593
	MOVLW       133
	SUBWF       FARG_getDistanceIR_GP2D120_ir_value+0, 0 
L__getDistanceIR_GP2D120593:
	BTFSC       STATUS+0, 0 
	GOTO        L_getDistanceIR_GP2D120398
L__getDistanceIR_GP2D120542:
;ir.h,51 :: 		return 25 - 45.45*(voltage - 0.52);       //20cm - 25cm
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
L_getDistanceIR_GP2D120398:
;ir.h,53 :: 		else if( 88<=ir_value && ir_value<106 )
	MOVLW       0
	SUBWF       FARG_getDistanceIR_GP2D120_ir_value+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__getDistanceIR_GP2D120594
	MOVLW       88
	SUBWF       FARG_getDistanceIR_GP2D120_ir_value+0, 0 
L__getDistanceIR_GP2D120594:
	BTFSS       STATUS+0, 0 
	GOTO        L_getDistanceIR_GP2D120402
	MOVLW       0
	SUBWF       FARG_getDistanceIR_GP2D120_ir_value+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__getDistanceIR_GP2D120595
	MOVLW       106
	SUBWF       FARG_getDistanceIR_GP2D120_ir_value+0, 0 
L__getDistanceIR_GP2D120595:
	BTFSC       STATUS+0, 0 
	GOTO        L_getDistanceIR_GP2D120402
L__getDistanceIR_GP2D120541:
;ir.h,54 :: 		return 30 - 55*(voltage - 0.43);           //25cm - 30cm
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
L_getDistanceIR_GP2D120402:
;ir.h,56 :: 		else if( 78<=ir_value && ir_value<88 )
	MOVLW       0
	SUBWF       FARG_getDistanceIR_GP2D120_ir_value+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__getDistanceIR_GP2D120596
	MOVLW       78
	SUBWF       FARG_getDistanceIR_GP2D120_ir_value+0, 0 
L__getDistanceIR_GP2D120596:
	BTFSS       STATUS+0, 0 
	GOTO        L_getDistanceIR_GP2D120406
	MOVLW       0
	SUBWF       FARG_getDistanceIR_GP2D120_ir_value+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__getDistanceIR_GP2D120597
	MOVLW       88
	SUBWF       FARG_getDistanceIR_GP2D120_ir_value+0, 0 
L__getDistanceIR_GP2D120597:
	BTFSC       STATUS+0, 0 
	GOTO        L_getDistanceIR_GP2D120406
L__getDistanceIR_GP2D120540:
;ir.h,57 :: 		return 35 - 100*(voltage - 0.38);         //30cm - 35cm
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
L_getDistanceIR_GP2D120406:
;ir.h,59 :: 		else if( 65<=ir_value && ir_value<78 )
	MOVLW       0
	SUBWF       FARG_getDistanceIR_GP2D120_ir_value+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__getDistanceIR_GP2D120598
	MOVLW       65
	SUBWF       FARG_getDistanceIR_GP2D120_ir_value+0, 0 
L__getDistanceIR_GP2D120598:
	BTFSS       STATUS+0, 0 
	GOTO        L_getDistanceIR_GP2D120410
	MOVLW       0
	SUBWF       FARG_getDistanceIR_GP2D120_ir_value+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__getDistanceIR_GP2D120599
	MOVLW       78
	SUBWF       FARG_getDistanceIR_GP2D120_ir_value+0, 0 
L__getDistanceIR_GP2D120599:
	BTFSC       STATUS+0, 0 
	GOTO        L_getDistanceIR_GP2D120410
L__getDistanceIR_GP2D120539:
;ir.h,60 :: 		return 40 - 83.33*(voltage - 0.32);       //35cm - 40cm
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
L_getDistanceIR_GP2D120410:
;ir.h,62 :: 		return 50;
	MOVLW       0
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	MOVLW       72
	MOVWF       R2 
	MOVLW       132
	MOVWF       R3 
;ir.h,63 :: 		}
	RETURN      0
; end of _getDistanceIR_GP2D120

_getSonarDistance:

;sonar.h,7 :: 		float getSonarDistance(){
;sonar.h,8 :: 		TRIG = 0;
	BCF         PORTD+0, 0 
;sonar.h,9 :: 		delay_us(10);
	MOVLW       16
	MOVWF       R13, 0
L_getSonarDistance412:
	DECFSZ      R13, 1, 0
	BRA         L_getSonarDistance412
	NOP
;sonar.h,10 :: 		TRIG = 1;
	BSF         PORTD+0, 0 
;sonar.h,11 :: 		delay_us(10);
	MOVLW       16
	MOVWF       R13, 0
L_getSonarDistance413:
	DECFSZ      R13, 1, 0
	BRA         L_getSonarDistance413
	NOP
;sonar.h,12 :: 		TRIG = 0;
	BCF         PORTD+0, 0 
;sonar.h,14 :: 		while(ECHO==0);
L_getSonarDistance414:
	BTFSC       PORTD+0, 1 
	GOTO        L_getSonarDistance415
	GOTO        L_getSonarDistance414
L_getSonarDistance415:
;sonar.h,15 :: 		_counter = 0;
	CLRF        __counter+0 
	CLRF        __counter+1 
;sonar.h,17 :: 		while(ECHO==1){
L_getSonarDistance416:
	BTFSS       PORTD+0, 1 
	GOTO        L_getSonarDistance417
;sonar.h,18 :: 		_counter++;
	INFSNZ      __counter+0, 1 
	INCF        __counter+1, 1 
;sonar.h,19 :: 		}
	GOTO        L_getSonarDistance416
L_getSonarDistance417:
;sonar.h,20 :: 		_responseTime = _counter * 0.2 * 0.000001; //in s
	MOVF        __counter+0, 0 
	MOVWF       R0 
	MOVF        __counter+1, 0 
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
	MOVWF       __responseTime+0 
	MOVF        R1, 0 
	MOVWF       __responseTime+1 
	MOVF        R2, 0 
	MOVWF       __responseTime+2 
	MOVF        R3, 0 
	MOVWF       __responseTime+3 
;sonar.h,21 :: 		_distance = 340 * _responseTime * 100 /2;// in cm
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
	MOVWF       __distance+0 
	MOVF        R1, 0 
	MOVWF       __distance+1 
	MOVF        R2, 0 
	MOVWF       __distance+2 
	MOVF        R3, 0 
	MOVWF       __distance+3 
;sonar.h,22 :: 		return _distance;
;sonar.h,23 :: 		}
	RETURN      0
; end of _getSonarDistance

_getDistanceSonar2:

;sonar.h,25 :: 		unsigned short getDistanceSonar2(char c){
;sonar.h,29 :: 		TMR1H=0x00;
	CLRF        TMR1H+0 
;sonar.h,30 :: 		TMR1L=0x00;
	CLRF        TMR1L+0 
;sonar.h,31 :: 		if(c=='L'){
	MOVF        FARG_getDistanceSonar2_c+0, 0 
	XORLW       76
	BTFSS       STATUS+0, 2 
	GOTO        L_getDistanceSonar2418
;sonar.h,33 :: 		TRIG = 0;
	BCF         PORTD+0, 0 
;sonar.h,34 :: 		delay_us(2);
	MOVLW       3
	MOVWF       R13, 0
L_getDistanceSonar2419:
	DECFSZ      R13, 1, 0
	BRA         L_getDistanceSonar2419
;sonar.h,35 :: 		TRIG = 1;
	BSF         PORTD+0, 0 
;sonar.h,36 :: 		delay_us(5);
	MOVLW       8
	MOVWF       R13, 0
L_getDistanceSonar2420:
	DECFSZ      R13, 1, 0
	BRA         L_getDistanceSonar2420
;sonar.h,37 :: 		TRIG =0;
	BCF         PORTD+0, 0 
;sonar.h,39 :: 		while(!ECHO)
L_getDistanceSonar2421:
	BTFSC       PORTD+0, 1 
	GOTO        L_getDistanceSonar2422
;sonar.h,41 :: 		L=(TMR1L);
	MOVF        TMR1L+0, 0 
	MOVWF       getDistanceSonar2_L_L0+0 
	MOVLW       0
	MOVWF       getDistanceSonar2_L_L0+1 
;sonar.h,42 :: 		H=(TMR1H);
	MOVF        TMR1H+0, 0 
	MOVWF       getDistanceSonar2_H_L0+0 
	MOVLW       0
	MOVWF       getDistanceSonar2_H_L0+1 
;sonar.h,43 :: 		if(H>0xF0)
	MOVLW       0
	MOVWF       R0 
	MOVF        getDistanceSonar2_H_L0+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__getDistanceSonar2600
	MOVF        getDistanceSonar2_H_L0+0, 0 
	SUBLW       240
L__getDistanceSonar2600:
	BTFSC       STATUS+0, 0 
	GOTO        L_getDistanceSonar2423
;sonar.h,44 :: 		break;
	GOTO        L_getDistanceSonar2422
L_getDistanceSonar2423:
;sonar.h,45 :: 		}
	GOTO        L_getDistanceSonar2421
L_getDistanceSonar2422:
;sonar.h,46 :: 		TMR1H=0;
	CLRF        TMR1H+0 
;sonar.h,47 :: 		TMR1L=0;
	CLRF        TMR1L+0 
;sonar.h,48 :: 		T1CON.TMR1ON=1;
	BSF         T1CON+0, 0 
;sonar.h,49 :: 		while(ECHO)
L_getDistanceSonar2424:
	BTFSS       PORTD+0, 1 
	GOTO        L_getDistanceSonar2425
;sonar.h,51 :: 		L=(TMR1L);
	MOVF        TMR1L+0, 0 
	MOVWF       getDistanceSonar2_L_L0+0 
	MOVLW       0
	MOVWF       getDistanceSonar2_L_L0+1 
;sonar.h,52 :: 		H=(TMR1H);
	MOVF        TMR1H+0, 0 
	MOVWF       getDistanceSonar2_H_L0+0 
	MOVLW       0
	MOVWF       getDistanceSonar2_H_L0+1 
;sonar.h,53 :: 		if(H>0xF0)
	MOVLW       0
	MOVWF       R0 
	MOVF        getDistanceSonar2_H_L0+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__getDistanceSonar2601
	MOVF        getDistanceSonar2_H_L0+0, 0 
	SUBLW       240
L__getDistanceSonar2601:
	BTFSC       STATUS+0, 0 
	GOTO        L_getDistanceSonar2426
;sonar.h,54 :: 		break;
	GOTO        L_getDistanceSonar2425
L_getDistanceSonar2426:
;sonar.h,55 :: 		}
	GOTO        L_getDistanceSonar2424
L_getDistanceSonar2425:
;sonar.h,56 :: 		L=(TMR1L);
	MOVF        TMR1L+0, 0 
	MOVWF       getDistanceSonar2_L_L0+0 
	MOVLW       0
	MOVWF       getDistanceSonar2_L_L0+1 
;sonar.h,57 :: 		H=(TMR1H);
	MOVF        TMR1H+0, 0 
	MOVWF       getDistanceSonar2_H_L0+0 
	MOVLW       0
	MOVWF       getDistanceSonar2_H_L0+1 
;sonar.h,58 :: 		x=(H*256 + L)*0.2;
	MOVF        getDistanceSonar2_H_L0+0, 0 
	MOVWF       R1 
	CLRF        R0 
	MOVF        getDistanceSonar2_L_L0+0, 0 
	ADDWF       R0, 1 
	MOVF        getDistanceSonar2_L_L0+1, 0 
	ADDWFC      R1, 1 
	CALL        _Word2Double+0, 0
	MOVLW       205
	MOVWF       R4 
	MOVLW       204
	MOVWF       R5 
	MOVLW       76
	MOVWF       R6 
	MOVLW       124
	MOVWF       R7 
	CALL        _Mul_32x32_FP+0, 0
;sonar.h,59 :: 		y= (x/2)/29.1;
	MOVLW       0
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVLW       0
	MOVWF       R6 
	MOVLW       128
	MOVWF       R7 
	CALL        _Div_32x32_FP+0, 0
	MOVLW       205
	MOVWF       R4 
	MOVLW       204
	MOVWF       R5 
	MOVLW       104
	MOVWF       R6 
	MOVLW       131
	MOVWF       R7 
	CALL        _Div_32x32_FP+0, 0
;sonar.h,60 :: 		return (int)y;
	CALL        _Double2Int+0, 0
	RETURN      0
;sonar.h,90 :: 		}*/
L_getDistanceSonar2418:
;sonar.h,91 :: 		}
	RETURN      0
; end of _getDistanceSonar2

_main:

;Main 5.0V.c,19 :: 		void main() {
;Main 5.0V.c,20 :: 		configure();
	CALL        _configure+0, 0
;Main 5.0V.c,21 :: 		setPID();
	CALL        _setPID+0, 0
;Main 5.0V.c,22 :: 		sendText("Starting...");
	MOVLW       ?lstr34_Main_325.0V+0
	MOVWF       FARG_sendText_aText+0 
	MOVLW       hi_addr(?lstr34_Main_325.0V+0)
	MOVWF       FARG_sendText_aText+1 
	CALL        _sendText+0, 0
;Main 5.0V.c,26 :: 		LEVEL1_STATE = NOT_REACHED;
	CLRF        _LEVEL1_STATE+0 
	CLRF        _LEVEL1_STATE+1 
;Main 5.0V.c,27 :: 		sendText("Starting Block  ");
	MOVLW       ?lstr35_Main_325.0V+0
	MOVWF       FARG_sendText_aText+0 
	MOVLW       hi_addr(?lstr35_Main_325.0V+0)
	MOVWF       FARG_sendText_aText+1 
	CALL        _sendText+0, 0
;Main 5.0V.c,28 :: 		LEVEL = 0;
	CLRF        _LEVEL+0 
	CLRF        _LEVEL+1 
;Main 5.0V.c,30 :: 		while(isAllWhite())
L_main427:
	CALL        _isAllWhite+0, 0
	MOVF        R0, 0 
	IORWF       R1, 0 
	BTFSC       STATUS+0, 2 
	GOTO        L_main428
;Main 5.0V.c,31 :: 		moveStraightSlow();
	CALL        _moveStraightSlow+0, 0
	GOTO        L_main427
L_main428:
;Main 5.0V.c,32 :: 		LEVEL = 1;
	MOVLW       1
	MOVWF       _LEVEL+0 
	MOVLW       0
	MOVWF       _LEVEL+1 
;Main 5.0V.c,33 :: 		sendText("Level 1 Starting  ");
	MOVLW       ?lstr36_Main_325.0V+0
	MOVWF       FARG_sendText_aText+0 
	MOVLW       hi_addr(?lstr36_Main_325.0V+0)
	MOVWF       FARG_sendText_aText+1 
	CALL        _sendText+0, 0
;Main 5.0V.c,34 :: 		LEVEL1_STATE = REACHED;
	MOVLW       1
	MOVWF       _LEVEL1_STATE+0 
	MOVLW       0
	MOVWF       _LEVEL1_STATE+1 
;Main 5.0V.c,35 :: 		stop();
	CALL        _stop+0, 0
;Main 5.0V.c,39 :: 		moveForward(205,200);
	MOVLW       205
	MOVWF       FARG_moveForward_pwmLeft+0 
	MOVLW       0
	MOVWF       FARG_moveForward_pwmLeft+1 
	MOVLW       200
	MOVWF       FARG_moveForward_pwmRight+0 
	MOVLW       0
	MOVWF       FARG_moveForward_pwmRight+1 
	CALL        _moveForward+0, 0
;Main 5.0V.c,40 :: 		delay_ms(100);
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       138
	MOVWF       R12, 0
	MOVLW       85
	MOVWF       R13, 0
L_main429:
	DECFSZ      R13, 1, 0
	BRA         L_main429
	DECFSZ      R12, 1, 0
	BRA         L_main429
	DECFSZ      R11, 1, 0
	BRA         L_main429
	NOP
	NOP
;Main 5.0V.c,41 :: 		while(!isAllBlack())
L_main430:
	CALL        _isAllBlack+0, 0
	MOVF        R0, 0 
	IORWF       R1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_main431
;Main 5.0V.c,42 :: 		lineFollowNormalWorked();
	CALL        _lineFollowNormalWorked+0, 0
	GOTO        L_main430
L_main431:
;Main 5.0V.c,44 :: 		stop();
	CALL        _stop+0, 0
;Main 5.0V.c,45 :: 		sendText("  End of Level 1. Level 2 Starting  ");
	MOVLW       ?lstr37_Main_325.0V+0
	MOVWF       FARG_sendText_aText+0 
	MOVLW       hi_addr(?lstr37_Main_325.0V+0)
	MOVWF       FARG_sendText_aText+1 
	CALL        _sendText+0, 0
;Main 5.0V.c,46 :: 		LEVEL1_STATE = COMPLETED;
	MOVLW       2
	MOVWF       _LEVEL1_STATE+0 
	MOVLW       0
	MOVWF       _LEVEL1_STATE+1 
;Main 5.0V.c,47 :: 		LEVEL2_STATE = REACHED;
	MOVLW       1
	MOVWF       _LEVEL2_STATE+0 
	MOVLW       0
	MOVWF       _LEVEL2_STATE+1 
;Main 5.0V.c,48 :: 		LEVEL = 2;
	MOVLW       2
	MOVWF       _LEVEL+0 
	MOVLW       0
	MOVWF       _LEVEL+1 
;Main 5.0V.c,52 :: 		while(1)
L_main432:
;Main 5.0V.c,53 :: 		stop();
	CALL        _stop+0, 0
	GOTO        L_main432
;Main 5.0V.c,76 :: 		}
	GOTO        $+0
; end of _main

_isRightSafe:

;Main 5.0V.c,78 :: 		int isRightSafe(){
;Main 5.0V.c,79 :: 		ir_value = ADC_Read(IRSensorRight);
	MOVLW       0
	BTFSC       PORTA+0, 1 
	MOVLW       1
	MOVWF       FARG_ADC_Read_channel+0 
	CALL        _ADC_Read+0, 0
	MOVF        R0, 0 
	MOVWF       _ir_value+0 
	MOVF        R1, 0 
	MOVWF       _ir_value+1 
;Main 5.0V.c,80 :: 		if(250<=ir_value && ir_value<800){                         // ~5cm
	MOVLW       0
	SUBWF       R1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__isRightSafe602
	MOVLW       250
	SUBWF       R0, 0 
L__isRightSafe602:
	BTFSS       STATUS+0, 0 
	GOTO        L_isRightSafe450
	MOVLW       3
	SUBWF       _ir_value+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__isRightSafe603
	MOVLW       32
	SUBWF       _ir_value+0, 0 
L__isRightSafe603:
	BTFSC       STATUS+0, 0 
	GOTO        L_isRightSafe450
L__isRightSafe560:
;Main 5.0V.c,81 :: 		return FALSE;
	CLRF        R0 
	CLRF        R1 
	RETURN      0
;Main 5.0V.c,82 :: 		}
L_isRightSafe450:
;Main 5.0V.c,83 :: 		return TRUE;
	MOVLW       1
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
;Main 5.0V.c,84 :: 		}
	RETURN      0
; end of _isRightSafe

_isMiddleSafe:

;Main 5.0V.c,86 :: 		int isMiddleSafe(){
;Main 5.0V.c,87 :: 		ir_value = ADC_Read(IRSensorCenter);
	MOVLW       0
	BTFSC       PORTA+0, 0 
	MOVLW       1
	MOVWF       FARG_ADC_Read_channel+0 
	CALL        _ADC_Read+0, 0
	MOVF        R0, 0 
	MOVWF       _ir_value+0 
	MOVF        R1, 0 
	MOVWF       _ir_value+1 
;Main 5.0V.c,88 :: 		if(250<=ir_value && ir_value<800){                         // ~5cm
	MOVLW       0
	SUBWF       R1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__isMiddleSafe604
	MOVLW       250
	SUBWF       R0, 0 
L__isMiddleSafe604:
	BTFSS       STATUS+0, 0 
	GOTO        L_isMiddleSafe453
	MOVLW       3
	SUBWF       _ir_value+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__isMiddleSafe605
	MOVLW       32
	SUBWF       _ir_value+0, 0 
L__isMiddleSafe605:
	BTFSC       STATUS+0, 0 
	GOTO        L_isMiddleSafe453
L__isMiddleSafe561:
;Main 5.0V.c,89 :: 		return FALSE;
	CLRF        R0 
	CLRF        R1 
	RETURN      0
;Main 5.0V.c,90 :: 		}
L_isMiddleSafe453:
;Main 5.0V.c,91 :: 		return TRUE;
	MOVLW       1
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
;Main 5.0V.c,92 :: 		}
	RETURN      0
; end of _isMiddleSafe

_isLeftSafe:

;Main 5.0V.c,94 :: 		int isLeftSafe(){
;Main 5.0V.c,95 :: 		ir_value = ADC_Read(IRSensorLeft);
	MOVLW       0
	BTFSC       PORTA+0, 2 
	MOVLW       1
	MOVWF       FARG_ADC_Read_channel+0 
	CALL        _ADC_Read+0, 0
	MOVF        R0, 0 
	MOVWF       _ir_value+0 
	MOVF        R1, 0 
	MOVWF       _ir_value+1 
;Main 5.0V.c,96 :: 		if(250<=ir_value && ir_value<800){                         // ~5cm
	MOVLW       0
	SUBWF       R1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__isLeftSafe606
	MOVLW       250
	SUBWF       R0, 0 
L__isLeftSafe606:
	BTFSS       STATUS+0, 0 
	GOTO        L_isLeftSafe456
	MOVLW       3
	SUBWF       _ir_value+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__isLeftSafe607
	MOVLW       32
	SUBWF       _ir_value+0, 0 
L__isLeftSafe607:
	BTFSC       STATUS+0, 0 
	GOTO        L_isLeftSafe456
L__isLeftSafe562:
;Main 5.0V.c,97 :: 		return FALSE;
	CLRF        R0 
	CLRF        R1 
	RETURN      0
;Main 5.0V.c,98 :: 		}
L_isLeftSafe456:
;Main 5.0V.c,99 :: 		return TRUE;
	MOVLW       1
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
;Main 5.0V.c,100 :: 		}
	RETURN      0
; end of _isLeftSafe

_moveStraightSlow:

;Main 5.0V.c,102 :: 		void moveStraightSlow(){
;Main 5.0V.c,103 :: 		moveForward(205,200);
	MOVLW       205
	MOVWF       FARG_moveForward_pwmLeft+0 
	MOVLW       0
	MOVWF       FARG_moveForward_pwmLeft+1 
	MOVLW       200
	MOVWF       FARG_moveForward_pwmRight+0 
	MOVLW       0
	MOVWF       FARG_moveForward_pwmRight+1 
	CALL        _moveForward+0, 0
;Main 5.0V.c,104 :: 		}
	RETURN      0
; end of _moveStraightSlow

_goThroughObstacles:

;Main 5.0V.c,106 :: 		void goThroughObstacles(){
;Main 5.0V.c,107 :: 		distanceSonar = getDistanceSonar2('L');
	MOVLW       76
	MOVWF       FARG_getDistanceSonar2_c+0 
	CALL        _getDistanceSonar2+0, 0
	MOVF        R0, 0 
	MOVWF       _distanceSonar+0 
;Main 5.0V.c,108 :: 		if( distanceSonar < 20 ){
	MOVLW       20
	SUBWF       R0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_goThroughObstacles457
;Main 5.0V.c,109 :: 		if( DIRECTION >= 0 ){
	MOVLW       128
	XORWF       _DIRECTION+1, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__goThroughObstacles608
	MOVLW       0
	SUBWF       _DIRECTION+0, 0 
L__goThroughObstacles608:
	BTFSS       STATUS+0, 0 
	GOTO        L_goThroughObstacles458
;Main 5.0V.c,110 :: 		sendText(" rotateByDegree -30  ");
	MOVLW       ?lstr39_Main_325.0V+0
	MOVWF       FARG_sendText_aText+0 
	MOVLW       hi_addr(?lstr39_Main_325.0V+0)
	MOVWF       FARG_sendText_aText+1 
	CALL        _sendText+0, 0
;Main 5.0V.c,111 :: 		rotateByDegree(-30);
	MOVLW       226
	MOVWF       FARG_rotateByDegree_degree+0 
	MOVLW       255
	MOVWF       FARG_rotateByDegree_degree+1 
	CALL        _rotateByDegree+0, 0
;Main 5.0V.c,112 :: 		DIRECTION -= 30;
	MOVLW       30
	SUBWF       _DIRECTION+0, 1 
	MOVLW       0
	SUBWFB      _DIRECTION+1, 1 
;Main 5.0V.c,113 :: 		}
	GOTO        L_goThroughObstacles459
L_goThroughObstacles458:
;Main 5.0V.c,115 :: 		sendText(" rotateByDegree +30  ");
	MOVLW       ?lstr40_Main_325.0V+0
	MOVWF       FARG_sendText_aText+0 
	MOVLW       hi_addr(?lstr40_Main_325.0V+0)
	MOVWF       FARG_sendText_aText+1 
	CALL        _sendText+0, 0
;Main 5.0V.c,116 :: 		rotateByDegree(30);
	MOVLW       30
	MOVWF       FARG_rotateByDegree_degree+0 
	MOVLW       0
	MOVWF       FARG_rotateByDegree_degree+1 
	CALL        _rotateByDegree+0, 0
;Main 5.0V.c,117 :: 		DIRECTION += 30;
	MOVLW       30
	ADDWF       _DIRECTION+0, 1 
	MOVLW       0
	ADDWFC      _DIRECTION+1, 1 
;Main 5.0V.c,118 :: 		}
L_goThroughObstacles459:
;Main 5.0V.c,119 :: 		}
	GOTO        L_goThroughObstacles460
L_goThroughObstacles457:
;Main 5.0V.c,121 :: 		moveForward(220,220);
	MOVLW       220
	MOVWF       FARG_moveForward_pwmLeft+0 
	MOVLW       0
	MOVWF       FARG_moveForward_pwmLeft+1 
	MOVLW       220
	MOVWF       FARG_moveForward_pwmRight+0 
	MOVLW       0
	MOVWF       FARG_moveForward_pwmRight+1 
	CALL        _moveForward+0, 0
;Main 5.0V.c,122 :: 		}
L_goThroughObstacles460:
;Main 5.0V.c,123 :: 		}
	RETURN      0
; end of _goThroughObstacles
