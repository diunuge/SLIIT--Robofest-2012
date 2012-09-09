
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
	MOVLW       ?lstr3_Robo2_32v1.1+0
	MOVWF       _debugText+0 
	MOVLW       hi_addr(?lstr3_Robo2_32v1.1+0)
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
	MOVLW       ?lstr4_Robo2_32v1.1+0
	MOVWF       _debugText+0 
	MOVLW       hi_addr(?lstr4_Robo2_32v1.1+0)
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
	MOVLW       ?lstr5_Robo2_32v1.1+0
	MOVWF       _debugText+0 
	MOVLW       hi_addr(?lstr5_Robo2_32v1.1+0)
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
	MOVLW       ?lstr6_Robo2_32v1.1+0
	MOVWF       _debugText+0 
	MOVLW       hi_addr(?lstr6_Robo2_32v1.1+0)
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
	MOVLW       ?lstr7_Robo2_32v1.1+0
	MOVWF       _debugText+0 
	MOVLW       hi_addr(?lstr7_Robo2_32v1.1+0)
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
	MOVLW       ?lstr8_Robo2_32v1.1+0
	MOVWF       _debugText+0 
	MOVLW       hi_addr(?lstr8_Robo2_32v1.1+0)
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
	MOVLW       ?lstr9_Robo2_32v1.1+0
	MOVWF       _debugText+0 
	MOVLW       hi_addr(?lstr9_Robo2_32v1.1+0)
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
	MOVLW       ?lstr10_Robo2_32v1.1+0
	MOVWF       _debugText+0 
	MOVLW       hi_addr(?lstr10_Robo2_32v1.1+0)
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
	MOVLW       ?lstr11_Robo2_32v1.1+0
	MOVWF       _debugText+0 
	MOVLW       hi_addr(?lstr11_Robo2_32v1.1+0)
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
	MOVLW       ?lstr12_Robo2_32v1.1+0
	MOVWF       _debugText+0 
	MOVLW       hi_addr(?lstr12_Robo2_32v1.1+0)
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
	MOVLW       ?lstr13_Robo2_32v1.1+0
	MOVWF       _debugText+0 
	MOVLW       hi_addr(?lstr13_Robo2_32v1.1+0)
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
	MOVLW       ?lstr14_Robo2_32v1.1+0
	MOVWF       _debugText+0 
	MOVLW       hi_addr(?lstr14_Robo2_32v1.1+0)
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
	MOVLW       ?lstr15_Robo2_32v1.1+0
	MOVWF       _debugText+0 
	MOVLW       hi_addr(?lstr15_Robo2_32v1.1+0)
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
	MOVLW       ?lstr16_Robo2_32v1.1+0
	MOVWF       _debugText+0 
	MOVLW       hi_addr(?lstr16_Robo2_32v1.1+0)
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
	MOVLW       ?lstr17_Robo2_32v1.1+0
	MOVWF       _debugText+0 
	MOVLW       hi_addr(?lstr17_Robo2_32v1.1+0)
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
	MOVLW       ?lstr18_Robo2_32v1.1+0
	MOVWF       _debugText+0 
	MOVLW       hi_addr(?lstr18_Robo2_32v1.1+0)
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
	MOVLW       ?lstr19_Robo2_32v1.1+0
	MOVWF       _debugText+0 
	MOVLW       hi_addr(?lstr19_Robo2_32v1.1+0)
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
	MOVLW       ?lstr20_Robo2_32v1.1+0
	MOVWF       _debugText+0 
	MOVLW       hi_addr(?lstr20_Robo2_32v1.1+0)
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
	MOVLW       ?lstr21_Robo2_32v1.1+0
	MOVWF       _debugText+0 
	MOVLW       hi_addr(?lstr21_Robo2_32v1.1+0)
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
	MOVLW       ?lstr22_Robo2_32v1.1+0
	MOVWF       _debugText+0 
	MOVLW       hi_addr(?lstr22_Robo2_32v1.1+0)
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
	MOVLW       ?lstr23_Robo2_32v1.1+0
	MOVWF       _debugText+0 
	MOVLW       hi_addr(?lstr23_Robo2_32v1.1+0)
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
	MOVLW       ?lstr24_Robo2_32v1.1+0
	MOVWF       _debugText+0 
	MOVLW       hi_addr(?lstr24_Robo2_32v1.1+0)
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
	MOVLW       ?lstr25_Robo2_32v1.1+0
	MOVWF       _debugText+0 
	MOVLW       hi_addr(?lstr25_Robo2_32v1.1+0)
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
	MOVLW       ?lstr26_Robo2_32v1.1+0
	MOVWF       _debugText+0 
	MOVLW       hi_addr(?lstr26_Robo2_32v1.1+0)
	MOVWF       _debugText+1 
;debug.h,124 :: 		UART1_Write_Text(debugText);
	MOVF        _debugText+0, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVF        _debugText+1, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;debug.h,126 :: 		debugText = "Decrease PWM..   ";
	MOVLW       ?lstr27_Robo2_32v1.1+0
	MOVWF       _debugText+0 
	MOVLW       hi_addr(?lstr27_Robo2_32v1.1+0)
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
	GOTO        L__testPIC225
	MOVF        _count+0, 0 
	SUBLW       0
L__testPIC225:
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
	GOTO        L__lineFollow192
	BTFSC       PORTD+0, 5 
	GOTO        L__lineFollow192
	BTFSC       PORTD+0, 6 
	GOTO        L__lineFollow192
	BTFSC       PORTD+0, 7 
	GOTO        L__lineFollow192
	BTFSC       PORTB+0, 2 
	GOTO        L__lineFollow192
	GOTO        L_lineFollow46
