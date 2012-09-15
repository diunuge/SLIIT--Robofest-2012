
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
L__isAllBlack581:
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
L__isAllWhite582:
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
	GOTO        L__rotateByDegree703
	MOVLW       166
	XORWF       FARG_rotateByDegree_degree+0, 0 
L__rotateByDegree703:
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
	GOTO        L__rotateByDegree704
	MOVLW       90
	XORWF       FARG_rotateByDegree_degree+0, 0 
L__rotateByDegree704:
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
	MOVLW       ?lstr3_Main_323.0V+0
	MOVWF       _debugText+0 
	MOVLW       hi_addr(?lstr3_Main_323.0V+0)
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
	MOVLW       ?lstr4_Main_323.0V+0
	MOVWF       _debugText+0 
	MOVLW       hi_addr(?lstr4_Main_323.0V+0)
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
	MOVLW       ?lstr5_Main_323.0V+0
	MOVWF       _debugText+0 
	MOVLW       hi_addr(?lstr5_Main_323.0V+0)
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
	MOVLW       ?lstr6_Main_323.0V+0
	MOVWF       _debugText+0 
	MOVLW       hi_addr(?lstr6_Main_323.0V+0)
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
	MOVLW       ?lstr7_Main_323.0V+0
	MOVWF       _debugText+0 
	MOVLW       hi_addr(?lstr7_Main_323.0V+0)
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
	MOVLW       ?lstr8_Main_323.0V+0
	MOVWF       _debugText+0 
	MOVLW       hi_addr(?lstr8_Main_323.0V+0)
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
	MOVLW       ?lstr9_Main_323.0V+0
	MOVWF       _debugText+0 
	MOVLW       hi_addr(?lstr9_Main_323.0V+0)
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
	MOVLW       ?lstr10_Main_323.0V+0
	MOVWF       _debugText+0 
	MOVLW       hi_addr(?lstr10_Main_323.0V+0)
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
	MOVLW       ?lstr11_Main_323.0V+0
	MOVWF       _debugText+0 
	MOVLW       hi_addr(?lstr11_Main_323.0V+0)
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
	MOVLW       ?lstr12_Main_323.0V+0
	MOVWF       _debugText+0 
	MOVLW       hi_addr(?lstr12_Main_323.0V+0)
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
	MOVLW       ?lstr13_Main_323.0V+0
	MOVWF       _debugText+0 
	MOVLW       hi_addr(?lstr13_Main_323.0V+0)
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
	MOVLW       ?lstr14_Main_323.0V+0
	MOVWF       _debugText+0 
	MOVLW       hi_addr(?lstr14_Main_323.0V+0)
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
	MOVLW       ?lstr15_Main_323.0V+0
	MOVWF       _debugText+0 
	MOVLW       hi_addr(?lstr15_Main_323.0V+0)
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
	MOVLW       ?lstr16_Main_323.0V+0
	MOVWF       _debugText+0 
	MOVLW       hi_addr(?lstr16_Main_323.0V+0)
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
	MOVLW       ?lstr17_Main_323.0V+0
	MOVWF       _debugText+0 
	MOVLW       hi_addr(?lstr17_Main_323.0V+0)
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
	MOVLW       ?lstr18_Main_323.0V+0
	MOVWF       _debugText+0 
	MOVLW       hi_addr(?lstr18_Main_323.0V+0)
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
	MOVLW       ?lstr19_Main_323.0V+0
	MOVWF       _debugText+0 
	MOVLW       hi_addr(?lstr19_Main_323.0V+0)
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
	MOVLW       ?lstr20_Main_323.0V+0
	MOVWF       _debugText+0 
	MOVLW       hi_addr(?lstr20_Main_323.0V+0)
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
	MOVLW       ?lstr21_Main_323.0V+0
	MOVWF       _debugText+0 
	MOVLW       hi_addr(?lstr21_Main_323.0V+0)
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
	MOVLW       ?lstr22_Main_323.0V+0
	MOVWF       _debugText+0 
	MOVLW       hi_addr(?lstr22_Main_323.0V+0)
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
	MOVLW       ?lstr23_Main_323.0V+0
	MOVWF       _debugText+0 
	MOVLW       hi_addr(?lstr23_Main_323.0V+0)
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
	MOVLW       ?lstr24_Main_323.0V+0
	MOVWF       _debugText+0 
	MOVLW       hi_addr(?lstr24_Main_323.0V+0)
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
	MOVLW       ?lstr25_Main_323.0V+0
	MOVWF       _debugText+0 
	MOVLW       hi_addr(?lstr25_Main_323.0V+0)
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
	MOVLW       ?lstr26_Main_323.0V+0
	MOVWF       _debugText+0 
	MOVLW       hi_addr(?lstr26_Main_323.0V+0)
	MOVWF       _debugText+1 
;debug.h,129 :: 		UART1_Write_Text(debugText);
	MOVF        _debugText+0, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVF        _debugText+1, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;debug.h,131 :: 		debugText = "Decrease PWM..   ";
	MOVLW       ?lstr27_Main_323.0V+0
	MOVWF       _debugText+0 
	MOVLW       hi_addr(?lstr27_Main_323.0V+0)
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
	GOTO        L__testPIC705
	MOVF        _count+0, 0 
	SUBLW       0
L__testPIC705:
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

_lineFollow:

;linefollow.h,14 :: 		void lineFollow(){
;linefollow.h,16 :: 		while(1){
L_lineFollow53:
;linefollow.h,17 :: 		if( (Sensor3==1 || Sensor4==1 || Sensor5==1 || Sensor6==1 || Sensor7==1) && Sensor1==0 && Sensor2==0 && Sensor8==0 && Sensor9==0 ){
	BTFSC       PORTD+0, 4 
	GOTO        L__lineFollow587
	BTFSC       PORTD+0, 5 
	GOTO        L__lineFollow587
	BTFSC       PORTD+0, 6 
	GOTO        L__lineFollow587
	BTFSC       PORTD+0, 7 
	GOTO        L__lineFollow587
	BTFSC       PORTB+0, 2 
	GOTO        L__lineFollow587
	GOTO        L_lineFollow59
L__lineFollow587:
	BTFSC       PORTB+0, 4 
	GOTO        L_lineFollow59
	BTFSC       PORTB+0, 3 
	GOTO        L_lineFollow59
	BTFSC       PORTB+0, 6 
	GOTO        L_lineFollow59
	BTFSC       PORTB+0, 7 
	GOTO        L_lineFollow59
L__lineFollow586:
;linefollow.h,19 :: 		debugText = "Line follow PID..   ";
	MOVLW       ?lstr28_Main_323.0V+0
	MOVWF       _debugText+0 
	MOVLW       hi_addr(?lstr28_Main_323.0V+0)
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
	GOTO        L_lineFollow60
L_lineFollow59:
;linefollow.h,24 :: 		else if( !( Scout==1 && Sensor1==1 && Sensor2==1 && Sensor3==1 && Sensor4==1 && Sensor5==1 && Sensor6==1 && Sensor7==1 && Sensor8==1 && Sensor9==1) || !( Scout==0 && Sensor1==0 && Sensor2==0 && Sensor3==0 && Sensor4==0 && Sensor5==0 && Sensor6==0 && Sensor7==0 && Sensor8==0 && Sensor9==0)){
	BTFSS       PORTB+0, 5 
	GOTO        L_lineFollow62
	BTFSS       PORTB+0, 4 
	GOTO        L_lineFollow62
	BTFSS       PORTB+0, 3 
	GOTO        L_lineFollow62
	BTFSS       PORTD+0, 4 
	GOTO        L_lineFollow62
	BTFSS       PORTD+0, 5 
	GOTO        L_lineFollow62
	BTFSS       PORTD+0, 6 
	GOTO        L_lineFollow62
	BTFSS       PORTD+0, 7 
	GOTO        L_lineFollow62
	BTFSS       PORTB+0, 2 
	GOTO        L_lineFollow62
	BTFSS       PORTB+0, 6 
	GOTO        L_lineFollow62
	BTFSS       PORTB+0, 7 
	GOTO        L_lineFollow62
	MOVLW       1
	MOVWF       R0 
	GOTO        L_lineFollow61
L_lineFollow62:
	CLRF        R0 
L_lineFollow61:
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L__lineFollow585
	BTFSC       PORTB+0, 5 
	GOTO        L_lineFollow64
	BTFSC       PORTB+0, 4 
	GOTO        L_lineFollow64
	BTFSC       PORTB+0, 3 
	GOTO        L_lineFollow64
	BTFSC       PORTD+0, 4 
	GOTO        L_lineFollow64
	BTFSC       PORTD+0, 5 
	GOTO        L_lineFollow64
	BTFSC       PORTD+0, 6 
	GOTO        L_lineFollow64
	BTFSC       PORTD+0, 7 
	GOTO        L_lineFollow64
	BTFSC       PORTB+0, 2 
	GOTO        L_lineFollow64
	BTFSC       PORTB+0, 6 
	GOTO        L_lineFollow64
	BTFSC       PORTB+0, 7 
	GOTO        L_lineFollow64
	MOVLW       1
	MOVWF       R0 
	GOTO        L_lineFollow63
L_lineFollow64:
	CLRF        R0 
L_lineFollow63:
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L__lineFollow585
	GOTO        L_lineFollow67
L__lineFollow585:
;linefollow.h,26 :: 		debugText = "Line follow Normal..   ";
	MOVLW       ?lstr29_Main_323.0V+0
	MOVWF       _debugText+0 
	MOVLW       hi_addr(?lstr29_Main_323.0V+0)
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
	GOTO        L_lineFollow68
L_lineFollow67:
;linefollow.h,31 :: 		else if(( Scout==1 && Sensor1==1 && Sensor2==1 && Sensor3==1 && Sensor4==1 && Sensor5==1 && Sensor6==1 && Sensor7==1 && Sensor8==1 && Sensor9==1) || !( Scout==0 && Sensor1==0 && Sensor2==0 && Sensor3==0 && Sensor4==0 && Sensor5==0 && Sensor6==0 && Sensor7==0 && Sensor8==0 && Sensor9==0)){
	BTFSS       PORTB+0, 5 
	GOTO        L__lineFollow584
	BTFSS       PORTB+0, 4 
	GOTO        L__lineFollow584
	BTFSS       PORTB+0, 3 
	GOTO        L__lineFollow584
	BTFSS       PORTD+0, 4 
	GOTO        L__lineFollow584
	BTFSS       PORTD+0, 5 
	GOTO        L__lineFollow584
	BTFSS       PORTD+0, 6 
	GOTO        L__lineFollow584
	BTFSS       PORTD+0, 7 
	GOTO        L__lineFollow584
	BTFSS       PORTB+0, 2 
	GOTO        L__lineFollow584
	BTFSS       PORTB+0, 6 
	GOTO        L__lineFollow584
	BTFSS       PORTB+0, 7 
	GOTO        L__lineFollow584
	GOTO        L__lineFollow583
L__lineFollow584:
	BTFSC       PORTB+0, 5 
	GOTO        L_lineFollow72
	BTFSC       PORTB+0, 4 
	GOTO        L_lineFollow72
	BTFSC       PORTB+0, 3 
	GOTO        L_lineFollow72
	BTFSC       PORTD+0, 4 
	GOTO        L_lineFollow72
	BTFSC       PORTD+0, 5 
	GOTO        L_lineFollow72
	BTFSC       PORTD+0, 6 
	GOTO        L_lineFollow72
	BTFSC       PORTD+0, 7 
	GOTO        L_lineFollow72
	BTFSC       PORTB+0, 2 
	GOTO        L_lineFollow72
	BTFSC       PORTB+0, 6 
	GOTO        L_lineFollow72
	BTFSC       PORTB+0, 7 
	GOTO        L_lineFollow72
	MOVLW       1
	MOVWF       R0 
	GOTO        L_lineFollow71
L_lineFollow72:
	CLRF        R0 
L_lineFollow71:
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L__lineFollow583
	GOTO        L_lineFollow75
L__lineFollow583:
;linefollow.h,33 :: 		stop();
	CALL        _stop+0, 0
;linefollow.h,34 :: 		sendSensorStatus();
	CALL        _sendSensorStatus+0, 0
;linefollow.h,36 :: 		}
L_lineFollow75:
L_lineFollow68:
L_lineFollow60:
;linefollow.h,37 :: 		}
	GOTO        L_lineFollow53
;linefollow.h,38 :: 		}
	RETURN      0
; end of _lineFollow

_lineFollowNormal:

;linefollow.h,40 :: 		void lineFollowNormal(){
;linefollow.h,41 :: 		while(1){              //!((Sensor3==1 || Sensor4==1 || Sensor5==1 || Sensor6==1 || Sensor7==1) && Sensor1==0 && Sensor2==0 && Sensor8==0 && Sensor9==0)
L_lineFollowNormal76:
;linefollow.h,42 :: 		if( Scout==1 && Sensor1==1 && Sensor2==1 && Sensor3==1 && Sensor4==1 && Sensor5==1 && Sensor6==1 && Sensor7==1 && Sensor8==1 && Sensor9==1){
	BTFSS       PORTB+0, 5 
	GOTO        L_lineFollowNormal80
	BTFSS       PORTB+0, 4 
	GOTO        L_lineFollowNormal80
	BTFSS       PORTB+0, 3 
	GOTO        L_lineFollowNormal80
	BTFSS       PORTD+0, 4 
	GOTO        L_lineFollowNormal80
	BTFSS       PORTD+0, 5 
	GOTO        L_lineFollowNormal80
	BTFSS       PORTD+0, 6 
	GOTO        L_lineFollowNormal80
	BTFSS       PORTD+0, 7 
	GOTO        L_lineFollowNormal80
	BTFSS       PORTB+0, 2 
	GOTO        L_lineFollowNormal80
	BTFSS       PORTB+0, 6 
	GOTO        L_lineFollowNormal80
	BTFSS       PORTB+0, 7 
	GOTO        L_lineFollowNormal80
L__lineFollowNormal600:
;linefollow.h,43 :: 		stop();
	CALL        _stop+0, 0
;linefollow.h,44 :: 		}
	GOTO        L_lineFollowNormal81
L_lineFollowNormal80:
;linefollow.h,45 :: 		else if( (Scout==0 && Sensor1==0 && Sensor2==0 && Sensor3==0 && Sensor4==1 && Sensor5==1 && Sensor6==1 && Sensor7==1 && Sensor8==1 && Sensor9==1) || (Scout==0 && Sensor1==0 && Sensor2==0 && Sensor3==0 && Sensor4==0 && Sensor5==1 && Sensor6==1 && Sensor7==1 && Sensor8==1 && Sensor9==1)){
	BTFSC       PORTB+0, 5 
	GOTO        L__lineFollowNormal599
	BTFSC       PORTB+0, 4 
	GOTO        L__lineFollowNormal599
	BTFSC       PORTB+0, 3 
	GOTO        L__lineFollowNormal599
	BTFSC       PORTD+0, 4 
	GOTO        L__lineFollowNormal599
	BTFSS       PORTD+0, 5 
	GOTO        L__lineFollowNormal599
	BTFSS       PORTD+0, 6 
	GOTO        L__lineFollowNormal599
	BTFSS       PORTD+0, 7 
	GOTO        L__lineFollowNormal599
	BTFSS       PORTB+0, 2 
	GOTO        L__lineFollowNormal599
	BTFSS       PORTB+0, 6 
	GOTO        L__lineFollowNormal599
	BTFSS       PORTB+0, 7 
	GOTO        L__lineFollowNormal599
	GOTO        L__lineFollowNormal597
L__lineFollowNormal599:
	BTFSC       PORTB+0, 5 
	GOTO        L__lineFollowNormal598
	BTFSC       PORTB+0, 4 
	GOTO        L__lineFollowNormal598
	BTFSC       PORTB+0, 3 
	GOTO        L__lineFollowNormal598
	BTFSC       PORTD+0, 4 
	GOTO        L__lineFollowNormal598
	BTFSC       PORTD+0, 5 
	GOTO        L__lineFollowNormal598
	BTFSS       PORTD+0, 6 
	GOTO        L__lineFollowNormal598
	BTFSS       PORTD+0, 7 
	GOTO        L__lineFollowNormal598
	BTFSS       PORTB+0, 2 
	GOTO        L__lineFollowNormal598
	BTFSS       PORTB+0, 6 
	GOTO        L__lineFollowNormal598
	BTFSS       PORTB+0, 7 
	GOTO        L__lineFollowNormal598
	GOTO        L__lineFollowNormal597
L__lineFollowNormal598:
	GOTO        L_lineFollowNormal88
L__lineFollowNormal597:
;linefollow.h,47 :: 		debugText = "90 to right..   ";
	MOVLW       ?lstr30_Main_323.0V+0
	MOVWF       _debugText+0 
	MOVLW       hi_addr(?lstr30_Main_323.0V+0)
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
L_lineFollowNormal89:
	BTFSC       PORTB+0, 5 
	GOTO        L_lineFollowNormal90
;linefollow.h,51 :: 		rotateClockwise(TEST_RPM);
	MOVF        _TEST_RPM+0, 0 
	MOVWF       FARG_rotateClockwise_pwm+0 
	MOVF        _TEST_RPM+1, 0 
	MOVWF       FARG_rotateClockwise_pwm+1 
	CALL        _rotateClockwise+0, 0
;linefollow.h,52 :: 		}
	GOTO        L_lineFollowNormal89
L_lineFollowNormal90:
;linefollow.h,53 :: 		}
	GOTO        L_lineFollowNormal91
L_lineFollowNormal88:
;linefollow.h,54 :: 		else if( (Scout==0 && Sensor1==1 && Sensor2==1 && Sensor3==1 && Sensor4==1 && Sensor5==1 && Sensor6==0 && Sensor7==0 && Sensor8==0 && Sensor9==0) && (Scout==0 && Sensor1==1 && Sensor2==1 && Sensor3==1 && Sensor4==1 && Sensor5==0 && Sensor6==0 && Sensor7==0 && Sensor8==0 && Sensor9==0)){
	BTFSC       PORTB+0, 5 
	GOTO        L_lineFollowNormal98
	BTFSS       PORTB+0, 4 
	GOTO        L_lineFollowNormal98
	BTFSS       PORTB+0, 3 
	GOTO        L_lineFollowNormal98
	BTFSS       PORTD+0, 4 
	GOTO        L_lineFollowNormal98
	BTFSS       PORTD+0, 5 
	GOTO        L_lineFollowNormal98
	BTFSS       PORTD+0, 6 
	GOTO        L_lineFollowNormal98
	BTFSC       PORTD+0, 7 
	GOTO        L_lineFollowNormal98
	BTFSC       PORTB+0, 2 
	GOTO        L_lineFollowNormal98
	BTFSC       PORTB+0, 6 
	GOTO        L_lineFollowNormal98
	BTFSC       PORTB+0, 7 
	GOTO        L_lineFollowNormal98
L__lineFollowNormal596:
	BTFSC       PORTB+0, 5 
	GOTO        L_lineFollowNormal98
	BTFSS       PORTB+0, 4 
	GOTO        L_lineFollowNormal98
	BTFSS       PORTB+0, 3 
	GOTO        L_lineFollowNormal98
	BTFSS       PORTD+0, 4 
	GOTO        L_lineFollowNormal98
	BTFSS       PORTD+0, 5 
	GOTO        L_lineFollowNormal98
	BTFSC       PORTD+0, 6 
	GOTO        L_lineFollowNormal98
	BTFSC       PORTD+0, 7 
	GOTO        L_lineFollowNormal98
	BTFSC       PORTB+0, 2 
	GOTO        L_lineFollowNormal98
	BTFSC       PORTB+0, 6 
	GOTO        L_lineFollowNormal98
	BTFSC       PORTB+0, 7 
	GOTO        L_lineFollowNormal98
L__lineFollowNormal595:
L__lineFollowNormal594:
;linefollow.h,56 :: 		debugText = "90 to left..   ";
	MOVLW       ?lstr31_Main_323.0V+0
	MOVWF       _debugText+0 
	MOVLW       hi_addr(?lstr31_Main_323.0V+0)
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
L_lineFollowNormal99:
	BTFSC       PORTB+0, 5 
	GOTO        L_lineFollowNormal100
;linefollow.h,60 :: 		rotateAntiClockwise(TEST_RPM);
	MOVF        _TEST_RPM+0, 0 
	MOVWF       FARG_rotateAntiClockwise_pwm+0 
	MOVF        _TEST_RPM+1, 0 
	MOVWF       FARG_rotateAntiClockwise_pwm+1 
	CALL        _rotateAntiClockwise+0, 0
;linefollow.h,61 :: 		}
	GOTO        L_lineFollowNormal99
L_lineFollowNormal100:
;linefollow.h,62 :: 		}
	GOTO        L_lineFollowNormal101
L_lineFollowNormal98:
;linefollow.h,63 :: 		else if( Sensor4==1 && Sensor5==1){
	BTFSS       PORTD+0, 5 
	GOTO        L_lineFollowNormal104
	BTFSS       PORTD+0, 6 
	GOTO        L_lineFollowNormal104
L__lineFollowNormal593:
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
	GOTO        L_lineFollowNormal105
L_lineFollowNormal104:
;linefollow.h,67 :: 		else if( Sensor4==1 && Sensor5==0 && Scout==1){
	BTFSS       PORTD+0, 5 
	GOTO        L_lineFollowNormal108
	BTFSC       PORTD+0, 6 
	GOTO        L_lineFollowNormal108
	BTFSS       PORTB+0, 5 
	GOTO        L_lineFollowNormal108
L__lineFollowNormal592:
;linefollow.h,69 :: 		turnLeft(TEST_RPM);
	MOVF        _TEST_RPM+0, 0 
	MOVWF       FARG_turnLeft_pwmRight+0 
	MOVF        _TEST_RPM+1, 0 
	MOVWF       FARG_turnLeft_pwmRight+1 
	CALL        _turnLeft+0, 0
;linefollow.h,70 :: 		}
	GOTO        L_lineFollowNormal109
L_lineFollowNormal108:
;linefollow.h,71 :: 		else if( Sensor4==0 && Sensor5==1 && Scout==1){
	BTFSC       PORTD+0, 5 
	GOTO        L_lineFollowNormal112
	BTFSS       PORTD+0, 6 
	GOTO        L_lineFollowNormal112
	BTFSS       PORTB+0, 5 
	GOTO        L_lineFollowNormal112
L__lineFollowNormal591:
;linefollow.h,73 :: 		turnRight(TEST_RPM);
	MOVF        _TEST_RPM+0, 0 
	MOVWF       FARG_turnRight_pwmLeft+0 
	MOVF        _TEST_RPM+1, 0 
	MOVWF       FARG_turnRight_pwmLeft+1 
	CALL        _turnRight+0, 0
;linefollow.h,74 :: 		}
	GOTO        L_lineFollowNormal113
L_lineFollowNormal112:
;linefollow.h,75 :: 		else if( Sensor4==1 && Sensor5==0 && Scout==0){
	BTFSS       PORTD+0, 5 
	GOTO        L_lineFollowNormal116
	BTFSC       PORTD+0, 6 
	GOTO        L_lineFollowNormal116
	BTFSC       PORTB+0, 5 
	GOTO        L_lineFollowNormal116
L__lineFollowNormal590:
;linefollow.h,77 :: 		stop();
	CALL        _stop+0, 0
;linefollow.h,79 :: 		rotateAntiClockwise(TEST_RPM);
	MOVF        _TEST_RPM+0, 0 
	MOVWF       FARG_rotateAntiClockwise_pwm+0 
	MOVF        _TEST_RPM+1, 0 
	MOVWF       FARG_rotateAntiClockwise_pwm+1 
	CALL        _rotateAntiClockwise+0, 0
;linefollow.h,80 :: 		}
	GOTO        L_lineFollowNormal117
L_lineFollowNormal116:
;linefollow.h,81 :: 		else if( Sensor4==0 && Sensor5==1 && Scout==0){
	BTFSC       PORTD+0, 5 
	GOTO        L_lineFollowNormal120
	BTFSS       PORTD+0, 6 
	GOTO        L_lineFollowNormal120
	BTFSC       PORTB+0, 5 
	GOTO        L_lineFollowNormal120
L__lineFollowNormal589:
;linefollow.h,83 :: 		stop();
	CALL        _stop+0, 0
;linefollow.h,85 :: 		rotateClockwise(TEST_RPM);
	MOVF        _TEST_RPM+0, 0 
	MOVWF       FARG_rotateClockwise_pwm+0 
	MOVF        _TEST_RPM+1, 0 
	MOVWF       FARG_rotateClockwise_pwm+1 
	CALL        _rotateClockwise+0, 0
;linefollow.h,86 :: 		}
	GOTO        L_lineFollowNormal121
L_lineFollowNormal120:
;linefollow.h,87 :: 		else if( Sensor4==0 && Sensor5==0 ){
	BTFSC       PORTD+0, 5 
	GOTO        L_lineFollowNormal124
	BTFSC       PORTD+0, 6 
	GOTO        L_lineFollowNormal124
L__lineFollowNormal588:
;linefollow.h,88 :: 		if(Sensor3 ==1){
	BTFSS       PORTD+0, 4 
	GOTO        L_lineFollowNormal125
;linefollow.h,89 :: 		rotateAntiClockwise(TEST_RPM);
	MOVF        _TEST_RPM+0, 0 
	MOVWF       FARG_rotateAntiClockwise_pwm+0 
	MOVF        _TEST_RPM+1, 0 
	MOVWF       FARG_rotateAntiClockwise_pwm+1 
	CALL        _rotateAntiClockwise+0, 0
;linefollow.h,90 :: 		}
	GOTO        L_lineFollowNormal126
L_lineFollowNormal125:
;linefollow.h,91 :: 		else if(Sensor6 ==1){
	BTFSS       PORTD+0, 7 
	GOTO        L_lineFollowNormal127
;linefollow.h,92 :: 		rotateClockwise(TEST_RPM);
	MOVF        _TEST_RPM+0, 0 
	MOVWF       FARG_rotateClockwise_pwm+0 
	MOVF        _TEST_RPM+1, 0 
	MOVWF       FARG_rotateClockwise_pwm+1 
	CALL        _rotateClockwise+0, 0
;linefollow.h,93 :: 		}
	GOTO        L_lineFollowNormal128
L_lineFollowNormal127:
;linefollow.h,94 :: 		else if(Sensor2 ==1){
	BTFSS       PORTB+0, 3 
	GOTO        L_lineFollowNormal129
;linefollow.h,95 :: 		rotateAntiClockwise(TEST_RPM);
	MOVF        _TEST_RPM+0, 0 
	MOVWF       FARG_rotateAntiClockwise_pwm+0 
	MOVF        _TEST_RPM+1, 0 
	MOVWF       FARG_rotateAntiClockwise_pwm+1 
	CALL        _rotateAntiClockwise+0, 0
;linefollow.h,96 :: 		}
	GOTO        L_lineFollowNormal130
L_lineFollowNormal129:
;linefollow.h,97 :: 		else if(Sensor7 ==1){
	BTFSS       PORTB+0, 2 
	GOTO        L_lineFollowNormal131
;linefollow.h,98 :: 		rotateClockwise(TEST_RPM);
	MOVF        _TEST_RPM+0, 0 
	MOVWF       FARG_rotateClockwise_pwm+0 
	MOVF        _TEST_RPM+1, 0 
	MOVWF       FARG_rotateClockwise_pwm+1 
	CALL        _rotateClockwise+0, 0
;linefollow.h,99 :: 		}
	GOTO        L_lineFollowNormal132
L_lineFollowNormal131:
;linefollow.h,102 :: 		stop();
	CALL        _stop+0, 0
;linefollow.h,105 :: 		}
L_lineFollowNormal132:
L_lineFollowNormal130:
L_lineFollowNormal128:
L_lineFollowNormal126:
;linefollow.h,106 :: 		}
L_lineFollowNormal124:
L_lineFollowNormal121:
L_lineFollowNormal117:
L_lineFollowNormal113:
L_lineFollowNormal109:
L_lineFollowNormal105:
L_lineFollowNormal101:
L_lineFollowNormal91:
L_lineFollowNormal81:
;linefollow.h,108 :: 		}
	GOTO        L_lineFollowNormal76
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
;linefollow.h,116 :: 		TEST_RPM = 200;
	MOVLW       200
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
;linefollow.h,134 :: 		if( (Scout==0 && Sensor1==0 && Sensor2==0 && Sensor3==0 && Sensor4==1 && Sensor5==1 && Sensor6==1 && Sensor7==1 && Sensor8==1 && Sensor9==1) || (Scout==0 && Sensor1==0 && Sensor2==0 && Sensor3==0 && Sensor4==0 && Sensor5==1 && Sensor6==1 && Sensor7==1 && Sensor8==1 && Sensor9==1)){
	BTFSC       PORTB+0, 5 
	GOTO        L__lineFollowPID618
	BTFSC       PORTB+0, 4 
	GOTO        L__lineFollowPID618
	BTFSC       PORTB+0, 3 
	GOTO        L__lineFollowPID618
	BTFSC       PORTD+0, 4 
	GOTO        L__lineFollowPID618
	BTFSS       PORTD+0, 5 
	GOTO        L__lineFollowPID618
	BTFSS       PORTD+0, 6 
	GOTO        L__lineFollowPID618
	BTFSS       PORTD+0, 7 
	GOTO        L__lineFollowPID618
	BTFSS       PORTB+0, 2 
	GOTO        L__lineFollowPID618
	BTFSS       PORTB+0, 6 
	GOTO        L__lineFollowPID618
	BTFSS       PORTB+0, 7 
	GOTO        L__lineFollowPID618
	GOTO        L__lineFollowPID616
L__lineFollowPID618:
	BTFSC       PORTB+0, 5 
	GOTO        L__lineFollowPID617
	BTFSC       PORTB+0, 4 
	GOTO        L__lineFollowPID617
	BTFSC       PORTB+0, 3 
	GOTO        L__lineFollowPID617
	BTFSC       PORTD+0, 4 
	GOTO        L__lineFollowPID617
	BTFSC       PORTD+0, 5 
	GOTO        L__lineFollowPID617
	BTFSS       PORTD+0, 6 
	GOTO        L__lineFollowPID617
	BTFSS       PORTD+0, 7 
	GOTO        L__lineFollowPID617
	BTFSS       PORTB+0, 2 
	GOTO        L__lineFollowPID617
	BTFSS       PORTB+0, 6 
	GOTO        L__lineFollowPID617
	BTFSS       PORTB+0, 7 
	GOTO        L__lineFollowPID617
	GOTO        L__lineFollowPID616
L__lineFollowPID617:
	GOTO        L_lineFollowPID139
L__lineFollowPID616:
;linefollow.h,136 :: 		debugText = "90 to right..   ";
	MOVLW       ?lstr32_Main_323.0V+0
	MOVWF       _debugText+0 
	MOVLW       hi_addr(?lstr32_Main_323.0V+0)
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
L_lineFollowPID140:
	BTFSC       PORTB+0, 5 
	GOTO        L_lineFollowPID141
;linefollow.h,140 :: 		rotateClockwise(TEST_RPM);
	MOVF        _TEST_RPM+0, 0 
	MOVWF       FARG_rotateClockwise_pwm+0 
	MOVF        _TEST_RPM+1, 0 
	MOVWF       FARG_rotateClockwise_pwm+1 
	CALL        _rotateClockwise+0, 0
;linefollow.h,141 :: 		}
	GOTO        L_lineFollowPID140
L_lineFollowPID141:
;linefollow.h,142 :: 		}
	GOTO        L_lineFollowPID142
L_lineFollowPID139:
;linefollow.h,143 :: 		else if( (Scout==0 && Sensor1==1 && Sensor2==1 && Sensor3==1 && Sensor4==1 && Sensor7==0 && Sensor8==0 && Sensor9==0) && (Scout==0 && Sensor1==1 && Sensor2==1 && Sensor3==1 && Sensor4==1 && Sensor7==0 && Sensor8==0 && Sensor9==0)){
	BTFSC       PORTB+0, 5 
	GOTO        L_lineFollowPID149
	BTFSS       PORTB+0, 4 
	GOTO        L_lineFollowPID149
	BTFSS       PORTB+0, 3 
	GOTO        L_lineFollowPID149
	BTFSS       PORTD+0, 4 
	GOTO        L_lineFollowPID149
	BTFSS       PORTD+0, 5 
	GOTO        L_lineFollowPID149
	BTFSC       PORTB+0, 2 
	GOTO        L_lineFollowPID149
	BTFSC       PORTB+0, 6 
	GOTO        L_lineFollowPID149
	BTFSC       PORTB+0, 7 
	GOTO        L_lineFollowPID149
L__lineFollowPID615:
	BTFSC       PORTB+0, 5 
	GOTO        L_lineFollowPID149
	BTFSS       PORTB+0, 4 
	GOTO        L_lineFollowPID149
	BTFSS       PORTB+0, 3 
	GOTO        L_lineFollowPID149
	BTFSS       PORTD+0, 4 
	GOTO        L_lineFollowPID149
	BTFSS       PORTD+0, 5 
	GOTO        L_lineFollowPID149
	BTFSC       PORTB+0, 2 
	GOTO        L_lineFollowPID149
	BTFSC       PORTB+0, 6 
	GOTO        L_lineFollowPID149
	BTFSC       PORTB+0, 7 
	GOTO        L_lineFollowPID149
L__lineFollowPID614:
L__lineFollowPID613:
;linefollow.h,145 :: 		debugText = "90 to left..   ";
	MOVLW       ?lstr33_Main_323.0V+0
	MOVWF       _debugText+0 
	MOVLW       hi_addr(?lstr33_Main_323.0V+0)
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
L_lineFollowPID150:
	BTFSC       PORTB+0, 5 
	GOTO        L_lineFollowPID151
;linefollow.h,149 :: 		rotateAntiClockwise(TEST_RPM);
	MOVF        _TEST_RPM+0, 0 
	MOVWF       FARG_rotateAntiClockwise_pwm+0 
	MOVF        _TEST_RPM+1, 0 
	MOVWF       FARG_rotateAntiClockwise_pwm+1 
	CALL        _rotateAntiClockwise+0, 0
;linefollow.h,150 :: 		}
	GOTO        L_lineFollowPID150
L_lineFollowPID151:
;linefollow.h,151 :: 		}
L_lineFollowPID149:
L_lineFollowPID142:
;linefollow.h,154 :: 		if( Sensor3==1 && Sensor4==0 && Sensor5==0 && Sensor6==0 && Sensor7==0)
	BTFSS       PORTD+0, 4 
	GOTO        L_lineFollowPID154
	BTFSC       PORTD+0, 5 
	GOTO        L_lineFollowPID154
	BTFSC       PORTD+0, 6 
	GOTO        L_lineFollowPID154
	BTFSC       PORTD+0, 7 
	GOTO        L_lineFollowPID154
	BTFSC       PORTB+0, 2 
	GOTO        L_lineFollowPID154
L__lineFollowPID612:
;linefollow.h,155 :: 		deviation = 4;
	MOVLW       4
	MOVWF       _deviation+0 
	MOVLW       0
	MOVWF       _deviation+1 
L_lineFollowPID154:
;linefollow.h,156 :: 		if( Sensor3==1 && Sensor4==1 && Sensor5==0 && Sensor6==0 && Sensor7==0)
	BTFSS       PORTD+0, 4 
	GOTO        L_lineFollowPID157
	BTFSS       PORTD+0, 5 
	GOTO        L_lineFollowPID157
	BTFSC       PORTD+0, 6 
	GOTO        L_lineFollowPID157
	BTFSC       PORTD+0, 7 
	GOTO        L_lineFollowPID157
	BTFSC       PORTB+0, 2 
	GOTO        L_lineFollowPID157
L__lineFollowPID611:
;linefollow.h,157 :: 		deviation = 3;
	MOVLW       3
	MOVWF       _deviation+0 
	MOVLW       0
	MOVWF       _deviation+1 
L_lineFollowPID157:
;linefollow.h,158 :: 		if( Sensor3==1 && Sensor4==1 && Sensor5==1 && Sensor6==0 && Sensor7==0)
	BTFSS       PORTD+0, 4 
	GOTO        L_lineFollowPID160
	BTFSS       PORTD+0, 5 
	GOTO        L_lineFollowPID160
	BTFSS       PORTD+0, 6 
	GOTO        L_lineFollowPID160
	BTFSC       PORTD+0, 7 
	GOTO        L_lineFollowPID160
	BTFSC       PORTB+0, 2 
	GOTO        L_lineFollowPID160
L__lineFollowPID610:
;linefollow.h,159 :: 		deviation = 2;
	MOVLW       2
	MOVWF       _deviation+0 
	MOVLW       0
	MOVWF       _deviation+1 
L_lineFollowPID160:
;linefollow.h,160 :: 		if( Sensor3==0 && Sensor4==1 && Sensor5==0 && Sensor6==0 && Sensor7==0)
	BTFSC       PORTD+0, 4 
	GOTO        L_lineFollowPID163
	BTFSS       PORTD+0, 5 
	GOTO        L_lineFollowPID163
	BTFSC       PORTD+0, 6 
	GOTO        L_lineFollowPID163
	BTFSC       PORTD+0, 7 
	GOTO        L_lineFollowPID163
	BTFSC       PORTB+0, 2 
	GOTO        L_lineFollowPID163
L__lineFollowPID609:
;linefollow.h,161 :: 		deviation = 1;
	MOVLW       1
	MOVWF       _deviation+0 
	MOVLW       0
	MOVWF       _deviation+1 
L_lineFollowPID163:
;linefollow.h,163 :: 		if( Sensor3==0 && Sensor4==1 && Sensor5==1 && Sensor6==0 && Sensor7==0)
	BTFSC       PORTD+0, 4 
	GOTO        L_lineFollowPID166
	BTFSS       PORTD+0, 5 
	GOTO        L_lineFollowPID166
	BTFSS       PORTD+0, 6 
	GOTO        L_lineFollowPID166
	BTFSC       PORTD+0, 7 
	GOTO        L_lineFollowPID166
	BTFSC       PORTB+0, 2 
	GOTO        L_lineFollowPID166