L__lineFollow192:
	BTFSC       PORTB+0, 4 
	GOTO        L_lineFollow46
	BTFSC       PORTB+0, 3 
	GOTO        L_lineFollow46
	BTFSC       PORTB+0, 6 
	GOTO        L_lineFollow46
	BTFSC       PORTB+0, 7 
	GOTO        L_lineFollow46
L__lineFollow191:
;linefollow.h,19 :: 		debugText = "Line follow PID..   ";
	MOVLW       ?lstr28_Robo2_32v1.1+0
	MOVWF       _debugText+0 
	MOVLW       hi_addr(?lstr28_Robo2_32v1.1+0)
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
	GOTO        L__lineFollow190
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
	GOTO        L__lineFollow190
	GOTO        L_lineFollow54
L__lineFollow190:
;linefollow.h,26 :: 		debugText = "Line follow Normal..   ";
	MOVLW       ?lstr29_Robo2_32v1.1+0
	MOVWF       _debugText+0 
	MOVLW       hi_addr(?lstr29_Robo2_32v1.1+0)
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
	GOTO        L__lineFollow189
	BTFSS       PORTB+0, 4 
	GOTO        L__lineFollow189
	BTFSS       PORTB+0, 3 
	GOTO        L__lineFollow189
	BTFSS       PORTD+0, 4 
	GOTO        L__lineFollow189
	BTFSS       PORTD+0, 5 
	GOTO        L__lineFollow189
	BTFSS       PORTD+0, 6 
	GOTO        L__lineFollow189
	BTFSS       PORTD+0, 7 
	GOTO        L__lineFollow189
	BTFSS       PORTB+0, 2 
	GOTO        L__lineFollow189
	BTFSS       PORTB+0, 6 
	GOTO        L__lineFollow189
	BTFSS       PORTB+0, 7 
	GOTO        L__lineFollow189
	GOTO        L__lineFollow188
L__lineFollow189:
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
	GOTO        L__lineFollow188
	GOTO        L_lineFollow62
L__lineFollow188:
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
;linefollow.h,41 :: 		while(!((Sensor3==1 || Sensor4==1 || Sensor5==1 || Sensor6==1 || Sensor7==1) && Sensor1==0 && Sensor2==0 && Sensor8==0 && Sensor9==0)){
L_lineFollowNormal63:
	BTFSC       PORTD+0, 4 
	GOTO        L__lineFollowNormal206
	BTFSC       PORTD+0, 5 
	GOTO        L__lineFollowNormal206
	BTFSC       PORTD+0, 6 
	GOTO        L__lineFollowNormal206
	BTFSC       PORTD+0, 7 
	GOTO        L__lineFollowNormal206
	BTFSC       PORTB+0, 2 
	GOTO        L__lineFollowNormal206
	GOTO        L_lineFollowNormal68
L__lineFollowNormal206:
	BTFSC       PORTB+0, 4 
	GOTO        L_lineFollowNormal68
	BTFSC       PORTB+0, 3 
	GOTO        L_lineFollowNormal68
	BTFSC       PORTB+0, 6 
	GOTO        L_lineFollowNormal68
	BTFSC       PORTB+0, 7 
	GOTO        L_lineFollowNormal68
	MOVLW       1
	MOVWF       R0 
	GOTO        L_lineFollowNormal67
L_lineFollowNormal68:
	CLRF        R0 
L_lineFollowNormal67:
	MOVF        R0, 1 
	BTFSS       STATUS+0, 2 
	GOTO        L_lineFollowNormal64
;linefollow.h,42 :: 		if( Scout==1 && Sensor1==1 && Sensor2==1 && Sensor3==1 && Sensor4==1 && Sensor5==1 && Sensor6==1 && Sensor7==1 && Sensor8==1 && Sensor9==1){
	BTFSS       PORTB+0, 5 
	GOTO        L_lineFollowNormal71
	BTFSS       PORTB+0, 4 
	GOTO        L_lineFollowNormal71
	BTFSS       PORTB+0, 3 
	GOTO        L_lineFollowNormal71
	BTFSS       PORTD+0, 4 
	GOTO        L_lineFollowNormal71
	BTFSS       PORTD+0, 5 
	GOTO        L_lineFollowNormal71
	BTFSS       PORTD+0, 6 
	GOTO        L_lineFollowNormal71
	BTFSS       PORTD+0, 7 
	GOTO        L_lineFollowNormal71
	BTFSS       PORTB+0, 2 
	GOTO        L_lineFollowNormal71
	BTFSS       PORTB+0, 6 
	GOTO        L_lineFollowNormal71
	BTFSS       PORTB+0, 7 
	GOTO        L_lineFollowNormal71
L__lineFollowNormal205:
;linefollow.h,43 :: 		stop();
	CALL        _stop+0, 0
;linefollow.h,44 :: 		}
	GOTO        L_lineFollowNormal72
L_lineFollowNormal71:
;linefollow.h,45 :: 		else if( (Scout==0 && Sensor1==0 && Sensor2==0 && Sensor3==0 && Sensor4==1 && Sensor5==1 && Sensor6==1 && Sensor7==1 && Sensor8==1 && Sensor9==1) || (Scout==0 && Sensor1==0 && Sensor2==0 && Sensor3==0 && Sensor4==0 && Sensor5==1 && Sensor6==1 && Sensor7==1 && Sensor8==1 && Sensor9==1)){
	BTFSC       PORTB+0, 5 
	GOTO        L__lineFollowNormal204
	BTFSC       PORTB+0, 4 
	GOTO        L__lineFollowNormal204
	BTFSC       PORTB+0, 3 
	GOTO        L__lineFollowNormal204
	BTFSC       PORTD+0, 4 
	GOTO        L__lineFollowNormal204
	BTFSS       PORTD+0, 5 
	GOTO        L__lineFollowNormal204
	BTFSS       PORTD+0, 6 
	GOTO        L__lineFollowNormal204
	BTFSS       PORTD+0, 7 
	GOTO        L__lineFollowNormal204
	BTFSS       PORTB+0, 2 
	GOTO        L__lineFollowNormal204
	BTFSS       PORTB+0, 6 
	GOTO        L__lineFollowNormal204
	BTFSS       PORTB+0, 7 
	GOTO        L__lineFollowNormal204
	GOTO        L__lineFollowNormal202
L__lineFollowNormal204:
	BTFSC       PORTB+0, 5 
	GOTO        L__lineFollowNormal203
	BTFSC       PORTB+0, 4 
	GOTO        L__lineFollowNormal203
	BTFSC       PORTB+0, 3 
	GOTO        L__lineFollowNormal203
	BTFSC       PORTD+0, 4 
	GOTO        L__lineFollowNormal203
	BTFSC       PORTD+0, 5 
	GOTO        L__lineFollowNormal203
	BTFSS       PORTD+0, 6 
	GOTO        L__lineFollowNormal203
	BTFSS       PORTD+0, 7 
	GOTO        L__lineFollowNormal203
	BTFSS       PORTB+0, 2 
	GOTO        L__lineFollowNormal203
	BTFSS       PORTB+0, 6 
	GOTO        L__lineFollowNormal203
	BTFSS       PORTB+0, 7 
	GOTO        L__lineFollowNormal203
	GOTO        L__lineFollowNormal202
L__lineFollowNormal203:
	GOTO        L_lineFollowNormal79
L__lineFollowNormal202:
;linefollow.h,47 :: 		debugText = "90 to right..   ";
	MOVLW       ?lstr30_Robo2_32v1.1+0
	MOVWF       _debugText+0 
	MOVLW       hi_addr(?lstr30_Robo2_32v1.1+0)
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
L_lineFollowNormal80:
	BTFSC       PORTB+0, 5 
	GOTO        L_lineFollowNormal81
;linefollow.h,51 :: 		rotateClockwise(TEST_RPM);
	MOVF        _TEST_RPM+0, 0 
	MOVWF       FARG_rotateClockwise_pwm+0 
	MOVF        _TEST_RPM+1, 0 
	MOVWF       FARG_rotateClockwise_pwm+1 
	CALL        _rotateClockwise+0, 0
;linefollow.h,52 :: 		}
	GOTO        L_lineFollowNormal80
L_lineFollowNormal81:
;linefollow.h,53 :: 		}
	GOTO        L_lineFollowNormal82