L__lineFollowPID608:
;linefollow.h,164 :: 		deviation = 0;
	CLRF        _deviation+0 
	CLRF        _deviation+1 
L_lineFollowPID166:
;linefollow.h,165 :: 		if( Sensor3==0 && Sensor4==1 && Sensor5==1 && Sensor6==1 && Sensor7==0)
	BTFSC       PORTD+0, 4 
	GOTO        L_lineFollowPID169
	BTFSS       PORTD+0, 5 
	GOTO        L_lineFollowPID169
	BTFSS       PORTD+0, 6 
	GOTO        L_lineFollowPID169
	BTFSS       PORTD+0, 7 
	GOTO        L_lineFollowPID169
	BTFSC       PORTB+0, 2 
	GOTO        L_lineFollowPID169
L__lineFollowPID607:
;linefollow.h,166 :: 		deviation = 0;
	CLRF        _deviation+0 
	CLRF        _deviation+1 
L_lineFollowPID169:
;linefollow.h,167 :: 		if( Sensor3==0 && Sensor4==0 && Sensor5==1 && Sensor6==0 && Sensor7==0)
	BTFSC       PORTD+0, 4 
	GOTO        L_lineFollowPID172
	BTFSC       PORTD+0, 5 
	GOTO        L_lineFollowPID172
	BTFSS       PORTD+0, 6 
	GOTO        L_lineFollowPID172
	BTFSC       PORTD+0, 7 
	GOTO        L_lineFollowPID172
	BTFSC       PORTB+0, 2 
	GOTO        L_lineFollowPID172
L__lineFollowPID606:
;linefollow.h,168 :: 		deviation = 0;
	CLRF        _deviation+0 
	CLRF        _deviation+1 
L_lineFollowPID172:
;linefollow.h,169 :: 		if( Sensor3==0 && Sensor4==0 && Sensor5==1 && Sensor6==1 && Sensor7==0)
	BTFSC       PORTD+0, 4 
	GOTO        L_lineFollowPID175
	BTFSC       PORTD+0, 5 
	GOTO        L_lineFollowPID175
	BTFSS       PORTD+0, 6 
	GOTO        L_lineFollowPID175
	BTFSS       PORTD+0, 7 
	GOTO        L_lineFollowPID175
	BTFSC       PORTB+0, 2 
	GOTO        L_lineFollowPID175
L__lineFollowPID605:
;linefollow.h,170 :: 		deviation = 0;
	CLRF        _deviation+0 
	CLRF        _deviation+1 
L_lineFollowPID175:
;linefollow.h,172 :: 		if( Sensor3==0 && Sensor4==0 && Sensor5==0 && Sensor6==1 && Sensor7==0)
	BTFSC       PORTD+0, 4 
	GOTO        L_lineFollowPID178
	BTFSC       PORTD+0, 5 
	GOTO        L_lineFollowPID178
	BTFSC       PORTD+0, 6 
	GOTO        L_lineFollowPID178
	BTFSS       PORTD+0, 7 
	GOTO        L_lineFollowPID178
	BTFSC       PORTB+0, 2 
	GOTO        L_lineFollowPID178
L__lineFollowPID604:
;linefollow.h,173 :: 		deviation = -1;
	MOVLW       255
	MOVWF       _deviation+0 
	MOVLW       255
	MOVWF       _deviation+1 
L_lineFollowPID178:
;linefollow.h,174 :: 		if( Sensor3==0 && Sensor4==0 && Sensor5==1 && Sensor6==1 && Sensor7==1)
	BTFSC       PORTD+0, 4 
	GOTO        L_lineFollowPID181
	BTFSC       PORTD+0, 5 
	GOTO        L_lineFollowPID181
	BTFSS       PORTD+0, 6 
	GOTO        L_lineFollowPID181
	BTFSS       PORTD+0, 7 
	GOTO        L_lineFollowPID181
	BTFSS       PORTB+0, 2 
	GOTO        L_lineFollowPID181
L__lineFollowPID603:
;linefollow.h,175 :: 		deviation = -2;
	MOVLW       254
	MOVWF       _deviation+0 
	MOVLW       255
	MOVWF       _deviation+1 
L_lineFollowPID181:
;linefollow.h,176 :: 		if( Sensor3==0 && Sensor4==0 && Sensor5==0 && Sensor6==1 && Sensor7==1)
	BTFSC       PORTD+0, 4 
	GOTO        L_lineFollowPID184
	BTFSC       PORTD+0, 5 
	GOTO        L_lineFollowPID184
	BTFSC       PORTD+0, 6 
	GOTO        L_lineFollowPID184
	BTFSS       PORTD+0, 7 
	GOTO        L_lineFollowPID184
	BTFSS       PORTB+0, 2 
	GOTO        L_lineFollowPID184
L__lineFollowPID602:
;linefollow.h,177 :: 		deviation = -3;
	MOVLW       253
	MOVWF       _deviation+0 
	MOVLW       255
	MOVWF       _deviation+1 
L_lineFollowPID184:
;linefollow.h,178 :: 		if( Sensor3==0 && Sensor4==0 && Sensor5==0 && Sensor6==0 && Sensor7==1)
	BTFSC       PORTD+0, 4 
	GOTO        L_lineFollowPID187
	BTFSC       PORTD+0, 5 
	GOTO        L_lineFollowPID187
	BTFSC       PORTD+0, 6 
	GOTO        L_lineFollowPID187
	BTFSC       PORTD+0, 7 
	GOTO        L_lineFollowPID187
	BTFSS       PORTB+0, 2 
	GOTO        L_lineFollowPID187
L__lineFollowPID601:
;linefollow.h,179 :: 		deviation = -4;
	MOVLW       252
	MOVWF       _deviation+0 
	MOVLW       255
	MOVWF       _deviation+1 
L_lineFollowPID187:
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
;linefollow.h,194 :: 		}
	RETURN      0
; end of _lineFollowPID

_configure:

;configuration.h,10 :: 		void configure(){
;configuration.h,13 :: 		TRISA = 0b11111111;
	MOVLW       255
	MOVWF       TRISA+0 
;configuration.h,14 :: 		TRISB = 0b11111111;
	MOVLW       255
	MOVWF       TRISB+0 
;configuration.h,15 :: 		TRISC = 0b00000000;
	CLRF        TRISC+0 
;configuration.h,16 :: 		TRISD = 0b11110010;
	MOVLW       242
	MOVWF       TRISD+0 
;configuration.h,19 :: 		PORTA = 0;
	CLRF        PORTA+0 
;configuration.h,20 :: 		PORTB = 0;
	CLRF        PORTB+0 
;configuration.h,21 :: 		PORTC = 0;
	CLRF        PORTC+0 
;configuration.h,22 :: 		PORTD = 0;
	CLRF        PORTD+0 
;configuration.h,25 :: 		PWM1_Init(5000);
	BSF         T2CON+0, 0, 0
	BCF         T2CON+0, 1, 0
	MOVLW       249
	MOVWF       PR2+0, 0
	CALL        _PWM1_Init+0, 0
;configuration.h,26 :: 		PWM2_Init(5000);
	BSF         T2CON+0, 0, 0
	BCF         T2CON+0, 1, 0
	MOVLW       249
	MOVWF       PR2+0, 0
	CALL        _PWM2_Init+0, 0
;configuration.h,27 :: 		PWM1_Start();
	CALL        _PWM1_Start+0, 0
;configuration.h,28 :: 		PWM2_Start();
	CALL        _PWM2_Start+0, 0
;configuration.h,29 :: 		UART1_Init(9600);
	MOVLW       129
	MOVWF       SPBRG+0 
	BSF         TXSTA+0, 2, 0
	CALL        _UART1_Init+0, 0
;configuration.h,37 :: 		ADCON0 = 0b11000001;
	MOVLW       193
	MOVWF       ADCON0+0 
;configuration.h,38 :: 		ADCON1 = 0b00000000;
	CLRF        ADCON1+0 
;configuration.h,46 :: 		LEVEL = 0;
	CLRF        _LEVEL+0 
	CLRF        _LEVEL+1 
;configuration.h,47 :: 		LEVEL1_STATE  = NOT_REACHED;
	CLRF        _LEVEL1_STATE+0 
	CLRF        _LEVEL1_STATE+1 
;configuration.h,48 :: 		LEVEL2_STATE  = NOT_REACHED;
	CLRF        _LEVEL2_STATE+0 
	CLRF        _LEVEL2_STATE+1 
;configuration.h,49 :: 		LEVEL3_STATE  = NOT_REACHED;
	CLRF        _LEVEL3_STATE+0 
	CLRF        _LEVEL3_STATE+1 
;configuration.h,51 :: 		SLOW_PWM = 180;
	MOVLW       180
	MOVWF       _SLOW_PWM+0 
	MOVLW       0
	MOVWF       _SLOW_PWM+1 
;configuration.h,52 :: 		MID_PWM = 200;
	MOVLW       200
	MOVWF       _MID_PWM+0 
	MOVLW       0
	MOVWF       _MID_PWM+1 
;configuration.h,53 :: 		FAST_PWM = 220;
	MOVLW       220
	MOVWF       _FAST_PWM+0 
	MOVLW       0
	MOVWF       _FAST_PWM+1 
;configuration.h,55 :: 		T0CON=0xC3;
	MOVLW       195
	MOVWF       T0CON+0 
;configuration.h,56 :: 		TMR0L=0x00;
	CLRF        TMR0L+0 
;configuration.h,57 :: 		INTCON.TMR0IE=1;
	BSF         INTCON+0, 5 
;configuration.h,59 :: 		T1CON=0x80;
	MOVLW       128
	MOVWF       T1CON+0 
;configuration.h,60 :: 		TMR1H=0x00;
	CLRF        TMR1H+0 
;configuration.h,61 :: 		TMR1L=0x00;
	CLRF        TMR1L+0 
;configuration.h,62 :: 		}
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
	GOTO        L__getDistanceIR_GP2D120706
	MOVLW       98
	SUBWF       FARG_getDistanceIR_GP2D120_ir_value+0, 0 
L__getDistanceIR_GP2D120706:
	BTFSS       STATUS+0, 0 
	GOTO        L_getDistanceIR_GP2D120190
	MOVLW       2
	SUBWF       FARG_getDistanceIR_GP2D120_ir_value+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__getDistanceIR_GP2D120707
	MOVLW       111
	SUBWF       FARG_getDistanceIR_GP2D120_ir_value+0, 0 
L__getDistanceIR_GP2D120707:
	BTFSC       STATUS+0, 0 
	GOTO        L_getDistanceIR_GP2D120190
L__getDistanceIR_GP2D120635:
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
L_getDistanceIR_GP2D120190:
;ir.h,14 :: 		else if( 557<=ir_value && ir_value<610 )
	MOVLW       2
	SUBWF       FARG_getDistanceIR_GP2D120_ir_value+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__getDistanceIR_GP2D120708
	MOVLW       45
	SUBWF       FARG_getDistanceIR_GP2D120_ir_value+0, 0 
L__getDistanceIR_GP2D120708:
	BTFSS       STATUS+0, 0 
	GOTO        L_getDistanceIR_GP2D120194
	MOVLW       2
	SUBWF       FARG_getDistanceIR_GP2D120_ir_value+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__getDistanceIR_GP2D120709
	MOVLW       98
	SUBWF       FARG_getDistanceIR_GP2D120_ir_value+0, 0 
L__getDistanceIR_GP2D120709:
	BTFSC       STATUS+0, 0 
	GOTO        L_getDistanceIR_GP2D120194
L__getDistanceIR_GP2D120634:
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
L_getDistanceIR_GP2D120194:
;ir.h,17 :: 		else if( 481<=ir_value && ir_value<557 )
	MOVLW       1
	SUBWF       FARG_getDistanceIR_GP2D120_ir_value+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__getDistanceIR_GP2D120710
	MOVLW       225
	SUBWF       FARG_getDistanceIR_GP2D120_ir_value+0, 0 
L__getDistanceIR_GP2D120710:
	BTFSS       STATUS+0, 0 
	GOTO        L_getDistanceIR_GP2D120198
	MOVLW       2
	SUBWF       FARG_getDistanceIR_GP2D120_ir_value+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__getDistanceIR_GP2D120711
	MOVLW       45
	SUBWF       FARG_getDistanceIR_GP2D120_ir_value+0, 0 
L__getDistanceIR_GP2D120711:
	BTFSC       STATUS+0, 0 
	GOTO        L_getDistanceIR_GP2D120198
L__getDistanceIR_GP2D120633:
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
L_getDistanceIR_GP2D120198:
;ir.h,20 :: 		else if( 409<=ir_value && ir_value<481 )
	MOVLW       1
	SUBWF       FARG_getDistanceIR_GP2D120_ir_value+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__getDistanceIR_GP2D120712
	MOVLW       153
	SUBWF       FARG_getDistanceIR_GP2D120_ir_value+0, 0 
L__getDistanceIR_GP2D120712:
	BTFSS       STATUS+0, 0 
	GOTO        L_getDistanceIR_GP2D120202
	MOVLW       1
	SUBWF       FARG_getDistanceIR_GP2D120_ir_value+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__getDistanceIR_GP2D120713
	MOVLW       225
	SUBWF       FARG_getDistanceIR_GP2D120_ir_value+0, 0 
L__getDistanceIR_GP2D120713:
	BTFSC       STATUS+0, 0 
	GOTO        L_getDistanceIR_GP2D120202
L__getDistanceIR_GP2D120632:
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
L_getDistanceIR_GP2D120202:
;ir.h,23 :: 		else if( 364<=ir_value && ir_value<409 )
	MOVLW       1
	SUBWF       FARG_getDistanceIR_GP2D120_ir_value+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__getDistanceIR_GP2D120714
	MOVLW       108
	SUBWF       FARG_getDistanceIR_GP2D120_ir_value+0, 0 
L__getDistanceIR_GP2D120714:
	BTFSS       STATUS+0, 0 
	GOTO        L_getDistanceIR_GP2D120206
	MOVLW       1
	SUBWF       FARG_getDistanceIR_GP2D120_ir_value+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__getDistanceIR_GP2D120715
	MOVLW       153
	SUBWF       FARG_getDistanceIR_GP2D120_ir_value+0, 0 
L__getDistanceIR_GP2D120715:
	BTFSC       STATUS+0, 0 
	GOTO        L_getDistanceIR_GP2D120206
L__getDistanceIR_GP2D120631:
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
L_getDistanceIR_GP2D120206:
;ir.h,26 :: 		else if( 317<=ir_value && ir_value<364 )
	MOVLW       1
	SUBWF       FARG_getDistanceIR_GP2D120_ir_value+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__getDistanceIR_GP2D120716
	MOVLW       61
	SUBWF       FARG_getDistanceIR_GP2D120_ir_value+0, 0 
L__getDistanceIR_GP2D120716:
	BTFSS       STATUS+0, 0 
	GOTO        L_getDistanceIR_GP2D120210
	MOVLW       1
	SUBWF       FARG_getDistanceIR_GP2D120_ir_value+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__getDistanceIR_GP2D120717
	MOVLW       108
	SUBWF       FARG_getDistanceIR_GP2D120_ir_value+0, 0 
L__getDistanceIR_GP2D120717:
	BTFSC       STATUS+0, 0 
	GOTO        L_getDistanceIR_GP2D120210
L__getDistanceIR_GP2D120630:
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
L_getDistanceIR_GP2D120210:
;ir.h,29 :: 		else if( 286<=ir_value && ir_value<317 )
	MOVLW       1
	SUBWF       FARG_getDistanceIR_GP2D120_ir_value+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__getDistanceIR_GP2D120718
	MOVLW       30
	SUBWF       FARG_getDistanceIR_GP2D120_ir_value+0, 0 
L__getDistanceIR_GP2D120718:
	BTFSS       STATUS+0, 0 
	GOTO        L_getDistanceIR_GP2D120214
	MOVLW       1
	SUBWF       FARG_getDistanceIR_GP2D120_ir_value+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__getDistanceIR_GP2D120719
	MOVLW       61
	SUBWF       FARG_getDistanceIR_GP2D120_ir_value+0, 0 
L__getDistanceIR_GP2D120719:
	BTFSC       STATUS+0, 0 
	GOTO        L_getDistanceIR_GP2D120214
L__getDistanceIR_GP2D120629:
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
L_getDistanceIR_GP2D120214:
;ir.h,32 :: 		else if( 256<=ir_value && ir_value<286 )
	MOVLW       1
	SUBWF       FARG_getDistanceIR_GP2D120_ir_value+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__getDistanceIR_GP2D120720
	MOVLW       0
	SUBWF       FARG_getDistanceIR_GP2D120_ir_value+0, 0 
L__getDistanceIR_GP2D120720:
	BTFSS       STATUS+0, 0 
	GOTO        L_getDistanceIR_GP2D120218
	MOVLW       1
	SUBWF       FARG_getDistanceIR_GP2D120_ir_value+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__getDistanceIR_GP2D120721
	MOVLW       30
	SUBWF       FARG_getDistanceIR_GP2D120_ir_value+0, 0 
L__getDistanceIR_GP2D120721:
	BTFSC       STATUS+0, 0 
	GOTO        L_getDistanceIR_GP2D120218
L__getDistanceIR_GP2D120628:
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
L_getDistanceIR_GP2D120218:
;ir.h,35 :: 		else if( 215<=ir_value && ir_value<256 )
	MOVLW       0
	SUBWF       FARG_getDistanceIR_GP2D120_ir_value+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__getDistanceIR_GP2D120722
	MOVLW       215
	SUBWF       FARG_getDistanceIR_GP2D120_ir_value+0, 0 
L__getDistanceIR_GP2D120722:
	BTFSS       STATUS+0, 0 
	GOTO        L_getDistanceIR_GP2D120222
	MOVLW       1
	SUBWF       FARG_getDistanceIR_GP2D120_ir_value+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__getDistanceIR_GP2D120723
	MOVLW       0
	SUBWF       FARG_getDistanceIR_GP2D120_ir_value+0, 0 
L__getDistanceIR_GP2D120723:
	BTFSC       STATUS+0, 0 
	GOTO        L_getDistanceIR_GP2D120222
L__getDistanceIR_GP2D120627:
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
L_getDistanceIR_GP2D120222:
;ir.h,38 :: 		else if( 186<=ir_value && ir_value<215 )
	MOVLW       0
	SUBWF       FARG_getDistanceIR_GP2D120_ir_value+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__getDistanceIR_GP2D120724
	MOVLW       186
	SUBWF       FARG_getDistanceIR_GP2D120_ir_value+0, 0 
L__getDistanceIR_GP2D120724:
	BTFSS       STATUS+0, 0 
	GOTO        L_getDistanceIR_GP2D120226
	MOVLW       0
	SUBWF       FARG_getDistanceIR_GP2D120_ir_value+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__getDistanceIR_GP2D120725
	MOVLW       215
	SUBWF       FARG_getDistanceIR_GP2D120_ir_value+0, 0 
L__getDistanceIR_GP2D120725:
	BTFSC       STATUS+0, 0 
	GOTO        L_getDistanceIR_GP2D120226