L_lineFollowNormal79:
;linefollow.h,54 :: 		else if( (Scout==0 && Sensor1==1 && Sensor2==1 && Sensor3==1 && Sensor4==1 && Sensor5==1 && Sensor6==0 && Sensor7==0 && Sensor8==0 && Sensor9==0) && (Scout==0 && Sensor1==1 && Sensor2==1 && Sensor3==1 && Sensor4==1 && Sensor5==0 && Sensor6==0 && Sensor7==0 && Sensor8==0 && Sensor9==0)){
	BTFSC       PORTB+0, 5 
	GOTO        L_lineFollowNormal89
	BTFSS       PORTB+0, 4 
	GOTO        L_lineFollowNormal89
	BTFSS       PORTB+0, 3 
	GOTO        L_lineFollowNormal89
	BTFSS       PORTD+0, 4 
	GOTO        L_lineFollowNormal89
	BTFSS       PORTD+0, 5 
	GOTO        L_lineFollowNormal89
	BTFSS       PORTD+0, 6 
	GOTO        L_lineFollowNormal89
	BTFSC       PORTD+0, 7 
	GOTO        L_lineFollowNormal89
	BTFSC       PORTB+0, 2 
	GOTO        L_lineFollowNormal89
	BTFSC       PORTB+0, 6 
	GOTO        L_lineFollowNormal89
	BTFSC       PORTB+0, 7 
	GOTO        L_lineFollowNormal89
L__lineFollowNormal201:
	BTFSC       PORTB+0, 5 
	GOTO        L_lineFollowNormal89
	BTFSS       PORTB+0, 4 
	GOTO        L_lineFollowNormal89
	BTFSS       PORTB+0, 3 
	GOTO        L_lineFollowNormal89
	BTFSS       PORTD+0, 4 
	GOTO        L_lineFollowNormal89
	BTFSS       PORTD+0, 5 
	GOTO        L_lineFollowNormal89
	BTFSC       PORTD+0, 6 
	GOTO        L_lineFollowNormal89
	BTFSC       PORTD+0, 7 
	GOTO        L_lineFollowNormal89
	BTFSC       PORTB+0, 2 
	GOTO        L_lineFollowNormal89
	BTFSC       PORTB+0, 6 
	GOTO        L_lineFollowNormal89
	BTFSC       PORTB+0, 7 
	GOTO        L_lineFollowNormal89
L__lineFollowNormal200:
L__lineFollowNormal199:
;linefollow.h,56 :: 		debugText = "90 to left..   ";
	MOVLW       ?lstr31_Robo2_32v1.1+0
	MOVWF       _debugText+0 
	MOVLW       hi_addr(?lstr31_Robo2_32v1.1+0)
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
L_lineFollowNormal90:
	BTFSC       PORTB+0, 5 
	GOTO        L_lineFollowNormal91
;linefollow.h,60 :: 		rotateAntiClockwise(TEST_RPM);
	MOVF        _TEST_RPM+0, 0 
	MOVWF       FARG_rotateAntiClockwise_pwm+0 
	MOVF        _TEST_RPM+1, 0 
	MOVWF       FARG_rotateAntiClockwise_pwm+1 
	CALL        _rotateAntiClockwise+0, 0
;linefollow.h,61 :: 		}
	GOTO        L_lineFollowNormal90
L_lineFollowNormal91:
;linefollow.h,62 :: 		}
	GOTO        L_lineFollowNormal92