L__getDistanceIR_GP2D120626:
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
L_getDistanceIR_GP2D120226:
;ir.h,41 :: 		else if( 166<=ir_value && ir_value<186 )
	MOVLW       0
	SUBWF       FARG_getDistanceIR_GP2D120_ir_value+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__getDistanceIR_GP2D120726
	MOVLW       166
	SUBWF       FARG_getDistanceIR_GP2D120_ir_value+0, 0 
L__getDistanceIR_GP2D120726:
	BTFSS       STATUS+0, 0 
	GOTO        L_getDistanceIR_GP2D120230
	MOVLW       0
	SUBWF       FARG_getDistanceIR_GP2D120_ir_value+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__getDistanceIR_GP2D120727
	MOVLW       186
	SUBWF       FARG_getDistanceIR_GP2D120_ir_value+0, 0 
L__getDistanceIR_GP2D120727:
	BTFSC       STATUS+0, 0 
	GOTO        L_getDistanceIR_GP2D120230
L__getDistanceIR_GP2D120625:
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
L_getDistanceIR_GP2D120230:
;ir.h,44 :: 		else if( 147<=ir_value && ir_value<166 )
	MOVLW       0
	SUBWF       FARG_getDistanceIR_GP2D120_ir_value+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__getDistanceIR_GP2D120728
	MOVLW       147
	SUBWF       FARG_getDistanceIR_GP2D120_ir_value+0, 0 
L__getDistanceIR_GP2D120728:
	BTFSS       STATUS+0, 0 
	GOTO        L_getDistanceIR_GP2D120234
	MOVLW       0
	SUBWF       FARG_getDistanceIR_GP2D120_ir_value+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__getDistanceIR_GP2D120729
	MOVLW       166
	SUBWF       FARG_getDistanceIR_GP2D120_ir_value+0, 0 
L__getDistanceIR_GP2D120729:
	BTFSC       STATUS+0, 0 
	GOTO        L_getDistanceIR_GP2D120234
L__getDistanceIR_GP2D120624:
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
L_getDistanceIR_GP2D120234:
;ir.h,47 :: 		else if( 133<=ir_value && ir_value<147 )
	MOVLW       0
	SUBWF       FARG_getDistanceIR_GP2D120_ir_value+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__getDistanceIR_GP2D120730
	MOVLW       133
	SUBWF       FARG_getDistanceIR_GP2D120_ir_value+0, 0 
L__getDistanceIR_GP2D120730:
	BTFSS       STATUS+0, 0 
	GOTO        L_getDistanceIR_GP2D120238
	MOVLW       0
	SUBWF       FARG_getDistanceIR_GP2D120_ir_value+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__getDistanceIR_GP2D120731
	MOVLW       147
	SUBWF       FARG_getDistanceIR_GP2D120_ir_value+0, 0 
L__getDistanceIR_GP2D120731:
	BTFSC       STATUS+0, 0 
	GOTO        L_getDistanceIR_GP2D120238
L__getDistanceIR_GP2D120623:
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
L_getDistanceIR_GP2D120238:
;ir.h,50 :: 		else if( 106<=ir_value && ir_value<133 )
	MOVLW       0
	SUBWF       FARG_getDistanceIR_GP2D120_ir_value+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__getDistanceIR_GP2D120732
	MOVLW       106
	SUBWF       FARG_getDistanceIR_GP2D120_ir_value+0, 0 
L__getDistanceIR_GP2D120732:
	BTFSS       STATUS+0, 0 
	GOTO        L_getDistanceIR_GP2D120242
	MOVLW       0
	SUBWF       FARG_getDistanceIR_GP2D120_ir_value+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__getDistanceIR_GP2D120733
	MOVLW       133
	SUBWF       FARG_getDistanceIR_GP2D120_ir_value+0, 0 
L__getDistanceIR_GP2D120733:
	BTFSC       STATUS+0, 0 
	GOTO        L_getDistanceIR_GP2D120242
L__getDistanceIR_GP2D120622:
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
L_getDistanceIR_GP2D120242:
;ir.h,53 :: 		else if( 88<=ir_value && ir_value<106 )
	MOVLW       0
	SUBWF       FARG_getDistanceIR_GP2D120_ir_value+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__getDistanceIR_GP2D120734
	MOVLW       88
	SUBWF       FARG_getDistanceIR_GP2D120_ir_value+0, 0 
L__getDistanceIR_GP2D120734:
	BTFSS       STATUS+0, 0 
	GOTO        L_getDistanceIR_GP2D120246
	MOVLW       0
	SUBWF       FARG_getDistanceIR_GP2D120_ir_value+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__getDistanceIR_GP2D120735
	MOVLW       106
	SUBWF       FARG_getDistanceIR_GP2D120_ir_value+0, 0 
L__getDistanceIR_GP2D120735:
	BTFSC       STATUS+0, 0 
	GOTO        L_getDistanceIR_GP2D120246
L__getDistanceIR_GP2D120621:
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
L_getDistanceIR_GP2D120246:
;ir.h,56 :: 		else if( 78<=ir_value && ir_value<88 )
	MOVLW       0
	SUBWF       FARG_getDistanceIR_GP2D120_ir_value+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__getDistanceIR_GP2D120736
	MOVLW       78
	SUBWF       FARG_getDistanceIR_GP2D120_ir_value+0, 0 
L__getDistanceIR_GP2D120736:
	BTFSS       STATUS+0, 0 
	GOTO        L_getDistanceIR_GP2D120250
	MOVLW       0
	SUBWF       FARG_getDistanceIR_GP2D120_ir_value+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__getDistanceIR_GP2D120737
	MOVLW       88
	SUBWF       FARG_getDistanceIR_GP2D120_ir_value+0, 0 
L__getDistanceIR_GP2D120737:
	BTFSC       STATUS+0, 0 
	GOTO        L_getDistanceIR_GP2D120250
L__getDistanceIR_GP2D120620:
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
L_getDistanceIR_GP2D120250:
;ir.h,59 :: 		else if( 65<=ir_value && ir_value<78 )
	MOVLW       0
	SUBWF       FARG_getDistanceIR_GP2D120_ir_value+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__getDistanceIR_GP2D120738
	MOVLW       65
	SUBWF       FARG_getDistanceIR_GP2D120_ir_value+0, 0 
L__getDistanceIR_GP2D120738:
	BTFSS       STATUS+0, 0 
	GOTO        L_getDistanceIR_GP2D120254
	MOVLW       0
	SUBWF       FARG_getDistanceIR_GP2D120_ir_value+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__getDistanceIR_GP2D120739
	MOVLW       78
	SUBWF       FARG_getDistanceIR_GP2D120_ir_value+0, 0 
L__getDistanceIR_GP2D120739:
	BTFSC       STATUS+0, 0 
	GOTO        L_getDistanceIR_GP2D120254
L__getDistanceIR_GP2D120619:
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
L_getDistanceIR_GP2D120254:
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
L_getSonarDistance256:
	DECFSZ      R13, 1, 0
	BRA         L_getSonarDistance256
	NOP
;sonar.h,10 :: 		TRIG = 1;
	BSF         PORTD+0, 0 
;sonar.h,11 :: 		delay_us(10);
	MOVLW       16
	MOVWF       R13, 0
L_getSonarDistance257:
	DECFSZ      R13, 1, 0
	BRA         L_getSonarDistance257
	NOP
;sonar.h,12 :: 		TRIG = 0;
	BCF         PORTD+0, 0 
;sonar.h,14 :: 		while(ECHO==0);
L_getSonarDistance258:
	BTFSC       PORTD+0, 1 
	GOTO        L_getSonarDistance259
	GOTO        L_getSonarDistance258
L_getSonarDistance259:
;sonar.h,15 :: 		_counter = 0;
	CLRF        __counter+0 
	CLRF        __counter+1 
;sonar.h,17 :: 		while(ECHO==1){
L_getSonarDistance260:
	BTFSS       PORTD+0, 1 
	GOTO        L_getSonarDistance261
;sonar.h,18 :: 		_counter++;
	INFSNZ      __counter+0, 1 
	INCF        __counter+1, 1 
;sonar.h,19 :: 		}
	GOTO        L_getSonarDistance260
L_getSonarDistance261:
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
	GOTO        L_getDistanceSonar2262
;sonar.h,33 :: 		TRIG = 0;
	BCF         PORTD+0, 0 
;sonar.h,34 :: 		delay_us(2);
	MOVLW       3
	MOVWF       R13, 0
L_getDistanceSonar2263:
	DECFSZ      R13, 1, 0
	BRA         L_getDistanceSonar2263
;sonar.h,35 :: 		TRIG = 1;
	BSF         PORTD+0, 0 
;sonar.h,36 :: 		delay_us(5);
	MOVLW       8
	MOVWF       R13, 0
L_getDistanceSonar2264:
	DECFSZ      R13, 1, 0
	BRA         L_getDistanceSonar2264
;sonar.h,37 :: 		TRIG =0;
	BCF         PORTD+0, 0 
;sonar.h,39 :: 		while(!ECHO)
L_getDistanceSonar2265:
	BTFSC       PORTD+0, 1 
	GOTO        L_getDistanceSonar2266
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
	GOTO        L__getDistanceSonar2740
	MOVF        getDistanceSonar2_H_L0+0, 0 
	SUBLW       240
L__getDistanceSonar2740:
	BTFSC       STATUS+0, 0 
	GOTO        L_getDistanceSonar2267
;sonar.h,44 :: 		break;
	GOTO        L_getDistanceSonar2266
L_getDistanceSonar2267:
;sonar.h,45 :: 		}
	GOTO        L_getDistanceSonar2265
L_getDistanceSonar2266:
;sonar.h,46 :: 		TMR1H=0;
	CLRF        TMR1H+0 
;sonar.h,47 :: 		TMR1L=0;
	CLRF        TMR1L+0 
;sonar.h,48 :: 		T1CON.TMR1ON=1;
	BSF         T1CON+0, 0 
;sonar.h,49 :: 		while(ECHO)
L_getDistanceSonar2268:
	BTFSS       PORTD+0, 1 
	GOTO        L_getDistanceSonar2269
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
	GOTO        L__getDistanceSonar2741
	MOVF        getDistanceSonar2_H_L0+0, 0 
	SUBLW       240
L__getDistanceSonar2741:
	BTFSC       STATUS+0, 0 
	GOTO        L_getDistanceSonar2270
;sonar.h,54 :: 		break;
	GOTO        L_getDistanceSonar2269
L_getDistanceSonar2270:
;sonar.h,55 :: 		}
	GOTO        L_getDistanceSonar2268
L_getDistanceSonar2269:
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
L_getDistanceSonar2262:
;sonar.h,91 :: 		}
	RETURN      0
; end of _getDistanceSonar2

_main:

;Main 3.0V.c,17 :: 		void main() {
;Main 3.0V.c,18 :: 		configure();
	CALL        _configure+0, 0
;Main 3.0V.c,19 :: 		setPID();
	CALL        _setPID+0, 0
;Main 3.0V.c,20 :: 		sendText("Starting...");
	MOVLW       ?lstr34_Main_323.0V+0
	MOVWF       FARG_sendText_aText+0 
	MOVLW       hi_addr(?lstr34_Main_323.0V+0)
	MOVWF       FARG_sendText_aText+1 
	CALL        _sendText+0, 0
;Main 3.0V.c,23 :: 		while(1){
L_main271:
;Main 3.0V.c,24 :: 		sendSensorStatus();
	CALL        _sendSensorStatus+0, 0
;Main 3.0V.c,25 :: 		delay_ms(300);
	MOVLW       8
	MOVWF       R11, 0
	MOVLW       157
	MOVWF       R12, 0
	MOVLW       5
	MOVWF       R13, 0
L_main273:
	DECFSZ      R13, 1, 0
	BRA         L_main273
	DECFSZ      R12, 1, 0
	BRA         L_main273
	DECFSZ      R11, 1, 0
	BRA         L_main273
	NOP
	NOP
;Main 3.0V.c,26 :: 		}
	GOTO        L_main271
;Main 3.0V.c,48 :: 		delay_ms(100);
L_main279:
	DECFSZ      R13, 1, 0
	BRA         L_main279
	DECFSZ      R12, 1, 0
	BRA         L_main279
	DECFSZ      R11, 1, 0
	BRA         L_main279
	NOP
	NOP
;Main 3.0V.c,84 :: 		}
	GOTO        $+0
; end of _main

_isRightSafe:

;Main 3.0V.c,86 :: 		int isRightSafe(){
;Main 3.0V.c,87 :: 		ir_value = ADC_Read(IRSensorRight);
	MOVLW       0
	BTFSC       PORTA+0, 1 
	MOVLW       1
	MOVWF       FARG_ADC_Read_channel+0 
	CALL        _ADC_Read+0, 0
	MOVF        R0, 0 
	MOVWF       _ir_value+0 
	MOVF        R1, 0 
	MOVWF       _ir_value+1 
;Main 3.0V.c,88 :: 		if(250<=ir_value && ir_value<800){                         // ~5cm
	MOVLW       0
	SUBWF       R1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__isRightSafe742
	MOVLW       250
	SUBWF       R0, 0 
L__isRightSafe742:
	BTFSS       STATUS+0, 0 
	GOTO        L_isRightSafe300
	MOVLW       3
	SUBWF       _ir_value+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__isRightSafe743
	MOVLW       32
	SUBWF       _ir_value+0, 0 
L__isRightSafe743:
	BTFSC       STATUS+0, 0 
	GOTO        L_isRightSafe300
L__isRightSafe640:
;Main 3.0V.c,89 :: 		return FALSE;
	CLRF        R0 
	CLRF        R1 
	RETURN      0
;Main 3.0V.c,90 :: 		}
L_isRightSafe300:
;Main 3.0V.c,91 :: 		return TRUE;
	MOVLW       1
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
;Main 3.0V.c,92 :: 		}
	RETURN      0
; end of _isRightSafe

_isMiddleSafe:

;Main 3.0V.c,94 :: 		int isMiddleSafe(){
;Main 3.0V.c,95 :: 		ir_value = ADC_Read(IRSensorCenter);
	MOVLW       0
	BTFSC       PORTA+0, 0 
	MOVLW       1
	MOVWF       FARG_ADC_Read_channel+0 
	CALL        _ADC_Read+0, 0
	MOVF        R0, 0 
	MOVWF       _ir_value+0 
	MOVF        R1, 0 
	MOVWF       _ir_value+1 
;Main 3.0V.c,96 :: 		if(250<=ir_value && ir_value<800){                         // ~5cm
	MOVLW       0
	SUBWF       R1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__isMiddleSafe744
	MOVLW       250
	SUBWF       R0, 0 
L__isMiddleSafe744:
	BTFSS       STATUS+0, 0 
	GOTO        L_isMiddleSafe303
	MOVLW       3
	SUBWF       _ir_value+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__isMiddleSafe745
	MOVLW       32
	SUBWF       _ir_value+0, 0 
L__isMiddleSafe745:
	BTFSC       STATUS+0, 0 
	GOTO        L_isMiddleSafe303
L__isMiddleSafe641:
;Main 3.0V.c,97 :: 		return FALSE;
	CLRF        R0 
	CLRF        R1 
	RETURN      0
;Main 3.0V.c,98 :: 		}
L_isMiddleSafe303:
;Main 3.0V.c,99 :: 		return TRUE;
	MOVLW       1
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
;Main 3.0V.c,100 :: 		}
	RETURN      0
; end of _isMiddleSafe

_isLeftSafe:

;Main 3.0V.c,102 :: 		int isLeftSafe(){
;Main 3.0V.c,103 :: 		ir_value = ADC_Read(IRSensorLeft);
	MOVLW       0
	BTFSC       PORTA+0, 2 
	MOVLW       1
	MOVWF       FARG_ADC_Read_channel+0 
	CALL        _ADC_Read+0, 0
	MOVF        R0, 0 
	MOVWF       _ir_value+0 
	MOVF        R1, 0 
	MOVWF       _ir_value+1 
;Main 3.0V.c,104 :: 		if(250<=ir_value && ir_value<800){                         // ~5cm
	MOVLW       0
	SUBWF       R1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__isLeftSafe746
	MOVLW       250
	SUBWF       R0, 0 
L__isLeftSafe746:
	BTFSS       STATUS+0, 0 
	GOTO        L_isLeftSafe306
	MOVLW       3
	SUBWF       _ir_value+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__isLeftSafe747
	MOVLW       32
	SUBWF       _ir_value+0, 0 
L__isLeftSafe747:
	BTFSC       STATUS+0, 0 
	GOTO        L_isLeftSafe306
L__isLeftSafe642:
;Main 3.0V.c,105 :: 		return FALSE;
	CLRF        R0 
	CLRF        R1 
	RETURN      0
;Main 3.0V.c,106 :: 		}
L_isLeftSafe306:
;Main 3.0V.c,107 :: 		return TRUE;
	MOVLW       1
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
;Main 3.0V.c,108 :: 		}
	RETURN      0
; end of _isLeftSafe

_moveStraightSlow:

;Main 3.0V.c,110 :: 		void moveStraightSlow(){
;Main 3.0V.c,111 :: 		moveForward(205,200);
	MOVLW       205
	MOVWF       FARG_moveForward_pwmLeft+0 
	MOVLW       0
	MOVWF       FARG_moveForward_pwmLeft+1 
	MOVLW       200
	MOVWF       FARG_moveForward_pwmRight+0 
	MOVLW       0
	MOVWF       FARG_moveForward_pwmRight+1 
	CALL        _moveForward+0, 0
;Main 3.0V.c,112 :: 		}
	RETURN      0
; end of _moveStraightSlow

_lineFollowNormal2:

;Main 3.0V.c,114 :: 		void lineFollowNormal2(){
;Main 3.0V.c,115 :: 		if(Scout == 1){
	BTFSS       PORTB+0, 5 
	GOTO        L_lineFollowNormal2307
;Main 3.0V.c,117 :: 		if( Sensor3==0 && Sensor4==1 && Sensor5==1 && Sensor6==0 && Sensor7==0)
	BTFSC       PORTD+0, 4 
	GOTO        L_lineFollowNormal2310
	BTFSS       PORTD+0, 5 
	GOTO        L_lineFollowNormal2310
	BTFSS       PORTD+0, 6 
	GOTO        L_lineFollowNormal2310
	BTFSC       PORTD+0, 7 
	GOTO        L_lineFollowNormal2310
	BTFSC       PORTB+0, 2 
	GOTO        L_lineFollowNormal2310
L__lineFollowNormal2662:
;Main 3.0V.c,118 :: 		moveForward(SLOW_PWM,FAST_PWM);
	MOVF        _SLOW_PWM+0, 0 
	MOVWF       FARG_moveForward_pwmLeft+0 
	MOVF        _SLOW_PWM+1, 0 
	MOVWF       FARG_moveForward_pwmLeft+1 
	MOVF        _FAST_PWM+0, 0 
	MOVWF       FARG_moveForward_pwmRight+0 
	MOVF        _FAST_PWM+1, 0 
	MOVWF       FARG_moveForward_pwmRight+1 
	CALL        _moveForward+0, 0
	GOTO        L_lineFollowNormal2311
L_lineFollowNormal2310:
;Main 3.0V.c,119 :: 		else if( Sensor3==0 && Sensor4==1 && Sensor5==1 && Sensor6==1 && Sensor7==0)
	BTFSC       PORTD+0, 4 
	GOTO        L_lineFollowNormal2314
	BTFSS       PORTD+0, 5 
	GOTO        L_lineFollowNormal2314
	BTFSS       PORTD+0, 6 
	GOTO        L_lineFollowNormal2314
	BTFSS       PORTD+0, 7 
	GOTO        L_lineFollowNormal2314
	BTFSC       PORTB+0, 2 
	GOTO        L_lineFollowNormal2314
L__lineFollowNormal2661:
;Main 3.0V.c,120 :: 		moveForward(FAST_PWM,FAST_PWM);
	MOVF        _FAST_PWM+0, 0 
	MOVWF       FARG_moveForward_pwmLeft+0 
	MOVF        _FAST_PWM+1, 0 
	MOVWF       FARG_moveForward_pwmLeft+1 
	MOVF        _FAST_PWM+0, 0 
	MOVWF       FARG_moveForward_pwmRight+0 
	MOVF        _FAST_PWM+1, 0 
	MOVWF       FARG_moveForward_pwmRight+1 
	CALL        _moveForward+0, 0
	GOTO        L_lineFollowNormal2315
L_lineFollowNormal2314:
;Main 3.0V.c,121 :: 		else if( Sensor3==0 && Sensor4==0 && Sensor5==1 && Sensor6==0 && Sensor7==0)
	BTFSC       PORTD+0, 4 
	GOTO        L_lineFollowNormal2318
	BTFSC       PORTD+0, 5 
	GOTO        L_lineFollowNormal2318
	BTFSS       PORTD+0, 6 
	GOTO        L_lineFollowNormal2318
	BTFSC       PORTD+0, 7 
	GOTO        L_lineFollowNormal2318
	BTFSC       PORTB+0, 2 
	GOTO        L_lineFollowNormal2318
L__lineFollowNormal2660:
;Main 3.0V.c,122 :: 		moveForward(FAST_PWM,FAST_PWM);
	MOVF        _FAST_PWM+0, 0 
	MOVWF       FARG_moveForward_pwmLeft+0 
	MOVF        _FAST_PWM+1, 0 
	MOVWF       FARG_moveForward_pwmLeft+1 
	MOVF        _FAST_PWM+0, 0 
	MOVWF       FARG_moveForward_pwmRight+0 
	MOVF        _FAST_PWM+1, 0 
	MOVWF       FARG_moveForward_pwmRight+1 
	CALL        _moveForward+0, 0
	GOTO        L_lineFollowNormal2319
L_lineFollowNormal2318:
;Main 3.0V.c,123 :: 		else if( Sensor3==0 && Sensor4==0 && Sensor5==1 && Sensor6==1 && Sensor7==0)
	BTFSC       PORTD+0, 4 
	GOTO        L_lineFollowNormal2322
	BTFSC       PORTD+0, 5 
	GOTO        L_lineFollowNormal2322
	BTFSS       PORTD+0, 6 
	GOTO        L_lineFollowNormal2322
	BTFSS       PORTD+0, 7 
	GOTO        L_lineFollowNormal2322
	BTFSC       PORTB+0, 2 
	GOTO        L_lineFollowNormal2322
L__lineFollowNormal2659:
;Main 3.0V.c,124 :: 		moveForward(FAST_PWM,SLOW_PWM);
	MOVF        _FAST_PWM+0, 0 
	MOVWF       FARG_moveForward_pwmLeft+0 
	MOVF        _FAST_PWM+1, 0 
	MOVWF       FARG_moveForward_pwmLeft+1 
	MOVF        _SLOW_PWM+0, 0 
	MOVWF       FARG_moveForward_pwmRight+0 
	MOVF        _SLOW_PWM+1, 0 
	MOVWF       FARG_moveForward_pwmRight+1 
	CALL        _moveForward+0, 0
	GOTO        L_lineFollowNormal2323
L_lineFollowNormal2322:
;Main 3.0V.c,129 :: 		else if( Sensor3==1 && Sensor4==0 && Sensor5==0 && Sensor6==0 && Sensor7==0)
	BTFSS       PORTD+0, 4 
	GOTO        L_lineFollowNormal2326
	BTFSC       PORTD+0, 5 
	GOTO        L_lineFollowNormal2326
	BTFSC       PORTD+0, 6 
	GOTO        L_lineFollowNormal2326
	BTFSC       PORTD+0, 7 
	GOTO        L_lineFollowNormal2326
	BTFSC       PORTB+0, 2 
	GOTO        L_lineFollowNormal2326
L__lineFollowNormal2658:
;Main 3.0V.c,130 :: 		while(!isOnThePath())
L_lineFollowNormal2327:
	CALL        _isOnThePath+0, 0
	MOVF        R0, 0 
	IORWF       R1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_lineFollowNormal2328
;Main 3.0V.c,131 :: 		turnLeft(FAST_PWM);
	MOVF        _FAST_PWM+0, 0 
	MOVWF       FARG_turnLeft_pwmRight+0 
	MOVF        _FAST_PWM+1, 0 
	MOVWF       FARG_turnLeft_pwmRight+1 
	CALL        _turnLeft+0, 0
	GOTO        L_lineFollowNormal2327
L_lineFollowNormal2328:
	GOTO        L_lineFollowNormal2329
L_lineFollowNormal2326:
;Main 3.0V.c,132 :: 		else if( Sensor3==1 && Sensor4==1 && Sensor5==0 && Sensor6==0 && Sensor7==0)
	BTFSS       PORTD+0, 4 
	GOTO        L_lineFollowNormal2332
	BTFSS       PORTD+0, 5 
	GOTO        L_lineFollowNormal2332
	BTFSC       PORTD+0, 6 
	GOTO        L_lineFollowNormal2332
	BTFSC       PORTD+0, 7 
	GOTO        L_lineFollowNormal2332
	BTFSC       PORTB+0, 2 
	GOTO        L_lineFollowNormal2332
L__lineFollowNormal2657:
;Main 3.0V.c,133 :: 		while(!isOnThePath())
L_lineFollowNormal2333:
	CALL        _isOnThePath+0, 0
	MOVF        R0, 0 
	IORWF       R1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_lineFollowNormal2334
;Main 3.0V.c,134 :: 		turnLeft(FAST_PWM);
	MOVF        _FAST_PWM+0, 0 
	MOVWF       FARG_turnLeft_pwmRight+0 
	MOVF        _FAST_PWM+1, 0 
	MOVWF       FARG_turnLeft_pwmRight+1 
	CALL        _turnLeft+0, 0
	GOTO        L_lineFollowNormal2333
L_lineFollowNormal2334:
	GOTO        L_lineFollowNormal2335
L_lineFollowNormal2332:
;Main 3.0V.c,135 :: 		else if( Sensor3==1 && Sensor4==1 && Sensor5==1 && Sensor6==0 && Sensor7==0)
	BTFSS       PORTD+0, 4 
	GOTO        L_lineFollowNormal2338
	BTFSS       PORTD+0, 5 
	GOTO        L_lineFollowNormal2338
	BTFSS       PORTD+0, 6 
	GOTO        L_lineFollowNormal2338
	BTFSC       PORTD+0, 7 
	GOTO        L_lineFollowNormal2338
	BTFSC       PORTB+0, 2 
	GOTO        L_lineFollowNormal2338
L__lineFollowNormal2656:
;Main 3.0V.c,136 :: 		while(!isOnThePath())
L_lineFollowNormal2339:
	CALL        _isOnThePath+0, 0
	MOVF        R0, 0 
	IORWF       R1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_lineFollowNormal2340
;Main 3.0V.c,137 :: 		turnLeft(FAST_PWM);
	MOVF        _FAST_PWM+0, 0 
	MOVWF       FARG_turnLeft_pwmRight+0 
	MOVF        _FAST_PWM+1, 0 
	MOVWF       FARG_turnLeft_pwmRight+1 
	CALL        _turnLeft+0, 0
	GOTO        L_lineFollowNormal2339
L_lineFollowNormal2340:
	GOTO        L_lineFollowNormal2341
L_lineFollowNormal2338:
;Main 3.0V.c,138 :: 		else if( Sensor3==0 && Sensor4==1 && Sensor5==0 && Sensor6==0 && Sensor7==0)
	BTFSC       PORTD+0, 4 
	GOTO        L_lineFollowNormal2344
	BTFSS       PORTD+0, 5 
	GOTO        L_lineFollowNormal2344
	BTFSC       PORTD+0, 6 
	GOTO        L_lineFollowNormal2344
	BTFSC       PORTD+0, 7 
	GOTO        L_lineFollowNormal2344
	BTFSC       PORTB+0, 2 
	GOTO        L_lineFollowNormal2344
L__lineFollowNormal2655:
;Main 3.0V.c,139 :: 		while(!isOnThePath())
L_lineFollowNormal2345:
	CALL        _isOnThePath+0, 0
	MOVF        R0, 0 
	IORWF       R1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_lineFollowNormal2346
;Main 3.0V.c,140 :: 		turnLeft(FAST_PWM);
	MOVF        _FAST_PWM+0, 0 
	MOVWF       FARG_turnLeft_pwmRight+0 
	MOVF        _FAST_PWM+1, 0 
	MOVWF       FARG_turnLeft_pwmRight+1 
	CALL        _turnLeft+0, 0
	GOTO        L_lineFollowNormal2345
L_lineFollowNormal2346:
	GOTO        L_lineFollowNormal2347
L_lineFollowNormal2344:
;Main 3.0V.c,143 :: 		else if( Sensor3==0 && Sensor4==0 && Sensor5==0 && Sensor6==1 && Sensor7==0)
	BTFSC       PORTD+0, 4 
	GOTO        L_lineFollowNormal2350
	BTFSC       PORTD+0, 5 
	GOTO        L_lineFollowNormal2350
	BTFSC       PORTD+0, 6 
	GOTO        L_lineFollowNormal2350
	BTFSS       PORTD+0, 7 
	GOTO        L_lineFollowNormal2350
	BTFSC       PORTB+0, 2 
	GOTO        L_lineFollowNormal2350
L__lineFollowNormal2654:
;Main 3.0V.c,144 :: 		while(!isOnThePath())
L_lineFollowNormal2351:
	CALL        _isOnThePath+0, 0
	MOVF        R0, 0 
	IORWF       R1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_lineFollowNormal2352
;Main 3.0V.c,145 :: 		turnRight(FAST_PWM);
	MOVF        _FAST_PWM+0, 0 
	MOVWF       FARG_turnRight_pwmLeft+0 
	MOVF        _FAST_PWM+1, 0 
	MOVWF       FARG_turnRight_pwmLeft+1 
	CALL        _turnRight+0, 0
	GOTO        L_lineFollowNormal2351
L_lineFollowNormal2352:
	GOTO        L_lineFollowNormal2353
L_lineFollowNormal2350:
;Main 3.0V.c,146 :: 		else if( Sensor3==0 && Sensor4==0 && Sensor5==1 && Sensor6==1 && Sensor7==1)
	BTFSC       PORTD+0, 4 
	GOTO        L_lineFollowNormal2356
	BTFSC       PORTD+0, 5 
	GOTO        L_lineFollowNormal2356
	BTFSS       PORTD+0, 6 
	GOTO        L_lineFollowNormal2356
	BTFSS       PORTD+0, 7 
	GOTO        L_lineFollowNormal2356
	BTFSS       PORTB+0, 2 
	GOTO        L_lineFollowNormal2356
L__lineFollowNormal2653:
;Main 3.0V.c,147 :: 		while(!isOnThePath())
L_lineFollowNormal2357:
	CALL        _isOnThePath+0, 0
	MOVF        R0, 0 
	IORWF       R1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_lineFollowNormal2358
;Main 3.0V.c,148 :: 		turnRight(FAST_PWM);
	MOVF        _FAST_PWM+0, 0 
	MOVWF       FARG_turnRight_pwmLeft+0 
	MOVF        _FAST_PWM+1, 0 
	MOVWF       FARG_turnRight_pwmLeft+1 
	CALL        _turnRight+0, 0
	GOTO        L_lineFollowNormal2357
L_lineFollowNormal2358:
	GOTO        L_lineFollowNormal2359
L_lineFollowNormal2356:
;Main 3.0V.c,149 :: 		else if( Sensor3==0 && Sensor4==0 && Sensor5==0 && Sensor6==1 && Sensor7==1)
	BTFSC       PORTD+0, 4 
	GOTO        L_lineFollowNormal2362
	BTFSC       PORTD+0, 5 
	GOTO        L_lineFollowNormal2362
	BTFSC       PORTD+0, 6 
	GOTO        L_lineFollowNormal2362
	BTFSS       PORTD+0, 7 
	GOTO        L_lineFollowNormal2362
	BTFSS       PORTB+0, 2 
	GOTO        L_lineFollowNormal2362
L__lineFollowNormal2652:
;Main 3.0V.c,150 :: 		while(!isOnThePath())
L_lineFollowNormal2363:
	CALL        _isOnThePath+0, 0
	MOVF        R0, 0 
	IORWF       R1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_lineFollowNormal2364
;Main 3.0V.c,151 :: 		turnRight(FAST_PWM);
	MOVF        _FAST_PWM+0, 0 
	MOVWF       FARG_turnRight_pwmLeft+0 
	MOVF        _FAST_PWM+1, 0 
	MOVWF       FARG_turnRight_pwmLeft+1 
	CALL        _turnRight+0, 0
	GOTO        L_lineFollowNormal2363
L_lineFollowNormal2364:
	GOTO        L_lineFollowNormal2365
L_lineFollowNormal2362:
;Main 3.0V.c,152 :: 		else if( Sensor3==0 && Sensor4==0 && Sensor5==0 && Sensor6==0 && Sensor7==1)
	BTFSC       PORTD+0, 4 
	GOTO        L_lineFollowNormal2368
	BTFSC       PORTD+0, 5 
	GOTO        L_lineFollowNormal2368
	BTFSC       PORTD+0, 6 
	GOTO        L_lineFollowNormal2368
	BTFSC       PORTD+0, 7 
	GOTO        L_lineFollowNormal2368
	BTFSS       PORTB+0, 2 
	GOTO        L_lineFollowNormal2368
L__lineFollowNormal2651:
;Main 3.0V.c,153 :: 		while(!isOnThePath())
L_lineFollowNormal2369:
	CALL        _isOnThePath+0, 0
	MOVF        R0, 0 
	IORWF       R1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_lineFollowNormal2370
;Main 3.0V.c,154 :: 		turnRight(FAST_PWM);
	MOVF        _FAST_PWM+0, 0 
	MOVWF       FARG_turnRight_pwmLeft+0 
	MOVF        _FAST_PWM+1, 0 
	MOVWF       FARG_turnRight_pwmLeft+1 
	CALL        _turnRight+0, 0
	GOTO        L_lineFollowNormal2369
L_lineFollowNormal2370:
	GOTO        L_lineFollowNormal2371
L_lineFollowNormal2368:
;Main 3.0V.c,156 :: 		else if(isAllBlack()){
	CALL        _isAllBlack+0, 0
	MOVF        R0, 0 
	IORWF       R1, 0 
	BTFSC       STATUS+0, 2 
	GOTO        L_lineFollowNormal2372
;Main 3.0V.c,158 :: 		stop();
	CALL        _stop+0, 0
;Main 3.0V.c,159 :: 		}
	GOTO        L_lineFollowNormal2373
L_lineFollowNormal2372:
;Main 3.0V.c,161 :: 		stop();
	CALL        _stop+0, 0
L_lineFollowNormal2373:
L_lineFollowNormal2371:
L_lineFollowNormal2365:
L_lineFollowNormal2359:
L_lineFollowNormal2353:
L_lineFollowNormal2347:
L_lineFollowNormal2341:
L_lineFollowNormal2335:
L_lineFollowNormal2329:
L_lineFollowNormal2323:
L_lineFollowNormal2319:
L_lineFollowNormal2315:
L_lineFollowNormal2311:
;Main 3.0V.c,162 :: 		}
	GOTO        L_lineFollowNormal2374
L_lineFollowNormal2307:
;Main 3.0V.c,168 :: 		if( Sensor3==1 && Sensor4==0 && Sensor5==0 && Sensor6==0 && Sensor7==0)
	BTFSS       PORTD+0, 4 
	GOTO        L_lineFollowNormal2377
	BTFSC       PORTD+0, 5 
	GOTO        L_lineFollowNormal2377
	BTFSC       PORTD+0, 6 
	GOTO        L_lineFollowNormal2377
	BTFSC       PORTD+0, 7 
	GOTO        L_lineFollowNormal2377
	BTFSC       PORTB+0, 2 
	GOTO        L_lineFollowNormal2377
L__lineFollowNormal2650:
;Main 3.0V.c,169 :: 		while(!isOnThePath())
L_lineFollowNormal2378:
	CALL        _isOnThePath+0, 0
	MOVF        R0, 0 
	IORWF       R1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_lineFollowNormal2379
;Main 3.0V.c,170 :: 		turnLeft(FAST_PWM);
	MOVF        _FAST_PWM+0, 0 
	MOVWF       FARG_turnLeft_pwmRight+0 
	MOVF        _FAST_PWM+1, 0 
	MOVWF       FARG_turnLeft_pwmRight+1 
	CALL        _turnLeft+0, 0
	GOTO        L_lineFollowNormal2378
L_lineFollowNormal2379:
	GOTO        L_lineFollowNormal2380
L_lineFollowNormal2377:
;Main 3.0V.c,171 :: 		else if( Sensor3==1 && Sensor4==1 && Sensor5==0 && Sensor6==0 && Sensor7==0)
	BTFSS       PORTD+0, 4 
	GOTO        L_lineFollowNormal2383
	BTFSS       PORTD+0, 5 
	GOTO        L_lineFollowNormal2383
	BTFSC       PORTD+0, 6 
	GOTO        L_lineFollowNormal2383
	BTFSC       PORTD+0, 7 
	GOTO        L_lineFollowNormal2383
	BTFSC       PORTB+0, 2 
	GOTO        L_lineFollowNormal2383
L__lineFollowNormal2649:
;Main 3.0V.c,172 :: 		while(!isOnThePath())
L_lineFollowNormal2384:
	CALL        _isOnThePath+0, 0
	MOVF        R0, 0 
	IORWF       R1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_lineFollowNormal2385
;Main 3.0V.c,173 :: 		turnLeft(FAST_PWM);
	MOVF        _FAST_PWM+0, 0 
	MOVWF       FARG_turnLeft_pwmRight+0 
	MOVF        _FAST_PWM+1, 0 
	MOVWF       FARG_turnLeft_pwmRight+1 
	CALL        _turnLeft+0, 0
	GOTO        L_lineFollowNormal2384
L_lineFollowNormal2385:
	GOTO        L_lineFollowNormal2386
L_lineFollowNormal2383:
;Main 3.0V.c,174 :: 		else if( Sensor3==1 && Sensor4==1 && Sensor5==1 && Sensor6==0 && Sensor7==0)
	BTFSS       PORTD+0, 4 
	GOTO        L_lineFollowNormal2389
	BTFSS       PORTD+0, 5 
	GOTO        L_lineFollowNormal2389
	BTFSS       PORTD+0, 6 
	GOTO        L_lineFollowNormal2389
	BTFSC       PORTD+0, 7 
	GOTO        L_lineFollowNormal2389
	BTFSC       PORTB+0, 2 
	GOTO        L_lineFollowNormal2389
L__lineFollowNormal2648:
;Main 3.0V.c,175 :: 		while(!isOnThePath())
L_lineFollowNormal2390:
	CALL        _isOnThePath+0, 0
	MOVF        R0, 0 
	IORWF       R1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_lineFollowNormal2391
;Main 3.0V.c,176 :: 		turnLeft(FAST_PWM);
	MOVF        _FAST_PWM+0, 0 
	MOVWF       FARG_turnLeft_pwmRight+0 
	MOVF        _FAST_PWM+1, 0 
	MOVWF       FARG_turnLeft_pwmRight+1 
	CALL        _turnLeft+0, 0
	GOTO        L_lineFollowNormal2390
L_lineFollowNormal2391:
	GOTO        L_lineFollowNormal2392
L_lineFollowNormal2389:
;Main 3.0V.c,177 :: 		else if( Sensor3==0 && Sensor4==1 && Sensor5==0 && Sensor6==0 && Sensor7==0)
	BTFSC       PORTD+0, 4 
	GOTO        L_lineFollowNormal2395
	BTFSS       PORTD+0, 5 
	GOTO        L_lineFollowNormal2395
	BTFSC       PORTD+0, 6 
	GOTO        L_lineFollowNormal2395
	BTFSC       PORTD+0, 7 
	GOTO        L_lineFollowNormal2395
	BTFSC       PORTB+0, 2 
	GOTO        L_lineFollowNormal2395
L__lineFollowNormal2647:
;Main 3.0V.c,178 :: 		while(!isOnThePath())
L_lineFollowNormal2396:
	CALL        _isOnThePath+0, 0
	MOVF        R0, 0 
	IORWF       R1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_lineFollowNormal2397
;Main 3.0V.c,179 :: 		turnLeft(FAST_PWM);
	MOVF        _FAST_PWM+0, 0 
	MOVWF       FARG_turnLeft_pwmRight+0 
	MOVF        _FAST_PWM+1, 0 
	MOVWF       FARG_turnLeft_pwmRight+1 
	CALL        _turnLeft+0, 0
	GOTO        L_lineFollowNormal2396
L_lineFollowNormal2397:
	GOTO        L_lineFollowNormal2398
L_lineFollowNormal2395:
;Main 3.0V.c,182 :: 		else if( Sensor3==0 && Sensor4==0 && Sensor5==0 && Sensor6==1 && Sensor7==0)
	BTFSC       PORTD+0, 4 
	GOTO        L_lineFollowNormal2401
	BTFSC       PORTD+0, 5 
	GOTO        L_lineFollowNormal2401
	BTFSC       PORTD+0, 6 
	GOTO        L_lineFollowNormal2401
	BTFSS       PORTD+0, 7 
	GOTO        L_lineFollowNormal2401
	BTFSC       PORTB+0, 2 
	GOTO        L_lineFollowNormal2401
L__lineFollowNormal2646:
;Main 3.0V.c,183 :: 		while(!isOnThePath())
L_lineFollowNormal2402:
	CALL        _isOnThePath+0, 0
	MOVF        R0, 0 
	IORWF       R1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_lineFollowNormal2403
;Main 3.0V.c,184 :: 		turnRight(FAST_PWM);
	MOVF        _FAST_PWM+0, 0 
	MOVWF       FARG_turnRight_pwmLeft+0 
	MOVF        _FAST_PWM+1, 0 
	MOVWF       FARG_turnRight_pwmLeft+1 
	CALL        _turnRight+0, 0
	GOTO        L_lineFollowNormal2402
L_lineFollowNormal2403:
	GOTO        L_lineFollowNormal2404
L_lineFollowNormal2401:
;Main 3.0V.c,185 :: 		else if( Sensor3==0 && Sensor4==0 && Sensor5==1 && Sensor6==1 && Sensor7==1)
	BTFSC       PORTD+0, 4 
	GOTO        L_lineFollowNormal2407
	BTFSC       PORTD+0, 5 
	GOTO        L_lineFollowNormal2407
	BTFSS       PORTD+0, 6 
	GOTO        L_lineFollowNormal2407
	BTFSS       PORTD+0, 7 
	GOTO        L_lineFollowNormal2407
	BTFSS       PORTB+0, 2 
	GOTO        L_lineFollowNormal2407
L__lineFollowNormal2645:
;Main 3.0V.c,186 :: 		while(!isOnThePath())
L_lineFollowNormal2408:
	CALL        _isOnThePath+0, 0
	MOVF        R0, 0 
	IORWF       R1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_lineFollowNormal2409
;Main 3.0V.c,187 :: 		turnRight(FAST_PWM);
	MOVF        _FAST_PWM+0, 0 
	MOVWF       FARG_turnRight_pwmLeft+0 
	MOVF        _FAST_PWM+1, 0 
	MOVWF       FARG_turnRight_pwmLeft+1 
	CALL        _turnRight+0, 0
	GOTO        L_lineFollowNormal2408
L_lineFollowNormal2409:
	GOTO        L_lineFollowNormal2410
L_lineFollowNormal2407:
;Main 3.0V.c,188 :: 		else if( Sensor3==0 && Sensor4==0 && Sensor5==0 && Sensor6==1 && Sensor7==1)
	BTFSC       PORTD+0, 4 
	GOTO        L_lineFollowNormal2413
	BTFSC       PORTD+0, 5 
	GOTO        L_lineFollowNormal2413
	BTFSC       PORTD+0, 6 
	GOTO        L_lineFollowNormal2413
	BTFSS       PORTD+0, 7 
	GOTO        L_lineFollowNormal2413
	BTFSS       PORTB+0, 2 
	GOTO        L_lineFollowNormal2413
L__lineFollowNormal2644:
;Main 3.0V.c,189 :: 		while(!isOnThePath())
L_lineFollowNormal2414:
	CALL        _isOnThePath+0, 0
	MOVF        R0, 0 
	IORWF       R1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_lineFollowNormal2415
;Main 3.0V.c,190 :: 		turnRight(FAST_PWM);
	MOVF        _FAST_PWM+0, 0 
	MOVWF       FARG_turnRight_pwmLeft+0 
	MOVF        _FAST_PWM+1, 0 
	MOVWF       FARG_turnRight_pwmLeft+1 
	CALL        _turnRight+0, 0
	GOTO        L_lineFollowNormal2414
L_lineFollowNormal2415:
	GOTO        L_lineFollowNormal2416
L_lineFollowNormal2413:
;Main 3.0V.c,191 :: 		else if( Sensor3==0 && Sensor4==0 && Sensor5==0 && Sensor6==0 && Sensor7==1)
	BTFSC       PORTD+0, 4 
	GOTO        L_lineFollowNormal2419
	BTFSC       PORTD+0, 5 
	GOTO        L_lineFollowNormal2419
	BTFSC       PORTD+0, 6 
	GOTO        L_lineFollowNormal2419
	BTFSC       PORTD+0, 7 
	GOTO        L_lineFollowNormal2419
	BTFSS       PORTB+0, 2 
	GOTO        L_lineFollowNormal2419
L__lineFollowNormal2643:
;Main 3.0V.c,192 :: 		while(!isOnThePath())
L_lineFollowNormal2420:
	CALL        _isOnThePath+0, 0
	MOVF        R0, 0 
	IORWF       R1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_lineFollowNormal2421
;Main 3.0V.c,193 :: 		turnRight(FAST_PWM);
	MOVF        _FAST_PWM+0, 0 
	MOVWF       FARG_turnRight_pwmLeft+0 
	MOVF        _FAST_PWM+1, 0 
	MOVWF       FARG_turnRight_pwmLeft+1 
	CALL        _turnRight+0, 0
	GOTO        L_lineFollowNormal2420
L_lineFollowNormal2421:
	GOTO        L_lineFollowNormal2422
L_lineFollowNormal2419:
;Main 3.0V.c,197 :: 		else if(isAllWhite()){
	CALL        _isAllWhite+0, 0
	MOVF        R0, 0 
	IORWF       R1, 0 
	BTFSC       STATUS+0, 2 
	GOTO        L_lineFollowNormal2423
;Main 3.0V.c,199 :: 		stop();
	CALL        _stop+0, 0
;Main 3.0V.c,200 :: 		}
	GOTO        L_lineFollowNormal2424
L_lineFollowNormal2423:
;Main 3.0V.c,202 :: 		stop();
	CALL        _stop+0, 0
L_lineFollowNormal2424:
L_lineFollowNormal2422:
L_lineFollowNormal2416:
L_lineFollowNormal2410:
L_lineFollowNormal2404:
L_lineFollowNormal2398:
L_lineFollowNormal2392:
L_lineFollowNormal2386:
L_lineFollowNormal2380:
;Main 3.0V.c,203 :: 		}
L_lineFollowNormal2374:
;Main 3.0V.c,204 :: 		}
	RETURN      0