L_lineFollowNormal89:
;linefollow.h,63 :: 		else if( Sensor4==1 && Sensor5==1){
	BTFSS       PORTD+0, 5 
	GOTO        L_lineFollowNormal95
	BTFSS       PORTD+0, 6 
	GOTO        L_lineFollowNormal95
L__lineFollowNormal198:
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
	GOTO        L_lineFollowNormal96
L_lineFollowNormal95:
;linefollow.h,67 :: 		else if( Sensor4==1 && Sensor5==0 && Scout==1){
	BTFSS       PORTD+0, 5 
	GOTO        L_lineFollowNormal99
	BTFSC       PORTD+0, 6 
	GOTO        L_lineFollowNormal99
	BTFSS       PORTB+0, 5 
	GOTO        L_lineFollowNormal99
L__lineFollowNormal197:
;linefollow.h,69 :: 		turnLeft(TEST_RPM);
	MOVF        _TEST_RPM+0, 0 
	MOVWF       FARG_turnLeft_pwmRight+0 
	MOVF        _TEST_RPM+1, 0 
	MOVWF       FARG_turnLeft_pwmRight+1 
	CALL        _turnLeft+0, 0
;linefollow.h,70 :: 		}
	GOTO        L_lineFollowNormal100
L_lineFollowNormal99:
;linefollow.h,71 :: 		else if( Sensor4==0 && Sensor5==1 && Scout==1){
	BTFSC       PORTD+0, 5 
	GOTO        L_lineFollowNormal103
	BTFSS       PORTD+0, 6 
	GOTO        L_lineFollowNormal103
	BTFSS       PORTB+0, 5 
	GOTO        L_lineFollowNormal103
L__lineFollowNormal196:
;linefollow.h,73 :: 		turnRight(TEST_RPM);
	MOVF        _TEST_RPM+0, 0 
	MOVWF       FARG_turnRight_pwmLeft+0 
	MOVF        _TEST_RPM+1, 0 
	MOVWF       FARG_turnRight_pwmLeft+1 
	CALL        _turnRight+0, 0
;linefollow.h,74 :: 		}
	GOTO        L_lineFollowNormal104
L_lineFollowNormal103:
;linefollow.h,75 :: 		else if( Sensor4==1 && Sensor5==0 && Scout==0){
	BTFSS       PORTD+0, 5 
	GOTO        L_lineFollowNormal107
	BTFSC       PORTD+0, 6 
	GOTO        L_lineFollowNormal107
	BTFSC       PORTB+0, 5 
	GOTO        L_lineFollowNormal107
L__lineFollowNormal195:
;linefollow.h,77 :: 		stop();
	CALL        _stop+0, 0
;linefollow.h,79 :: 		rotateAntiClockwise(TEST_RPM);
	MOVF        _TEST_RPM+0, 0 
	MOVWF       FARG_rotateAntiClockwise_pwm+0 
	MOVF        _TEST_RPM+1, 0 
	MOVWF       FARG_rotateAntiClockwise_pwm+1 
	CALL        _rotateAntiClockwise+0, 0
;linefollow.h,80 :: 		}
	GOTO        L_lineFollowNormal108
L_lineFollowNormal107:
;linefollow.h,81 :: 		else if( Sensor4==0 && Sensor5==1 && Scout==0){
	BTFSC       PORTD+0, 5 
	GOTO        L_lineFollowNormal111
	BTFSS       PORTD+0, 6 
	GOTO        L_lineFollowNormal111
	BTFSC       PORTB+0, 5 
	GOTO        L_lineFollowNormal111
L__lineFollowNormal194:
;linefollow.h,83 :: 		stop();
	CALL        _stop+0, 0
;linefollow.h,85 :: 		rotateClockwise(TEST_RPM);
	MOVF        _TEST_RPM+0, 0 
	MOVWF       FARG_rotateClockwise_pwm+0 
	MOVF        _TEST_RPM+1, 0 
	MOVWF       FARG_rotateClockwise_pwm+1 
	CALL        _rotateClockwise+0, 0
;linefollow.h,86 :: 		}
	GOTO        L_lineFollowNormal112
L_lineFollowNormal111:
;linefollow.h,87 :: 		else if( Sensor4==0 && Sensor5==0 ){
	BTFSC       PORTD+0, 5 
	GOTO        L_lineFollowNormal115
	BTFSC       PORTD+0, 6 
	GOTO        L_lineFollowNormal115
L__lineFollowNormal193:
;linefollow.h,88 :: 		if(Sensor3 ==1){
	BTFSS       PORTD+0, 4 
	GOTO        L_lineFollowNormal116
;linefollow.h,89 :: 		rotateAntiClockwise(TEST_RPM);
	MOVF        _TEST_RPM+0, 0 
	MOVWF       FARG_rotateAntiClockwise_pwm+0 
	MOVF        _TEST_RPM+1, 0 
	MOVWF       FARG_rotateAntiClockwise_pwm+1 
	CALL        _rotateAntiClockwise+0, 0
;linefollow.h,90 :: 		}
	GOTO        L_lineFollowNormal117
L_lineFollowNormal116:
;linefollow.h,91 :: 		else if(Sensor6 ==1){
	BTFSS       PORTD+0, 7 
	GOTO        L_lineFollowNormal118
;linefollow.h,92 :: 		rotateClockwise(TEST_RPM);
	MOVF        _TEST_RPM+0, 0 
	MOVWF       FARG_rotateClockwise_pwm+0 
	MOVF        _TEST_RPM+1, 0 
	MOVWF       FARG_rotateClockwise_pwm+1 
	CALL        _rotateClockwise+0, 0
;linefollow.h,93 :: 		}
	GOTO        L_lineFollowNormal119
L_lineFollowNormal118:
;linefollow.h,94 :: 		else if(Sensor2 ==1){
	BTFSS       PORTB+0, 3 
	GOTO        L_lineFollowNormal120
;linefollow.h,95 :: 		rotateAntiClockwise(TEST_RPM);
	MOVF        _TEST_RPM+0, 0 
	MOVWF       FARG_rotateAntiClockwise_pwm+0 
	MOVF        _TEST_RPM+1, 0 
	MOVWF       FARG_rotateAntiClockwise_pwm+1 
	CALL        _rotateAntiClockwise+0, 0
;linefollow.h,96 :: 		}
	GOTO        L_lineFollowNormal121
L_lineFollowNormal120:
;linefollow.h,97 :: 		else if(Sensor7 ==1){
	BTFSS       PORTB+0, 2 
	GOTO        L_lineFollowNormal122
;linefollow.h,98 :: 		rotateClockwise(TEST_RPM);
	MOVF        _TEST_RPM+0, 0 
	MOVWF       FARG_rotateClockwise_pwm+0 
	MOVF        _TEST_RPM+1, 0 
	MOVWF       FARG_rotateClockwise_pwm+1 
	CALL        _rotateClockwise+0, 0
;linefollow.h,99 :: 		}
	GOTO        L_lineFollowNormal123
L_lineFollowNormal122:
;linefollow.h,102 :: 		stop();
	CALL        _stop+0, 0
;linefollow.h,105 :: 		}
L_lineFollowNormal123:
L_lineFollowNormal121:
L_lineFollowNormal119:
L_lineFollowNormal117:
;linefollow.h,106 :: 		}
L_lineFollowNormal115:
L_lineFollowNormal112:
L_lineFollowNormal108:
L_lineFollowNormal104:
L_lineFollowNormal100:
L_lineFollowNormal96:
L_lineFollowNormal92:
L_lineFollowNormal82:
L_lineFollowNormal72:
;linefollow.h,108 :: 		}
	GOTO        L_lineFollowNormal63