; end of _lineFollowNormal2

_lineFollowNormal3:

;Main 3.0V.c,206 :: 		void lineFollowNormal3(){
;Main 3.0V.c,207 :: 		if(Scout == 1){
	BTFSS       PORTB+0, 5 
	GOTO        L_lineFollowNormal3425
;Main 3.0V.c,209 :: 		if( Sensor3==0 && Sensor4==1 && Sensor5==1 && Sensor6==0 && Sensor7==0)
	BTFSC       PORTD+0, 4 
	GOTO        L_lineFollowNormal3428
	BTFSS       PORTD+0, 5 
	GOTO        L_lineFollowNormal3428
	BTFSS       PORTD+0, 6 
	GOTO        L_lineFollowNormal3428
	BTFSC       PORTD+0, 7 
	GOTO        L_lineFollowNormal3428
	BTFSC       PORTB+0, 2 
	GOTO        L_lineFollowNormal3428
L__lineFollowNormal3696:
;Main 3.0V.c,210 :: 		moveForward(SLOW_PWM,FAST_PWM);
	MOVF        _SLOW_PWM+0, 0 
	MOVWF       FARG_moveForward_pwmLeft+0 
	MOVF        _SLOW_PWM+1, 0 
	MOVWF       FARG_moveForward_pwmLeft+1 
	MOVF        _FAST_PWM+0, 0 
	MOVWF       FARG_moveForward_pwmRight+0 
	MOVF        _FAST_PWM+1, 0 
	MOVWF       FARG_moveForward_pwmRight+1 
	CALL        _moveForward+0, 0
	GOTO        L_lineFollowNormal3429
L_lineFollowNormal3428:
;Main 3.0V.c,211 :: 		else if( Sensor3==0 && Sensor4==1 && Sensor5==1 && Sensor6==1 && Sensor7==0)
	BTFSC       PORTD+0, 4 
	GOTO        L_lineFollowNormal3432
	BTFSS       PORTD+0, 5 
	GOTO        L_lineFollowNormal3432
	BTFSS       PORTD+0, 6 
	GOTO        L_lineFollowNormal3432
	BTFSS       PORTD+0, 7 
	GOTO        L_lineFollowNormal3432
	BTFSC       PORTB+0, 2 
	GOTO        L_lineFollowNormal3432
L__lineFollowNormal3695:
;Main 3.0V.c,212 :: 		moveForward(FAST_PWM,FAST_PWM);
	MOVF        _FAST_PWM+0, 0 
	MOVWF       FARG_moveForward_pwmLeft+0 
	MOVF        _FAST_PWM+1, 0 
	MOVWF       FARG_moveForward_pwmLeft+1 
	MOVF        _FAST_PWM+0, 0 
	MOVWF       FARG_moveForward_pwmRight+0 
	MOVF        _FAST_PWM+1, 0 
	MOVWF       FARG_moveForward_pwmRight+1 
	CALL        _moveForward+0, 0
	GOTO        L_lineFollowNormal3433
L_lineFollowNormal3432:
;Main 3.0V.c,213 :: 		else if( Sensor3==0 && Sensor4==0 && Sensor5==1 && Sensor6==0 && Sensor7==0)
	BTFSC       PORTD+0, 4 
	GOTO        L_lineFollowNormal3436
	BTFSC       PORTD+0, 5 
	GOTO        L_lineFollowNormal3436
	BTFSS       PORTD+0, 6 
	GOTO        L_lineFollowNormal3436
	BTFSC       PORTD+0, 7 
	GOTO        L_lineFollowNormal3436
	BTFSC       PORTB+0, 2 
	GOTO        L_lineFollowNormal3436
L__lineFollowNormal3694:
;Main 3.0V.c,214 :: 		moveForward(FAST_PWM,FAST_PWM);
	MOVF        _FAST_PWM+0, 0 
	MOVWF       FARG_moveForward_pwmLeft+0 
	MOVF        _FAST_PWM+1, 0 
	MOVWF       FARG_moveForward_pwmLeft+1 
	MOVF        _FAST_PWM+0, 0 
	MOVWF       FARG_moveForward_pwmRight+0 
	MOVF        _FAST_PWM+1, 0 
	MOVWF       FARG_moveForward_pwmRight+1 
	CALL        _moveForward+0, 0
	GOTO        L_lineFollowNormal3437
L_lineFollowNormal3436:
;Main 3.0V.c,215 :: 		else if( Sensor3==0 && Sensor4==0 && Sensor5==1 && Sensor6==1 && Sensor7==0)
	BTFSC       PORTD+0, 4 
	GOTO        L_lineFollowNormal3440
	BTFSC       PORTD+0, 5 
	GOTO        L_lineFollowNormal3440
	BTFSS       PORTD+0, 6 
	GOTO        L_lineFollowNormal3440
	BTFSS       PORTD+0, 7 
	GOTO        L_lineFollowNormal3440
	BTFSC       PORTB+0, 2 
	GOTO        L_lineFollowNormal3440
L__lineFollowNormal3693:
;Main 3.0V.c,216 :: 		moveForward(FAST_PWM,SLOW_PWM);
	MOVF        _FAST_PWM+0, 0 
	MOVWF       FARG_moveForward_pwmLeft+0 
	MOVF        _FAST_PWM+1, 0 
	MOVWF       FARG_moveForward_pwmLeft+1 
	MOVF        _SLOW_PWM+0, 0 
	MOVWF       FARG_moveForward_pwmRight+0 
	MOVF        _SLOW_PWM+1, 0 
	MOVWF       FARG_moveForward_pwmRight+1 
	CALL        _moveForward+0, 0
	GOTO        L_lineFollowNormal3441
L_lineFollowNormal3440:
;Main 3.0V.c,221 :: 		else if( Sensor3==1 && Sensor4==0 && Sensor5==0 && Sensor6==0 && Sensor7==0)
	BTFSS       PORTD+0, 4 
	GOTO        L_lineFollowNormal3444
	BTFSC       PORTD+0, 5 
	GOTO        L_lineFollowNormal3444
	BTFSC       PORTD+0, 6 
	GOTO        L_lineFollowNormal3444
	BTFSC       PORTD+0, 7 
	GOTO        L_lineFollowNormal3444
	BTFSC       PORTB+0, 2 
	GOTO        L_lineFollowNormal3444
L__lineFollowNormal3692:
;Main 3.0V.c,223 :: 		turnLeft(FAST_PWM);
	MOVF        _FAST_PWM+0, 0 
	MOVWF       FARG_turnLeft_pwmRight+0 
	MOVF        _FAST_PWM+1, 0 
	MOVWF       FARG_turnLeft_pwmRight+1 
	CALL        _turnLeft+0, 0
	GOTO        L_lineFollowNormal3445
L_lineFollowNormal3444:
;Main 3.0V.c,224 :: 		else if( Sensor3==1 && Sensor4==1 && Sensor5==0 && Sensor6==0 && Sensor7==0)
	BTFSS       PORTD+0, 4 
	GOTO        L_lineFollowNormal3448
	BTFSS       PORTD+0, 5 
	GOTO        L_lineFollowNormal3448
	BTFSC       PORTD+0, 6 
	GOTO        L_lineFollowNormal3448
	BTFSC       PORTD+0, 7 
	GOTO        L_lineFollowNormal3448
	BTFSC       PORTB+0, 2 
	GOTO        L_lineFollowNormal3448
L__lineFollowNormal3691:
;Main 3.0V.c,226 :: 		turnLeft(FAST_PWM);
	MOVF        _FAST_PWM+0, 0 
	MOVWF       FARG_turnLeft_pwmRight+0 
	MOVF        _FAST_PWM+1, 0 
	MOVWF       FARG_turnLeft_pwmRight+1 
	CALL        _turnLeft+0, 0
	GOTO        L_lineFollowNormal3449
L_lineFollowNormal3448:
;Main 3.0V.c,227 :: 		else if( Sensor3==1 && Sensor4==1 && Sensor5==1 && Sensor6==0 && Sensor7==0)
	BTFSS       PORTD+0, 4 
	GOTO        L_lineFollowNormal3452
	BTFSS       PORTD+0, 5 
	GOTO        L_lineFollowNormal3452
	BTFSS       PORTD+0, 6 
	GOTO        L_lineFollowNormal3452
	BTFSC       PORTD+0, 7 
	GOTO        L_lineFollowNormal3452
	BTFSC       PORTB+0, 2 
	GOTO        L_lineFollowNormal3452
L__lineFollowNormal3690:
;Main 3.0V.c,229 :: 		turnLeft(FAST_PWM);
	MOVF        _FAST_PWM+0, 0 
	MOVWF       FARG_turnLeft_pwmRight+0 
	MOVF        _FAST_PWM+1, 0 
	MOVWF       FARG_turnLeft_pwmRight+1 
	CALL        _turnLeft+0, 0
	GOTO        L_lineFollowNormal3453
L_lineFollowNormal3452:
;Main 3.0V.c,230 :: 		else if( Sensor3==0 && Sensor4==1 && Sensor5==0 && Sensor6==0 && Sensor7==0)
	BTFSC       PORTD+0, 4 
	GOTO        L_lineFollowNormal3456
	BTFSS       PORTD+0, 5 
	GOTO        L_lineFollowNormal3456
	BTFSC       PORTD+0, 6 
	GOTO        L_lineFollowNormal3456
	BTFSC       PORTD+0, 7 
	GOTO        L_lineFollowNormal3456
	BTFSC       PORTB+0, 2 
	GOTO        L_lineFollowNormal3456
L__lineFollowNormal3689:
;Main 3.0V.c,232 :: 		turnLeft(FAST_PWM);
	MOVF        _FAST_PWM+0, 0 
	MOVWF       FARG_turnLeft_pwmRight+0 
	MOVF        _FAST_PWM+1, 0 
	MOVWF       FARG_turnLeft_pwmRight+1 
	CALL        _turnLeft+0, 0
	GOTO        L_lineFollowNormal3457
L_lineFollowNormal3456:
;Main 3.0V.c,235 :: 		else if( Sensor3==0 && Sensor4==0 && Sensor5==0 && Sensor6==1 && Sensor7==0)
	BTFSC       PORTD+0, 4 
	GOTO        L_lineFollowNormal3460
	BTFSC       PORTD+0, 5 
	GOTO        L_lineFollowNormal3460
	BTFSC       PORTD+0, 6 
	GOTO        L_lineFollowNormal3460
	BTFSS       PORTD+0, 7 
	GOTO        L_lineFollowNormal3460
	BTFSC       PORTB+0, 2 
	GOTO        L_lineFollowNormal3460
L__lineFollowNormal3688:
;Main 3.0V.c,237 :: 		turnRight(FAST_PWM);
	MOVF        _FAST_PWM+0, 0 
	MOVWF       FARG_turnRight_pwmLeft+0 
	MOVF        _FAST_PWM+1, 0 
	MOVWF       FARG_turnRight_pwmLeft+1 
	CALL        _turnRight+0, 0
	GOTO        L_lineFollowNormal3461
L_lineFollowNormal3460:
;Main 3.0V.c,238 :: 		else if( Sensor3==0 && Sensor4==0 && Sensor5==1 && Sensor6==1 && Sensor7==1)
	BTFSC       PORTD+0, 4 
	GOTO        L_lineFollowNormal3464
	BTFSC       PORTD+0, 5 
	GOTO        L_lineFollowNormal3464
	BTFSS       PORTD+0, 6 
	GOTO        L_lineFollowNormal3464
	BTFSS       PORTD+0, 7 
	GOTO        L_lineFollowNormal3464
	BTFSS       PORTB+0, 2 
	GOTO        L_lineFollowNormal3464
L__lineFollowNormal3687:
;Main 3.0V.c,240 :: 		turnRight(FAST_PWM);
	MOVF        _FAST_PWM+0, 0 
	MOVWF       FARG_turnRight_pwmLeft+0 
	MOVF        _FAST_PWM+1, 0 
	MOVWF       FARG_turnRight_pwmLeft+1 
	CALL        _turnRight+0, 0
	GOTO        L_lineFollowNormal3465
L_lineFollowNormal3464:
;Main 3.0V.c,241 :: 		else if( Sensor3==0 && Sensor4==0 && Sensor5==0 && Sensor6==1 && Sensor7==1)
	BTFSC       PORTD+0, 4 
	GOTO        L_lineFollowNormal3468
	BTFSC       PORTD+0, 5 
	GOTO        L_lineFollowNormal3468
	BTFSC       PORTD+0, 6 
	GOTO        L_lineFollowNormal3468
	BTFSS       PORTD+0, 7 
	GOTO        L_lineFollowNormal3468
	BTFSS       PORTB+0, 2 
	GOTO        L_lineFollowNormal3468
L__lineFollowNormal3686:
;Main 3.0V.c,243 :: 		turnRight(FAST_PWM);
	MOVF        _FAST_PWM+0, 0 
	MOVWF       FARG_turnRight_pwmLeft+0 
	MOVF        _FAST_PWM+1, 0 
	MOVWF       FARG_turnRight_pwmLeft+1 
	CALL        _turnRight+0, 0
	GOTO        L_lineFollowNormal3469
L_lineFollowNormal3468:
;Main 3.0V.c,244 :: 		else if( Sensor3==0 && Sensor4==0 && Sensor5==0 && Sensor6==0 && Sensor7==1)
	BTFSC       PORTD+0, 4 
	GOTO        L_lineFollowNormal3472
	BTFSC       PORTD+0, 5 
	GOTO        L_lineFollowNormal3472
	BTFSC       PORTD+0, 6 
	GOTO        L_lineFollowNormal3472
	BTFSC       PORTD+0, 7 
	GOTO        L_lineFollowNormal3472
	BTFSS       PORTB+0, 2 
	GOTO        L_lineFollowNormal3472
L__lineFollowNormal3685:
;Main 3.0V.c,246 :: 		turnRight(FAST_PWM);
	MOVF        _FAST_PWM+0, 0 
	MOVWF       FARG_turnRight_pwmLeft+0 
	MOVF        _FAST_PWM+1, 0 
	MOVWF       FARG_turnRight_pwmLeft+1 
	CALL        _turnRight+0, 0
	GOTO        L_lineFollowNormal3473
L_lineFollowNormal3472:
;Main 3.0V.c,249 :: 		else if( Sensor3==1 && Sensor4==1 && Sensor5==1 && Sensor6==1 && Sensor7==0)
	BTFSS       PORTD+0, 4 
	GOTO        L_lineFollowNormal3476
	BTFSS       PORTD+0, 5 
	GOTO        L_lineFollowNormal3476
	BTFSS       PORTD+0, 6 
	GOTO        L_lineFollowNormal3476
	BTFSS       PORTD+0, 7 
	GOTO        L_lineFollowNormal3476
	BTFSC       PORTB+0, 2 
	GOTO        L_lineFollowNormal3476
L__lineFollowNormal3684:
;Main 3.0V.c,250 :: 		moveForward(FAST_PWM,FAST_PWM);
	MOVF        _FAST_PWM+0, 0 
	MOVWF       FARG_moveForward_pwmLeft+0 
	MOVF        _FAST_PWM+1, 0 
	MOVWF       FARG_moveForward_pwmLeft+1 
	MOVF        _FAST_PWM+0, 0 
	MOVWF       FARG_moveForward_pwmRight+0 
	MOVF        _FAST_PWM+1, 0 
	MOVWF       FARG_moveForward_pwmRight+1 
	CALL        _moveForward+0, 0
	GOTO        L_lineFollowNormal3477
L_lineFollowNormal3476:
;Main 3.0V.c,251 :: 		else if( Sensor3==0 && Sensor4==1 && Sensor5==1 && Sensor6==1 && Sensor7==1)
	BTFSC       PORTD+0, 4 
	GOTO        L_lineFollowNormal3480
	BTFSS       PORTD+0, 5 
	GOTO        L_lineFollowNormal3480
	BTFSS       PORTD+0, 6 
	GOTO        L_lineFollowNormal3480
	BTFSS       PORTD+0, 7 
	GOTO        L_lineFollowNormal3480
	BTFSS       PORTB+0, 2 
	GOTO        L_lineFollowNormal3480
L__lineFollowNormal3683:
;Main 3.0V.c,252 :: 		moveForward(FAST_PWM,FAST_PWM);
	MOVF        _FAST_PWM+0, 0 
	MOVWF       FARG_moveForward_pwmLeft+0 
	MOVF        _FAST_PWM+1, 0 
	MOVWF       FARG_moveForward_pwmLeft+1 
	MOVF        _FAST_PWM+0, 0 
	MOVWF       FARG_moveForward_pwmRight+0 
	MOVF        _FAST_PWM+1, 0 
	MOVWF       FARG_moveForward_pwmRight+1 
	CALL        _moveForward+0, 0
	GOTO        L_lineFollowNormal3481
L_lineFollowNormal3480:
;Main 3.0V.c,254 :: 		else if(isAllBlack()){
	CALL        _isAllBlack+0, 0
	MOVF        R0, 0 
	IORWF       R1, 0 
	BTFSC       STATUS+0, 2 
	GOTO        L_lineFollowNormal3482
;Main 3.0V.c,257 :: 		sendSensorStatus();
	CALL        _sendSensorStatus+0, 0
;Main 3.0V.c,258 :: 		}
	GOTO        L_lineFollowNormal3483
L_lineFollowNormal3482:
;Main 3.0V.c,260 :: 		stop();
	CALL        _stop+0, 0
;Main 3.0V.c,261 :: 		sendSensorStatus();
	CALL        _sendSensorStatus+0, 0
;Main 3.0V.c,263 :: 		}
L_lineFollowNormal3483:
L_lineFollowNormal3481:
L_lineFollowNormal3477:
L_lineFollowNormal3473:
L_lineFollowNormal3469:
L_lineFollowNormal3465:
L_lineFollowNormal3461:
L_lineFollowNormal3457:
L_lineFollowNormal3453:
L_lineFollowNormal3449:
L_lineFollowNormal3445:
L_lineFollowNormal3441:
L_lineFollowNormal3437:
L_lineFollowNormal3433:
L_lineFollowNormal3429:
;Main 3.0V.c,264 :: 		}
	GOTO        L_lineFollowNormal3484