L_lineFollowNormal64:
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
;linefollow.h,114 :: 		MID_RPM = 180;
	MOVLW       180
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
;linefollow.h,118 :: 		Kp = 9;
	MOVLW       0
	MOVWF       _Kp+0 
	MOVLW       0
	MOVWF       _Kp+1 
	MOVLW       16
	MOVWF       _Kp+2 
	MOVLW       130
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
	MOVLW       180
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
L_lineFollowPID124:
	BTFSC       PORTD+0, 4 
	GOTO        L_lineFollowPID127
	BTFSC       PORTD+0, 5 
	GOTO        L_lineFollowPID127
	BTFSC       PORTD+0, 6 
	GOTO        L_lineFollowPID127
	BTFSC       PORTD+0, 7 
	GOTO        L_lineFollowPID127
	BTFSC       PORTB+0, 2 
	GOTO        L_lineFollowPID127
	MOVLW       1
	MOVWF       R0 
	GOTO        L_lineFollowPID126
L_lineFollowPID127:
	CLRF        R0 
L_lineFollowPID126:
	MOVF        R0, 1 
	BTFSS       STATUS+0, 2 
	GOTO        L_lineFollowPID125
;linefollow.h,134 :: 		if( (Scout==0 && Sensor1==0 && Sensor2==0 && Sensor3==0 && Sensor4==1 && Sensor5==1 && Sensor6==1 && Sensor7==1 && Sensor8==1 && Sensor9==1) || (Scout==0 && Sensor1==0 && Sensor2==0 && Sensor3==0 && Sensor4==0 && Sensor5==1 && Sensor6==1 && Sensor7==1 && Sensor8==1 && Sensor9==1)){
	BTFSC       PORTB+0, 5 
	GOTO        L__lineFollowPID224
	BTFSC       PORTB+0, 4 
	GOTO        L__lineFollowPID224
	BTFSC       PORTB+0, 3 
	GOTO        L__lineFollowPID224
	BTFSC       PORTD+0, 4 
	GOTO        L__lineFollowPID224
	BTFSS       PORTD+0, 5 
	GOTO        L__lineFollowPID224
	BTFSS       PORTD+0, 6 
	GOTO        L__lineFollowPID224
	BTFSS       PORTD+0, 7 
	GOTO        L__lineFollowPID224
	BTFSS       PORTB+0, 2 
	GOTO        L__lineFollowPID224
	BTFSS       PORTB+0, 6 
	GOTO        L__lineFollowPID224
	BTFSS       PORTB+0, 7 
	GOTO        L__lineFollowPID224
	GOTO        L__lineFollowPID222
L__lineFollowPID224:
	BTFSC       PORTB+0, 5 
	GOTO        L__lineFollowPID223
	BTFSC       PORTB+0, 4 
	GOTO        L__lineFollowPID223
	BTFSC       PORTB+0, 3 
	GOTO        L__lineFollowPID223
	BTFSC       PORTD+0, 4 
	GOTO        L__lineFollowPID223
	BTFSC       PORTD+0, 5 
	GOTO        L__lineFollowPID223
	BTFSS       PORTD+0, 6 
	GOTO        L__lineFollowPID223
	BTFSS       PORTD+0, 7 
	GOTO        L__lineFollowPID223
	BTFSS       PORTB+0, 2 
	GOTO        L__lineFollowPID223
	BTFSS       PORTB+0, 6 
	GOTO        L__lineFollowPID223
	BTFSS       PORTB+0, 7 
	GOTO        L__lineFollowPID223
	GOTO        L__lineFollowPID222
L__lineFollowPID223:
	GOTO        L_lineFollowPID134
L__lineFollowPID222:
;linefollow.h,136 :: 		debugText = "90 to right..   ";
	MOVLW       ?lstr32_Robo2_32v1.1+0
	MOVWF       _debugText+0 
	MOVLW       hi_addr(?lstr32_Robo2_32v1.1+0)
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
L_lineFollowPID135:
	BTFSC       PORTB+0, 5 
	GOTO        L_lineFollowPID136
;linefollow.h,140 :: 		rotateClockwise(TEST_RPM);
	MOVF        _TEST_RPM+0, 0 
	MOVWF       FARG_rotateClockwise_pwm+0 
	MOVF        _TEST_RPM+1, 0 
	MOVWF       FARG_rotateClockwise_pwm+1 
	CALL        _rotateClockwise+0, 0
;linefollow.h,141 :: 		}
	GOTO        L_lineFollowPID135
L_lineFollowPID136:
;linefollow.h,142 :: 		}
	GOTO        L_lineFollowPID137
L_lineFollowPID134:
;linefollow.h,143 :: 		else if( (Scout==0 && Sensor1==1 && Sensor2==1 && Sensor3==1 && Sensor4==1 && Sensor7==0 && Sensor8==0 && Sensor9==0) && (Scout==0 && Sensor1==1 && Sensor2==1 && Sensor3==1 && Sensor4==1 && Sensor7==0 && Sensor8==0 && Sensor9==0)){
	BTFSC       PORTB+0, 5 
	GOTO        L_lineFollowPID144
	BTFSS       PORTB+0, 4 
	GOTO        L_lineFollowPID144
	BTFSS       PORTB+0, 3 
	GOTO        L_lineFollowPID144
	BTFSS       PORTD+0, 4 
	GOTO        L_lineFollowPID144
	BTFSS       PORTD+0, 5 
	GOTO        L_lineFollowPID144
	BTFSC       PORTB+0, 2 
	GOTO        L_lineFollowPID144
	BTFSC       PORTB+0, 6 
	GOTO        L_lineFollowPID144
	BTFSC       PORTB+0, 7 
	GOTO        L_lineFollowPID144
L__lineFollowPID221:
	BTFSC       PORTB+0, 5 
	GOTO        L_lineFollowPID144
	BTFSS       PORTB+0, 4 
	GOTO        L_lineFollowPID144
	BTFSS       PORTB+0, 3 
	GOTO        L_lineFollowPID144
	BTFSS       PORTD+0, 4 
	GOTO        L_lineFollowPID144
	BTFSS       PORTD+0, 5 
	GOTO        L_lineFollowPID144
	BTFSC       PORTB+0, 2 
	GOTO        L_lineFollowPID144
	BTFSC       PORTB+0, 6 
	GOTO        L_lineFollowPID144
	BTFSC       PORTB+0, 7 
	GOTO        L_lineFollowPID144
L__lineFollowPID220:
L__lineFollowPID219:
;linefollow.h,145 :: 		debugText = "90 to left..   ";
	MOVLW       ?lstr33_Robo2_32v1.1+0
	MOVWF       _debugText+0 
	MOVLW       hi_addr(?lstr33_Robo2_32v1.1+0)
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
L_lineFollowPID145:
	BTFSC       PORTB+0, 5 
	GOTO        L_lineFollowPID146
;linefollow.h,149 :: 		rotateAntiClockwise(TEST_RPM);
	MOVF        _TEST_RPM+0, 0 
	MOVWF       FARG_rotateAntiClockwise_pwm+0 
	MOVF        _TEST_RPM+1, 0 
	MOVWF       FARG_rotateAntiClockwise_pwm+1 
	CALL        _rotateAntiClockwise+0, 0
;linefollow.h,150 :: 		}
	GOTO        L_lineFollowPID145
L_lineFollowPID146:
;linefollow.h,151 :: 		}
L_lineFollowPID144:
L_lineFollowPID137:
;linefollow.h,154 :: 		if( Sensor3==1 && Sensor4==0 && Sensor5==0 && Sensor6==0 && Sensor7==0)
	BTFSS       PORTD+0, 4 
	GOTO        L_lineFollowPID149
	BTFSC       PORTD+0, 5 
	GOTO        L_lineFollowPID149
	BTFSC       PORTD+0, 6 
	GOTO        L_lineFollowPID149
	BTFSC       PORTD+0, 7 
	GOTO        L_lineFollowPID149
	BTFSC       PORTB+0, 2 
	GOTO        L_lineFollowPID149
L__lineFollowPID218:
;linefollow.h,155 :: 		deviation = 4;
	MOVLW       4
	MOVWF       _deviation+0 
	MOVLW       0
	MOVWF       _deviation+1 
L_lineFollowPID149:
;linefollow.h,156 :: 		if( Sensor3==1 && Sensor4==1 && Sensor5==0 && Sensor6==0 && Sensor7==0)
	BTFSS       PORTD+0, 4 
	GOTO        L_lineFollowPID152
	BTFSS       PORTD+0, 5 
	GOTO        L_lineFollowPID152
	BTFSC       PORTD+0, 6 
	GOTO        L_lineFollowPID152
	BTFSC       PORTD+0, 7 
	GOTO        L_lineFollowPID152
	BTFSC       PORTB+0, 2 
	GOTO        L_lineFollowPID152
L__lineFollowPID217:
;linefollow.h,157 :: 		deviation = 3;
	MOVLW       3
	MOVWF       _deviation+0 
	MOVLW       0
	MOVWF       _deviation+1 
L_lineFollowPID152:
;linefollow.h,158 :: 		if( Sensor3==1 && Sensor4==1 && Sensor5==1 && Sensor6==0 && Sensor7==0)
	BTFSS       PORTD+0, 4 
	GOTO        L_lineFollowPID155
	BTFSS       PORTD+0, 5 
	GOTO        L_lineFollowPID155
	BTFSS       PORTD+0, 6 
	GOTO        L_lineFollowPID155
	BTFSC       PORTD+0, 7 
	GOTO        L_lineFollowPID155
	BTFSC       PORTB+0, 2 
	GOTO        L_lineFollowPID155