L_lineFollowNormal3425:
;Main 3.0V.c,271 :: 		if( Sensor1==1 && Sensor2==1 && Sensor3==1 && Sensor4==1 && Sensor5==1 && Sensor6==0 && Sensor7==0 && Sensor8==0 && Sensor9==0)
	BTFSS       PORTB+0, 4 
	GOTO        L_lineFollowNormal3487
	BTFSS       PORTB+0, 3 
	GOTO        L_lineFollowNormal3487
	BTFSS       PORTD+0, 4 
	GOTO        L_lineFollowNormal3487
	BTFSS       PORTD+0, 5 
	GOTO        L_lineFollowNormal3487
	BTFSS       PORTD+0, 6 
	GOTO        L_lineFollowNormal3487
	BTFSC       PORTD+0, 7 
	GOTO        L_lineFollowNormal3487
	BTFSC       PORTB+0, 2 
	GOTO        L_lineFollowNormal3487
	BTFSC       PORTB+0, 6 
	GOTO        L_lineFollowNormal3487
	BTFSC       PORTB+0, 7 
	GOTO        L_lineFollowNormal3487
L__lineFollowNormal3682:
;Main 3.0V.c,272 :: 		rotateByDegree(-90);
	MOVLW       166
	MOVWF       FARG_rotateByDegree_degree+0 
	MOVLW       255
	MOVWF       FARG_rotateByDegree_degree+1 
	CALL        _rotateByDegree+0, 0
	GOTO        L_lineFollowNormal3488
L_lineFollowNormal3487:
;Main 3.0V.c,273 :: 		else if( Sensor1==1 && Sensor2==1 && Sensor3==1 && Sensor4==1 && Sensor5==1 && Sensor6==1 && Sensor7==0 && Sensor8==0 && Sensor9==0)
	BTFSS       PORTB+0, 4 
	GOTO        L_lineFollowNormal3491
	BTFSS       PORTB+0, 3 
	GOTO        L_lineFollowNormal3491
	BTFSS       PORTD+0, 4 
	GOTO        L_lineFollowNormal3491
	BTFSS       PORTD+0, 5 
	GOTO        L_lineFollowNormal3491
	BTFSS       PORTD+0, 6 
	GOTO        L_lineFollowNormal3491
	BTFSS       PORTD+0, 7 
	GOTO        L_lineFollowNormal3491
	BTFSC       PORTB+0, 2 
	GOTO        L_lineFollowNormal3491
	BTFSC       PORTB+0, 6 
	GOTO        L_lineFollowNormal3491
	BTFSC       PORTB+0, 7 
	GOTO        L_lineFollowNormal3491
L__lineFollowNormal3681:
;Main 3.0V.c,274 :: 		rotateByDegree(-90);
	MOVLW       166
	MOVWF       FARG_rotateByDegree_degree+0 
	MOVLW       255
	MOVWF       FARG_rotateByDegree_degree+1 
	CALL        _rotateByDegree+0, 0
	GOTO        L_lineFollowNormal3492
L_lineFollowNormal3491:
;Main 3.0V.c,275 :: 		else if( Sensor1==1 && Sensor2==1 && Sensor3==1 && Sensor4==1 && Sensor5==1 && Sensor6==1 && Sensor7==1 && Sensor8==0 && Sensor9==0)
	BTFSS       PORTB+0, 4 
	GOTO        L_lineFollowNormal3495
	BTFSS       PORTB+0, 3 
	GOTO        L_lineFollowNormal3495
	BTFSS       PORTD+0, 4 
	GOTO        L_lineFollowNormal3495
	BTFSS       PORTD+0, 5 
	GOTO        L_lineFollowNormal3495
	BTFSS       PORTD+0, 6 
	GOTO        L_lineFollowNormal3495
	BTFSS       PORTD+0, 7 
	GOTO        L_lineFollowNormal3495
	BTFSS       PORTB+0, 2 
	GOTO        L_lineFollowNormal3495
	BTFSC       PORTB+0, 6 
	GOTO        L_lineFollowNormal3495
	BTFSC       PORTB+0, 7 
	GOTO        L_lineFollowNormal3495
L__lineFollowNormal3680:
;Main 3.0V.c,276 :: 		rotateByDegree(-90);
	MOVLW       166
	MOVWF       FARG_rotateByDegree_degree+0 
	MOVLW       255
	MOVWF       FARG_rotateByDegree_degree+1 
	CALL        _rotateByDegree+0, 0
	GOTO        L_lineFollowNormal3496
L_lineFollowNormal3495:
;Main 3.0V.c,279 :: 		else if( Sensor1==0 && Sensor2==0 && Sensor3==1 && Sensor4==1 && Sensor5==1 && Sensor6==1 && Sensor7==1 && Sensor8==1 && Sensor9==1)
	BTFSC       PORTB+0, 4 
	GOTO        L_lineFollowNormal3499
	BTFSC       PORTB+0, 3 
	GOTO        L_lineFollowNormal3499
	BTFSS       PORTD+0, 4 
	GOTO        L_lineFollowNormal3499
	BTFSS       PORTD+0, 5 
	GOTO        L_lineFollowNormal3499
	BTFSS       PORTD+0, 6 
	GOTO        L_lineFollowNormal3499
	BTFSS       PORTD+0, 7 
	GOTO        L_lineFollowNormal3499
	BTFSS       PORTB+0, 2 
	GOTO        L_lineFollowNormal3499
	BTFSS       PORTB+0, 6 
	GOTO        L_lineFollowNormal3499
	BTFSS       PORTB+0, 7 
	GOTO        L_lineFollowNormal3499
L__lineFollowNormal3679:
;Main 3.0V.c,280 :: 		rotateByDegree(90);
	MOVLW       90
	MOVWF       FARG_rotateByDegree_degree+0 
	MOVLW       0
	MOVWF       FARG_rotateByDegree_degree+1 
	CALL        _rotateByDegree+0, 0
	GOTO        L_lineFollowNormal3500
L_lineFollowNormal3499:
;Main 3.0V.c,281 :: 		else if( Sensor1==0 && Sensor2==0 && Sensor3==0 && Sensor4==1 && Sensor5==1 && Sensor6==1 && Sensor7==1 && Sensor8==1 && Sensor9==1)
	BTFSC       PORTB+0, 4 
	GOTO        L_lineFollowNormal3503
	BTFSC       PORTB+0, 3 
	GOTO        L_lineFollowNormal3503
	BTFSC       PORTD+0, 4 
	GOTO        L_lineFollowNormal3503
	BTFSS       PORTD+0, 5 
	GOTO        L_lineFollowNormal3503
	BTFSS       PORTD+0, 6 
	GOTO        L_lineFollowNormal3503
	BTFSS       PORTD+0, 7 
	GOTO        L_lineFollowNormal3503
	BTFSS       PORTB+0, 2 
	GOTO        L_lineFollowNormal3503
	BTFSS       PORTB+0, 6 
	GOTO        L_lineFollowNormal3503
	BTFSS       PORTB+0, 7 
	GOTO        L_lineFollowNormal3503
L__lineFollowNormal3678:
;Main 3.0V.c,282 :: 		rotateByDegree(90);
	MOVLW       90
	MOVWF       FARG_rotateByDegree_degree+0 
	MOVLW       0
	MOVWF       FARG_rotateByDegree_degree+1 
	CALL        _rotateByDegree+0, 0
	GOTO        L_lineFollowNormal3504
L_lineFollowNormal3503:
;Main 3.0V.c,283 :: 		else if( Sensor1==0 && Sensor2==0 && Sensor3==0 && Sensor4==0 && Sensor5==1 && Sensor6==1 && Sensor7==1 && Sensor8==1 && Sensor9==1)
	BTFSC       PORTB+0, 4 
	GOTO        L_lineFollowNormal3507
	BTFSC       PORTB+0, 3 
	GOTO        L_lineFollowNormal3507
	BTFSC       PORTD+0, 4 
	GOTO        L_lineFollowNormal3507
	BTFSC       PORTD+0, 5 
	GOTO        L_lineFollowNormal3507
	BTFSS       PORTD+0, 6 
	GOTO        L_lineFollowNormal3507
	BTFSS       PORTD+0, 7 
	GOTO        L_lineFollowNormal3507
	BTFSS       PORTB+0, 2 
	GOTO        L_lineFollowNormal3507
	BTFSS       PORTB+0, 6 
	GOTO        L_lineFollowNormal3507
	BTFSS       PORTB+0, 7 
	GOTO        L_lineFollowNormal3507
L__lineFollowNormal3677:
;Main 3.0V.c,284 :: 		rotateByDegree(90);
	MOVLW       90
	MOVWF       FARG_rotateByDegree_degree+0 
	MOVLW       0
	MOVWF       FARG_rotateByDegree_degree+1 
	CALL        _rotateByDegree+0, 0
	GOTO        L_lineFollowNormal3508
L_lineFollowNormal3507:
;Main 3.0V.c,289 :: 		else if( Sensor3==1 && Sensor4==0 && Sensor5==0 && Sensor6==0 && Sensor7==0)
	BTFSS       PORTD+0, 4 
	GOTO        L_lineFollowNormal3511
	BTFSC       PORTD+0, 5 
	GOTO        L_lineFollowNormal3511
	BTFSC       PORTD+0, 6 
	GOTO        L_lineFollowNormal3511
	BTFSC       PORTD+0, 7 
	GOTO        L_lineFollowNormal3511
	BTFSC       PORTB+0, 2 
	GOTO        L_lineFollowNormal3511
L__lineFollowNormal3676:
;Main 3.0V.c,291 :: 		turnLeft(FAST_PWM);
	MOVF        _FAST_PWM+0, 0 
	MOVWF       FARG_turnLeft_pwmRight+0 
	MOVF        _FAST_PWM+1, 0 
	MOVWF       FARG_turnLeft_pwmRight+1 
	CALL        _turnLeft+0, 0
	GOTO        L_lineFollowNormal3512
L_lineFollowNormal3511:
;Main 3.0V.c,292 :: 		else if( Sensor3==1 && Sensor4==1 && Sensor5==0 && Sensor6==0 && Sensor7==0)
	BTFSS       PORTD+0, 4 
	GOTO        L_lineFollowNormal3515
	BTFSS       PORTD+0, 5 
	GOTO        L_lineFollowNormal3515
	BTFSC       PORTD+0, 6 
	GOTO        L_lineFollowNormal3515
	BTFSC       PORTD+0, 7 
	GOTO        L_lineFollowNormal3515
	BTFSC       PORTB+0, 2 
	GOTO        L_lineFollowNormal3515
L__lineFollowNormal3675:
;Main 3.0V.c,294 :: 		turnLeft(FAST_PWM);
	MOVF        _FAST_PWM+0, 0 
	MOVWF       FARG_turnLeft_pwmRight+0 
	MOVF        _FAST_PWM+1, 0 
	MOVWF       FARG_turnLeft_pwmRight+1 
	CALL        _turnLeft+0, 0
	GOTO        L_lineFollowNormal3516