L__lineFollowPID216:
;linefollow.h,159 :: 		deviation = 2;
	MOVLW       2
	MOVWF       _deviation+0 
	MOVLW       0
	MOVWF       _deviation+1 
L_lineFollowPID155:
;linefollow.h,160 :: 		if( Sensor3==0 && Sensor4==1 && Sensor5==0 && Sensor6==0 && Sensor7==0)
	BTFSC       PORTD+0, 4 
	GOTO        L_lineFollowPID158
	BTFSS       PORTD+0, 5 
	GOTO        L_lineFollowPID158
	BTFSC       PORTD+0, 6 
	GOTO        L_lineFollowPID158
	BTFSC       PORTD+0, 7 
	GOTO        L_lineFollowPID158
	BTFSC       PORTB+0, 2 
	GOTO        L_lineFollowPID158
L__lineFollowPID215:
;linefollow.h,161 :: 		deviation = 1;
	MOVLW       1
	MOVWF       _deviation+0 
	MOVLW       0
	MOVWF       _deviation+1 
L_lineFollowPID158:
;linefollow.h,163 :: 		if( Sensor3==0 && Sensor4==1 && Sensor5==1 && Sensor6==0 && Sensor7==0)
	BTFSC       PORTD+0, 4 
	GOTO        L_lineFollowPID161
	BTFSS       PORTD+0, 5 
	GOTO        L_lineFollowPID161
	BTFSS       PORTD+0, 6 
	GOTO        L_lineFollowPID161
	BTFSC       PORTD+0, 7 
	GOTO        L_lineFollowPID161
	BTFSC       PORTB+0, 2 
	GOTO        L_lineFollowPID161
L__lineFollowPID214:
;linefollow.h,164 :: 		deviation = 0;
	CLRF        _deviation+0 
	CLRF        _deviation+1 
L_lineFollowPID161:
;linefollow.h,165 :: 		if( Sensor3==0 && Sensor4==1 && Sensor5==1 && Sensor6==1 && Sensor7==0)
	BTFSC       PORTD+0, 4 
	GOTO        L_lineFollowPID164
	BTFSS       PORTD+0, 5 
	GOTO        L_lineFollowPID164
	BTFSS       PORTD+0, 6 
	GOTO        L_lineFollowPID164
	BTFSS       PORTD+0, 7 
	GOTO        L_lineFollowPID164
	BTFSC       PORTB+0, 2 
	GOTO        L_lineFollowPID164
L__lineFollowPID213:
;linefollow.h,166 :: 		deviation = 0;
	CLRF        _deviation+0 
	CLRF        _deviation+1 
L_lineFollowPID164:
;linefollow.h,167 :: 		if( Sensor3==0 && Sensor4==0 && Sensor5==1 && Sensor6==0 && Sensor7==0)
	BTFSC       PORTD+0, 4 
	GOTO        L_lineFollowPID167
	BTFSC       PORTD+0, 5 
	GOTO        L_lineFollowPID167
	BTFSS       PORTD+0, 6 
	GOTO        L_lineFollowPID167
	BTFSC       PORTD+0, 7 
	GOTO        L_lineFollowPID167
	BTFSC       PORTB+0, 2 
	GOTO        L_lineFollowPID167
L__lineFollowPID212:
;linefollow.h,168 :: 		deviation = 0;
	CLRF        _deviation+0 
	CLRF        _deviation+1 
L_lineFollowPID167:
;linefollow.h,169 :: 		if( Sensor3==0 && Sensor4==0 && Sensor5==1 && Sensor6==1 && Sensor7==0)
	BTFSC       PORTD+0, 4 
	GOTO        L_lineFollowPID170
	BTFSC       PORTD+0, 5 
	GOTO        L_lineFollowPID170
	BTFSS       PORTD+0, 6 
	GOTO        L_lineFollowPID170
	BTFSS       PORTD+0, 7 
	GOTO        L_lineFollowPID170
	BTFSC       PORTB+0, 2 
	GOTO        L_lineFollowPID170
L__lineFollowPID211:
;linefollow.h,170 :: 		deviation = 0;
	CLRF        _deviation+0 
	CLRF        _deviation+1 
L_lineFollowPID170:
;linefollow.h,172 :: 		if( Sensor3==0 && Sensor4==0 && Sensor5==0 && Sensor6==1 && Sensor7==0)
	BTFSC       PORTD+0, 4 
	GOTO        L_lineFollowPID173
	BTFSC       PORTD+0, 5 
	GOTO        L_lineFollowPID173
	BTFSC       PORTD+0, 6 
	GOTO        L_lineFollowPID173
	BTFSS       PORTD+0, 7 
	GOTO        L_lineFollowPID173
	BTFSC       PORTB+0, 2 
	GOTO        L_lineFollowPID173
L__lineFollowPID210:
;linefollow.h,173 :: 		deviation = -1;
	MOVLW       255
	MOVWF       _deviation+0 
	MOVLW       255
	MOVWF       _deviation+1 
L_lineFollowPID173:
;linefollow.h,174 :: 		if( Sensor3==0 && Sensor4==0 && Sensor5==1 && Sensor6==1 && Sensor7==1)
	BTFSC       PORTD+0, 4 
	GOTO        L_lineFollowPID176
	BTFSC       PORTD+0, 5 
	GOTO        L_lineFollowPID176
	BTFSS       PORTD+0, 6 
	GOTO        L_lineFollowPID176
	BTFSS       PORTD+0, 7 
	GOTO        L_lineFollowPID176
	BTFSS       PORTB+0, 2 
	GOTO        L_lineFollowPID176
L__lineFollowPID209:
;linefollow.h,175 :: 		deviation = -2;
	MOVLW       254
	MOVWF       _deviation+0 
	MOVLW       255
	MOVWF       _deviation+1 