L_lineFollowNormal3515:
;Main 3.0V.c,295 :: 		else if( Sensor3==1 && Sensor4==1 && Sensor5==1 && Sensor6==0 && Sensor7==0)
	BTFSS       PORTD+0, 4 
	GOTO        L_lineFollowNormal3519
	BTFSS       PORTD+0, 5 
	GOTO        L_lineFollowNormal3519
	BTFSS       PORTD+0, 6 
	GOTO        L_lineFollowNormal3519
	BTFSC       PORTD+0, 7 
	GOTO        L_lineFollowNormal3519
	BTFSC       PORTB+0, 2 
	GOTO        L_lineFollowNormal3519
L__lineFollowNormal3674:
;Main 3.0V.c,297 :: 		turnLeft(FAST_PWM);
	MOVF        _FAST_PWM+0, 0 
	MOVWF       FARG_turnLeft_pwmRight+0 
	MOVF        _FAST_PWM+1, 0 
	MOVWF       FARG_turnLeft_pwmRight+1 
	CALL        _turnLeft+0, 0
	GOTO        L_lineFollowNormal3520
L_lineFollowNormal3519:
;Main 3.0V.c,298 :: 		else if( Sensor3==0 && Sensor4==1 && Sensor5==0 && Sensor6==0 && Sensor7==0)
	BTFSC       PORTD+0, 4 
	GOTO        L_lineFollowNormal3523
	BTFSS       PORTD+0, 5 
	GOTO        L_lineFollowNormal3523
	BTFSC       PORTD+0, 6 
	GOTO        L_lineFollowNormal3523
	BTFSC       PORTD+0, 7 
	GOTO        L_lineFollowNormal3523
	BTFSC       PORTB+0, 2 
	GOTO        L_lineFollowNormal3523
L__lineFollowNormal3673:
;Main 3.0V.c,300 :: 		turnLeft(FAST_PWM);
	MOVF        _FAST_PWM+0, 0 
	MOVWF       FARG_turnLeft_pwmRight+0 
	MOVF        _FAST_PWM+1, 0 
	MOVWF       FARG_turnLeft_pwmRight+1 
	CALL        _turnLeft+0, 0
	GOTO        L_lineFollowNormal3524
L_lineFollowNormal3523:
;Main 3.0V.c,303 :: 		else if( Sensor3==0 && Sensor4==0 && Sensor5==0 && Sensor6==1 && Sensor7==0)
	BTFSC       PORTD+0, 4 
	GOTO        L_lineFollowNormal3527
	BTFSC       PORTD+0, 5 
	GOTO        L_lineFollowNormal3527
	BTFSC       PORTD+0, 6 
	GOTO        L_lineFollowNormal3527
	BTFSS       PORTD+0, 7 
	GOTO        L_lineFollowNormal3527
	BTFSC       PORTB+0, 2 
	GOTO        L_lineFollowNormal3527
L__lineFollowNormal3672:
;Main 3.0V.c,305 :: 		turnRight(FAST_PWM);
	MOVF        _FAST_PWM+0, 0 
	MOVWF       FARG_turnRight_pwmLeft+0 
	MOVF        _FAST_PWM+1, 0 
	MOVWF       FARG_turnRight_pwmLeft+1 
	CALL        _turnRight+0, 0
	GOTO        L_lineFollowNormal3528
L_lineFollowNormal3527:
;Main 3.0V.c,306 :: 		else if( Sensor3==0 && Sensor4==0 && Sensor5==1 && Sensor6==1 && Sensor7==1)
	BTFSC       PORTD+0, 4 
	GOTO        L_lineFollowNormal3531
	BTFSC       PORTD+0, 5 
	GOTO        L_lineFollowNormal3531
	BTFSS       PORTD+0, 6 
	GOTO        L_lineFollowNormal3531
	BTFSS       PORTD+0, 7 
	GOTO        L_lineFollowNormal3531
	BTFSS       PORTB+0, 2 
	GOTO        L_lineFollowNormal3531
L__lineFollowNormal3671:
;Main 3.0V.c,308 :: 		turnRight(FAST_PWM);
	MOVF        _FAST_PWM+0, 0 
	MOVWF       FARG_turnRight_pwmLeft+0 
	MOVF        _FAST_PWM+1, 0 
	MOVWF       FARG_turnRight_pwmLeft+1 
	CALL        _turnRight+0, 0
	GOTO        L_lineFollowNormal3532
L_lineFollowNormal3531:
;Main 3.0V.c,309 :: 		else if( Sensor3==0 && Sensor4==0 && Sensor5==0 && Sensor6==1 && Sensor7==1)
	BTFSC       PORTD+0, 4 
	GOTO        L_lineFollowNormal3535
	BTFSC       PORTD+0, 5 
	GOTO        L_lineFollowNormal3535
	BTFSC       PORTD+0, 6 
	GOTO        L_lineFollowNormal3535
	BTFSS       PORTD+0, 7 
	GOTO        L_lineFollowNormal3535
	BTFSS       PORTB+0, 2 
	GOTO        L_lineFollowNormal3535
L__lineFollowNormal3670:
;Main 3.0V.c,311 :: 		turnRight(FAST_PWM);
	MOVF        _FAST_PWM+0, 0 
	MOVWF       FARG_turnRight_pwmLeft+0 
	MOVF        _FAST_PWM+1, 0 
	MOVWF       FARG_turnRight_pwmLeft+1 
	CALL        _turnRight+0, 0
	GOTO        L_lineFollowNormal3536
L_lineFollowNormal3535:
;Main 3.0V.c,312 :: 		else if( Sensor3==0 && Sensor4==0 && Sensor5==0 && Sensor6==0 && Sensor7==1)
	BTFSC       PORTD+0, 4 
	GOTO        L_lineFollowNormal3539
	BTFSC       PORTD+0, 5 
	GOTO        L_lineFollowNormal3539
	BTFSC       PORTD+0, 6 
	GOTO        L_lineFollowNormal3539
	BTFSC       PORTD+0, 7 
	GOTO        L_lineFollowNormal3539
	BTFSS       PORTB+0, 2 
	GOTO        L_lineFollowNormal3539
L__lineFollowNormal3669:
;Main 3.0V.c,314 :: 		turnRight(FAST_PWM);
	MOVF        _FAST_PWM+0, 0 
	MOVWF       FARG_turnRight_pwmLeft+0 
	MOVF        _FAST_PWM+1, 0 
	MOVWF       FARG_turnRight_pwmLeft+1 
	CALL        _turnRight+0, 0
	GOTO        L_lineFollowNormal3540
L_lineFollowNormal3539:
;Main 3.0V.c,317 :: 		else if( Sensor3==1 && Sensor4==1 && Sensor5==1 && Sensor6==1 && Sensor7==0)
	BTFSS       PORTD+0, 4 
	GOTO        L_lineFollowNormal3543
	BTFSS       PORTD+0, 5 
	GOTO        L_lineFollowNormal3543
	BTFSS       PORTD+0, 6 
	GOTO        L_lineFollowNormal3543
	BTFSS       PORTD+0, 7 
	GOTO        L_lineFollowNormal3543
	BTFSC       PORTB+0, 2 
	GOTO        L_lineFollowNormal3543
L__lineFollowNormal3668:
;Main 3.0V.c,318 :: 		moveForward(SLOW_PWM,FAST_PWM);
	MOVF        _SLOW_PWM+0, 0 
	MOVWF       FARG_moveForward_pwmLeft+0 
	MOVF        _SLOW_PWM+1, 0 
	MOVWF       FARG_moveForward_pwmLeft+1 
	MOVF        _FAST_PWM+0, 0 
	MOVWF       FARG_moveForward_pwmRight+0 
	MOVF        _FAST_PWM+1, 0 
	MOVWF       FARG_moveForward_pwmRight+1 
	CALL        _moveForward+0, 0
	GOTO        L_lineFollowNormal3544
L_lineFollowNormal3543:
;Main 3.0V.c,319 :: 		else if( Sensor3==0 && Sensor4==1 && Sensor5==1 && Sensor6==1 && Sensor7==1)
	BTFSC       PORTD+0, 4 
	GOTO        L_lineFollowNormal3547
	BTFSS       PORTD+0, 5 
	GOTO        L_lineFollowNormal3547
	BTFSS       PORTD+0, 6 
	GOTO        L_lineFollowNormal3547
	BTFSS       PORTD+0, 7 
	GOTO        L_lineFollowNormal3547
	BTFSS       PORTB+0, 2 
	GOTO        L_lineFollowNormal3547
L__lineFollowNormal3667:
;Main 3.0V.c,320 :: 		moveForward(FAST_PWM,SLOW_PWM);
	MOVF        _FAST_PWM+0, 0 
	MOVWF       FARG_moveForward_pwmLeft+0 
	MOVF        _FAST_PWM+1, 0 
	MOVWF       FARG_moveForward_pwmLeft+1 
	MOVF        _SLOW_PWM+0, 0 
	MOVWF       FARG_moveForward_pwmRight+0 
	MOVF        _SLOW_PWM+1, 0 
	MOVWF       FARG_moveForward_pwmRight+1 
	CALL        _moveForward+0, 0
	GOTO        L_lineFollowNormal3548
L_lineFollowNormal3547:
;Main 3.0V.c,323 :: 		else if( Sensor3==0 && Sensor4==1 && Sensor5==1 && Sensor6==0 && Sensor7==0)
	BTFSC       PORTD+0, 4 
	GOTO        L_lineFollowNormal3551
	BTFSS       PORTD+0, 5 
	GOTO        L_lineFollowNormal3551
	BTFSS       PORTD+0, 6 
	GOTO        L_lineFollowNormal3551
	BTFSC       PORTD+0, 7 
	GOTO        L_lineFollowNormal3551
	BTFSC       PORTB+0, 2 
	GOTO        L_lineFollowNormal3551
L__lineFollowNormal3666:
;Main 3.0V.c,324 :: 		moveForward(SLOW_PWM,FAST_PWM);
	MOVF        _SLOW_PWM+0, 0 
	MOVWF       FARG_moveForward_pwmLeft+0 
	MOVF        _SLOW_PWM+1, 0 
	MOVWF       FARG_moveForward_pwmLeft+1 
	MOVF        _FAST_PWM+0, 0 
	MOVWF       FARG_moveForward_pwmRight+0 
	MOVF        _FAST_PWM+1, 0 
	MOVWF       FARG_moveForward_pwmRight+1 
	CALL        _moveForward+0, 0
	GOTO        L_lineFollowNormal3552
L_lineFollowNormal3551:
;Main 3.0V.c,325 :: 		else if( Sensor3==0 && Sensor4==1 && Sensor5==1 && Sensor6==1 && Sensor7==0)
	BTFSC       PORTD+0, 4 
	GOTO        L_lineFollowNormal3555
	BTFSS       PORTD+0, 5 
	GOTO        L_lineFollowNormal3555
	BTFSS       PORTD+0, 6 
	GOTO        L_lineFollowNormal3555
	BTFSS       PORTD+0, 7 
	GOTO        L_lineFollowNormal3555
	BTFSC       PORTB+0, 2 
	GOTO        L_lineFollowNormal3555
L__lineFollowNormal3665:
;Main 3.0V.c,326 :: 		moveForward(FAST_PWM,FAST_PWM);
	MOVF        _FAST_PWM+0, 0 
	MOVWF       FARG_moveForward_pwmLeft+0 
	MOVF        _FAST_PWM+1, 0 
	MOVWF       FARG_moveForward_pwmLeft+1 
	MOVF        _FAST_PWM+0, 0 
	MOVWF       FARG_moveForward_pwmRight+0 
	MOVF        _FAST_PWM+1, 0 
	MOVWF       FARG_moveForward_pwmRight+1 
	CALL        _moveForward+0, 0
	GOTO        L_lineFollowNormal3556
L_lineFollowNormal3555:
;Main 3.0V.c,327 :: 		else if( Sensor3==0 && Sensor4==0 && Sensor5==1 && Sensor6==0 && Sensor7==0)
	BTFSC       PORTD+0, 4 
	GOTO        L_lineFollowNormal3559
	BTFSC       PORTD+0, 5 
	GOTO        L_lineFollowNormal3559
	BTFSS       PORTD+0, 6 
	GOTO        L_lineFollowNormal3559
	BTFSC       PORTD+0, 7 
	GOTO        L_lineFollowNormal3559
	BTFSC       PORTB+0, 2 
	GOTO        L_lineFollowNormal3559
L__lineFollowNormal3664:
;Main 3.0V.c,328 :: 		moveForward(FAST_PWM,FAST_PWM);
	MOVF        _FAST_PWM+0, 0 
	MOVWF       FARG_moveForward_pwmLeft+0 
	MOVF        _FAST_PWM+1, 0 
	MOVWF       FARG_moveForward_pwmLeft+1 
	MOVF        _FAST_PWM+0, 0 
	MOVWF       FARG_moveForward_pwmRight+0 
	MOVF        _FAST_PWM+1, 0 
	MOVWF       FARG_moveForward_pwmRight+1 
	CALL        _moveForward+0, 0
	GOTO        L_lineFollowNormal3560
L_lineFollowNormal3559:
;Main 3.0V.c,329 :: 		else if( Sensor3==0 && Sensor4==0 && Sensor5==1 && Sensor6==1 && Sensor7==0)
	BTFSC       PORTD+0, 4 
	GOTO        L_lineFollowNormal3563
	BTFSC       PORTD+0, 5 
	GOTO        L_lineFollowNormal3563
	BTFSS       PORTD+0, 6 
	GOTO        L_lineFollowNormal3563
	BTFSS       PORTD+0, 7 
	GOTO        L_lineFollowNormal3563
	BTFSC       PORTB+0, 2 
	GOTO        L_lineFollowNormal3563
L__lineFollowNormal3663:
;Main 3.0V.c,330 :: 		moveForward(FAST_PWM,SLOW_PWM);
	MOVF        _FAST_PWM+0, 0 
	MOVWF       FARG_moveForward_pwmLeft+0 
	MOVF        _FAST_PWM+1, 0 
	MOVWF       FARG_moveForward_pwmLeft+1 
	MOVF        _SLOW_PWM+0, 0 
	MOVWF       FARG_moveForward_pwmRight+0 
	MOVF        _SLOW_PWM+1, 0 
	MOVWF       FARG_moveForward_pwmRight+1 
	CALL        _moveForward+0, 0
	GOTO        L_lineFollowNormal3564
L_lineFollowNormal3563:
;Main 3.0V.c,333 :: 		else if(isAllWhite()){
	CALL        _isAllWhite+0, 0
	MOVF        R0, 0 
	IORWF       R1, 0 
	BTFSC       STATUS+0, 2 
	GOTO        L_lineFollowNormal3565
;Main 3.0V.c,336 :: 		sendSensorStatus();
	CALL        _sendSensorStatus+0, 0
;Main 3.0V.c,337 :: 		}
	GOTO        L_lineFollowNormal3566
L_lineFollowNormal3565:
;Main 3.0V.c,339 :: 		stop();
	CALL        _stop+0, 0
;Main 3.0V.c,340 :: 		sendSensorStatus();
	CALL        _sendSensorStatus+0, 0
;Main 3.0V.c,342 :: 		}
L_lineFollowNormal3566:
L_lineFollowNormal3564:
L_lineFollowNormal3560:
L_lineFollowNormal3556:
L_lineFollowNormal3552:
L_lineFollowNormal3548:
L_lineFollowNormal3544:
L_lineFollowNormal3540:
L_lineFollowNormal3536:
L_lineFollowNormal3532:
L_lineFollowNormal3528:
L_lineFollowNormal3524:
L_lineFollowNormal3520:
L_lineFollowNormal3516:
L_lineFollowNormal3512:
L_lineFollowNormal3508:
L_lineFollowNormal3504:
L_lineFollowNormal3500:
L_lineFollowNormal3496:
L_lineFollowNormal3492:
L_lineFollowNormal3488:
;Main 3.0V.c,343 :: 		}
L_lineFollowNormal3484:
;Main 3.0V.c,344 :: 		}
	RETURN      0
; end of _lineFollowNormal3

_isOnThePath:

;Main 3.0V.c,346 :: 		int isOnThePath(){
;Main 3.0V.c,347 :: 		if(((Sensor3==0 && Sensor4==1 && Sensor5==1 && Sensor6==0 && Sensor7==0) || ( Sensor3==0 && Sensor4==1 && Sensor5==1 && Sensor6==1 && Sensor7==0) || ( Sensor3==0 && Sensor4==0 && Sensor5==1 && Sensor6==0 && Sensor7==0) || ( Sensor3==0 && Sensor4==0 && Sensor5==1 && Sensor6==1 && Sensor7==0)) && Sensor1==0 && Sensor2==0 && Sensor8==0 && Sensor9==0)
	BTFSC       PORTD+0, 4 
	GOTO        L__isOnThePath702
	BTFSS       PORTD+0, 5 
	GOTO        L__isOnThePath702
	BTFSS       PORTD+0, 6 
	GOTO        L__isOnThePath702
	BTFSC       PORTD+0, 7 
	GOTO        L__isOnThePath702
	BTFSC       PORTB+0, 2 
	GOTO        L__isOnThePath702
	GOTO        L__isOnThePath698
L__isOnThePath702:
	BTFSC       PORTD+0, 4 
	GOTO        L__isOnThePath701
	BTFSS       PORTD+0, 5 
	GOTO        L__isOnThePath701
	BTFSS       PORTD+0, 6 
	GOTO        L__isOnThePath701
	BTFSS       PORTD+0, 7 
	GOTO        L__isOnThePath701
	BTFSC       PORTB+0, 2 
	GOTO        L__isOnThePath701
	GOTO        L__isOnThePath698
L__isOnThePath701:
	BTFSC       PORTD+0, 4 
	GOTO        L__isOnThePath700
	BTFSC       PORTD+0, 5 
	GOTO        L__isOnThePath700
	BTFSS       PORTD+0, 6 
	GOTO        L__isOnThePath700
	BTFSC       PORTD+0, 7 
	GOTO        L__isOnThePath700
	BTFSC       PORTB+0, 2 
	GOTO        L__isOnThePath700
	GOTO        L__isOnThePath698
L__isOnThePath700:
	BTFSC       PORTD+0, 4 
	GOTO        L__isOnThePath699
	BTFSC       PORTD+0, 5 
	GOTO        L__isOnThePath699
	BTFSS       PORTD+0, 6 
	GOTO        L__isOnThePath699
	BTFSS       PORTD+0, 7 
	GOTO        L__isOnThePath699
	BTFSC       PORTB+0, 2 
	GOTO        L__isOnThePath699
	GOTO        L__isOnThePath698
L__isOnThePath699:
	GOTO        L_isOnThePath579
L__isOnThePath698:
	BTFSC       PORTB+0, 4 
	GOTO        L_isOnThePath579
	BTFSC       PORTB+0, 3 
	GOTO        L_isOnThePath579
	BTFSC       PORTB+0, 6 
	GOTO        L_isOnThePath579
	BTFSC       PORTB+0, 7 
	GOTO        L_isOnThePath579
L__isOnThePath697:
;Main 3.0V.c,348 :: 		return TRUE;
	MOVLW       1
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	RETURN      0
L_isOnThePath579:
;Main 3.0V.c,350 :: 		return FALSE;
	CLRF        R0 
	CLRF        R1 
;Main 3.0V.c,351 :: 		}
	RETURN      0
; end of _isOnThePath