L_lineFollowPID176:
;linefollow.h,176 :: 		if( Sensor3==0 && Sensor4==0 && Sensor5==0 && Sensor6==1 && Sensor7==1)
	BTFSC       PORTD+0, 4 
	GOTO        L_lineFollowPID179
	BTFSC       PORTD+0, 5 
	GOTO        L_lineFollowPID179
	BTFSC       PORTD+0, 6 
	GOTO        L_lineFollowPID179
	BTFSS       PORTD+0, 7 
	GOTO        L_lineFollowPID179
	BTFSS       PORTB+0, 2 
	GOTO        L_lineFollowPID179
L__lineFollowPID208:
;linefollow.h,177 :: 		deviation = -3;
	MOVLW       253
	MOVWF       _deviation+0 
	MOVLW       255
	MOVWF       _deviation+1 
L_lineFollowPID179:
;linefollow.h,178 :: 		if( Sensor3==0 && Sensor4==0 && Sensor5==0 && Sensor6==0 && Sensor7==1)
	BTFSC       PORTD+0, 4 
	GOTO        L_lineFollowPID182
	BTFSC       PORTD+0, 5 
	GOTO        L_lineFollowPID182
	BTFSC       PORTD+0, 6 
	GOTO        L_lineFollowPID182
	BTFSC       PORTD+0, 7 
	GOTO        L_lineFollowPID182
	BTFSS       PORTB+0, 2 
	GOTO        L_lineFollowPID182
L__lineFollowPID207:
;linefollow.h,179 :: 		deviation = -4;
	MOVLW       252
	MOVWF       _deviation+0 
	MOVLW       255
	MOVWF       _deviation+1 
L_lineFollowPID182:
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
	GOTO        L_lineFollowPID124
L_lineFollowPID125:
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

;Robo2 v1.1.c,7 :: 		void main() {
;Robo2 v1.1.c,8 :: 		configure();
	CALL        _configure+0, 0
;Robo2 v1.1.c,10 :: 		UART1_Write_Text(ConnectionEstablished);
	MOVF        _ConnectionEstablished+0, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVF        _ConnectionEstablished+1, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;Robo2 v1.1.c,11 :: 		setPID();
	CALL        _setPID+0, 0
;Robo2 v1.1.c,15 :: 		debugText = "          Starting..  ";
	MOVLW       ?lstr34_Robo2_32v1.1+0
	MOVWF       _debugText+0 
	MOVLW       hi_addr(?lstr34_Robo2_32v1.1+0)
	MOVWF       _debugText+1 
;Robo2 v1.1.c,16 :: 		UART1_Write_Text(debugText);
	MOVF        _debugText+0, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVF        _debugText+1, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;Robo2 v1.1.c,18 :: 		delay_ms(1000);
	MOVLW       26
	MOVWF       R11, 0
	MOVLW       94
	MOVWF       R12, 0
	MOVLW       110
	MOVWF       R13, 0
L_main183:
	DECFSZ      R13, 1, 0
	BRA         L_main183
	DECFSZ      R12, 1, 0
	BRA         L_main183
	DECFSZ      R11, 1, 0
	BRA         L_main183
	NOP
;Robo2 v1.1.c,19 :: 		debugText = "Test Sensors   ";
	MOVLW       ?lstr35_Robo2_32v1.1+0
	MOVWF       _debugText+0 
	MOVLW       hi_addr(?lstr35_Robo2_32v1.1+0)
	MOVWF       _debugText+1 
;Robo2 v1.1.c,20 :: 		UART1_Write_Text(debugText);
	MOVF        _debugText+0, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVF        _debugText+1, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;Robo2 v1.1.c,22 :: 		for(count=0; count<5; count++){
	CLRF        _count+0 
	CLRF        _count+1 
L_main184:
	MOVLW       128
	XORWF       _count+1, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main226
	MOVLW       5
	SUBWF       _count+0, 0 
L__main226:
	BTFSC       STATUS+0, 0 
	GOTO        L_main185
;Robo2 v1.1.c,23 :: 		receiveCommand = UART1_Read();
	CALL        _UART1_Read+0, 0
	MOVF        R0, 0 
	MOVWF       _receiveCommand+0 
;Robo2 v1.1.c,24 :: 		sendSensorStatus();
	CALL        _sendSensorStatus+0, 0
;Robo2 v1.1.c,25 :: 		delay_ms(1000);
	MOVLW       26
	MOVWF       R11, 0
	MOVLW       94
	MOVWF       R12, 0
	MOVLW       110
	MOVWF       R13, 0
L_main187:
	DECFSZ      R13, 1, 0
	BRA         L_main187
	DECFSZ      R12, 1, 0
	BRA         L_main187
	DECFSZ      R11, 1, 0
	BRA         L_main187
	NOP
;Robo2 v1.1.c,22 :: 		for(count=0; count<5; count++){
	INFSNZ      _count+0, 1 
	INCF        _count+1, 1 
;Robo2 v1.1.c,26 :: 		}                                                  //while( receiveCommand != 'A' && receiveCommand != 'a' );
	GOTO        L_main184
L_main185:
;Robo2 v1.1.c,28 :: 		debugText = "Start Line follow..   ";
	MOVLW       ?lstr36_Robo2_32v1.1+0
	MOVWF       _debugText+0 
	MOVLW       hi_addr(?lstr36_Robo2_32v1.1+0)
	MOVWF       _debugText+1 
;Robo2 v1.1.c,29 :: 		UART1_Write_Text(debugText);
	MOVF        _debugText+0, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVF        _debugText+1, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;Robo2 v1.1.c,31 :: 		lineFollow();
	CALL        _lineFollow+0, 0
;Robo2 v1.1.c,32 :: 		}
	GOTO        $+0
; end of _main
