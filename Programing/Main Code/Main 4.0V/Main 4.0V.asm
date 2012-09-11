
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
L__isAllBlack612:
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
L__isAllWhite613:
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

;motion.h,32 :: 		void motorLeft_foward(int pwm){
;motion.h,33 :: 		Motor_Left_Forward = 1;
	BSF         PORTD+0, 2 
;motion.h,34 :: 		Motor_Left_Reverse = 0;
	BCF         PORTD+0, 3 
;motion.h,35 :: 		PWM2_Set_Duty(pwm);
	MOVF        FARG_motorLeft_foward_pwm+0, 0 
	MOVWF       FARG_PWM2_Set_Duty_new_duty+0 
	CALL        _PWM2_Set_Duty+0, 0
;motion.h,36 :: 		}
	RETURN      0
; end of _motorLeft_foward

_motorRight_foward:

;motion.h,38 :: 		void motorRight_foward(int pwm){
;motion.h,39 :: 		Motor_Right_Forward = 1;
	BSF         PORTC+0, 4 
;motion.h,40 :: 		Motor_Right_Reverse = 0;
	BCF         PORTC+0, 5 
;motion.h,41 :: 		PWM1_Set_Duty(pwm);
	MOVF        FARG_motorRight_foward_pwm+0, 0 
	MOVWF       FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;motion.h,42 :: 		}
	RETURN      0
; end of _motorRight_foward

_motorLeft_reverse:

;motion.h,44 :: 		void motorLeft_reverse(int pwm){
;motion.h,45 :: 		Motor_Left_Forward = 0;
	BCF         PORTD+0, 2 
;motion.h,46 :: 		Motor_Left_Reverse = 1;
	BSF         PORTD+0, 3 
;motion.h,47 :: 		PWM2_Set_Duty(pwm);
	MOVF        FARG_motorLeft_reverse_pwm+0, 0 
	MOVWF       FARG_PWM2_Set_Duty_new_duty+0 
	CALL        _PWM2_Set_Duty+0, 0
;motion.h,48 :: 		}
	RETURN      0
; end of _motorLeft_reverse

_motorRight_reverse:

;motion.h,50 :: 		void motorRight_reverse(int pwm){
;motion.h,51 :: 		Motor_Right_Forward = 0;
	BCF         PORTC+0, 4 
;motion.h,52 :: 		Motor_Right_Reverse = 1;
	BSF         PORTC+0, 5 
;motion.h,53 :: 		PWM1_Set_Duty(pwm);
	MOVF        FARG_motorRight_reverse_pwm+0, 0 
	MOVWF       FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;motion.h,54 :: 		}
	RETURN      0
; end of _motorRight_reverse

_motorLeft_stop:

;motion.h,56 :: 		void motorLeft_stop(){
;motion.h,57 :: 		Motor_Left_Forward = 1;
	BSF         PORTD+0, 2 
;motion.h,58 :: 		Motor_Left_Reverse = 1;
	BSF         PORTD+0, 3 
;motion.h,59 :: 		}
	RETURN      0
; end of _motorLeft_stop

_motorRight_stop:

;motion.h,61 :: 		void motorRight_stop(){
;motion.h,62 :: 		Motor_Right_Forward = 1;
	BSF         PORTC+0, 4 
;motion.h,63 :: 		Motor_Right_Reverse = 1;
	BSF         PORTC+0, 5 
;motion.h,64 :: 		}
	RETURN      0
; end of _motorRight_stop

_moveForward:

;motion.h,66 :: 		void moveForward(int pwmLeft, int pwmRight){
;motion.h,67 :: 		motorLeft_foward(pwmLeft*205/200);
	MOVF        FARG_moveForward_pwmLeft+0, 0 
	MOVWF       R0 
	MOVF        FARG_moveForward_pwmLeft+1, 0 
	MOVWF       R1 
	MOVLW       205
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	CALL        _Mul_16x16_U+0, 0
	MOVLW       200
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	CALL        _Div_16x16_S+0, 0
	MOVF        R0, 0 
	MOVWF       FARG_motorLeft_foward_pwm+0 
	MOVF        R1, 0 
	MOVWF       FARG_motorLeft_foward_pwm+1 
	CALL        _motorLeft_foward+0, 0
;motion.h,68 :: 		motorRight_foward(pwmRight);
	MOVF        FARG_moveForward_pwmRight+0, 0 
	MOVWF       FARG_motorRight_foward_pwm+0 
	MOVF        FARG_moveForward_pwmRight+1, 0 
	MOVWF       FARG_motorRight_foward_pwm+1 
	CALL        _motorRight_foward+0, 0
;motion.h,69 :: 		}
	RETURN      0
; end of _moveForward

_reverse:

;motion.h,71 :: 		void reverse(int pwmLeft, int pwmRight){
;motion.h,72 :: 		motorLeft_reverse(pwmLeft);
	MOVF        FARG_reverse_pwmLeft+0, 0 
	MOVWF       FARG_motorLeft_reverse_pwm+0 
	MOVF        FARG_reverse_pwmLeft+1, 0 
	MOVWF       FARG_motorLeft_reverse_pwm+1 
	CALL        _motorLeft_reverse+0, 0
;motion.h,73 :: 		motorRight_reverse(pwmRight);
	MOVF        FARG_reverse_pwmRight+0, 0 
	MOVWF       FARG_motorRight_reverse_pwm+0 
	MOVF        FARG_reverse_pwmRight+1, 0 
	MOVWF       FARG_motorRight_reverse_pwm+1 
	CALL        _motorRight_reverse+0, 0
;motion.h,74 :: 		}
	RETURN      0
; end of _reverse

_turnRight:

;motion.h,76 :: 		void turnRight(int pwmLeft){
;motion.h,77 :: 		motorLeft_foward(pwmLeft);
	MOVF        FARG_turnRight_pwmLeft+0, 0 
	MOVWF       FARG_motorLeft_foward_pwm+0 
	MOVF        FARG_turnRight_pwmLeft+1, 0 
	MOVWF       FARG_motorLeft_foward_pwm+1 
	CALL        _motorLeft_foward+0, 0
;motion.h,78 :: 		motorRight_stop();
	CALL        _motorRight_stop+0, 0
;motion.h,79 :: 		}
	RETURN      0
; end of _turnRight

_turnLeft:

;motion.h,81 :: 		void turnLeft(int pwmRight){
;motion.h,82 :: 		motorRight_foward(pwmRight);
	MOVF        FARG_turnLeft_pwmRight+0, 0 
	MOVWF       FARG_motorRight_foward_pwm+0 
	MOVF        FARG_turnLeft_pwmRight+1, 0 
	MOVWF       FARG_motorRight_foward_pwm+1 
	CALL        _motorRight_foward+0, 0
;motion.h,83 :: 		motorLeft_stop();
	CALL        _motorLeft_stop+0, 0
;motion.h,84 :: 		}
	RETURN      0
; end of _turnLeft

_rotateClockwise:

;motion.h,86 :: 		void rotateClockwise(int pwm){
;motion.h,87 :: 		motorLeft_foward(pwm);
	MOVF        FARG_rotateClockwise_pwm+0, 0 
	MOVWF       FARG_motorLeft_foward_pwm+0 
	MOVF        FARG_rotateClockwise_pwm+1, 0 
	MOVWF       FARG_motorLeft_foward_pwm+1 
	CALL        _motorLeft_foward+0, 0
;motion.h,88 :: 		motorRight_reverse(pwm);
	MOVF        FARG_rotateClockwise_pwm+0, 0 
	MOVWF       FARG_motorRight_reverse_pwm+0 
	MOVF        FARG_rotateClockwise_pwm+1, 0 
	MOVWF       FARG_motorRight_reverse_pwm+1 
	CALL        _motorRight_reverse+0, 0
;motion.h,89 :: 		}
	RETURN      0
; end of _rotateClockwise

_rotateAntiClockwise:

;motion.h,91 :: 		void rotateAntiClockwise(int pwm){
;motion.h,92 :: 		motorLeft_reverse(pwm);
	MOVF        FARG_rotateAntiClockwise_pwm+0, 0 
	MOVWF       FARG_motorLeft_reverse_pwm+0 
	MOVF        FARG_rotateAntiClockwise_pwm+1, 0 
	MOVWF       FARG_motorLeft_reverse_pwm+1 
	CALL        _motorLeft_reverse+0, 0
;motion.h,93 :: 		motorRight_foward(pwm);
	MOVF        FARG_rotateAntiClockwise_pwm+0, 0 
	MOVWF       FARG_motorRight_foward_pwm+0 
	MOVF        FARG_rotateAntiClockwise_pwm+1, 0 
	MOVWF       FARG_motorRight_foward_pwm+1 
	CALL        _motorRight_foward+0, 0
;motion.h,94 :: 		}
	RETURN      0
; end of _rotateAntiClockwise

_stop:

;motion.h,96 :: 		void stop(){
;motion.h,97 :: 		motorLeft_stop();
	CALL        _motorLeft_stop+0, 0
;motion.h,98 :: 		motorRight_stop();
	CALL        _motorRight_stop+0, 0
;motion.h,99 :: 		}
	RETURN      0
; end of _stop

_rotateByDegree:

;motion.h,101 :: 		void rotateByDegree(int degree){
;motion.h,102 :: 		if( degree == -90 ){
	MOVLW       255
	XORWF       FARG_rotateByDegree_degree+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__rotateByDegree732
	MOVLW       166
	XORWF       FARG_rotateByDegree_degree+0, 0 
L__rotateByDegree732:
	BTFSS       STATUS+0, 2 
	GOTO        L_rotateByDegree8
;motion.h,103 :: 		rotateAntiClockwise(255);
	MOVLW       255
	MOVWF       FARG_rotateAntiClockwise_pwm+0 
	MOVLW       0
	MOVWF       FARG_rotateAntiClockwise_pwm+1 
	CALL        _rotateAntiClockwise+0, 0
;motion.h,104 :: 		delay_ms(220);
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
;motion.h,105 :: 		stop();
	CALL        _stop+0, 0
;motion.h,106 :: 		}
	GOTO        L_rotateByDegree10
L_rotateByDegree8:
;motion.h,107 :: 		else if( degree == 90 ){
	MOVLW       0
	XORWF       FARG_rotateByDegree_degree+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__rotateByDegree733
	MOVLW       90
	XORWF       FARG_rotateByDegree_degree+0, 0 
L__rotateByDegree733:
	BTFSS       STATUS+0, 2 
	GOTO        L_rotateByDegree11
;motion.h,108 :: 		rotateClockwise(255);
	MOVLW       255
	MOVWF       FARG_rotateClockwise_pwm+0 
	MOVLW       0
	MOVWF       FARG_rotateClockwise_pwm+1 
	CALL        _rotateClockwise+0, 0
;motion.h,109 :: 		delay_ms(220);
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
;motion.h,110 :: 		stop();
	CALL        _stop+0, 0
;motion.h,111 :: 		}
L_rotateByDegree11:
L_rotateByDegree10:
;motion.h,112 :: 		if( degree == -30 ){
	MOVLW       255
	XORWF       FARG_rotateByDegree_degree+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__rotateByDegree734
	MOVLW       226
	XORWF       FARG_rotateByDegree_degree+0, 0 
L__rotateByDegree734:
	BTFSS       STATUS+0, 2 
	GOTO        L_rotateByDegree13
;motion.h,113 :: 		rotateAntiClockwise(255);
	MOVLW       255
	MOVWF       FARG_rotateAntiClockwise_pwm+0 
	MOVLW       0
	MOVWF       FARG_rotateAntiClockwise_pwm+1 
	CALL        _rotateAntiClockwise+0, 0
;motion.h,114 :: 		delay_ms(100);
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       138
	MOVWF       R12, 0
	MOVLW       85
	MOVWF       R13, 0
L_rotateByDegree14:
	DECFSZ      R13, 1, 0
	BRA         L_rotateByDegree14
	DECFSZ      R12, 1, 0
	BRA         L_rotateByDegree14
	DECFSZ      R11, 1, 0
	BRA         L_rotateByDegree14
	NOP
	NOP
;motion.h,115 :: 		stop();
	CALL        _stop+0, 0
;motion.h,116 :: 		delay_ms(200);
	MOVLW       6
	MOVWF       R11, 0
	MOVLW       19
	MOVWF       R12, 0
	MOVLW       173
	MOVWF       R13, 0
L_rotateByDegree15:
	DECFSZ      R13, 1, 0
	BRA         L_rotateByDegree15
	DECFSZ      R12, 1, 0
	BRA         L_rotateByDegree15
	DECFSZ      R11, 1, 0
	BRA         L_rotateByDegree15
	NOP
	NOP
;motion.h,117 :: 		}
	GOTO        L_rotateByDegree16
L_rotateByDegree13:
;motion.h,118 :: 		else if( degree == 30 ){
	MOVLW       0
	XORWF       FARG_rotateByDegree_degree+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__rotateByDegree735
	MOVLW       30
	XORWF       FARG_rotateByDegree_degree+0, 0 
L__rotateByDegree735:
	BTFSS       STATUS+0, 2 
	GOTO        L_rotateByDegree17
;motion.h,119 :: 		rotateClockwise(255);
	MOVLW       255
	MOVWF       FARG_rotateClockwise_pwm+0 
	MOVLW       0
	MOVWF       FARG_rotateClockwise_pwm+1 
	CALL        _rotateClockwise+0, 0
;motion.h,120 :: 		delay_ms(100);
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       138
	MOVWF       R12, 0
	MOVLW       85
	MOVWF       R13, 0
L_rotateByDegree18:
	DECFSZ      R13, 1, 0
	BRA         L_rotateByDegree18
	DECFSZ      R12, 1, 0
	BRA         L_rotateByDegree18
	DECFSZ      R11, 1, 0
	BRA         L_rotateByDegree18
	NOP
	NOP
;motion.h,121 :: 		stop();
	CALL        _stop+0, 0
;motion.h,122 :: 		delay_ms(200);
	MOVLW       6
	MOVWF       R11, 0
	MOVLW       19
	MOVWF       R12, 0
	MOVLW       173
	MOVWF       R13, 0
L_rotateByDegree19:
	DECFSZ      R13, 1, 0
	BRA         L_rotateByDegree19
	DECFSZ      R12, 1, 0
	BRA         L_rotateByDegree19
	DECFSZ      R11, 1, 0
	BRA         L_rotateByDegree19
	NOP
	NOP
;motion.h,123 :: 		}
L_rotateByDegree17:
L_rotateByDegree16:
;motion.h,124 :: 		if( degree == -60 ){
	MOVLW       255
	XORWF       FARG_rotateByDegree_degree+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__rotateByDegree736
	MOVLW       196
	XORWF       FARG_rotateByDegree_degree+0, 0 
L__rotateByDegree736:
	BTFSS       STATUS+0, 2 
	GOTO        L_rotateByDegree20
;motion.h,125 :: 		rotateAntiClockwise(255);
	MOVLW       255
	MOVWF       FARG_rotateAntiClockwise_pwm+0 
	MOVLW       0
	MOVWF       FARG_rotateAntiClockwise_pwm+1 
	CALL        _rotateAntiClockwise+0, 0
;motion.h,126 :: 		delay_ms(155);
	MOVLW       4
	MOVWF       R11, 0
	MOVLW       239
	MOVWF       R12, 0
	MOVLW       121
	MOVWF       R13, 0
L_rotateByDegree21:
	DECFSZ      R13, 1, 0
	BRA         L_rotateByDegree21
	DECFSZ      R12, 1, 0
	BRA         L_rotateByDegree21
	DECFSZ      R11, 1, 0
	BRA         L_rotateByDegree21
	NOP
	NOP
;motion.h,127 :: 		stop();
	CALL        _stop+0, 0
;motion.h,128 :: 		delay_ms(200);
	MOVLW       6
	MOVWF       R11, 0
	MOVLW       19
	MOVWF       R12, 0
	MOVLW       173
	MOVWF       R13, 0
L_rotateByDegree22:
	DECFSZ      R13, 1, 0
	BRA         L_rotateByDegree22
	DECFSZ      R12, 1, 0
	BRA         L_rotateByDegree22
	DECFSZ      R11, 1, 0
	BRA         L_rotateByDegree22
	NOP
	NOP
;motion.h,129 :: 		}
	GOTO        L_rotateByDegree23
L_rotateByDegree20:
;motion.h,130 :: 		else if( degree == 60 ){
	MOVLW       0
	XORWF       FARG_rotateByDegree_degree+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__rotateByDegree737
	MOVLW       60
	XORWF       FARG_rotateByDegree_degree+0, 0 
L__rotateByDegree737:
	BTFSS       STATUS+0, 2 
	GOTO        L_rotateByDegree24
;motion.h,131 :: 		rotateClockwise(255);
	MOVLW       255
	MOVWF       FARG_rotateClockwise_pwm+0 
	MOVLW       0
	MOVWF       FARG_rotateClockwise_pwm+1 
	CALL        _rotateClockwise+0, 0
;motion.h,132 :: 		delay_ms(155);
	MOVLW       4
	MOVWF       R11, 0
	MOVLW       239
	MOVWF       R12, 0
	MOVLW       121
	MOVWF       R13, 0
L_rotateByDegree25:
	DECFSZ      R13, 1, 0
	BRA         L_rotateByDegree25
	DECFSZ      R12, 1, 0
	BRA         L_rotateByDegree25
	DECFSZ      R11, 1, 0
	BRA         L_rotateByDegree25
	NOP
	NOP
;motion.h,133 :: 		stop();
	CALL        _stop+0, 0
;motion.h,134 :: 		delay_ms(200);
	MOVLW       6
	MOVWF       R11, 0
	MOVLW       19
	MOVWF       R12, 0
	MOVLW       173
	MOVWF       R13, 0
L_rotateByDegree26:
	DECFSZ      R13, 1, 0
	BRA         L_rotateByDegree26
	DECFSZ      R12, 1, 0
	BRA         L_rotateByDegree26
	DECFSZ      R11, 1, 0
	BRA         L_rotateByDegree26
	NOP
	NOP
;motion.h,135 :: 		}
L_rotateByDegree24:
L_rotateByDegree23:
;motion.h,136 :: 		}
	RETURN      0
; end of _rotateByDegree

_testMotion:

;motion.h,138 :: 		void testMotion(int pwm){
;motion.h,139 :: 		rotateClockwise(pwm);
	MOVF        FARG_testMotion_pwm+0, 0 
	MOVWF       FARG_rotateClockwise_pwm+0 
	MOVF        FARG_testMotion_pwm+1, 0 
	MOVWF       FARG_rotateClockwise_pwm+1 
	CALL        _rotateClockwise+0, 0
;motion.h,140 :: 		delay_ms(1000);
	MOVLW       26
	MOVWF       R11, 0
	MOVLW       94
	MOVWF       R12, 0
	MOVLW       110
	MOVWF       R13, 0
L_testMotion27:
	DECFSZ      R13, 1, 0
	BRA         L_testMotion27
	DECFSZ      R12, 1, 0
	BRA         L_testMotion27
	DECFSZ      R11, 1, 0
	BRA         L_testMotion27
	NOP
;motion.h,141 :: 		rotateAntiClockwise(pwm);
	MOVF        FARG_testMotion_pwm+0, 0 
	MOVWF       FARG_rotateAntiClockwise_pwm+0 
	MOVF        FARG_testMotion_pwm+1, 0 
	MOVWF       FARG_rotateAntiClockwise_pwm+1 
	CALL        _rotateAntiClockwise+0, 0
;motion.h,142 :: 		delay_ms(1000);
	MOVLW       26
	MOVWF       R11, 0
	MOVLW       94
	MOVWF       R12, 0
	MOVLW       110
	MOVWF       R13, 0
L_testMotion28:
	DECFSZ      R13, 1, 0
	BRA         L_testMotion28
	DECFSZ      R12, 1, 0
	BRA         L_testMotion28
	DECFSZ      R11, 1, 0
	BRA         L_testMotion28
	NOP
;motion.h,143 :: 		moveForward(pwm,pwm);
	MOVF        FARG_testMotion_pwm+0, 0 
	MOVWF       FARG_moveForward_pwmLeft+0 
	MOVF        FARG_testMotion_pwm+1, 0 
	MOVWF       FARG_moveForward_pwmLeft+1 
	MOVF        FARG_testMotion_pwm+0, 0 
	MOVWF       FARG_moveForward_pwmRight+0 
	MOVF        FARG_testMotion_pwm+1, 0 
	MOVWF       FARG_moveForward_pwmRight+1 
	CALL        _moveForward+0, 0
;motion.h,144 :: 		delay_ms(1000);
	MOVLW       26
	MOVWF       R11, 0
	MOVLW       94
	MOVWF       R12, 0
	MOVLW       110
	MOVWF       R13, 0
L_testMotion29:
	DECFSZ      R13, 1, 0
	BRA         L_testMotion29
	DECFSZ      R12, 1, 0
	BRA         L_testMotion29
	DECFSZ      R11, 1, 0
	BRA         L_testMotion29
	NOP
;motion.h,145 :: 		}
	RETURN      0
; end of _testMotion

_sendSensorStatus:

;debug.h,13 :: 		void sendSensorStatus(){
;debug.h,14 :: 		if( Sensor1 == 1){
	BTFSS       PORTB+0, 4 
	GOTO        L_sendSensorStatus30
;debug.h,15 :: 		debugText = "1";
	MOVLW       ?lstr3_Main_324.0V+0
	MOVWF       _debugText+0 
	MOVLW       hi_addr(?lstr3_Main_324.0V+0)
	MOVWF       _debugText+1 
;debug.h,16 :: 		UART1_Write_Text(debugText);
	MOVF        _debugText+0, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVF        _debugText+1, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;debug.h,17 :: 		}
	GOTO        L_sendSensorStatus31
L_sendSensorStatus30:
;debug.h,18 :: 		else if( Sensor1 == 0){
	BTFSC       PORTB+0, 4 
	GOTO        L_sendSensorStatus32
;debug.h,19 :: 		debugText = "0";
	MOVLW       ?lstr4_Main_324.0V+0
	MOVWF       _debugText+0 
	MOVLW       hi_addr(?lstr4_Main_324.0V+0)
	MOVWF       _debugText+1 
;debug.h,20 :: 		UART1_Write_Text(debugText);
	MOVF        _debugText+0, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVF        _debugText+1, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;debug.h,21 :: 		}
L_sendSensorStatus32:
L_sendSensorStatus31:
;debug.h,23 :: 		if( Sensor2 == 1){
	BTFSS       PORTB+0, 3 
	GOTO        L_sendSensorStatus33
;debug.h,24 :: 		debugText = "1";
	MOVLW       ?lstr5_Main_324.0V+0
	MOVWF       _debugText+0 
	MOVLW       hi_addr(?lstr5_Main_324.0V+0)
	MOVWF       _debugText+1 
;debug.h,25 :: 		UART1_Write_Text(debugText);
	MOVF        _debugText+0, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVF        _debugText+1, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;debug.h,26 :: 		}
	GOTO        L_sendSensorStatus34
L_sendSensorStatus33:
;debug.h,27 :: 		else if( Sensor2 == 0){
	BTFSC       PORTB+0, 3 
	GOTO        L_sendSensorStatus35
;debug.h,28 :: 		debugText = "0";
	MOVLW       ?lstr6_Main_324.0V+0
	MOVWF       _debugText+0 
	MOVLW       hi_addr(?lstr6_Main_324.0V+0)
	MOVWF       _debugText+1 
;debug.h,29 :: 		UART1_Write_Text(debugText);
	MOVF        _debugText+0, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVF        _debugText+1, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;debug.h,30 :: 		}
L_sendSensorStatus35:
L_sendSensorStatus34:
;debug.h,32 :: 		if( Sensor3 == 1){
	BTFSS       PORTD+0, 4 
	GOTO        L_sendSensorStatus36
;debug.h,33 :: 		debugText = "1";
	MOVLW       ?lstr7_Main_324.0V+0
	MOVWF       _debugText+0 
	MOVLW       hi_addr(?lstr7_Main_324.0V+0)
	MOVWF       _debugText+1 
;debug.h,34 :: 		UART1_Write_Text(debugText);
	MOVF        _debugText+0, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVF        _debugText+1, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;debug.h,35 :: 		}
	GOTO        L_sendSensorStatus37
L_sendSensorStatus36:
;debug.h,36 :: 		else if( Sensor3 == 0){
	BTFSC       PORTD+0, 4 
	GOTO        L_sendSensorStatus38
;debug.h,37 :: 		debugText = "0";
	MOVLW       ?lstr8_Main_324.0V+0
	MOVWF       _debugText+0 
	MOVLW       hi_addr(?lstr8_Main_324.0V+0)
	MOVWF       _debugText+1 
;debug.h,38 :: 		UART1_Write_Text(debugText);
	MOVF        _debugText+0, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVF        _debugText+1, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;debug.h,39 :: 		}
L_sendSensorStatus38:
L_sendSensorStatus37:
;debug.h,41 :: 		if( Sensor4 == 1){
	BTFSS       PORTD+0, 5 
	GOTO        L_sendSensorStatus39
;debug.h,42 :: 		debugText = "1";
	MOVLW       ?lstr9_Main_324.0V+0
	MOVWF       _debugText+0 
	MOVLW       hi_addr(?lstr9_Main_324.0V+0)
	MOVWF       _debugText+1 
;debug.h,43 :: 		UART1_Write_Text(debugText);
	MOVF        _debugText+0, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVF        _debugText+1, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;debug.h,44 :: 		}
	GOTO        L_sendSensorStatus40
L_sendSensorStatus39:
;debug.h,45 :: 		else if( Sensor4 == 0){
	BTFSC       PORTD+0, 5 
	GOTO        L_sendSensorStatus41
;debug.h,46 :: 		debugText = "0";
	MOVLW       ?lstr10_Main_324.0V+0
	MOVWF       _debugText+0 
	MOVLW       hi_addr(?lstr10_Main_324.0V+0)
	MOVWF       _debugText+1 
;debug.h,47 :: 		UART1_Write_Text(debugText);
	MOVF        _debugText+0, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVF        _debugText+1, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;debug.h,48 :: 		}
L_sendSensorStatus41:
L_sendSensorStatus40:
;debug.h,50 :: 		if( Sensor5 == 1){
	BTFSS       PORTD+0, 6 
	GOTO        L_sendSensorStatus42
;debug.h,51 :: 		debugText = "1";
	MOVLW       ?lstr11_Main_324.0V+0
	MOVWF       _debugText+0 
	MOVLW       hi_addr(?lstr11_Main_324.0V+0)
	MOVWF       _debugText+1 
;debug.h,52 :: 		UART1_Write_Text(debugText);
	MOVF        _debugText+0, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVF        _debugText+1, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;debug.h,53 :: 		}
	GOTO        L_sendSensorStatus43
L_sendSensorStatus42:
;debug.h,54 :: 		else if( Sensor5 == 0){
	BTFSC       PORTD+0, 6 
	GOTO        L_sendSensorStatus44
;debug.h,55 :: 		debugText = "0";
	MOVLW       ?lstr12_Main_324.0V+0
	MOVWF       _debugText+0 
	MOVLW       hi_addr(?lstr12_Main_324.0V+0)
	MOVWF       _debugText+1 
;debug.h,56 :: 		UART1_Write_Text(debugText);
	MOVF        _debugText+0, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVF        _debugText+1, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;debug.h,57 :: 		}
L_sendSensorStatus44:
L_sendSensorStatus43:
;debug.h,59 :: 		if( Sensor6 == 1){
	BTFSS       PORTD+0, 7 
	GOTO        L_sendSensorStatus45
;debug.h,60 :: 		debugText = "1";
	MOVLW       ?lstr13_Main_324.0V+0
	MOVWF       _debugText+0 
	MOVLW       hi_addr(?lstr13_Main_324.0V+0)
	MOVWF       _debugText+1 
;debug.h,61 :: 		UART1_Write_Text(debugText);
	MOVF        _debugText+0, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVF        _debugText+1, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;debug.h,62 :: 		}
	GOTO        L_sendSensorStatus46
L_sendSensorStatus45:
;debug.h,63 :: 		else if( Sensor6 == 0){
	BTFSC       PORTD+0, 7 
	GOTO        L_sendSensorStatus47
;debug.h,64 :: 		debugText = "0";
	MOVLW       ?lstr14_Main_324.0V+0
	MOVWF       _debugText+0 
	MOVLW       hi_addr(?lstr14_Main_324.0V+0)
	MOVWF       _debugText+1 
;debug.h,65 :: 		UART1_Write_Text(debugText);
	MOVF        _debugText+0, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVF        _debugText+1, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;debug.h,66 :: 		}
L_sendSensorStatus47:
L_sendSensorStatus46:
;debug.h,68 :: 		if( Sensor7 == 1){
	BTFSS       PORTB+0, 2 
	GOTO        L_sendSensorStatus48
;debug.h,69 :: 		debugText = "1";
	MOVLW       ?lstr15_Main_324.0V+0
	MOVWF       _debugText+0 
	MOVLW       hi_addr(?lstr15_Main_324.0V+0)
	MOVWF       _debugText+1 
;debug.h,70 :: 		UART1_Write_Text(debugText);
	MOVF        _debugText+0, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVF        _debugText+1, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;debug.h,71 :: 		}
	GOTO        L_sendSensorStatus49
L_sendSensorStatus48:
;debug.h,72 :: 		else if( Sensor7 == 0){
	BTFSC       PORTB+0, 2 
	GOTO        L_sendSensorStatus50
;debug.h,73 :: 		debugText = "0";
	MOVLW       ?lstr16_Main_324.0V+0
	MOVWF       _debugText+0 
	MOVLW       hi_addr(?lstr16_Main_324.0V+0)
	MOVWF       _debugText+1 
;debug.h,74 :: 		UART1_Write_Text(debugText);
	MOVF        _debugText+0, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVF        _debugText+1, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;debug.h,75 :: 		}
L_sendSensorStatus50:
L_sendSensorStatus49:
;debug.h,77 :: 		if( Sensor8 == 1){
	BTFSS       PORTB+0, 6 
	GOTO        L_sendSensorStatus51
;debug.h,78 :: 		debugText = "1";
	MOVLW       ?lstr17_Main_324.0V+0
	MOVWF       _debugText+0 
	MOVLW       hi_addr(?lstr17_Main_324.0V+0)
	MOVWF       _debugText+1 
;debug.h,79 :: 		UART1_Write_Text(debugText);
	MOVF        _debugText+0, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVF        _debugText+1, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;debug.h,80 :: 		}
	GOTO        L_sendSensorStatus52
L_sendSensorStatus51:
;debug.h,81 :: 		else if( Sensor8 == 0){
	BTFSC       PORTB+0, 6 
	GOTO        L_sendSensorStatus53
;debug.h,82 :: 		debugText = "0";
	MOVLW       ?lstr18_Main_324.0V+0
	MOVWF       _debugText+0 
	MOVLW       hi_addr(?lstr18_Main_324.0V+0)
	MOVWF       _debugText+1 
;debug.h,83 :: 		UART1_Write_Text(debugText);
	MOVF        _debugText+0, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVF        _debugText+1, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;debug.h,84 :: 		}
L_sendSensorStatus53:
L_sendSensorStatus52:
;debug.h,86 :: 		if( Sensor9 == 1){
	BTFSS       PORTB+0, 7 
	GOTO        L_sendSensorStatus54
;debug.h,87 :: 		debugText = "1";
	MOVLW       ?lstr19_Main_324.0V+0
	MOVWF       _debugText+0 
	MOVLW       hi_addr(?lstr19_Main_324.0V+0)
	MOVWF       _debugText+1 
;debug.h,88 :: 		UART1_Write_Text(debugText);
	MOVF        _debugText+0, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVF        _debugText+1, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;debug.h,89 :: 		}
	GOTO        L_sendSensorStatus55
L_sendSensorStatus54:
;debug.h,90 :: 		else if( Sensor9 == 0){
	BTFSC       PORTB+0, 7 
	GOTO        L_sendSensorStatus56
;debug.h,91 :: 		debugText = "0";
	MOVLW       ?lstr20_Main_324.0V+0
	MOVWF       _debugText+0 
	MOVLW       hi_addr(?lstr20_Main_324.0V+0)
	MOVWF       _debugText+1 
;debug.h,92 :: 		UART1_Write_Text(debugText);
	MOVF        _debugText+0, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVF        _debugText+1, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;debug.h,93 :: 		}
L_sendSensorStatus56:
L_sendSensorStatus55:
;debug.h,95 :: 		if( Scout == 1){
	BTFSS       PORTB+0, 5 
	GOTO        L_sendSensorStatus57
;debug.h,96 :: 		debugText = " 1; ";
	MOVLW       ?lstr21_Main_324.0V+0
	MOVWF       _debugText+0 
	MOVLW       hi_addr(?lstr21_Main_324.0V+0)
	MOVWF       _debugText+1 
;debug.h,97 :: 		UART1_Write_Text(debugText);
	MOVF        _debugText+0, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVF        _debugText+1, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;debug.h,98 :: 		}
	GOTO        L_sendSensorStatus58
L_sendSensorStatus57:
;debug.h,99 :: 		else if( Scout == 0){
	BTFSC       PORTB+0, 5 
	GOTO        L_sendSensorStatus59
;debug.h,100 :: 		debugText = " 0; ";
	MOVLW       ?lstr22_Main_324.0V+0
	MOVWF       _debugText+0 
	MOVLW       hi_addr(?lstr22_Main_324.0V+0)
	MOVWF       _debugText+1 
;debug.h,101 :: 		UART1_Write_Text(debugText);
	MOVF        _debugText+0, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVF        _debugText+1, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;debug.h,102 :: 		}
L_sendSensorStatus59:
L_sendSensorStatus58:
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
	MOVLW       ?lstr23_Main_324.0V+0
	MOVWF       _debugText+0 
	MOVLW       hi_addr(?lstr23_Main_324.0V+0)
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
L_testPIC60:
	DECFSZ      R13, 1, 0
	BRA         L_testPIC60
	DECFSZ      R12, 1, 0
	BRA         L_testPIC60
	DECFSZ      R11, 1, 0
	BRA         L_testPIC60
	NOP
	NOP
;debug.h,115 :: 		motorRight_foward(255);
	MOVLW       255
	MOVWF       FARG_motorRight_foward_pwm+0 
	MOVLW       0
	MOVWF       FARG_motorRight_foward_pwm+1 
	CALL        _motorRight_foward+0, 0
;debug.h,116 :: 		debugText = "turn Left";
	MOVLW       ?lstr24_Main_324.0V+0
	MOVWF       _debugText+0 
	MOVLW       hi_addr(?lstr24_Main_324.0V+0)
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
L_testPIC61:
	DECFSZ      R13, 1, 0
	BRA         L_testPIC61
	DECFSZ      R12, 1, 0
	BRA         L_testPIC61
	DECFSZ      R11, 1, 0
	BRA         L_testPIC61
	NOP
	NOP
;debug.h,121 :: 		motorLeft_foward(255);
	MOVLW       255
	MOVWF       FARG_motorLeft_foward_pwm+0 
	MOVLW       0
	MOVWF       FARG_motorLeft_foward_pwm+1 
	CALL        _motorLeft_foward+0, 0
;debug.h,122 :: 		debugText = "turn Right";
	MOVLW       ?lstr25_Main_324.0V+0
	MOVWF       _debugText+0 
	MOVLW       hi_addr(?lstr25_Main_324.0V+0)
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
L_testPIC62:
	DECFSZ      R13, 1, 0
	BRA         L_testPIC62
	DECFSZ      R12, 1, 0
	BRA         L_testPIC62
	DECFSZ      R11, 1, 0
	BRA         L_testPIC62
	NOP
	NOP
;debug.h,127 :: 		stop();
	CALL        _stop+0, 0
;debug.h,128 :: 		debugText = "Stopping..   ";
	MOVLW       ?lstr26_Main_324.0V+0
	MOVWF       _debugText+0 
	MOVLW       hi_addr(?lstr26_Main_324.0V+0)
	MOVWF       _debugText+1 
;debug.h,129 :: 		UART1_Write_Text(debugText);
	MOVF        _debugText+0, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVF        _debugText+1, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;debug.h,131 :: 		debugText = "Decrease PWM..   ";
	MOVLW       ?lstr27_Main_324.0V+0
	MOVWF       _debugText+0 
	MOVLW       hi_addr(?lstr27_Main_324.0V+0)
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
L_testPIC63:
	MOVLW       128
	MOVWF       R0 
	MOVLW       128
	XORWF       _count+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__testPIC738
	MOVF        _count+0, 0 
	SUBLW       0
L__testPIC738:
	BTFSC       STATUS+0, 0 
	GOTO        L_testPIC64
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
L_testPIC66:
	DECFSZ      R13, 1, 0
	BRA         L_testPIC66
	DECFSZ      R12, 1, 0
	BRA         L_testPIC66
	DECFSZ      R11, 1, 0
	BRA         L_testPIC66
	NOP
	NOP
;debug.h,134 :: 		for( count=255; count>0; count--){
	MOVLW       1
	SUBWF       _count+0, 1 
	MOVLW       0
	SUBWFB      _count+1, 1 
;debug.h,139 :: 		}
	GOTO        L_testPIC63
L_testPIC64:
;debug.h,140 :: 		}
	RETURN      0
; end of _testPIC

_lineFollow:

;linefollow.h,14 :: 		void lineFollow(){
;linefollow.h,16 :: 		while(1){
L_lineFollow67:
;linefollow.h,17 :: 		if( (Sensor3==1 || Sensor4==1 || Sensor5==1 || Sensor6==1 || Sensor7==1) && Sensor1==0 && Sensor2==0 && Sensor8==0 && Sensor9==0 ){
	BTFSC       PORTD+0, 4 
	GOTO        L__lineFollow618
	BTFSC       PORTD+0, 5 
	GOTO        L__lineFollow618
	BTFSC       PORTD+0, 6 
	GOTO        L__lineFollow618
	BTFSC       PORTD+0, 7 
	GOTO        L__lineFollow618
	BTFSC       PORTB+0, 2 
	GOTO        L__lineFollow618
	GOTO        L_lineFollow73
L__lineFollow618:
	BTFSC       PORTB+0, 4 
	GOTO        L_lineFollow73
	BTFSC       PORTB+0, 3 
	GOTO        L_lineFollow73
	BTFSC       PORTB+0, 6 
	GOTO        L_lineFollow73
	BTFSC       PORTB+0, 7 
	GOTO        L_lineFollow73
L__lineFollow617:
;linefollow.h,19 :: 		debugText = "Line follow PID..   ";
	MOVLW       ?lstr28_Main_324.0V+0
	MOVWF       _debugText+0 
	MOVLW       hi_addr(?lstr28_Main_324.0V+0)
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
	GOTO        L_lineFollow74
L_lineFollow73:
;linefollow.h,24 :: 		else if( !( Scout==1 && Sensor1==1 && Sensor2==1 && Sensor3==1 && Sensor4==1 && Sensor5==1 && Sensor6==1 && Sensor7==1 && Sensor8==1 && Sensor9==1) || !( Scout==0 && Sensor1==0 && Sensor2==0 && Sensor3==0 && Sensor4==0 && Sensor5==0 && Sensor6==0 && Sensor7==0 && Sensor8==0 && Sensor9==0)){
	BTFSS       PORTB+0, 5 
	GOTO        L_lineFollow76
	BTFSS       PORTB+0, 4 
	GOTO        L_lineFollow76
	BTFSS       PORTB+0, 3 
	GOTO        L_lineFollow76
	BTFSS       PORTD+0, 4 
	GOTO        L_lineFollow76
	BTFSS       PORTD+0, 5 
	GOTO        L_lineFollow76
	BTFSS       PORTD+0, 6 
	GOTO        L_lineFollow76
	BTFSS       PORTD+0, 7 
	GOTO        L_lineFollow76
	BTFSS       PORTB+0, 2 
	GOTO        L_lineFollow76
	BTFSS       PORTB+0, 6 
	GOTO        L_lineFollow76
	BTFSS       PORTB+0, 7 
	GOTO        L_lineFollow76
	MOVLW       1
	MOVWF       R0 
	GOTO        L_lineFollow75
L_lineFollow76:
	CLRF        R0 
L_lineFollow75:
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L__lineFollow616
	BTFSC       PORTB+0, 5 
	GOTO        L_lineFollow78
	BTFSC       PORTB+0, 4 
	GOTO        L_lineFollow78
	BTFSC       PORTB+0, 3 
	GOTO        L_lineFollow78
	BTFSC       PORTD+0, 4 
	GOTO        L_lineFollow78
	BTFSC       PORTD+0, 5 
	GOTO        L_lineFollow78
	BTFSC       PORTD+0, 6 
	GOTO        L_lineFollow78
	BTFSC       PORTD+0, 7 
	GOTO        L_lineFollow78
	BTFSC       PORTB+0, 2 
	GOTO        L_lineFollow78
	BTFSC       PORTB+0, 6 
	GOTO        L_lineFollow78
	BTFSC       PORTB+0, 7 
	GOTO        L_lineFollow78
	MOVLW       1
	MOVWF       R0 
	GOTO        L_lineFollow77
L_lineFollow78:
	CLRF        R0 
L_lineFollow77:
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L__lineFollow616
	GOTO        L_lineFollow81
L__lineFollow616:
;linefollow.h,26 :: 		debugText = "Line follow Normal..   ";
	MOVLW       ?lstr29_Main_324.0V+0
	MOVWF       _debugText+0 
	MOVLW       hi_addr(?lstr29_Main_324.0V+0)
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
	GOTO        L_lineFollow82
L_lineFollow81:
;linefollow.h,31 :: 		else if(( Scout==1 && Sensor1==1 && Sensor2==1 && Sensor3==1 && Sensor4==1 && Sensor5==1 && Sensor6==1 && Sensor7==1 && Sensor8==1 && Sensor9==1) || !( Scout==0 && Sensor1==0 && Sensor2==0 && Sensor3==0 && Sensor4==0 && Sensor5==0 && Sensor6==0 && Sensor7==0 && Sensor8==0 && Sensor9==0)){
	BTFSS       PORTB+0, 5 
	GOTO        L__lineFollow615
	BTFSS       PORTB+0, 4 
	GOTO        L__lineFollow615
	BTFSS       PORTB+0, 3 
	GOTO        L__lineFollow615
	BTFSS       PORTD+0, 4 
	GOTO        L__lineFollow615
	BTFSS       PORTD+0, 5 
	GOTO        L__lineFollow615
	BTFSS       PORTD+0, 6 
	GOTO        L__lineFollow615
	BTFSS       PORTD+0, 7 
	GOTO        L__lineFollow615
	BTFSS       PORTB+0, 2 
	GOTO        L__lineFollow615
	BTFSS       PORTB+0, 6 
	GOTO        L__lineFollow615
	BTFSS       PORTB+0, 7 
	GOTO        L__lineFollow615
	GOTO        L__lineFollow614
L__lineFollow615:
	BTFSC       PORTB+0, 5 
	GOTO        L_lineFollow86
	BTFSC       PORTB+0, 4 
	GOTO        L_lineFollow86
	BTFSC       PORTB+0, 3 
	GOTO        L_lineFollow86
	BTFSC       PORTD+0, 4 
	GOTO        L_lineFollow86
	BTFSC       PORTD+0, 5 
	GOTO        L_lineFollow86
	BTFSC       PORTD+0, 6 
	GOTO        L_lineFollow86
	BTFSC       PORTD+0, 7 
	GOTO        L_lineFollow86
	BTFSC       PORTB+0, 2 
	GOTO        L_lineFollow86
	BTFSC       PORTB+0, 6 
	GOTO        L_lineFollow86
	BTFSC       PORTB+0, 7 
	GOTO        L_lineFollow86
	MOVLW       1
	MOVWF       R0 
	GOTO        L_lineFollow85
L_lineFollow86:
	CLRF        R0 
L_lineFollow85:
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L__lineFollow614
	GOTO        L_lineFollow89
L__lineFollow614:
;linefollow.h,33 :: 		stop();
	CALL        _stop+0, 0
;linefollow.h,34 :: 		sendSensorStatus();
	CALL        _sendSensorStatus+0, 0
;linefollow.h,36 :: 		}
L_lineFollow89:
L_lineFollow82:
L_lineFollow74:
;linefollow.h,37 :: 		}
	GOTO        L_lineFollow67
;linefollow.h,38 :: 		}
	RETURN      0
; end of _lineFollow

_lineFollowNormal:

;linefollow.h,40 :: 		void lineFollowNormal(){
;linefollow.h,41 :: 		while(1){              //!((Sensor3==1 || Sensor4==1 || Sensor5==1 || Sensor6==1 || Sensor7==1) && Sensor1==0 && Sensor2==0 && Sensor8==0 && Sensor9==0)
L_lineFollowNormal90:
;linefollow.h,42 :: 		if( Scout==1 && Sensor1==1 && Sensor2==1 && Sensor3==1 && Sensor4==1 && Sensor5==1 && Sensor6==1 && Sensor7==1 && Sensor8==1 && Sensor9==1){
	BTFSS       PORTB+0, 5 
	GOTO        L_lineFollowNormal94
	BTFSS       PORTB+0, 4 
	GOTO        L_lineFollowNormal94
	BTFSS       PORTB+0, 3 
	GOTO        L_lineFollowNormal94
	BTFSS       PORTD+0, 4 
	GOTO        L_lineFollowNormal94
	BTFSS       PORTD+0, 5 
	GOTO        L_lineFollowNormal94
	BTFSS       PORTD+0, 6 
	GOTO        L_lineFollowNormal94
	BTFSS       PORTD+0, 7 
	GOTO        L_lineFollowNormal94
	BTFSS       PORTB+0, 2 
	GOTO        L_lineFollowNormal94
	BTFSS       PORTB+0, 6 
	GOTO        L_lineFollowNormal94
	BTFSS       PORTB+0, 7 
	GOTO        L_lineFollowNormal94
L__lineFollowNormal631:
;linefollow.h,43 :: 		stop();
	CALL        _stop+0, 0
;linefollow.h,44 :: 		}
	GOTO        L_lineFollowNormal95
L_lineFollowNormal94:
;linefollow.h,45 :: 		else if( (Scout==0 && Sensor1==0 && Sensor2==0 && Sensor3==0 && Sensor4==1 && Sensor5==1 && Sensor6==1 && Sensor7==1 && Sensor8==1 && Sensor9==1) || (Scout==0 && Sensor1==0 && Sensor2==0 && Sensor3==0 && Sensor4==0 && Sensor5==1 && Sensor6==1 && Sensor7==1 && Sensor8==1 && Sensor9==1)){
	BTFSC       PORTB+0, 5 
	GOTO        L__lineFollowNormal630
	BTFSC       PORTB+0, 4 
	GOTO        L__lineFollowNormal630
	BTFSC       PORTB+0, 3 
	GOTO        L__lineFollowNormal630
	BTFSC       PORTD+0, 4 
	GOTO        L__lineFollowNormal630
	BTFSS       PORTD+0, 5 
	GOTO        L__lineFollowNormal630
	BTFSS       PORTD+0, 6 
	GOTO        L__lineFollowNormal630
	BTFSS       PORTD+0, 7 
	GOTO        L__lineFollowNormal630
	BTFSS       PORTB+0, 2 
	GOTO        L__lineFollowNormal630
	BTFSS       PORTB+0, 6 
	GOTO        L__lineFollowNormal630
	BTFSS       PORTB+0, 7 
	GOTO        L__lineFollowNormal630
	GOTO        L__lineFollowNormal628
L__lineFollowNormal630:
	BTFSC       PORTB+0, 5 
	GOTO        L__lineFollowNormal629
	BTFSC       PORTB+0, 4 
	GOTO        L__lineFollowNormal629
	BTFSC       PORTB+0, 3 
	GOTO        L__lineFollowNormal629
	BTFSC       PORTD+0, 4 
	GOTO        L__lineFollowNormal629
	BTFSC       PORTD+0, 5 
	GOTO        L__lineFollowNormal629
	BTFSS       PORTD+0, 6 
	GOTO        L__lineFollowNormal629
	BTFSS       PORTD+0, 7 
	GOTO        L__lineFollowNormal629
	BTFSS       PORTB+0, 2 
	GOTO        L__lineFollowNormal629
	BTFSS       PORTB+0, 6 
	GOTO        L__lineFollowNormal629
	BTFSS       PORTB+0, 7 
	GOTO        L__lineFollowNormal629
	GOTO        L__lineFollowNormal628
L__lineFollowNormal629:
	GOTO        L_lineFollowNormal102
L__lineFollowNormal628:
;linefollow.h,47 :: 		debugText = "90 to right..   ";
	MOVLW       ?lstr30_Main_324.0V+0
	MOVWF       _debugText+0 
	MOVLW       hi_addr(?lstr30_Main_324.0V+0)
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
L_lineFollowNormal103:
	BTFSC       PORTB+0, 5 
	GOTO        L_lineFollowNormal104
;linefollow.h,51 :: 		rotateClockwise(TEST_RPM);
	MOVF        _TEST_RPM+0, 0 
	MOVWF       FARG_rotateClockwise_pwm+0 
	MOVF        _TEST_RPM+1, 0 
	MOVWF       FARG_rotateClockwise_pwm+1 
	CALL        _rotateClockwise+0, 0
;linefollow.h,52 :: 		}
	GOTO        L_lineFollowNormal103
L_lineFollowNormal104:
;linefollow.h,53 :: 		}
	GOTO        L_lineFollowNormal105
L_lineFollowNormal102:
;linefollow.h,54 :: 		else if( (Scout==0 && Sensor1==1 && Sensor2==1 && Sensor3==1 && Sensor4==1 && Sensor5==1 && Sensor6==0 && Sensor7==0 && Sensor8==0 && Sensor9==0) && (Scout==0 && Sensor1==1 && Sensor2==1 && Sensor3==1 && Sensor4==1 && Sensor5==0 && Sensor6==0 && Sensor7==0 && Sensor8==0 && Sensor9==0)){
	BTFSC       PORTB+0, 5 
	GOTO        L_lineFollowNormal112
	BTFSS       PORTB+0, 4 
	GOTO        L_lineFollowNormal112
	BTFSS       PORTB+0, 3 
	GOTO        L_lineFollowNormal112
	BTFSS       PORTD+0, 4 
	GOTO        L_lineFollowNormal112
	BTFSS       PORTD+0, 5 
	GOTO        L_lineFollowNormal112
	BTFSS       PORTD+0, 6 
	GOTO        L_lineFollowNormal112
	BTFSC       PORTD+0, 7 
	GOTO        L_lineFollowNormal112
	BTFSC       PORTB+0, 2 
	GOTO        L_lineFollowNormal112
	BTFSC       PORTB+0, 6 
	GOTO        L_lineFollowNormal112
	BTFSC       PORTB+0, 7 
	GOTO        L_lineFollowNormal112
L__lineFollowNormal627:
	BTFSC       PORTB+0, 5 
	GOTO        L_lineFollowNormal112
	BTFSS       PORTB+0, 4 
	GOTO        L_lineFollowNormal112
	BTFSS       PORTB+0, 3 
	GOTO        L_lineFollowNormal112
	BTFSS       PORTD+0, 4 
	GOTO        L_lineFollowNormal112
	BTFSS       PORTD+0, 5 
	GOTO        L_lineFollowNormal112
	BTFSC       PORTD+0, 6 
	GOTO        L_lineFollowNormal112
	BTFSC       PORTD+0, 7 
	GOTO        L_lineFollowNormal112
	BTFSC       PORTB+0, 2 
	GOTO        L_lineFollowNormal112
	BTFSC       PORTB+0, 6 
	GOTO        L_lineFollowNormal112
	BTFSC       PORTB+0, 7 
	GOTO        L_lineFollowNormal112
L__lineFollowNormal626:
L__lineFollowNormal625:
;linefollow.h,56 :: 		debugText = "90 to left..   ";
	MOVLW       ?lstr31_Main_324.0V+0
	MOVWF       _debugText+0 
	MOVLW       hi_addr(?lstr31_Main_324.0V+0)
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
L_lineFollowNormal113:
	BTFSC       PORTB+0, 5 
	GOTO        L_lineFollowNormal114
;linefollow.h,60 :: 		rotateAntiClockwise(TEST_RPM);
	MOVF        _TEST_RPM+0, 0 
	MOVWF       FARG_rotateAntiClockwise_pwm+0 
	MOVF        _TEST_RPM+1, 0 
	MOVWF       FARG_rotateAntiClockwise_pwm+1 
	CALL        _rotateAntiClockwise+0, 0
;linefollow.h,61 :: 		}
	GOTO        L_lineFollowNormal113
L_lineFollowNormal114:
;linefollow.h,62 :: 		}
	GOTO        L_lineFollowNormal115
L_lineFollowNormal112:
;linefollow.h,63 :: 		else if( Sensor4==1 && Sensor5==1){
	BTFSS       PORTD+0, 5 
	GOTO        L_lineFollowNormal118
	BTFSS       PORTD+0, 6 
	GOTO        L_lineFollowNormal118
L__lineFollowNormal624:
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
	GOTO        L_lineFollowNormal119
L_lineFollowNormal118:
;linefollow.h,67 :: 		else if( Sensor4==1 && Sensor5==0 && Scout==1){
	BTFSS       PORTD+0, 5 
	GOTO        L_lineFollowNormal122
	BTFSC       PORTD+0, 6 
	GOTO        L_lineFollowNormal122
	BTFSS       PORTB+0, 5 
	GOTO        L_lineFollowNormal122
L__lineFollowNormal623:
;linefollow.h,69 :: 		turnLeft(TEST_RPM);
	MOVF        _TEST_RPM+0, 0 
	MOVWF       FARG_turnLeft_pwmRight+0 
	MOVF        _TEST_RPM+1, 0 
	MOVWF       FARG_turnLeft_pwmRight+1 
	CALL        _turnLeft+0, 0
;linefollow.h,70 :: 		}
	GOTO        L_lineFollowNormal123
L_lineFollowNormal122:
;linefollow.h,71 :: 		else if( Sensor4==0 && Sensor5==1 && Scout==1){
	BTFSC       PORTD+0, 5 
	GOTO        L_lineFollowNormal126
	BTFSS       PORTD+0, 6 
	GOTO        L_lineFollowNormal126
	BTFSS       PORTB+0, 5 
	GOTO        L_lineFollowNormal126
L__lineFollowNormal622:
;linefollow.h,73 :: 		turnRight(TEST_RPM);
	MOVF        _TEST_RPM+0, 0 
	MOVWF       FARG_turnRight_pwmLeft+0 
	MOVF        _TEST_RPM+1, 0 
	MOVWF       FARG_turnRight_pwmLeft+1 
	CALL        _turnRight+0, 0
;linefollow.h,74 :: 		}
	GOTO        L_lineFollowNormal127
L_lineFollowNormal126:
;linefollow.h,75 :: 		else if( Sensor4==1 && Sensor5==0 && Scout==0){
	BTFSS       PORTD+0, 5 
	GOTO        L_lineFollowNormal130
	BTFSC       PORTD+0, 6 
	GOTO        L_lineFollowNormal130
	BTFSC       PORTB+0, 5 
	GOTO        L_lineFollowNormal130
L__lineFollowNormal621:
;linefollow.h,77 :: 		stop();
	CALL        _stop+0, 0
;linefollow.h,79 :: 		rotateAntiClockwise(TEST_RPM);
	MOVF        _TEST_RPM+0, 0 
	MOVWF       FARG_rotateAntiClockwise_pwm+0 
	MOVF        _TEST_RPM+1, 0 
	MOVWF       FARG_rotateAntiClockwise_pwm+1 
	CALL        _rotateAntiClockwise+0, 0
;linefollow.h,80 :: 		}
	GOTO        L_lineFollowNormal131
L_lineFollowNormal130:
;linefollow.h,81 :: 		else if( Sensor4==0 && Sensor5==1 && Scout==0){
	BTFSC       PORTD+0, 5 
	GOTO        L_lineFollowNormal134
	BTFSS       PORTD+0, 6 
	GOTO        L_lineFollowNormal134
	BTFSC       PORTB+0, 5 
	GOTO        L_lineFollowNormal134
L__lineFollowNormal620:
;linefollow.h,83 :: 		stop();
	CALL        _stop+0, 0
;linefollow.h,85 :: 		rotateClockwise(TEST_RPM);
	MOVF        _TEST_RPM+0, 0 
	MOVWF       FARG_rotateClockwise_pwm+0 
	MOVF        _TEST_RPM+1, 0 
	MOVWF       FARG_rotateClockwise_pwm+1 
	CALL        _rotateClockwise+0, 0
;linefollow.h,86 :: 		}
	GOTO        L_lineFollowNormal135
L_lineFollowNormal134:
;linefollow.h,87 :: 		else if( Sensor4==0 && Sensor5==0 ){
	BTFSC       PORTD+0, 5 
	GOTO        L_lineFollowNormal138
	BTFSC       PORTD+0, 6 
	GOTO        L_lineFollowNormal138
L__lineFollowNormal619:
;linefollow.h,88 :: 		if(Sensor3 ==1){
	BTFSS       PORTD+0, 4 
	GOTO        L_lineFollowNormal139
;linefollow.h,89 :: 		rotateAntiClockwise(TEST_RPM);
	MOVF        _TEST_RPM+0, 0 
	MOVWF       FARG_rotateAntiClockwise_pwm+0 
	MOVF        _TEST_RPM+1, 0 
	MOVWF       FARG_rotateAntiClockwise_pwm+1 
	CALL        _rotateAntiClockwise+0, 0
;linefollow.h,90 :: 		}
	GOTO        L_lineFollowNormal140
L_lineFollowNormal139:
;linefollow.h,91 :: 		else if(Sensor6 ==1){
	BTFSS       PORTD+0, 7 
	GOTO        L_lineFollowNormal141
;linefollow.h,92 :: 		rotateClockwise(TEST_RPM);
	MOVF        _TEST_RPM+0, 0 
	MOVWF       FARG_rotateClockwise_pwm+0 
	MOVF        _TEST_RPM+1, 0 
	MOVWF       FARG_rotateClockwise_pwm+1 
	CALL        _rotateClockwise+0, 0
;linefollow.h,93 :: 		}
	GOTO        L_lineFollowNormal142
L_lineFollowNormal141:
;linefollow.h,94 :: 		else if(Sensor2 ==1){
	BTFSS       PORTB+0, 3 
	GOTO        L_lineFollowNormal143
;linefollow.h,95 :: 		rotateAntiClockwise(TEST_RPM);
	MOVF        _TEST_RPM+0, 0 
	MOVWF       FARG_rotateAntiClockwise_pwm+0 
	MOVF        _TEST_RPM+1, 0 
	MOVWF       FARG_rotateAntiClockwise_pwm+1 
	CALL        _rotateAntiClockwise+0, 0
;linefollow.h,96 :: 		}
	GOTO        L_lineFollowNormal144
L_lineFollowNormal143:
;linefollow.h,97 :: 		else if(Sensor7 ==1){
	BTFSS       PORTB+0, 2 
	GOTO        L_lineFollowNormal145
;linefollow.h,98 :: 		rotateClockwise(TEST_RPM);
	MOVF        _TEST_RPM+0, 0 
	MOVWF       FARG_rotateClockwise_pwm+0 
	MOVF        _TEST_RPM+1, 0 
	MOVWF       FARG_rotateClockwise_pwm+1 
	CALL        _rotateClockwise+0, 0
;linefollow.h,99 :: 		}
	GOTO        L_lineFollowNormal146
L_lineFollowNormal145:
;linefollow.h,102 :: 		stop();
	CALL        _stop+0, 0
;linefollow.h,105 :: 		}
L_lineFollowNormal146:
L_lineFollowNormal144:
L_lineFollowNormal142:
L_lineFollowNormal140:
;linefollow.h,106 :: 		}
L_lineFollowNormal138:
L_lineFollowNormal135:
L_lineFollowNormal131:
L_lineFollowNormal127:
L_lineFollowNormal123:
L_lineFollowNormal119:
L_lineFollowNormal115:
L_lineFollowNormal105:
L_lineFollowNormal95:
;linefollow.h,108 :: 		}
	GOTO        L_lineFollowNormal90
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
	GOTO        L__lineFollowPID649
	BTFSC       PORTB+0, 4 
	GOTO        L__lineFollowPID649
	BTFSC       PORTB+0, 3 
	GOTO        L__lineFollowPID649
	BTFSC       PORTD+0, 4 
	GOTO        L__lineFollowPID649
	BTFSS       PORTD+0, 5 
	GOTO        L__lineFollowPID649
	BTFSS       PORTD+0, 6 
	GOTO        L__lineFollowPID649
	BTFSS       PORTD+0, 7 
	GOTO        L__lineFollowPID649
	BTFSS       PORTB+0, 2 
	GOTO        L__lineFollowPID649
	BTFSS       PORTB+0, 6 
	GOTO        L__lineFollowPID649
	BTFSS       PORTB+0, 7 
	GOTO        L__lineFollowPID649
	GOTO        L__lineFollowPID647
L__lineFollowPID649:
	BTFSC       PORTB+0, 5 
	GOTO        L__lineFollowPID648
	BTFSC       PORTB+0, 4 
	GOTO        L__lineFollowPID648
	BTFSC       PORTB+0, 3 
	GOTO        L__lineFollowPID648
	BTFSC       PORTD+0, 4 
	GOTO        L__lineFollowPID648
	BTFSC       PORTD+0, 5 
	GOTO        L__lineFollowPID648
	BTFSS       PORTD+0, 6 
	GOTO        L__lineFollowPID648
	BTFSS       PORTD+0, 7 
	GOTO        L__lineFollowPID648
	BTFSS       PORTB+0, 2 
	GOTO        L__lineFollowPID648
	BTFSS       PORTB+0, 6 
	GOTO        L__lineFollowPID648
	BTFSS       PORTB+0, 7 
	GOTO        L__lineFollowPID648
	GOTO        L__lineFollowPID647
L__lineFollowPID648:
	GOTO        L_lineFollowPID153
L__lineFollowPID647:
;linefollow.h,136 :: 		debugText = "90 to right..   ";
	MOVLW       ?lstr32_Main_324.0V+0
	MOVWF       _debugText+0 
	MOVLW       hi_addr(?lstr32_Main_324.0V+0)
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
L_lineFollowPID154:
	BTFSC       PORTB+0, 5 
	GOTO        L_lineFollowPID155
;linefollow.h,140 :: 		rotateClockwise(TEST_RPM);
	MOVF        _TEST_RPM+0, 0 
	MOVWF       FARG_rotateClockwise_pwm+0 
	MOVF        _TEST_RPM+1, 0 
	MOVWF       FARG_rotateClockwise_pwm+1 
	CALL        _rotateClockwise+0, 0
;linefollow.h,141 :: 		}
	GOTO        L_lineFollowPID154
L_lineFollowPID155:
;linefollow.h,142 :: 		}
	GOTO        L_lineFollowPID156
L_lineFollowPID153:
;linefollow.h,143 :: 		else if( (Scout==0 && Sensor1==1 && Sensor2==1 && Sensor3==1 && Sensor4==1 && Sensor7==0 && Sensor8==0 && Sensor9==0) && (Scout==0 && Sensor1==1 && Sensor2==1 && Sensor3==1 && Sensor4==1 && Sensor7==0 && Sensor8==0 && Sensor9==0)){
	BTFSC       PORTB+0, 5 
	GOTO        L_lineFollowPID163
	BTFSS       PORTB+0, 4 
	GOTO        L_lineFollowPID163
	BTFSS       PORTB+0, 3 
	GOTO        L_lineFollowPID163
	BTFSS       PORTD+0, 4 
	GOTO        L_lineFollowPID163
	BTFSS       PORTD+0, 5 
	GOTO        L_lineFollowPID163
	BTFSC       PORTB+0, 2 
	GOTO        L_lineFollowPID163
	BTFSC       PORTB+0, 6 
	GOTO        L_lineFollowPID163
	BTFSC       PORTB+0, 7 
	GOTO        L_lineFollowPID163
L__lineFollowPID646:
	BTFSC       PORTB+0, 5 
	GOTO        L_lineFollowPID163
	BTFSS       PORTB+0, 4 
	GOTO        L_lineFollowPID163
	BTFSS       PORTB+0, 3 
	GOTO        L_lineFollowPID163
	BTFSS       PORTD+0, 4 
	GOTO        L_lineFollowPID163
	BTFSS       PORTD+0, 5 
	GOTO        L_lineFollowPID163
	BTFSC       PORTB+0, 2 
	GOTO        L_lineFollowPID163
	BTFSC       PORTB+0, 6 
	GOTO        L_lineFollowPID163
	BTFSC       PORTB+0, 7 
	GOTO        L_lineFollowPID163
L__lineFollowPID645:
L__lineFollowPID644:
;linefollow.h,145 :: 		debugText = "90 to left..   ";
	MOVLW       ?lstr33_Main_324.0V+0
	MOVWF       _debugText+0 
	MOVLW       hi_addr(?lstr33_Main_324.0V+0)
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
L_lineFollowPID164:
	BTFSC       PORTB+0, 5 
	GOTO        L_lineFollowPID165
;linefollow.h,149 :: 		rotateAntiClockwise(TEST_RPM);
	MOVF        _TEST_RPM+0, 0 
	MOVWF       FARG_rotateAntiClockwise_pwm+0 
	MOVF        _TEST_RPM+1, 0 
	MOVWF       FARG_rotateAntiClockwise_pwm+1 
	CALL        _rotateAntiClockwise+0, 0
;linefollow.h,150 :: 		}
	GOTO        L_lineFollowPID164
L_lineFollowPID165:
;linefollow.h,151 :: 		}
L_lineFollowPID163:
L_lineFollowPID156:
;linefollow.h,154 :: 		if( Sensor3==1 && Sensor4==0 && Sensor5==0 && Sensor6==0 && Sensor7==0)
	BTFSS       PORTD+0, 4 
	GOTO        L_lineFollowPID168
	BTFSC       PORTD+0, 5 
	GOTO        L_lineFollowPID168
	BTFSC       PORTD+0, 6 
	GOTO        L_lineFollowPID168
	BTFSC       PORTD+0, 7 
	GOTO        L_lineFollowPID168
	BTFSC       PORTB+0, 2 
	GOTO        L_lineFollowPID168
L__lineFollowPID643:
;linefollow.h,155 :: 		deviation = 4;
	MOVLW       4
	MOVWF       _deviation+0 
	MOVLW       0
	MOVWF       _deviation+1 
L_lineFollowPID168:
;linefollow.h,156 :: 		if( Sensor3==1 && Sensor4==1 && Sensor5==0 && Sensor6==0 && Sensor7==0)
	BTFSS       PORTD+0, 4 
	GOTO        L_lineFollowPID171
	BTFSS       PORTD+0, 5 
	GOTO        L_lineFollowPID171
	BTFSC       PORTD+0, 6 
	GOTO        L_lineFollowPID171
	BTFSC       PORTD+0, 7 
	GOTO        L_lineFollowPID171
	BTFSC       PORTB+0, 2 
	GOTO        L_lineFollowPID171
L__lineFollowPID642:
;linefollow.h,157 :: 		deviation = 3;
	MOVLW       3
	MOVWF       _deviation+0 
	MOVLW       0
	MOVWF       _deviation+1 
L_lineFollowPID171:
;linefollow.h,158 :: 		if( Sensor3==1 && Sensor4==1 && Sensor5==1 && Sensor6==0 && Sensor7==0)
	BTFSS       PORTD+0, 4 
	GOTO        L_lineFollowPID174
	BTFSS       PORTD+0, 5 
	GOTO        L_lineFollowPID174
	BTFSS       PORTD+0, 6 
	GOTO        L_lineFollowPID174
	BTFSC       PORTD+0, 7 
	GOTO        L_lineFollowPID174
	BTFSC       PORTB+0, 2 
	GOTO        L_lineFollowPID174
L__lineFollowPID641:
;linefollow.h,159 :: 		deviation = 2;
	MOVLW       2
	MOVWF       _deviation+0 
	MOVLW       0
	MOVWF       _deviation+1 
L_lineFollowPID174:
;linefollow.h,160 :: 		if( Sensor3==0 && Sensor4==1 && Sensor5==0 && Sensor6==0 && Sensor7==0)
	BTFSC       PORTD+0, 4 
	GOTO        L_lineFollowPID177
	BTFSS       PORTD+0, 5 
	GOTO        L_lineFollowPID177
	BTFSC       PORTD+0, 6 
	GOTO        L_lineFollowPID177
	BTFSC       PORTD+0, 7 
	GOTO        L_lineFollowPID177
	BTFSC       PORTB+0, 2 
	GOTO        L_lineFollowPID177
L__lineFollowPID640:
;linefollow.h,161 :: 		deviation = 1;
	MOVLW       1
	MOVWF       _deviation+0 
	MOVLW       0
	MOVWF       _deviation+1 
L_lineFollowPID177:
;linefollow.h,163 :: 		if( Sensor3==0 && Sensor4==1 && Sensor5==1 && Sensor6==0 && Sensor7==0)
	BTFSC       PORTD+0, 4 
	GOTO        L_lineFollowPID180
	BTFSS       PORTD+0, 5 
	GOTO        L_lineFollowPID180
	BTFSS       PORTD+0, 6 
	GOTO        L_lineFollowPID180
	BTFSC       PORTD+0, 7 
	GOTO        L_lineFollowPID180
	BTFSC       PORTB+0, 2 
	GOTO        L_lineFollowPID180
L__lineFollowPID639:
;linefollow.h,164 :: 		deviation = 0;
	CLRF        _deviation+0 
	CLRF        _deviation+1 
L_lineFollowPID180:
;linefollow.h,165 :: 		if( Sensor3==0 && Sensor4==1 && Sensor5==1 && Sensor6==1 && Sensor7==0)
	BTFSC       PORTD+0, 4 
	GOTO        L_lineFollowPID183
	BTFSS       PORTD+0, 5 
	GOTO        L_lineFollowPID183
	BTFSS       PORTD+0, 6 
	GOTO        L_lineFollowPID183
	BTFSS       PORTD+0, 7 
	GOTO        L_lineFollowPID183
	BTFSC       PORTB+0, 2 
	GOTO        L_lineFollowPID183
L__lineFollowPID638:
;linefollow.h,166 :: 		deviation = 0;
	CLRF        _deviation+0 
	CLRF        _deviation+1 
L_lineFollowPID183:
;linefollow.h,167 :: 		if( Sensor3==0 && Sensor4==0 && Sensor5==1 && Sensor6==0 && Sensor7==0)
	BTFSC       PORTD+0, 4 
	GOTO        L_lineFollowPID186
	BTFSC       PORTD+0, 5 
	GOTO        L_lineFollowPID186
	BTFSS       PORTD+0, 6 
	GOTO        L_lineFollowPID186
	BTFSC       PORTD+0, 7 
	GOTO        L_lineFollowPID186
	BTFSC       PORTB+0, 2 
	GOTO        L_lineFollowPID186
L__lineFollowPID637:
;linefollow.h,168 :: 		deviation = 0;
	CLRF        _deviation+0 
	CLRF        _deviation+1 
L_lineFollowPID186:
;linefollow.h,169 :: 		if( Sensor3==0 && Sensor4==0 && Sensor5==1 && Sensor6==1 && Sensor7==0)
	BTFSC       PORTD+0, 4 
	GOTO        L_lineFollowPID189
	BTFSC       PORTD+0, 5 
	GOTO        L_lineFollowPID189
	BTFSS       PORTD+0, 6 
	GOTO        L_lineFollowPID189
	BTFSS       PORTD+0, 7 
	GOTO        L_lineFollowPID189
	BTFSC       PORTB+0, 2 
	GOTO        L_lineFollowPID189
L__lineFollowPID636:
;linefollow.h,170 :: 		deviation = 0;
	CLRF        _deviation+0 
	CLRF        _deviation+1 
L_lineFollowPID189:
;linefollow.h,172 :: 		if( Sensor3==0 && Sensor4==0 && Sensor5==0 && Sensor6==1 && Sensor7==0)
	BTFSC       PORTD+0, 4 
	GOTO        L_lineFollowPID192
	BTFSC       PORTD+0, 5 
	GOTO        L_lineFollowPID192
	BTFSC       PORTD+0, 6 
	GOTO        L_lineFollowPID192
	BTFSS       PORTD+0, 7 
	GOTO        L_lineFollowPID192
	BTFSC       PORTB+0, 2 
	GOTO        L_lineFollowPID192
L__lineFollowPID635:
;linefollow.h,173 :: 		deviation = -1;
	MOVLW       255
	MOVWF       _deviation+0 
	MOVLW       255
	MOVWF       _deviation+1 
L_lineFollowPID192:
;linefollow.h,174 :: 		if( Sensor3==0 && Sensor4==0 && Sensor5==1 && Sensor6==1 && Sensor7==1)
	BTFSC       PORTD+0, 4 
	GOTO        L_lineFollowPID195
	BTFSC       PORTD+0, 5 
	GOTO        L_lineFollowPID195
	BTFSS       PORTD+0, 6 
	GOTO        L_lineFollowPID195
	BTFSS       PORTD+0, 7 
	GOTO        L_lineFollowPID195
	BTFSS       PORTB+0, 2 
	GOTO        L_lineFollowPID195
L__lineFollowPID634:
;linefollow.h,175 :: 		deviation = -2;
	MOVLW       254
	MOVWF       _deviation+0 
	MOVLW       255
	MOVWF       _deviation+1 
L_lineFollowPID195:
;linefollow.h,176 :: 		if( Sensor3==0 && Sensor4==0 && Sensor5==0 && Sensor6==1 && Sensor7==1)
	BTFSC       PORTD+0, 4 
	GOTO        L_lineFollowPID198
	BTFSC       PORTD+0, 5 
	GOTO        L_lineFollowPID198
	BTFSC       PORTD+0, 6 
	GOTO        L_lineFollowPID198
	BTFSS       PORTD+0, 7 
	GOTO        L_lineFollowPID198
	BTFSS       PORTB+0, 2 
	GOTO        L_lineFollowPID198
L__lineFollowPID633:
;linefollow.h,177 :: 		deviation = -3;
	MOVLW       253
	MOVWF       _deviation+0 
	MOVLW       255
	MOVWF       _deviation+1 
L_lineFollowPID198:
;linefollow.h,178 :: 		if( Sensor3==0 && Sensor4==0 && Sensor5==0 && Sensor6==0 && Sensor7==1)
	BTFSC       PORTD+0, 4 
	GOTO        L_lineFollowPID201
	BTFSC       PORTD+0, 5 
	GOTO        L_lineFollowPID201
	BTFSC       PORTD+0, 6 
	GOTO        L_lineFollowPID201
	BTFSC       PORTD+0, 7 
	GOTO        L_lineFollowPID201
	BTFSS       PORTB+0, 2 
	GOTO        L_lineFollowPID201
L__lineFollowPID632:
;linefollow.h,179 :: 		deviation = -4;
	MOVLW       252
	MOVWF       _deviation+0 
	MOVLW       255
	MOVWF       _deviation+1 
L_lineFollowPID201:
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
;configuration.h,52 :: 		MID_PWM = 220;
	MOVLW       220
	MOVWF       _MID_PWM+0 
	MOVLW       0
	MOVWF       _MID_PWM+1 
;configuration.h,53 :: 		FAST_PWM = 220;
	MOVLW       220
	MOVWF       _FAST_PWM+0 
	MOVLW       0
	MOVWF       _FAST_PWM+1 
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
	GOTO        L__getDistanceIR_GP2D120739
	MOVLW       98
	SUBWF       FARG_getDistanceIR_GP2D120_ir_value+0, 0 
L__getDistanceIR_GP2D120739:
	BTFSS       STATUS+0, 0 
	GOTO        L_getDistanceIR_GP2D120204
	MOVLW       2
	SUBWF       FARG_getDistanceIR_GP2D120_ir_value+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__getDistanceIR_GP2D120740
	MOVLW       111
	SUBWF       FARG_getDistanceIR_GP2D120_ir_value+0, 0 
L__getDistanceIR_GP2D120740:
	BTFSC       STATUS+0, 0 
	GOTO        L_getDistanceIR_GP2D120204
L__getDistanceIR_GP2D120666:
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
L_getDistanceIR_GP2D120204:
;ir.h,14 :: 		else if( 557<=ir_value && ir_value<610 )
	MOVLW       2
	SUBWF       FARG_getDistanceIR_GP2D120_ir_value+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__getDistanceIR_GP2D120741
	MOVLW       45
	SUBWF       FARG_getDistanceIR_GP2D120_ir_value+0, 0 
L__getDistanceIR_GP2D120741:
	BTFSS       STATUS+0, 0 
	GOTO        L_getDistanceIR_GP2D120208
	MOVLW       2
	SUBWF       FARG_getDistanceIR_GP2D120_ir_value+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__getDistanceIR_GP2D120742
	MOVLW       98
	SUBWF       FARG_getDistanceIR_GP2D120_ir_value+0, 0 
L__getDistanceIR_GP2D120742:
	BTFSC       STATUS+0, 0 
	GOTO        L_getDistanceIR_GP2D120208
L__getDistanceIR_GP2D120665:
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
L_getDistanceIR_GP2D120208:
;ir.h,17 :: 		else if( 481<=ir_value && ir_value<557 )
	MOVLW       1
	SUBWF       FARG_getDistanceIR_GP2D120_ir_value+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__getDistanceIR_GP2D120743
	MOVLW       225
	SUBWF       FARG_getDistanceIR_GP2D120_ir_value+0, 0 
L__getDistanceIR_GP2D120743:
	BTFSS       STATUS+0, 0 
	GOTO        L_getDistanceIR_GP2D120212
	MOVLW       2
	SUBWF       FARG_getDistanceIR_GP2D120_ir_value+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__getDistanceIR_GP2D120744
	MOVLW       45
	SUBWF       FARG_getDistanceIR_GP2D120_ir_value+0, 0 
L__getDistanceIR_GP2D120744:
	BTFSC       STATUS+0, 0 
	GOTO        L_getDistanceIR_GP2D120212
L__getDistanceIR_GP2D120664:
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
L_getDistanceIR_GP2D120212:
;ir.h,20 :: 		else if( 409<=ir_value && ir_value<481 )
	MOVLW       1
	SUBWF       FARG_getDistanceIR_GP2D120_ir_value+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__getDistanceIR_GP2D120745
	MOVLW       153
	SUBWF       FARG_getDistanceIR_GP2D120_ir_value+0, 0 
L__getDistanceIR_GP2D120745:
	BTFSS       STATUS+0, 0 
	GOTO        L_getDistanceIR_GP2D120216
	MOVLW       1
	SUBWF       FARG_getDistanceIR_GP2D120_ir_value+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__getDistanceIR_GP2D120746
	MOVLW       225
	SUBWF       FARG_getDistanceIR_GP2D120_ir_value+0, 0 
L__getDistanceIR_GP2D120746:
	BTFSC       STATUS+0, 0 
	GOTO        L_getDistanceIR_GP2D120216
L__getDistanceIR_GP2D120663:
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
L_getDistanceIR_GP2D120216:
;ir.h,23 :: 		else if( 364<=ir_value && ir_value<409 )
	MOVLW       1
	SUBWF       FARG_getDistanceIR_GP2D120_ir_value+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__getDistanceIR_GP2D120747
	MOVLW       108
	SUBWF       FARG_getDistanceIR_GP2D120_ir_value+0, 0 
L__getDistanceIR_GP2D120747:
	BTFSS       STATUS+0, 0 
	GOTO        L_getDistanceIR_GP2D120220
	MOVLW       1
	SUBWF       FARG_getDistanceIR_GP2D120_ir_value+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__getDistanceIR_GP2D120748
	MOVLW       153
	SUBWF       FARG_getDistanceIR_GP2D120_ir_value+0, 0 
L__getDistanceIR_GP2D120748:
	BTFSC       STATUS+0, 0 
	GOTO        L_getDistanceIR_GP2D120220
L__getDistanceIR_GP2D120662:
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
L_getDistanceIR_GP2D120220:
;ir.h,26 :: 		else if( 317<=ir_value && ir_value<364 )
	MOVLW       1
	SUBWF       FARG_getDistanceIR_GP2D120_ir_value+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__getDistanceIR_GP2D120749
	MOVLW       61
	SUBWF       FARG_getDistanceIR_GP2D120_ir_value+0, 0 
L__getDistanceIR_GP2D120749:
	BTFSS       STATUS+0, 0 
	GOTO        L_getDistanceIR_GP2D120224
	MOVLW       1
	SUBWF       FARG_getDistanceIR_GP2D120_ir_value+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__getDistanceIR_GP2D120750
	MOVLW       108
	SUBWF       FARG_getDistanceIR_GP2D120_ir_value+0, 0 
L__getDistanceIR_GP2D120750:
	BTFSC       STATUS+0, 0 
	GOTO        L_getDistanceIR_GP2D120224
L__getDistanceIR_GP2D120661:
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
L_getDistanceIR_GP2D120224:
;ir.h,29 :: 		else if( 286<=ir_value && ir_value<317 )
	MOVLW       1
	SUBWF       FARG_getDistanceIR_GP2D120_ir_value+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__getDistanceIR_GP2D120751
	MOVLW       30
	SUBWF       FARG_getDistanceIR_GP2D120_ir_value+0, 0 
L__getDistanceIR_GP2D120751:
	BTFSS       STATUS+0, 0 
	GOTO        L_getDistanceIR_GP2D120228
	MOVLW       1
	SUBWF       FARG_getDistanceIR_GP2D120_ir_value+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__getDistanceIR_GP2D120752
	MOVLW       61
	SUBWF       FARG_getDistanceIR_GP2D120_ir_value+0, 0 
L__getDistanceIR_GP2D120752:
	BTFSC       STATUS+0, 0 
	GOTO        L_getDistanceIR_GP2D120228
L__getDistanceIR_GP2D120660:
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
L_getDistanceIR_GP2D120228:
;ir.h,32 :: 		else if( 256<=ir_value && ir_value<286 )
	MOVLW       1
	SUBWF       FARG_getDistanceIR_GP2D120_ir_value+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__getDistanceIR_GP2D120753
	MOVLW       0
	SUBWF       FARG_getDistanceIR_GP2D120_ir_value+0, 0 
L__getDistanceIR_GP2D120753:
	BTFSS       STATUS+0, 0 
	GOTO        L_getDistanceIR_GP2D120232
	MOVLW       1
	SUBWF       FARG_getDistanceIR_GP2D120_ir_value+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__getDistanceIR_GP2D120754
	MOVLW       30
	SUBWF       FARG_getDistanceIR_GP2D120_ir_value+0, 0 
L__getDistanceIR_GP2D120754:
	BTFSC       STATUS+0, 0 
	GOTO        L_getDistanceIR_GP2D120232
L__getDistanceIR_GP2D120659:
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
L_getDistanceIR_GP2D120232:
;ir.h,35 :: 		else if( 215<=ir_value && ir_value<256 )
	MOVLW       0
	SUBWF       FARG_getDistanceIR_GP2D120_ir_value+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__getDistanceIR_GP2D120755
	MOVLW       215
	SUBWF       FARG_getDistanceIR_GP2D120_ir_value+0, 0 
L__getDistanceIR_GP2D120755:
	BTFSS       STATUS+0, 0 
	GOTO        L_getDistanceIR_GP2D120236
	MOVLW       1
	SUBWF       FARG_getDistanceIR_GP2D120_ir_value+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__getDistanceIR_GP2D120756
	MOVLW       0
	SUBWF       FARG_getDistanceIR_GP2D120_ir_value+0, 0 
L__getDistanceIR_GP2D120756:
	BTFSC       STATUS+0, 0 
	GOTO        L_getDistanceIR_GP2D120236
L__getDistanceIR_GP2D120658:
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
L_getDistanceIR_GP2D120236:
;ir.h,38 :: 		else if( 186<=ir_value && ir_value<215 )
	MOVLW       0
	SUBWF       FARG_getDistanceIR_GP2D120_ir_value+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__getDistanceIR_GP2D120757
	MOVLW       186
	SUBWF       FARG_getDistanceIR_GP2D120_ir_value+0, 0 
L__getDistanceIR_GP2D120757:
	BTFSS       STATUS+0, 0 
	GOTO        L_getDistanceIR_GP2D120240
	MOVLW       0
	SUBWF       FARG_getDistanceIR_GP2D120_ir_value+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__getDistanceIR_GP2D120758
	MOVLW       215
	SUBWF       FARG_getDistanceIR_GP2D120_ir_value+0, 0 
L__getDistanceIR_GP2D120758:
	BTFSC       STATUS+0, 0 
	GOTO        L_getDistanceIR_GP2D120240
L__getDistanceIR_GP2D120657:
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
L_getDistanceIR_GP2D120240:
;ir.h,41 :: 		else if( 166<=ir_value && ir_value<186 )
	MOVLW       0
	SUBWF       FARG_getDistanceIR_GP2D120_ir_value+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__getDistanceIR_GP2D120759
	MOVLW       166
	SUBWF       FARG_getDistanceIR_GP2D120_ir_value+0, 0 
L__getDistanceIR_GP2D120759:
	BTFSS       STATUS+0, 0 
	GOTO        L_getDistanceIR_GP2D120244
	MOVLW       0
	SUBWF       FARG_getDistanceIR_GP2D120_ir_value+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__getDistanceIR_GP2D120760
	MOVLW       186
	SUBWF       FARG_getDistanceIR_GP2D120_ir_value+0, 0 
L__getDistanceIR_GP2D120760:
	BTFSC       STATUS+0, 0 
	GOTO        L_getDistanceIR_GP2D120244
L__getDistanceIR_GP2D120656:
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
L_getDistanceIR_GP2D120244:
;ir.h,44 :: 		else if( 147<=ir_value && ir_value<166 )
	MOVLW       0
	SUBWF       FARG_getDistanceIR_GP2D120_ir_value+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__getDistanceIR_GP2D120761
	MOVLW       147
	SUBWF       FARG_getDistanceIR_GP2D120_ir_value+0, 0 
L__getDistanceIR_GP2D120761:
	BTFSS       STATUS+0, 0 
	GOTO        L_getDistanceIR_GP2D120248
	MOVLW       0
	SUBWF       FARG_getDistanceIR_GP2D120_ir_value+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__getDistanceIR_GP2D120762
	MOVLW       166
	SUBWF       FARG_getDistanceIR_GP2D120_ir_value+0, 0 
L__getDistanceIR_GP2D120762:
	BTFSC       STATUS+0, 0 
	GOTO        L_getDistanceIR_GP2D120248
L__getDistanceIR_GP2D120655:
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
L_getDistanceIR_GP2D120248:
;ir.h,47 :: 		else if( 133<=ir_value && ir_value<147 )
	MOVLW       0
	SUBWF       FARG_getDistanceIR_GP2D120_ir_value+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__getDistanceIR_GP2D120763
	MOVLW       133
	SUBWF       FARG_getDistanceIR_GP2D120_ir_value+0, 0 
L__getDistanceIR_GP2D120763:
	BTFSS       STATUS+0, 0 
	GOTO        L_getDistanceIR_GP2D120252
	MOVLW       0
	SUBWF       FARG_getDistanceIR_GP2D120_ir_value+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__getDistanceIR_GP2D120764
	MOVLW       147
	SUBWF       FARG_getDistanceIR_GP2D120_ir_value+0, 0 
L__getDistanceIR_GP2D120764:
	BTFSC       STATUS+0, 0 
	GOTO        L_getDistanceIR_GP2D120252
L__getDistanceIR_GP2D120654:
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
L_getDistanceIR_GP2D120252:
;ir.h,50 :: 		else if( 106<=ir_value && ir_value<133 )
	MOVLW       0
	SUBWF       FARG_getDistanceIR_GP2D120_ir_value+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__getDistanceIR_GP2D120765
	MOVLW       106
	SUBWF       FARG_getDistanceIR_GP2D120_ir_value+0, 0 
L__getDistanceIR_GP2D120765:
	BTFSS       STATUS+0, 0 
	GOTO        L_getDistanceIR_GP2D120256
	MOVLW       0
	SUBWF       FARG_getDistanceIR_GP2D120_ir_value+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__getDistanceIR_GP2D120766
	MOVLW       133
	SUBWF       FARG_getDistanceIR_GP2D120_ir_value+0, 0 
L__getDistanceIR_GP2D120766:
	BTFSC       STATUS+0, 0 
	GOTO        L_getDistanceIR_GP2D120256
L__getDistanceIR_GP2D120653:
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
L_getDistanceIR_GP2D120256:
;ir.h,53 :: 		else if( 88<=ir_value && ir_value<106 )
	MOVLW       0
	SUBWF       FARG_getDistanceIR_GP2D120_ir_value+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__getDistanceIR_GP2D120767
	MOVLW       88
	SUBWF       FARG_getDistanceIR_GP2D120_ir_value+0, 0 
L__getDistanceIR_GP2D120767:
	BTFSS       STATUS+0, 0 
	GOTO        L_getDistanceIR_GP2D120260
	MOVLW       0
	SUBWF       FARG_getDistanceIR_GP2D120_ir_value+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__getDistanceIR_GP2D120768
	MOVLW       106
	SUBWF       FARG_getDistanceIR_GP2D120_ir_value+0, 0 
L__getDistanceIR_GP2D120768:
	BTFSC       STATUS+0, 0 
	GOTO        L_getDistanceIR_GP2D120260
L__getDistanceIR_GP2D120652:
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
L_getDistanceIR_GP2D120260:
;ir.h,56 :: 		else if( 78<=ir_value && ir_value<88 )
	MOVLW       0
	SUBWF       FARG_getDistanceIR_GP2D120_ir_value+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__getDistanceIR_GP2D120769
	MOVLW       78
	SUBWF       FARG_getDistanceIR_GP2D120_ir_value+0, 0 
L__getDistanceIR_GP2D120769:
	BTFSS       STATUS+0, 0 
	GOTO        L_getDistanceIR_GP2D120264
	MOVLW       0
	SUBWF       FARG_getDistanceIR_GP2D120_ir_value+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__getDistanceIR_GP2D120770
	MOVLW       88
	SUBWF       FARG_getDistanceIR_GP2D120_ir_value+0, 0 
L__getDistanceIR_GP2D120770:
	BTFSC       STATUS+0, 0 
	GOTO        L_getDistanceIR_GP2D120264
L__getDistanceIR_GP2D120651:
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
L_getDistanceIR_GP2D120264:
;ir.h,59 :: 		else if( 65<=ir_value && ir_value<78 )
	MOVLW       0
	SUBWF       FARG_getDistanceIR_GP2D120_ir_value+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__getDistanceIR_GP2D120771
	MOVLW       65
	SUBWF       FARG_getDistanceIR_GP2D120_ir_value+0, 0 
L__getDistanceIR_GP2D120771:
	BTFSS       STATUS+0, 0 
	GOTO        L_getDistanceIR_GP2D120268
	MOVLW       0
	SUBWF       FARG_getDistanceIR_GP2D120_ir_value+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__getDistanceIR_GP2D120772
	MOVLW       78
	SUBWF       FARG_getDistanceIR_GP2D120_ir_value+0, 0 
L__getDistanceIR_GP2D120772:
	BTFSC       STATUS+0, 0 
	GOTO        L_getDistanceIR_GP2D120268
L__getDistanceIR_GP2D120650:
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
L_getDistanceIR_GP2D120268:
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
L_getSonarDistance270:
	DECFSZ      R13, 1, 0
	BRA         L_getSonarDistance270
	NOP
;sonar.h,10 :: 		TRIG = 1;
	BSF         PORTD+0, 0 
;sonar.h,11 :: 		delay_us(10);
	MOVLW       16
	MOVWF       R13, 0
L_getSonarDistance271:
	DECFSZ      R13, 1, 0
	BRA         L_getSonarDistance271
	NOP
;sonar.h,12 :: 		TRIG = 0;
	BCF         PORTD+0, 0 
;sonar.h,14 :: 		while(ECHO==0);
L_getSonarDistance272:
	BTFSC       PORTD+0, 1 
	GOTO        L_getSonarDistance273
	GOTO        L_getSonarDistance272
L_getSonarDistance273:
;sonar.h,15 :: 		_counter = 0;
	CLRF        __counter+0 
	CLRF        __counter+1 
;sonar.h,17 :: 		while(ECHO==1){
L_getSonarDistance274:
	BTFSS       PORTD+0, 1 
	GOTO        L_getSonarDistance275
;sonar.h,18 :: 		_counter++;
	INFSNZ      __counter+0, 1 
	INCF        __counter+1, 1 
;sonar.h,19 :: 		}
	GOTO        L_getSonarDistance274
L_getSonarDistance275:
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
	GOTO        L_getDistanceSonar2276
;sonar.h,33 :: 		TRIG = 0;
	BCF         PORTD+0, 0 
;sonar.h,34 :: 		delay_us(2);
	MOVLW       3
	MOVWF       R13, 0
L_getDistanceSonar2277:
	DECFSZ      R13, 1, 0
	BRA         L_getDistanceSonar2277
;sonar.h,35 :: 		TRIG = 1;
	BSF         PORTD+0, 0 
;sonar.h,36 :: 		delay_us(5);
	MOVLW       8
	MOVWF       R13, 0
L_getDistanceSonar2278:
	DECFSZ      R13, 1, 0
	BRA         L_getDistanceSonar2278
;sonar.h,37 :: 		TRIG =0;
	BCF         PORTD+0, 0 
;sonar.h,39 :: 		while(!ECHO)
L_getDistanceSonar2279:
	BTFSC       PORTD+0, 1 
	GOTO        L_getDistanceSonar2280
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
	GOTO        L__getDistanceSonar2773
	MOVF        getDistanceSonar2_H_L0+0, 0 
	SUBLW       240
L__getDistanceSonar2773:
	BTFSC       STATUS+0, 0 
	GOTO        L_getDistanceSonar2281
;sonar.h,44 :: 		break;
	GOTO        L_getDistanceSonar2280
L_getDistanceSonar2281:
;sonar.h,45 :: 		}
	GOTO        L_getDistanceSonar2279
L_getDistanceSonar2280:
;sonar.h,46 :: 		TMR1H=0;
	CLRF        TMR1H+0 
;sonar.h,47 :: 		TMR1L=0;
	CLRF        TMR1L+0 
;sonar.h,48 :: 		T1CON.TMR1ON=1;
	BSF         T1CON+0, 0 
;sonar.h,49 :: 		while(ECHO)
L_getDistanceSonar2282:
	BTFSS       PORTD+0, 1 
	GOTO        L_getDistanceSonar2283
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
	GOTO        L__getDistanceSonar2774
	MOVF        getDistanceSonar2_H_L0+0, 0 
	SUBLW       240
L__getDistanceSonar2774:
	BTFSC       STATUS+0, 0 
	GOTO        L_getDistanceSonar2284
;sonar.h,54 :: 		break;
	GOTO        L_getDistanceSonar2283
L_getDistanceSonar2284:
;sonar.h,55 :: 		}
	GOTO        L_getDistanceSonar2282
L_getDistanceSonar2283:
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
;sonar.h,61 :: 		}else if(c == 'R'){
L_getDistanceSonar2276:
	MOVF        FARG_getDistanceSonar2_c+0, 0 
	XORLW       82
	BTFSS       STATUS+0, 2 
	GOTO        L_getDistanceSonar2286
;sonar.h,62 :: 		TRIG = 0;
	BCF         PORTD+0, 0 
;sonar.h,63 :: 		delay_us(2);
	MOVLW       3
	MOVWF       R13, 0
L_getDistanceSonar2287:
	DECFSZ      R13, 1, 0
	BRA         L_getDistanceSonar2287
;sonar.h,64 :: 		TRIG = 1;
	BSF         PORTD+0, 0 
;sonar.h,65 :: 		delay_us(5);
	MOVLW       8
	MOVWF       R13, 0
L_getDistanceSonar2288:
	DECFSZ      R13, 1, 0
	BRA         L_getDistanceSonar2288
;sonar.h,66 :: 		TRIG =0;
	BCF         PORTD+0, 0 
;sonar.h,68 :: 		while(!ECHO)
L_getDistanceSonar2289:
	BTFSC       PORTD+0, 1 
	GOTO        L_getDistanceSonar2290
;sonar.h,70 :: 		L=(TMR1L);
	MOVF        TMR1L+0, 0 
	MOVWF       getDistanceSonar2_L_L0+0 
	MOVLW       0
	MOVWF       getDistanceSonar2_L_L0+1 
;sonar.h,71 :: 		H=(TMR1H);
	MOVF        TMR1H+0, 0 
	MOVWF       getDistanceSonar2_H_L0+0 
	MOVLW       0
	MOVWF       getDistanceSonar2_H_L0+1 
;sonar.h,72 :: 		if(H>0xF0)
	MOVLW       0
	MOVWF       R0 
	MOVF        getDistanceSonar2_H_L0+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__getDistanceSonar2775
	MOVF        getDistanceSonar2_H_L0+0, 0 
	SUBLW       240
L__getDistanceSonar2775:
	BTFSC       STATUS+0, 0 
	GOTO        L_getDistanceSonar2291
;sonar.h,73 :: 		break;
	GOTO        L_getDistanceSonar2290
L_getDistanceSonar2291:
;sonar.h,74 :: 		}
	GOTO        L_getDistanceSonar2289
L_getDistanceSonar2290:
;sonar.h,75 :: 		TMR1H=0;
	CLRF        TMR1H+0 
;sonar.h,76 :: 		TMR1L=0;
	CLRF        TMR1L+0 
;sonar.h,77 :: 		T1CON.TMR1ON=1;
	BSF         T1CON+0, 0 
;sonar.h,78 :: 		while(ECHO)
L_getDistanceSonar2292:
	BTFSS       PORTD+0, 1 
	GOTO        L_getDistanceSonar2293
;sonar.h,80 :: 		L=(TMR1L);
	MOVF        TMR1L+0, 0 
	MOVWF       getDistanceSonar2_L_L0+0 
	MOVLW       0
	MOVWF       getDistanceSonar2_L_L0+1 
;sonar.h,81 :: 		H=(TMR1H);
	MOVF        TMR1H+0, 0 
	MOVWF       getDistanceSonar2_H_L0+0 
	MOVLW       0
	MOVWF       getDistanceSonar2_H_L0+1 
;sonar.h,82 :: 		if(H>0xF0)
	MOVLW       0
	MOVWF       R0 
	MOVF        getDistanceSonar2_H_L0+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__getDistanceSonar2776
	MOVF        getDistanceSonar2_H_L0+0, 0 
	SUBLW       240
L__getDistanceSonar2776:
	BTFSC       STATUS+0, 0 
	GOTO        L_getDistanceSonar2294
;sonar.h,83 :: 		break;
	GOTO        L_getDistanceSonar2293
L_getDistanceSonar2294:
;sonar.h,84 :: 		}
	GOTO        L_getDistanceSonar2292
L_getDistanceSonar2293:
;sonar.h,85 :: 		L=(TMR1L);
	MOVF        TMR1L+0, 0 
	MOVWF       getDistanceSonar2_L_L0+0 
	MOVLW       0
	MOVWF       getDistanceSonar2_L_L0+1 
;sonar.h,86 :: 		H=(TMR1H);
	MOVF        TMR1H+0, 0 
	MOVWF       getDistanceSonar2_H_L0+0 
	MOVLW       0
	MOVWF       getDistanceSonar2_H_L0+1 
;sonar.h,87 :: 		x=(H*256 + L)*0.2;
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
;sonar.h,88 :: 		y= (x/2)/29.1;
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
;sonar.h,89 :: 		return (int)y;
	CALL        _Double2Int+0, 0
	RETURN      0
;sonar.h,90 :: 		}
L_getDistanceSonar2286:
;sonar.h,91 :: 		}
	RETURN      0
; end of _getDistanceSonar2

_goThroughObstacles:

;Main 4.0V.c,18 :: 		void goThroughObstacles(){
;Main 4.0V.c,19 :: 		distanceSonar = getDistanceSonar2('L');
	MOVLW       76
	MOVWF       FARG_getDistanceSonar2_c+0 
	CALL        _getDistanceSonar2+0, 0
	MOVF        R0, 0 
	MOVWF       _distanceSonar+0 
;Main 4.0V.c,20 :: 		if( distanceSonar < 20 ){
	MOVLW       20
	SUBWF       R0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_goThroughObstacles295
;Main 4.0V.c,21 :: 		if( DIRECTION >= 0 ){
	MOVLW       128
	XORWF       _DIRECTION+1, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__goThroughObstacles777
	MOVLW       0
	SUBWF       _DIRECTION+0, 0 
L__goThroughObstacles777:
	BTFSS       STATUS+0, 0 
	GOTO        L_goThroughObstacles296
;Main 4.0V.c,22 :: 		sendText(" rotateByDegree -30  ");
	MOVLW       ?lstr34_Main_324.0V+0
	MOVWF       FARG_sendText_aText+0 
	MOVLW       hi_addr(?lstr34_Main_324.0V+0)
	MOVWF       FARG_sendText_aText+1 
	CALL        _sendText+0, 0
;Main 4.0V.c,23 :: 		rotateByDegree(-30);
	MOVLW       226
	MOVWF       FARG_rotateByDegree_degree+0 
	MOVLW       255
	MOVWF       FARG_rotateByDegree_degree+1 
	CALL        _rotateByDegree+0, 0
;Main 4.0V.c,24 :: 		DIRECTION -= 30;
	MOVLW       30
	SUBWF       _DIRECTION+0, 1 
	MOVLW       0
	SUBWFB      _DIRECTION+1, 1 
;Main 4.0V.c,25 :: 		}
	GOTO        L_goThroughObstacles297
L_goThroughObstacles296:
;Main 4.0V.c,27 :: 		sendText(" rotateByDegree +30  ");
	MOVLW       ?lstr35_Main_324.0V+0
	MOVWF       FARG_sendText_aText+0 
	MOVLW       hi_addr(?lstr35_Main_324.0V+0)
	MOVWF       FARG_sendText_aText+1 
	CALL        _sendText+0, 0
;Main 4.0V.c,28 :: 		rotateByDegree(30);
	MOVLW       30
	MOVWF       FARG_rotateByDegree_degree+0 
	MOVLW       0
	MOVWF       FARG_rotateByDegree_degree+1 
	CALL        _rotateByDegree+0, 0
;Main 4.0V.c,29 :: 		DIRECTION += 30;
	MOVLW       30
	ADDWF       _DIRECTION+0, 1 
	MOVLW       0
	ADDWFC      _DIRECTION+1, 1 
;Main 4.0V.c,30 :: 		}
L_goThroughObstacles297:
;Main 4.0V.c,31 :: 		}
	GOTO        L_goThroughObstacles298
L_goThroughObstacles295:
;Main 4.0V.c,33 :: 		moveForward(220,220);
	MOVLW       220
	MOVWF       FARG_moveForward_pwmLeft+0 
	MOVLW       0
	MOVWF       FARG_moveForward_pwmLeft+1 
	MOVLW       220
	MOVWF       FARG_moveForward_pwmRight+0 
	MOVLW       0
	MOVWF       FARG_moveForward_pwmRight+1 
	CALL        _moveForward+0, 0
;Main 4.0V.c,34 :: 		}
L_goThroughObstacles298:
;Main 4.0V.c,35 :: 		}
	RETURN      0
; end of _goThroughObstacles

_main:

;Main 4.0V.c,37 :: 		void main() {
;Main 4.0V.c,38 :: 		configure();
	CALL        _configure+0, 0
;Main 4.0V.c,39 :: 		setPID();
	CALL        _setPID+0, 0
;Main 4.0V.c,40 :: 		sendText("Starting...");
	MOVLW       ?lstr36_Main_324.0V+0
	MOVWF       FARG_sendText_aText+0 
	MOVLW       hi_addr(?lstr36_Main_324.0V+0)
	MOVWF       FARG_sendText_aText+1 
	CALL        _sendText+0, 0
;Main 4.0V.c,46 :: 		testPIC();
	CALL        _testPIC+0, 0
;Main 4.0V.c,48 :: 		moveForward(255,255);
	MOVLW       255
	MOVWF       FARG_moveForward_pwmLeft+0 
	MOVLW       0
	MOVWF       FARG_moveForward_pwmLeft+1 
	MOVLW       255
	MOVWF       FARG_moveForward_pwmRight+0 
	MOVLW       0
	MOVWF       FARG_moveForward_pwmRight+1 
	CALL        _moveForward+0, 0
;Main 4.0V.c,49 :: 		Delay_ms(5000);
	MOVLW       127
	MOVWF       R11, 0
	MOVLW       212
	MOVWF       R12, 0
	MOVLW       49
	MOVWF       R13, 0
L_main299:
	DECFSZ      R13, 1, 0
	BRA         L_main299
	DECFSZ      R12, 1, 0
	BRA         L_main299
	DECFSZ      R11, 1, 0
	BRA         L_main299
	NOP
	NOP
;Main 4.0V.c,50 :: 		while(1)
L_main300:
;Main 4.0V.c,51 :: 		stop();
	CALL        _stop+0, 0
	GOTO        L_main300
;Main 4.0V.c,84 :: 		delay_ms(100);
L_main304:
	DECFSZ      R13, 1, 0
	BRA         L_main304
	DECFSZ      R12, 1, 0
	BRA         L_main304
	DECFSZ      R11, 1, 0
	BRA         L_main304
	NOP
	NOP
;Main 4.0V.c,153 :: 		}
	GOTO        $+0
; end of _main

_isRightSafe:

;Main 4.0V.c,155 :: 		int isRightSafe(){
;Main 4.0V.c,156 :: 		ir_value = ADC_Read(IRSensorRight);
	MOVLW       0
	BTFSC       PORTA+0, 1 
	MOVLW       1
	MOVWF       FARG_ADC_Read_channel+0 
	CALL        _ADC_Read+0, 0
	MOVF        R0, 0 
	MOVWF       _ir_value+0 
	MOVF        R1, 0 
	MOVWF       _ir_value+1 
;Main 4.0V.c,157 :: 		if(250<=ir_value && ir_value<800){                         // ~5cm
	MOVLW       0
	SUBWF       R1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__isRightSafe778
	MOVLW       250
	SUBWF       R0, 0 
L__isRightSafe778:
	BTFSS       STATUS+0, 0 
	GOTO        L_isRightSafe327
	MOVLW       3
	SUBWF       _ir_value+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__isRightSafe779
	MOVLW       32
	SUBWF       _ir_value+0, 0 
L__isRightSafe779:
	BTFSC       STATUS+0, 0 
	GOTO        L_isRightSafe327
L__isRightSafe669:
;Main 4.0V.c,158 :: 		return FALSE;
	CLRF        R0 
	CLRF        R1 
	RETURN      0
;Main 4.0V.c,159 :: 		}
L_isRightSafe327:
;Main 4.0V.c,160 :: 		return TRUE;
	MOVLW       1
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
;Main 4.0V.c,161 :: 		}
	RETURN      0
; end of _isRightSafe

_isMiddleSafe:

;Main 4.0V.c,163 :: 		int isMiddleSafe(){
;Main 4.0V.c,164 :: 		ir_value = ADC_Read(IRSensorCenter);
	MOVLW       0
	BTFSC       PORTA+0, 0 
	MOVLW       1
	MOVWF       FARG_ADC_Read_channel+0 
	CALL        _ADC_Read+0, 0
	MOVF        R0, 0 
	MOVWF       _ir_value+0 
	MOVF        R1, 0 
	MOVWF       _ir_value+1 
;Main 4.0V.c,165 :: 		if(250<=ir_value && ir_value<800){                         // ~5cm
	MOVLW       0
	SUBWF       R1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__isMiddleSafe780
	MOVLW       250
	SUBWF       R0, 0 
L__isMiddleSafe780:
	BTFSS       STATUS+0, 0 
	GOTO        L_isMiddleSafe330
	MOVLW       3
	SUBWF       _ir_value+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__isMiddleSafe781
	MOVLW       32
	SUBWF       _ir_value+0, 0 
L__isMiddleSafe781:
	BTFSC       STATUS+0, 0 
	GOTO        L_isMiddleSafe330
L__isMiddleSafe670:
;Main 4.0V.c,166 :: 		return FALSE;
	CLRF        R0 
	CLRF        R1 
	RETURN      0
;Main 4.0V.c,167 :: 		}
L_isMiddleSafe330:
;Main 4.0V.c,168 :: 		return TRUE;
	MOVLW       1
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
;Main 4.0V.c,169 :: 		}
	RETURN      0
; end of _isMiddleSafe

_isLeftSafe:

;Main 4.0V.c,171 :: 		int isLeftSafe(){
;Main 4.0V.c,172 :: 		ir_value = ADC_Read(IRSensorLeft);
	MOVLW       0
	BTFSC       PORTA+0, 2 
	MOVLW       1
	MOVWF       FARG_ADC_Read_channel+0 
	CALL        _ADC_Read+0, 0
	MOVF        R0, 0 
	MOVWF       _ir_value+0 
	MOVF        R1, 0 
	MOVWF       _ir_value+1 
;Main 4.0V.c,173 :: 		if(250<=ir_value && ir_value<800){                         // ~5cm
	MOVLW       0
	SUBWF       R1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__isLeftSafe782
	MOVLW       250
	SUBWF       R0, 0 
L__isLeftSafe782:
	BTFSS       STATUS+0, 0 
	GOTO        L_isLeftSafe333
	MOVLW       3
	SUBWF       _ir_value+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__isLeftSafe783
	MOVLW       32
	SUBWF       _ir_value+0, 0 
L__isLeftSafe783:
	BTFSC       STATUS+0, 0 
	GOTO        L_isLeftSafe333
L__isLeftSafe671:
;Main 4.0V.c,174 :: 		return FALSE;
	CLRF        R0 
	CLRF        R1 
	RETURN      0
;Main 4.0V.c,175 :: 		}
L_isLeftSafe333:
;Main 4.0V.c,176 :: 		return TRUE;
	MOVLW       1
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
;Main 4.0V.c,177 :: 		}
	RETURN      0
; end of _isLeftSafe

_moveStraightSlow:

;Main 4.0V.c,179 :: 		void moveStraightSlow(){
;Main 4.0V.c,180 :: 		moveForward(205,200);
	MOVLW       205
	MOVWF       FARG_moveForward_pwmLeft+0 
	MOVLW       0
	MOVWF       FARG_moveForward_pwmLeft+1 
	MOVLW       200
	MOVWF       FARG_moveForward_pwmRight+0 
	MOVLW       0
	MOVWF       FARG_moveForward_pwmRight+1 
	CALL        _moveForward+0, 0
;Main 4.0V.c,181 :: 		}
	RETURN      0
; end of _moveStraightSlow

_lineFollowNormal2:

;Main 4.0V.c,183 :: 		void lineFollowNormal2(){
;Main 4.0V.c,184 :: 		if(Scout == 1){
	BTFSS       PORTB+0, 5 
	GOTO        L_lineFollowNormal2334
;Main 4.0V.c,186 :: 		if( Sensor3==0 && Sensor4==1 && Sensor5==1 && Sensor6==0 && Sensor7==0)
	BTFSC       PORTD+0, 4 
	GOTO        L_lineFollowNormal2337
	BTFSS       PORTD+0, 5 
	GOTO        L_lineFollowNormal2337
	BTFSS       PORTD+0, 6 
	GOTO        L_lineFollowNormal2337
	BTFSC       PORTD+0, 7 
	GOTO        L_lineFollowNormal2337
	BTFSC       PORTB+0, 2 
	GOTO        L_lineFollowNormal2337
L__lineFollowNormal2691:
;Main 4.0V.c,187 :: 		moveForward(SLOW_PWM,FAST_PWM);
	MOVF        _SLOW_PWM+0, 0 
	MOVWF       FARG_moveForward_pwmLeft+0 
	MOVF        _SLOW_PWM+1, 0 
	MOVWF       FARG_moveForward_pwmLeft+1 
	MOVF        _FAST_PWM+0, 0 
	MOVWF       FARG_moveForward_pwmRight+0 
	MOVF        _FAST_PWM+1, 0 
	MOVWF       FARG_moveForward_pwmRight+1 
	CALL        _moveForward+0, 0
	GOTO        L_lineFollowNormal2338
L_lineFollowNormal2337:
;Main 4.0V.c,188 :: 		else if( Sensor3==0 && Sensor4==1 && Sensor5==1 && Sensor6==1 && Sensor7==0)
	BTFSC       PORTD+0, 4 
	GOTO        L_lineFollowNormal2341
	BTFSS       PORTD+0, 5 
	GOTO        L_lineFollowNormal2341
	BTFSS       PORTD+0, 6 
	GOTO        L_lineFollowNormal2341
	BTFSS       PORTD+0, 7 
	GOTO        L_lineFollowNormal2341
	BTFSC       PORTB+0, 2 
	GOTO        L_lineFollowNormal2341
L__lineFollowNormal2690:
;Main 4.0V.c,189 :: 		moveForward(FAST_PWM,FAST_PWM);
	MOVF        _FAST_PWM+0, 0 
	MOVWF       FARG_moveForward_pwmLeft+0 
	MOVF        _FAST_PWM+1, 0 
	MOVWF       FARG_moveForward_pwmLeft+1 
	MOVF        _FAST_PWM+0, 0 
	MOVWF       FARG_moveForward_pwmRight+0 
	MOVF        _FAST_PWM+1, 0 
	MOVWF       FARG_moveForward_pwmRight+1 
	CALL        _moveForward+0, 0
	GOTO        L_lineFollowNormal2342
L_lineFollowNormal2341:
;Main 4.0V.c,190 :: 		else if( Sensor3==0 && Sensor4==0 && Sensor5==1 && Sensor6==0 && Sensor7==0)
	BTFSC       PORTD+0, 4 
	GOTO        L_lineFollowNormal2345
	BTFSC       PORTD+0, 5 
	GOTO        L_lineFollowNormal2345
	BTFSS       PORTD+0, 6 
	GOTO        L_lineFollowNormal2345
	BTFSC       PORTD+0, 7 
	GOTO        L_lineFollowNormal2345
	BTFSC       PORTB+0, 2 
	GOTO        L_lineFollowNormal2345
L__lineFollowNormal2689:
;Main 4.0V.c,191 :: 		moveForward(FAST_PWM,FAST_PWM);
	MOVF        _FAST_PWM+0, 0 
	MOVWF       FARG_moveForward_pwmLeft+0 
	MOVF        _FAST_PWM+1, 0 
	MOVWF       FARG_moveForward_pwmLeft+1 
	MOVF        _FAST_PWM+0, 0 
	MOVWF       FARG_moveForward_pwmRight+0 
	MOVF        _FAST_PWM+1, 0 
	MOVWF       FARG_moveForward_pwmRight+1 
	CALL        _moveForward+0, 0
	GOTO        L_lineFollowNormal2346
L_lineFollowNormal2345:
;Main 4.0V.c,192 :: 		else if( Sensor3==0 && Sensor4==0 && Sensor5==1 && Sensor6==1 && Sensor7==0)
	BTFSC       PORTD+0, 4 
	GOTO        L_lineFollowNormal2349
	BTFSC       PORTD+0, 5 
	GOTO        L_lineFollowNormal2349
	BTFSS       PORTD+0, 6 
	GOTO        L_lineFollowNormal2349
	BTFSS       PORTD+0, 7 
	GOTO        L_lineFollowNormal2349
	BTFSC       PORTB+0, 2 
	GOTO        L_lineFollowNormal2349
L__lineFollowNormal2688:
;Main 4.0V.c,193 :: 		moveForward(FAST_PWM,SLOW_PWM);
	MOVF        _FAST_PWM+0, 0 
	MOVWF       FARG_moveForward_pwmLeft+0 
	MOVF        _FAST_PWM+1, 0 
	MOVWF       FARG_moveForward_pwmLeft+1 
	MOVF        _SLOW_PWM+0, 0 
	MOVWF       FARG_moveForward_pwmRight+0 
	MOVF        _SLOW_PWM+1, 0 
	MOVWF       FARG_moveForward_pwmRight+1 
	CALL        _moveForward+0, 0
	GOTO        L_lineFollowNormal2350
L_lineFollowNormal2349:
;Main 4.0V.c,198 :: 		else if( Sensor3==1 && Sensor4==0 && Sensor5==0 && Sensor6==0 && Sensor7==0)
	BTFSS       PORTD+0, 4 
	GOTO        L_lineFollowNormal2353
	BTFSC       PORTD+0, 5 
	GOTO        L_lineFollowNormal2353
	BTFSC       PORTD+0, 6 
	GOTO        L_lineFollowNormal2353
	BTFSC       PORTD+0, 7 
	GOTO        L_lineFollowNormal2353
	BTFSC       PORTB+0, 2 
	GOTO        L_lineFollowNormal2353
L__lineFollowNormal2687:
;Main 4.0V.c,199 :: 		while(!isOnThePath())
L_lineFollowNormal2354:
	CALL        _isOnThePath+0, 0
	MOVF        R0, 0 
	IORWF       R1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_lineFollowNormal2355
;Main 4.0V.c,200 :: 		turnLeft(FAST_PWM);
	MOVF        _FAST_PWM+0, 0 
	MOVWF       FARG_turnLeft_pwmRight+0 
	MOVF        _FAST_PWM+1, 0 
	MOVWF       FARG_turnLeft_pwmRight+1 
	CALL        _turnLeft+0, 0
	GOTO        L_lineFollowNormal2354
L_lineFollowNormal2355:
	GOTO        L_lineFollowNormal2356
L_lineFollowNormal2353:
;Main 4.0V.c,201 :: 		else if( Sensor3==1 && Sensor4==1 && Sensor5==0 && Sensor6==0 && Sensor7==0)
	BTFSS       PORTD+0, 4 
	GOTO        L_lineFollowNormal2359
	BTFSS       PORTD+0, 5 
	GOTO        L_lineFollowNormal2359
	BTFSC       PORTD+0, 6 
	GOTO        L_lineFollowNormal2359
	BTFSC       PORTD+0, 7 
	GOTO        L_lineFollowNormal2359
	BTFSC       PORTB+0, 2 
	GOTO        L_lineFollowNormal2359
L__lineFollowNormal2686:
;Main 4.0V.c,202 :: 		while(!isOnThePath())
L_lineFollowNormal2360:
	CALL        _isOnThePath+0, 0
	MOVF        R0, 0 
	IORWF       R1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_lineFollowNormal2361
;Main 4.0V.c,203 :: 		turnLeft(FAST_PWM);
	MOVF        _FAST_PWM+0, 0 
	MOVWF       FARG_turnLeft_pwmRight+0 
	MOVF        _FAST_PWM+1, 0 
	MOVWF       FARG_turnLeft_pwmRight+1 
	CALL        _turnLeft+0, 0
	GOTO        L_lineFollowNormal2360
L_lineFollowNormal2361:
	GOTO        L_lineFollowNormal2362
L_lineFollowNormal2359:
;Main 4.0V.c,204 :: 		else if( Sensor3==1 && Sensor4==1 && Sensor5==1 && Sensor6==0 && Sensor7==0)
	BTFSS       PORTD+0, 4 
	GOTO        L_lineFollowNormal2365
	BTFSS       PORTD+0, 5 
	GOTO        L_lineFollowNormal2365
	BTFSS       PORTD+0, 6 
	GOTO        L_lineFollowNormal2365
	BTFSC       PORTD+0, 7 
	GOTO        L_lineFollowNormal2365
	BTFSC       PORTB+0, 2 
	GOTO        L_lineFollowNormal2365
L__lineFollowNormal2685:
;Main 4.0V.c,205 :: 		while(!isOnThePath())
L_lineFollowNormal2366:
	CALL        _isOnThePath+0, 0
	MOVF        R0, 0 
	IORWF       R1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_lineFollowNormal2367
;Main 4.0V.c,206 :: 		turnLeft(FAST_PWM);
	MOVF        _FAST_PWM+0, 0 
	MOVWF       FARG_turnLeft_pwmRight+0 
	MOVF        _FAST_PWM+1, 0 
	MOVWF       FARG_turnLeft_pwmRight+1 
	CALL        _turnLeft+0, 0
	GOTO        L_lineFollowNormal2366
L_lineFollowNormal2367:
	GOTO        L_lineFollowNormal2368
L_lineFollowNormal2365:
;Main 4.0V.c,207 :: 		else if( Sensor3==0 && Sensor4==1 && Sensor5==0 && Sensor6==0 && Sensor7==0)
	BTFSC       PORTD+0, 4 
	GOTO        L_lineFollowNormal2371
	BTFSS       PORTD+0, 5 
	GOTO        L_lineFollowNormal2371
	BTFSC       PORTD+0, 6 
	GOTO        L_lineFollowNormal2371
	BTFSC       PORTD+0, 7 
	GOTO        L_lineFollowNormal2371
	BTFSC       PORTB+0, 2 
	GOTO        L_lineFollowNormal2371
L__lineFollowNormal2684:
;Main 4.0V.c,208 :: 		while(!isOnThePath())
L_lineFollowNormal2372:
	CALL        _isOnThePath+0, 0
	MOVF        R0, 0 
	IORWF       R1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_lineFollowNormal2373
;Main 4.0V.c,209 :: 		turnLeft(FAST_PWM);
	MOVF        _FAST_PWM+0, 0 
	MOVWF       FARG_turnLeft_pwmRight+0 
	MOVF        _FAST_PWM+1, 0 
	MOVWF       FARG_turnLeft_pwmRight+1 
	CALL        _turnLeft+0, 0
	GOTO        L_lineFollowNormal2372
L_lineFollowNormal2373:
	GOTO        L_lineFollowNormal2374
L_lineFollowNormal2371:
;Main 4.0V.c,212 :: 		else if( Sensor3==0 && Sensor4==0 && Sensor5==0 && Sensor6==1 && Sensor7==0)
	BTFSC       PORTD+0, 4 
	GOTO        L_lineFollowNormal2377
	BTFSC       PORTD+0, 5 
	GOTO        L_lineFollowNormal2377
	BTFSC       PORTD+0, 6 
	GOTO        L_lineFollowNormal2377
	BTFSS       PORTD+0, 7 
	GOTO        L_lineFollowNormal2377
	BTFSC       PORTB+0, 2 
	GOTO        L_lineFollowNormal2377
L__lineFollowNormal2683:
;Main 4.0V.c,213 :: 		while(!isOnThePath())
L_lineFollowNormal2378:
	CALL        _isOnThePath+0, 0
	MOVF        R0, 0 
	IORWF       R1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_lineFollowNormal2379
;Main 4.0V.c,214 :: 		turnRight(FAST_PWM);
	MOVF        _FAST_PWM+0, 0 
	MOVWF       FARG_turnRight_pwmLeft+0 
	MOVF        _FAST_PWM+1, 0 
	MOVWF       FARG_turnRight_pwmLeft+1 
	CALL        _turnRight+0, 0
	GOTO        L_lineFollowNormal2378
L_lineFollowNormal2379:
	GOTO        L_lineFollowNormal2380
L_lineFollowNormal2377:
;Main 4.0V.c,215 :: 		else if( Sensor3==0 && Sensor4==0 && Sensor5==1 && Sensor6==1 && Sensor7==1)
	BTFSC       PORTD+0, 4 
	GOTO        L_lineFollowNormal2383
	BTFSC       PORTD+0, 5 
	GOTO        L_lineFollowNormal2383
	BTFSS       PORTD+0, 6 
	GOTO        L_lineFollowNormal2383
	BTFSS       PORTD+0, 7 
	GOTO        L_lineFollowNormal2383
	BTFSS       PORTB+0, 2 
	GOTO        L_lineFollowNormal2383
L__lineFollowNormal2682:
;Main 4.0V.c,216 :: 		while(!isOnThePath())
L_lineFollowNormal2384:
	CALL        _isOnThePath+0, 0
	MOVF        R0, 0 
	IORWF       R1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_lineFollowNormal2385
;Main 4.0V.c,217 :: 		turnRight(FAST_PWM);
	MOVF        _FAST_PWM+0, 0 
	MOVWF       FARG_turnRight_pwmLeft+0 
	MOVF        _FAST_PWM+1, 0 
	MOVWF       FARG_turnRight_pwmLeft+1 
	CALL        _turnRight+0, 0
	GOTO        L_lineFollowNormal2384
L_lineFollowNormal2385:
	GOTO        L_lineFollowNormal2386
L_lineFollowNormal2383:
;Main 4.0V.c,218 :: 		else if( Sensor3==0 && Sensor4==0 && Sensor5==0 && Sensor6==1 && Sensor7==1)
	BTFSC       PORTD+0, 4 
	GOTO        L_lineFollowNormal2389
	BTFSC       PORTD+0, 5 
	GOTO        L_lineFollowNormal2389
	BTFSC       PORTD+0, 6 
	GOTO        L_lineFollowNormal2389
	BTFSS       PORTD+0, 7 
	GOTO        L_lineFollowNormal2389
	BTFSS       PORTB+0, 2 
	GOTO        L_lineFollowNormal2389
L__lineFollowNormal2681:
;Main 4.0V.c,219 :: 		while(!isOnThePath())
L_lineFollowNormal2390:
	CALL        _isOnThePath+0, 0
	MOVF        R0, 0 
	IORWF       R1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_lineFollowNormal2391
;Main 4.0V.c,220 :: 		turnRight(FAST_PWM);
	MOVF        _FAST_PWM+0, 0 
	MOVWF       FARG_turnRight_pwmLeft+0 
	MOVF        _FAST_PWM+1, 0 
	MOVWF       FARG_turnRight_pwmLeft+1 
	CALL        _turnRight+0, 0
	GOTO        L_lineFollowNormal2390
L_lineFollowNormal2391:
	GOTO        L_lineFollowNormal2392
L_lineFollowNormal2389:
;Main 4.0V.c,221 :: 		else if( Sensor3==0 && Sensor4==0 && Sensor5==0 && Sensor6==0 && Sensor7==1)
	BTFSC       PORTD+0, 4 
	GOTO        L_lineFollowNormal2395
	BTFSC       PORTD+0, 5 
	GOTO        L_lineFollowNormal2395
	BTFSC       PORTD+0, 6 
	GOTO        L_lineFollowNormal2395
	BTFSC       PORTD+0, 7 
	GOTO        L_lineFollowNormal2395
	BTFSS       PORTB+0, 2 
	GOTO        L_lineFollowNormal2395
L__lineFollowNormal2680:
;Main 4.0V.c,222 :: 		while(!isOnThePath())
L_lineFollowNormal2396:
	CALL        _isOnThePath+0, 0
	MOVF        R0, 0 
	IORWF       R1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_lineFollowNormal2397
;Main 4.0V.c,223 :: 		turnRight(FAST_PWM);
	MOVF        _FAST_PWM+0, 0 
	MOVWF       FARG_turnRight_pwmLeft+0 
	MOVF        _FAST_PWM+1, 0 
	MOVWF       FARG_turnRight_pwmLeft+1 
	CALL        _turnRight+0, 0
	GOTO        L_lineFollowNormal2396
L_lineFollowNormal2397:
	GOTO        L_lineFollowNormal2398
L_lineFollowNormal2395:
;Main 4.0V.c,225 :: 		else if(isAllBlack()){
	CALL        _isAllBlack+0, 0
	MOVF        R0, 0 
	IORWF       R1, 0 
	BTFSC       STATUS+0, 2 
	GOTO        L_lineFollowNormal2399
;Main 4.0V.c,227 :: 		stop();
	CALL        _stop+0, 0
;Main 4.0V.c,228 :: 		}
	GOTO        L_lineFollowNormal2400
L_lineFollowNormal2399:
;Main 4.0V.c,230 :: 		stop();
	CALL        _stop+0, 0
L_lineFollowNormal2400:
L_lineFollowNormal2398:
L_lineFollowNormal2392:
L_lineFollowNormal2386:
L_lineFollowNormal2380:
L_lineFollowNormal2374:
L_lineFollowNormal2368:
L_lineFollowNormal2362:
L_lineFollowNormal2356:
L_lineFollowNormal2350:
L_lineFollowNormal2346:
L_lineFollowNormal2342:
L_lineFollowNormal2338:
;Main 4.0V.c,231 :: 		}
	GOTO        L_lineFollowNormal2401
L_lineFollowNormal2334:
;Main 4.0V.c,237 :: 		if( Sensor3==1 && Sensor4==0 && Sensor5==0 && Sensor6==0 && Sensor7==0)
	BTFSS       PORTD+0, 4 
	GOTO        L_lineFollowNormal2404
	BTFSC       PORTD+0, 5 
	GOTO        L_lineFollowNormal2404
	BTFSC       PORTD+0, 6 
	GOTO        L_lineFollowNormal2404
	BTFSC       PORTD+0, 7 
	GOTO        L_lineFollowNormal2404
	BTFSC       PORTB+0, 2 
	GOTO        L_lineFollowNormal2404
L__lineFollowNormal2679:
;Main 4.0V.c,238 :: 		while(!isOnThePath())
L_lineFollowNormal2405:
	CALL        _isOnThePath+0, 0
	MOVF        R0, 0 
	IORWF       R1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_lineFollowNormal2406
;Main 4.0V.c,239 :: 		turnLeft(FAST_PWM);
	MOVF        _FAST_PWM+0, 0 
	MOVWF       FARG_turnLeft_pwmRight+0 
	MOVF        _FAST_PWM+1, 0 
	MOVWF       FARG_turnLeft_pwmRight+1 
	CALL        _turnLeft+0, 0
	GOTO        L_lineFollowNormal2405
L_lineFollowNormal2406:
	GOTO        L_lineFollowNormal2407
L_lineFollowNormal2404:
;Main 4.0V.c,240 :: 		else if( Sensor3==1 && Sensor4==1 && Sensor5==0 && Sensor6==0 && Sensor7==0)
	BTFSS       PORTD+0, 4 
	GOTO        L_lineFollowNormal2410
	BTFSS       PORTD+0, 5 
	GOTO        L_lineFollowNormal2410
	BTFSC       PORTD+0, 6 
	GOTO        L_lineFollowNormal2410
	BTFSC       PORTD+0, 7 
	GOTO        L_lineFollowNormal2410
	BTFSC       PORTB+0, 2 
	GOTO        L_lineFollowNormal2410
L__lineFollowNormal2678:
;Main 4.0V.c,241 :: 		while(!isOnThePath())
L_lineFollowNormal2411:
	CALL        _isOnThePath+0, 0
	MOVF        R0, 0 
	IORWF       R1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_lineFollowNormal2412
;Main 4.0V.c,242 :: 		turnLeft(FAST_PWM);
	MOVF        _FAST_PWM+0, 0 
	MOVWF       FARG_turnLeft_pwmRight+0 
	MOVF        _FAST_PWM+1, 0 
	MOVWF       FARG_turnLeft_pwmRight+1 
	CALL        _turnLeft+0, 0
	GOTO        L_lineFollowNormal2411
L_lineFollowNormal2412:
	GOTO        L_lineFollowNormal2413
L_lineFollowNormal2410:
;Main 4.0V.c,243 :: 		else if( Sensor3==1 && Sensor4==1 && Sensor5==1 && Sensor6==0 && Sensor7==0)
	BTFSS       PORTD+0, 4 
	GOTO        L_lineFollowNormal2416
	BTFSS       PORTD+0, 5 
	GOTO        L_lineFollowNormal2416
	BTFSS       PORTD+0, 6 
	GOTO        L_lineFollowNormal2416
	BTFSC       PORTD+0, 7 
	GOTO        L_lineFollowNormal2416
	BTFSC       PORTB+0, 2 
	GOTO        L_lineFollowNormal2416
L__lineFollowNormal2677:
;Main 4.0V.c,244 :: 		while(!isOnThePath())
L_lineFollowNormal2417:
	CALL        _isOnThePath+0, 0
	MOVF        R0, 0 
	IORWF       R1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_lineFollowNormal2418
;Main 4.0V.c,245 :: 		turnLeft(FAST_PWM);
	MOVF        _FAST_PWM+0, 0 
	MOVWF       FARG_turnLeft_pwmRight+0 
	MOVF        _FAST_PWM+1, 0 
	MOVWF       FARG_turnLeft_pwmRight+1 
	CALL        _turnLeft+0, 0
	GOTO        L_lineFollowNormal2417
L_lineFollowNormal2418:
	GOTO        L_lineFollowNormal2419
L_lineFollowNormal2416:
;Main 4.0V.c,246 :: 		else if( Sensor3==0 && Sensor4==1 && Sensor5==0 && Sensor6==0 && Sensor7==0)
	BTFSC       PORTD+0, 4 
	GOTO        L_lineFollowNormal2422
	BTFSS       PORTD+0, 5 
	GOTO        L_lineFollowNormal2422
	BTFSC       PORTD+0, 6 
	GOTO        L_lineFollowNormal2422
	BTFSC       PORTD+0, 7 
	GOTO        L_lineFollowNormal2422
	BTFSC       PORTB+0, 2 
	GOTO        L_lineFollowNormal2422
L__lineFollowNormal2676:
;Main 4.0V.c,247 :: 		while(!isOnThePath())
L_lineFollowNormal2423:
	CALL        _isOnThePath+0, 0
	MOVF        R0, 0 
	IORWF       R1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_lineFollowNormal2424
;Main 4.0V.c,248 :: 		turnLeft(FAST_PWM);
	MOVF        _FAST_PWM+0, 0 
	MOVWF       FARG_turnLeft_pwmRight+0 
	MOVF        _FAST_PWM+1, 0 
	MOVWF       FARG_turnLeft_pwmRight+1 
	CALL        _turnLeft+0, 0
	GOTO        L_lineFollowNormal2423
L_lineFollowNormal2424:
	GOTO        L_lineFollowNormal2425
L_lineFollowNormal2422:
;Main 4.0V.c,251 :: 		else if( Sensor3==0 && Sensor4==0 && Sensor5==0 && Sensor6==1 && Sensor7==0)
	BTFSC       PORTD+0, 4 
	GOTO        L_lineFollowNormal2428
	BTFSC       PORTD+0, 5 
	GOTO        L_lineFollowNormal2428
	BTFSC       PORTD+0, 6 
	GOTO        L_lineFollowNormal2428
	BTFSS       PORTD+0, 7 
	GOTO        L_lineFollowNormal2428
	BTFSC       PORTB+0, 2 
	GOTO        L_lineFollowNormal2428
L__lineFollowNormal2675:
;Main 4.0V.c,252 :: 		while(!isOnThePath())
L_lineFollowNormal2429:
	CALL        _isOnThePath+0, 0
	MOVF        R0, 0 
	IORWF       R1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_lineFollowNormal2430
;Main 4.0V.c,253 :: 		turnRight(FAST_PWM);
	MOVF        _FAST_PWM+0, 0 
	MOVWF       FARG_turnRight_pwmLeft+0 
	MOVF        _FAST_PWM+1, 0 
	MOVWF       FARG_turnRight_pwmLeft+1 
	CALL        _turnRight+0, 0
	GOTO        L_lineFollowNormal2429
L_lineFollowNormal2430:
	GOTO        L_lineFollowNormal2431
L_lineFollowNormal2428:
;Main 4.0V.c,254 :: 		else if( Sensor3==0 && Sensor4==0 && Sensor5==1 && Sensor6==1 && Sensor7==1)
	BTFSC       PORTD+0, 4 
	GOTO        L_lineFollowNormal2434
	BTFSC       PORTD+0, 5 
	GOTO        L_lineFollowNormal2434
	BTFSS       PORTD+0, 6 
	GOTO        L_lineFollowNormal2434
	BTFSS       PORTD+0, 7 
	GOTO        L_lineFollowNormal2434
	BTFSS       PORTB+0, 2 
	GOTO        L_lineFollowNormal2434
L__lineFollowNormal2674:
;Main 4.0V.c,255 :: 		while(!isOnThePath())
L_lineFollowNormal2435:
	CALL        _isOnThePath+0, 0
	MOVF        R0, 0 
	IORWF       R1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_lineFollowNormal2436
;Main 4.0V.c,256 :: 		turnRight(FAST_PWM);
	MOVF        _FAST_PWM+0, 0 
	MOVWF       FARG_turnRight_pwmLeft+0 
	MOVF        _FAST_PWM+1, 0 
	MOVWF       FARG_turnRight_pwmLeft+1 
	CALL        _turnRight+0, 0
	GOTO        L_lineFollowNormal2435
L_lineFollowNormal2436:
	GOTO        L_lineFollowNormal2437
L_lineFollowNormal2434:
;Main 4.0V.c,257 :: 		else if( Sensor3==0 && Sensor4==0 && Sensor5==0 && Sensor6==1 && Sensor7==1)
	BTFSC       PORTD+0, 4 
	GOTO        L_lineFollowNormal2440
	BTFSC       PORTD+0, 5 
	GOTO        L_lineFollowNormal2440
	BTFSC       PORTD+0, 6 
	GOTO        L_lineFollowNormal2440
	BTFSS       PORTD+0, 7 
	GOTO        L_lineFollowNormal2440
	BTFSS       PORTB+0, 2 
	GOTO        L_lineFollowNormal2440
L__lineFollowNormal2673:
;Main 4.0V.c,258 :: 		while(!isOnThePath())
L_lineFollowNormal2441:
	CALL        _isOnThePath+0, 0
	MOVF        R0, 0 
	IORWF       R1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_lineFollowNormal2442
;Main 4.0V.c,259 :: 		turnRight(FAST_PWM);
	MOVF        _FAST_PWM+0, 0 
	MOVWF       FARG_turnRight_pwmLeft+0 
	MOVF        _FAST_PWM+1, 0 
	MOVWF       FARG_turnRight_pwmLeft+1 
	CALL        _turnRight+0, 0
	GOTO        L_lineFollowNormal2441
L_lineFollowNormal2442:
	GOTO        L_lineFollowNormal2443
L_lineFollowNormal2440:
;Main 4.0V.c,260 :: 		else if( Sensor3==0 && Sensor4==0 && Sensor5==0 && Sensor6==0 && Sensor7==1)
	BTFSC       PORTD+0, 4 
	GOTO        L_lineFollowNormal2446
	BTFSC       PORTD+0, 5 
	GOTO        L_lineFollowNormal2446
	BTFSC       PORTD+0, 6 
	GOTO        L_lineFollowNormal2446
	BTFSC       PORTD+0, 7 
	GOTO        L_lineFollowNormal2446
	BTFSS       PORTB+0, 2 
	GOTO        L_lineFollowNormal2446
L__lineFollowNormal2672:
;Main 4.0V.c,261 :: 		while(!isOnThePath())
L_lineFollowNormal2447:
	CALL        _isOnThePath+0, 0
	MOVF        R0, 0 
	IORWF       R1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_lineFollowNormal2448
;Main 4.0V.c,262 :: 		turnRight(FAST_PWM);
	MOVF        _FAST_PWM+0, 0 
	MOVWF       FARG_turnRight_pwmLeft+0 
	MOVF        _FAST_PWM+1, 0 
	MOVWF       FARG_turnRight_pwmLeft+1 
	CALL        _turnRight+0, 0
	GOTO        L_lineFollowNormal2447
L_lineFollowNormal2448:
	GOTO        L_lineFollowNormal2449
L_lineFollowNormal2446:
;Main 4.0V.c,266 :: 		else if(isAllWhite()){
	CALL        _isAllWhite+0, 0
	MOVF        R0, 0 
	IORWF       R1, 0 
	BTFSC       STATUS+0, 2 
	GOTO        L_lineFollowNormal2450
;Main 4.0V.c,268 :: 		stop();
	CALL        _stop+0, 0
;Main 4.0V.c,269 :: 		}
	GOTO        L_lineFollowNormal2451
L_lineFollowNormal2450:
;Main 4.0V.c,271 :: 		stop();
	CALL        _stop+0, 0
L_lineFollowNormal2451:
L_lineFollowNormal2449:
L_lineFollowNormal2443:
L_lineFollowNormal2437:
L_lineFollowNormal2431:
L_lineFollowNormal2425:
L_lineFollowNormal2419:
L_lineFollowNormal2413:
L_lineFollowNormal2407:
;Main 4.0V.c,272 :: 		}
L_lineFollowNormal2401:
;Main 4.0V.c,273 :: 		}
	RETURN      0
; end of _lineFollowNormal2

_lineFollowNormal3:

;Main 4.0V.c,275 :: 		void lineFollowNormal3(){
;Main 4.0V.c,276 :: 		if(Scout == 1){
	BTFSS       PORTB+0, 5 
	GOTO        L_lineFollowNormal3452
;Main 4.0V.c,278 :: 		if( Sensor3==0 && Sensor4==1 && Sensor5==1 && Sensor6==0 && Sensor7==0)
	BTFSC       PORTD+0, 4 
	GOTO        L_lineFollowNormal3455
	BTFSS       PORTD+0, 5 
	GOTO        L_lineFollowNormal3455
	BTFSS       PORTD+0, 6 
	GOTO        L_lineFollowNormal3455
	BTFSC       PORTD+0, 7 
	GOTO        L_lineFollowNormal3455
	BTFSC       PORTB+0, 2 
	GOTO        L_lineFollowNormal3455
L__lineFollowNormal3725:
;Main 4.0V.c,279 :: 		moveForward(SLOW_PWM,FAST_PWM);
	MOVF        _SLOW_PWM+0, 0 
	MOVWF       FARG_moveForward_pwmLeft+0 
	MOVF        _SLOW_PWM+1, 0 
	MOVWF       FARG_moveForward_pwmLeft+1 
	MOVF        _FAST_PWM+0, 0 
	MOVWF       FARG_moveForward_pwmRight+0 
	MOVF        _FAST_PWM+1, 0 
	MOVWF       FARG_moveForward_pwmRight+1 
	CALL        _moveForward+0, 0
	GOTO        L_lineFollowNormal3456
L_lineFollowNormal3455:
;Main 4.0V.c,280 :: 		else if( Sensor3==0 && Sensor4==1 && Sensor5==1 && Sensor6==1 && Sensor7==0)
	BTFSC       PORTD+0, 4 
	GOTO        L_lineFollowNormal3459
	BTFSS       PORTD+0, 5 
	GOTO        L_lineFollowNormal3459
	BTFSS       PORTD+0, 6 
	GOTO        L_lineFollowNormal3459
	BTFSS       PORTD+0, 7 
	GOTO        L_lineFollowNormal3459
	BTFSC       PORTB+0, 2 
	GOTO        L_lineFollowNormal3459
L__lineFollowNormal3724:
;Main 4.0V.c,281 :: 		moveForward(FAST_PWM,FAST_PWM);
	MOVF        _FAST_PWM+0, 0 
	MOVWF       FARG_moveForward_pwmLeft+0 
	MOVF        _FAST_PWM+1, 0 
	MOVWF       FARG_moveForward_pwmLeft+1 
	MOVF        _FAST_PWM+0, 0 
	MOVWF       FARG_moveForward_pwmRight+0 
	MOVF        _FAST_PWM+1, 0 
	MOVWF       FARG_moveForward_pwmRight+1 
	CALL        _moveForward+0, 0
	GOTO        L_lineFollowNormal3460
L_lineFollowNormal3459:
;Main 4.0V.c,282 :: 		else if( Sensor3==0 && Sensor4==0 && Sensor5==1 && Sensor6==0 && Sensor7==0)
	BTFSC       PORTD+0, 4 
	GOTO        L_lineFollowNormal3463
	BTFSC       PORTD+0, 5 
	GOTO        L_lineFollowNormal3463
	BTFSS       PORTD+0, 6 
	GOTO        L_lineFollowNormal3463
	BTFSC       PORTD+0, 7 
	GOTO        L_lineFollowNormal3463
	BTFSC       PORTB+0, 2 
	GOTO        L_lineFollowNormal3463
L__lineFollowNormal3723:
;Main 4.0V.c,283 :: 		moveForward(FAST_PWM,FAST_PWM);
	MOVF        _FAST_PWM+0, 0 
	MOVWF       FARG_moveForward_pwmLeft+0 
	MOVF        _FAST_PWM+1, 0 
	MOVWF       FARG_moveForward_pwmLeft+1 
	MOVF        _FAST_PWM+0, 0 
	MOVWF       FARG_moveForward_pwmRight+0 
	MOVF        _FAST_PWM+1, 0 
	MOVWF       FARG_moveForward_pwmRight+1 
	CALL        _moveForward+0, 0
	GOTO        L_lineFollowNormal3464
L_lineFollowNormal3463:
;Main 4.0V.c,284 :: 		else if( Sensor3==0 && Sensor4==0 && Sensor5==1 && Sensor6==1 && Sensor7==0)
	BTFSC       PORTD+0, 4 
	GOTO        L_lineFollowNormal3467
	BTFSC       PORTD+0, 5 
	GOTO        L_lineFollowNormal3467
	BTFSS       PORTD+0, 6 
	GOTO        L_lineFollowNormal3467
	BTFSS       PORTD+0, 7 
	GOTO        L_lineFollowNormal3467
	BTFSC       PORTB+0, 2 
	GOTO        L_lineFollowNormal3467
L__lineFollowNormal3722:
;Main 4.0V.c,285 :: 		moveForward(FAST_PWM,SLOW_PWM);
	MOVF        _FAST_PWM+0, 0 
	MOVWF       FARG_moveForward_pwmLeft+0 
	MOVF        _FAST_PWM+1, 0 
	MOVWF       FARG_moveForward_pwmLeft+1 
	MOVF        _SLOW_PWM+0, 0 
	MOVWF       FARG_moveForward_pwmRight+0 
	MOVF        _SLOW_PWM+1, 0 
	MOVWF       FARG_moveForward_pwmRight+1 
	CALL        _moveForward+0, 0
	GOTO        L_lineFollowNormal3468
L_lineFollowNormal3467:
;Main 4.0V.c,290 :: 		else if( Sensor3==1 && Sensor4==0 && Sensor5==0 && Sensor6==0 && Sensor7==0)
	BTFSS       PORTD+0, 4 
	GOTO        L_lineFollowNormal3471
	BTFSC       PORTD+0, 5 
	GOTO        L_lineFollowNormal3471
	BTFSC       PORTD+0, 6 
	GOTO        L_lineFollowNormal3471
	BTFSC       PORTD+0, 7 
	GOTO        L_lineFollowNormal3471
	BTFSC       PORTB+0, 2 
	GOTO        L_lineFollowNormal3471
L__lineFollowNormal3721:
;Main 4.0V.c,292 :: 		turnLeft(FAST_PWM);
	MOVF        _FAST_PWM+0, 0 
	MOVWF       FARG_turnLeft_pwmRight+0 
	MOVF        _FAST_PWM+1, 0 
	MOVWF       FARG_turnLeft_pwmRight+1 
	CALL        _turnLeft+0, 0
	GOTO        L_lineFollowNormal3472
L_lineFollowNormal3471:
;Main 4.0V.c,293 :: 		else if( Sensor3==1 && Sensor4==1 && Sensor5==0 && Sensor6==0 && Sensor7==0)
	BTFSS       PORTD+0, 4 
	GOTO        L_lineFollowNormal3475
	BTFSS       PORTD+0, 5 
	GOTO        L_lineFollowNormal3475
	BTFSC       PORTD+0, 6 
	GOTO        L_lineFollowNormal3475
	BTFSC       PORTD+0, 7 
	GOTO        L_lineFollowNormal3475
	BTFSC       PORTB+0, 2 
	GOTO        L_lineFollowNormal3475
L__lineFollowNormal3720:
;Main 4.0V.c,295 :: 		turnLeft(FAST_PWM);
	MOVF        _FAST_PWM+0, 0 
	MOVWF       FARG_turnLeft_pwmRight+0 
	MOVF        _FAST_PWM+1, 0 
	MOVWF       FARG_turnLeft_pwmRight+1 
	CALL        _turnLeft+0, 0
	GOTO        L_lineFollowNormal3476
L_lineFollowNormal3475:
;Main 4.0V.c,296 :: 		else if( Sensor3==1 && Sensor4==1 && Sensor5==1 && Sensor6==0 && Sensor7==0)
	BTFSS       PORTD+0, 4 
	GOTO        L_lineFollowNormal3479
	BTFSS       PORTD+0, 5 
	GOTO        L_lineFollowNormal3479
	BTFSS       PORTD+0, 6 
	GOTO        L_lineFollowNormal3479
	BTFSC       PORTD+0, 7 
	GOTO        L_lineFollowNormal3479
	BTFSC       PORTB+0, 2 
	GOTO        L_lineFollowNormal3479
L__lineFollowNormal3719:
;Main 4.0V.c,298 :: 		turnLeft(FAST_PWM);
	MOVF        _FAST_PWM+0, 0 
	MOVWF       FARG_turnLeft_pwmRight+0 
	MOVF        _FAST_PWM+1, 0 
	MOVWF       FARG_turnLeft_pwmRight+1 
	CALL        _turnLeft+0, 0
	GOTO        L_lineFollowNormal3480
L_lineFollowNormal3479:
;Main 4.0V.c,299 :: 		else if( Sensor3==0 && Sensor4==1 && Sensor5==0 && Sensor6==0 && Sensor7==0)
	BTFSC       PORTD+0, 4 
	GOTO        L_lineFollowNormal3483
	BTFSS       PORTD+0, 5 
	GOTO        L_lineFollowNormal3483
	BTFSC       PORTD+0, 6 
	GOTO        L_lineFollowNormal3483
	BTFSC       PORTD+0, 7 
	GOTO        L_lineFollowNormal3483
	BTFSC       PORTB+0, 2 
	GOTO        L_lineFollowNormal3483
L__lineFollowNormal3718:
;Main 4.0V.c,301 :: 		turnLeft(FAST_PWM);
	MOVF        _FAST_PWM+0, 0 
	MOVWF       FARG_turnLeft_pwmRight+0 
	MOVF        _FAST_PWM+1, 0 
	MOVWF       FARG_turnLeft_pwmRight+1 
	CALL        _turnLeft+0, 0
	GOTO        L_lineFollowNormal3484
L_lineFollowNormal3483:
;Main 4.0V.c,304 :: 		else if( Sensor3==0 && Sensor4==0 && Sensor5==0 && Sensor6==1 && Sensor7==0)
	BTFSC       PORTD+0, 4 
	GOTO        L_lineFollowNormal3487
	BTFSC       PORTD+0, 5 
	GOTO        L_lineFollowNormal3487
	BTFSC       PORTD+0, 6 
	GOTO        L_lineFollowNormal3487
	BTFSS       PORTD+0, 7 
	GOTO        L_lineFollowNormal3487
	BTFSC       PORTB+0, 2 
	GOTO        L_lineFollowNormal3487
L__lineFollowNormal3717:
;Main 4.0V.c,306 :: 		turnRight(FAST_PWM);
	MOVF        _FAST_PWM+0, 0 
	MOVWF       FARG_turnRight_pwmLeft+0 
	MOVF        _FAST_PWM+1, 0 
	MOVWF       FARG_turnRight_pwmLeft+1 
	CALL        _turnRight+0, 0
	GOTO        L_lineFollowNormal3488
L_lineFollowNormal3487:
;Main 4.0V.c,307 :: 		else if( Sensor3==0 && Sensor4==0 && Sensor5==1 && Sensor6==1 && Sensor7==1)
	BTFSC       PORTD+0, 4 
	GOTO        L_lineFollowNormal3491
	BTFSC       PORTD+0, 5 
	GOTO        L_lineFollowNormal3491
	BTFSS       PORTD+0, 6 
	GOTO        L_lineFollowNormal3491
	BTFSS       PORTD+0, 7 
	GOTO        L_lineFollowNormal3491
	BTFSS       PORTB+0, 2 
	GOTO        L_lineFollowNormal3491
L__lineFollowNormal3716:
;Main 4.0V.c,309 :: 		turnRight(FAST_PWM);
	MOVF        _FAST_PWM+0, 0 
	MOVWF       FARG_turnRight_pwmLeft+0 
	MOVF        _FAST_PWM+1, 0 
	MOVWF       FARG_turnRight_pwmLeft+1 
	CALL        _turnRight+0, 0
	GOTO        L_lineFollowNormal3492
L_lineFollowNormal3491:
;Main 4.0V.c,310 :: 		else if( Sensor3==0 && Sensor4==0 && Sensor5==0 && Sensor6==1 && Sensor7==1)
	BTFSC       PORTD+0, 4 
	GOTO        L_lineFollowNormal3495
	BTFSC       PORTD+0, 5 
	GOTO        L_lineFollowNormal3495
	BTFSC       PORTD+0, 6 
	GOTO        L_lineFollowNormal3495
	BTFSS       PORTD+0, 7 
	GOTO        L_lineFollowNormal3495
	BTFSS       PORTB+0, 2 
	GOTO        L_lineFollowNormal3495
L__lineFollowNormal3715:
;Main 4.0V.c,312 :: 		turnRight(FAST_PWM);
	MOVF        _FAST_PWM+0, 0 
	MOVWF       FARG_turnRight_pwmLeft+0 
	MOVF        _FAST_PWM+1, 0 
	MOVWF       FARG_turnRight_pwmLeft+1 
	CALL        _turnRight+0, 0
	GOTO        L_lineFollowNormal3496
L_lineFollowNormal3495:
;Main 4.0V.c,313 :: 		else if( Sensor3==0 && Sensor4==0 && Sensor5==0 && Sensor6==0 && Sensor7==1)
	BTFSC       PORTD+0, 4 
	GOTO        L_lineFollowNormal3499
	BTFSC       PORTD+0, 5 
	GOTO        L_lineFollowNormal3499
	BTFSC       PORTD+0, 6 
	GOTO        L_lineFollowNormal3499
	BTFSC       PORTD+0, 7 
	GOTO        L_lineFollowNormal3499
	BTFSS       PORTB+0, 2 
	GOTO        L_lineFollowNormal3499
L__lineFollowNormal3714:
;Main 4.0V.c,315 :: 		turnRight(FAST_PWM);
	MOVF        _FAST_PWM+0, 0 
	MOVWF       FARG_turnRight_pwmLeft+0 
	MOVF        _FAST_PWM+1, 0 
	MOVWF       FARG_turnRight_pwmLeft+1 
	CALL        _turnRight+0, 0
	GOTO        L_lineFollowNormal3500
L_lineFollowNormal3499:
;Main 4.0V.c,318 :: 		else if( Sensor3==1 && Sensor4==1 && Sensor5==1 && Sensor6==1 && Sensor7==0)
	BTFSS       PORTD+0, 4 
	GOTO        L_lineFollowNormal3503
	BTFSS       PORTD+0, 5 
	GOTO        L_lineFollowNormal3503
	BTFSS       PORTD+0, 6 
	GOTO        L_lineFollowNormal3503
	BTFSS       PORTD+0, 7 
	GOTO        L_lineFollowNormal3503
	BTFSC       PORTB+0, 2 
	GOTO        L_lineFollowNormal3503
L__lineFollowNormal3713:
;Main 4.0V.c,319 :: 		moveForward(FAST_PWM,FAST_PWM);
	MOVF        _FAST_PWM+0, 0 
	MOVWF       FARG_moveForward_pwmLeft+0 
	MOVF        _FAST_PWM+1, 0 
	MOVWF       FARG_moveForward_pwmLeft+1 
	MOVF        _FAST_PWM+0, 0 
	MOVWF       FARG_moveForward_pwmRight+0 
	MOVF        _FAST_PWM+1, 0 
	MOVWF       FARG_moveForward_pwmRight+1 
	CALL        _moveForward+0, 0
	GOTO        L_lineFollowNormal3504
L_lineFollowNormal3503:
;Main 4.0V.c,320 :: 		else if( Sensor3==0 && Sensor4==1 && Sensor5==1 && Sensor6==1 && Sensor7==1)
	BTFSC       PORTD+0, 4 
	GOTO        L_lineFollowNormal3507
	BTFSS       PORTD+0, 5 
	GOTO        L_lineFollowNormal3507
	BTFSS       PORTD+0, 6 
	GOTO        L_lineFollowNormal3507
	BTFSS       PORTD+0, 7 
	GOTO        L_lineFollowNormal3507
	BTFSS       PORTB+0, 2 
	GOTO        L_lineFollowNormal3507
L__lineFollowNormal3712:
;Main 4.0V.c,321 :: 		moveForward(FAST_PWM,FAST_PWM);
	MOVF        _FAST_PWM+0, 0 
	MOVWF       FARG_moveForward_pwmLeft+0 
	MOVF        _FAST_PWM+1, 0 
	MOVWF       FARG_moveForward_pwmLeft+1 
	MOVF        _FAST_PWM+0, 0 
	MOVWF       FARG_moveForward_pwmRight+0 
	MOVF        _FAST_PWM+1, 0 
	MOVWF       FARG_moveForward_pwmRight+1 
	CALL        _moveForward+0, 0
	GOTO        L_lineFollowNormal3508
L_lineFollowNormal3507:
;Main 4.0V.c,323 :: 		else if(isAllBlack()){
	CALL        _isAllBlack+0, 0
	MOVF        R0, 0 
	IORWF       R1, 0 
	BTFSC       STATUS+0, 2 
	GOTO        L_lineFollowNormal3509
;Main 4.0V.c,326 :: 		reverse(FAST_PWM,FAST_PWM);
	MOVF        _FAST_PWM+0, 0 
	MOVWF       FARG_reverse_pwmLeft+0 
	MOVF        _FAST_PWM+1, 0 
	MOVWF       FARG_reverse_pwmLeft+1 
	MOVF        _FAST_PWM+0, 0 
	MOVWF       FARG_reverse_pwmRight+0 
	MOVF        _FAST_PWM+1, 0 
	MOVWF       FARG_reverse_pwmRight+1 
	CALL        _reverse+0, 0
;Main 4.0V.c,327 :: 		delay_ms(10);
	MOVLW       65
	MOVWF       R12, 0
	MOVLW       238
	MOVWF       R13, 0
L_lineFollowNormal3510:
	DECFSZ      R13, 1, 0
	BRA         L_lineFollowNormal3510
	DECFSZ      R12, 1, 0
	BRA         L_lineFollowNormal3510
	NOP
;Main 4.0V.c,328 :: 		sendSensorStatus();
	CALL        _sendSensorStatus+0, 0
;Main 4.0V.c,329 :: 		}
	GOTO        L_lineFollowNormal3511
L_lineFollowNormal3509:
;Main 4.0V.c,332 :: 		reverse(FAST_PWM,FAST_PWM);
	MOVF        _FAST_PWM+0, 0 
	MOVWF       FARG_reverse_pwmLeft+0 
	MOVF        _FAST_PWM+1, 0 
	MOVWF       FARG_reverse_pwmLeft+1 
	MOVF        _FAST_PWM+0, 0 
	MOVWF       FARG_reverse_pwmRight+0 
	MOVF        _FAST_PWM+1, 0 
	MOVWF       FARG_reverse_pwmRight+1 
	CALL        _reverse+0, 0
;Main 4.0V.c,333 :: 		delay_ms(10);
	MOVLW       65
	MOVWF       R12, 0
	MOVLW       238
	MOVWF       R13, 0
L_lineFollowNormal3512:
	DECFSZ      R13, 1, 0
	BRA         L_lineFollowNormal3512
	DECFSZ      R12, 1, 0
	BRA         L_lineFollowNormal3512
	NOP
;Main 4.0V.c,334 :: 		sendSensorStatus();
	CALL        _sendSensorStatus+0, 0
;Main 4.0V.c,336 :: 		}
L_lineFollowNormal3511:
L_lineFollowNormal3508:
L_lineFollowNormal3504:
L_lineFollowNormal3500:
L_lineFollowNormal3496:
L_lineFollowNormal3492:
L_lineFollowNormal3488:
L_lineFollowNormal3484:
L_lineFollowNormal3480:
L_lineFollowNormal3476:
L_lineFollowNormal3472:
L_lineFollowNormal3468:
L_lineFollowNormal3464:
L_lineFollowNormal3460:
L_lineFollowNormal3456:
;Main 4.0V.c,337 :: 		}
	GOTO        L_lineFollowNormal3513
L_lineFollowNormal3452:
;Main 4.0V.c,344 :: 		if( Sensor1==1 && Sensor2==1 && Sensor3==1 && Sensor4==1 && Sensor5==1 && Sensor6==0 && Sensor7==0 && Sensor8==0 && Sensor9==0)
	BTFSS       PORTB+0, 4 
	GOTO        L_lineFollowNormal3516
	BTFSS       PORTB+0, 3 
	GOTO        L_lineFollowNormal3516
	BTFSS       PORTD+0, 4 
	GOTO        L_lineFollowNormal3516
	BTFSS       PORTD+0, 5 
	GOTO        L_lineFollowNormal3516
	BTFSS       PORTD+0, 6 
	GOTO        L_lineFollowNormal3516
	BTFSC       PORTD+0, 7 
	GOTO        L_lineFollowNormal3516
	BTFSC       PORTB+0, 2 
	GOTO        L_lineFollowNormal3516
	BTFSC       PORTB+0, 6 
	GOTO        L_lineFollowNormal3516
	BTFSC       PORTB+0, 7 
	GOTO        L_lineFollowNormal3516
L__lineFollowNormal3711:
;Main 4.0V.c,345 :: 		rotateByDegree(-90);
	MOVLW       166
	MOVWF       FARG_rotateByDegree_degree+0 
	MOVLW       255
	MOVWF       FARG_rotateByDegree_degree+1 
	CALL        _rotateByDegree+0, 0
	GOTO        L_lineFollowNormal3517
L_lineFollowNormal3516:
;Main 4.0V.c,346 :: 		else if( Sensor1==1 && Sensor2==1 && Sensor3==1 && Sensor4==1 && Sensor5==1 && Sensor6==1 && Sensor7==0 && Sensor8==0 && Sensor9==0)
	BTFSS       PORTB+0, 4 
	GOTO        L_lineFollowNormal3520
	BTFSS       PORTB+0, 3 
	GOTO        L_lineFollowNormal3520
	BTFSS       PORTD+0, 4 
	GOTO        L_lineFollowNormal3520
	BTFSS       PORTD+0, 5 
	GOTO        L_lineFollowNormal3520
	BTFSS       PORTD+0, 6 
	GOTO        L_lineFollowNormal3520
	BTFSS       PORTD+0, 7 
	GOTO        L_lineFollowNormal3520
	BTFSC       PORTB+0, 2 
	GOTO        L_lineFollowNormal3520
	BTFSC       PORTB+0, 6 
	GOTO        L_lineFollowNormal3520
	BTFSC       PORTB+0, 7 
	GOTO        L_lineFollowNormal3520
L__lineFollowNormal3710:
;Main 4.0V.c,347 :: 		rotateByDegree(-90);
	MOVLW       166
	MOVWF       FARG_rotateByDegree_degree+0 
	MOVLW       255
	MOVWF       FARG_rotateByDegree_degree+1 
	CALL        _rotateByDegree+0, 0
	GOTO        L_lineFollowNormal3521
L_lineFollowNormal3520:
;Main 4.0V.c,348 :: 		else if( Sensor1==1 && Sensor2==1 && Sensor3==1 && Sensor4==1 && Sensor5==1 && Sensor6==1 && Sensor7==1 && Sensor8==0 && Sensor9==0)
	BTFSS       PORTB+0, 4 
	GOTO        L_lineFollowNormal3524
	BTFSS       PORTB+0, 3 
	GOTO        L_lineFollowNormal3524
	BTFSS       PORTD+0, 4 
	GOTO        L_lineFollowNormal3524
	BTFSS       PORTD+0, 5 
	GOTO        L_lineFollowNormal3524
	BTFSS       PORTD+0, 6 
	GOTO        L_lineFollowNormal3524
	BTFSS       PORTD+0, 7 
	GOTO        L_lineFollowNormal3524
	BTFSS       PORTB+0, 2 
	GOTO        L_lineFollowNormal3524
	BTFSC       PORTB+0, 6 
	GOTO        L_lineFollowNormal3524
	BTFSC       PORTB+0, 7 
	GOTO        L_lineFollowNormal3524
L__lineFollowNormal3709:
;Main 4.0V.c,349 :: 		rotateByDegree(-90);
	MOVLW       166
	MOVWF       FARG_rotateByDegree_degree+0 
	MOVLW       255
	MOVWF       FARG_rotateByDegree_degree+1 
	CALL        _rotateByDegree+0, 0
	GOTO        L_lineFollowNormal3525
L_lineFollowNormal3524:
;Main 4.0V.c,352 :: 		else if( Sensor1==0 && Sensor2==0 && Sensor3==1 && Sensor4==1 && Sensor5==1 && Sensor6==1 && Sensor7==1 && Sensor8==1 && Sensor9==1)
	BTFSC       PORTB+0, 4 
	GOTO        L_lineFollowNormal3528
	BTFSC       PORTB+0, 3 
	GOTO        L_lineFollowNormal3528
	BTFSS       PORTD+0, 4 
	GOTO        L_lineFollowNormal3528
	BTFSS       PORTD+0, 5 
	GOTO        L_lineFollowNormal3528
	BTFSS       PORTD+0, 6 
	GOTO        L_lineFollowNormal3528
	BTFSS       PORTD+0, 7 
	GOTO        L_lineFollowNormal3528
	BTFSS       PORTB+0, 2 
	GOTO        L_lineFollowNormal3528
	BTFSS       PORTB+0, 6 
	GOTO        L_lineFollowNormal3528
	BTFSS       PORTB+0, 7 
	GOTO        L_lineFollowNormal3528
L__lineFollowNormal3708:
;Main 4.0V.c,353 :: 		rotateByDegree(90);
	MOVLW       90
	MOVWF       FARG_rotateByDegree_degree+0 
	MOVLW       0
	MOVWF       FARG_rotateByDegree_degree+1 
	CALL        _rotateByDegree+0, 0
	GOTO        L_lineFollowNormal3529
L_lineFollowNormal3528:
;Main 4.0V.c,354 :: 		else if( Sensor1==0 && Sensor2==0 && Sensor3==0 && Sensor4==1 && Sensor5==1 && Sensor6==1 && Sensor7==1 && Sensor8==1 && Sensor9==1)
	BTFSC       PORTB+0, 4 
	GOTO        L_lineFollowNormal3532
	BTFSC       PORTB+0, 3 
	GOTO        L_lineFollowNormal3532
	BTFSC       PORTD+0, 4 
	GOTO        L_lineFollowNormal3532
	BTFSS       PORTD+0, 5 
	GOTO        L_lineFollowNormal3532
	BTFSS       PORTD+0, 6 
	GOTO        L_lineFollowNormal3532
	BTFSS       PORTD+0, 7 
	GOTO        L_lineFollowNormal3532
	BTFSS       PORTB+0, 2 
	GOTO        L_lineFollowNormal3532
	BTFSS       PORTB+0, 6 
	GOTO        L_lineFollowNormal3532
	BTFSS       PORTB+0, 7 
	GOTO        L_lineFollowNormal3532
L__lineFollowNormal3707:
;Main 4.0V.c,355 :: 		rotateByDegree(90);
	MOVLW       90
	MOVWF       FARG_rotateByDegree_degree+0 
	MOVLW       0
	MOVWF       FARG_rotateByDegree_degree+1 
	CALL        _rotateByDegree+0, 0
	GOTO        L_lineFollowNormal3533
L_lineFollowNormal3532:
;Main 4.0V.c,356 :: 		else if( Sensor1==0 && Sensor2==0 && Sensor3==0 && Sensor4==0 && Sensor5==1 && Sensor6==1 && Sensor7==1 && Sensor8==1 && Sensor9==1)
	BTFSC       PORTB+0, 4 
	GOTO        L_lineFollowNormal3536
	BTFSC       PORTB+0, 3 
	GOTO        L_lineFollowNormal3536
	BTFSC       PORTD+0, 4 
	GOTO        L_lineFollowNormal3536
	BTFSC       PORTD+0, 5 
	GOTO        L_lineFollowNormal3536
	BTFSS       PORTD+0, 6 
	GOTO        L_lineFollowNormal3536
	BTFSS       PORTD+0, 7 
	GOTO        L_lineFollowNormal3536
	BTFSS       PORTB+0, 2 
	GOTO        L_lineFollowNormal3536
	BTFSS       PORTB+0, 6 
	GOTO        L_lineFollowNormal3536
	BTFSS       PORTB+0, 7 
	GOTO        L_lineFollowNormal3536
L__lineFollowNormal3706:
;Main 4.0V.c,357 :: 		rotateByDegree(90);
	MOVLW       90
	MOVWF       FARG_rotateByDegree_degree+0 
	MOVLW       0
	MOVWF       FARG_rotateByDegree_degree+1 
	CALL        _rotateByDegree+0, 0
	GOTO        L_lineFollowNormal3537
L_lineFollowNormal3536:
;Main 4.0V.c,362 :: 		else if( Sensor3==1 && Sensor4==0 && Sensor5==0 && Sensor6==0 && Sensor7==0)
	BTFSS       PORTD+0, 4 
	GOTO        L_lineFollowNormal3540
	BTFSC       PORTD+0, 5 
	GOTO        L_lineFollowNormal3540
	BTFSC       PORTD+0, 6 
	GOTO        L_lineFollowNormal3540
	BTFSC       PORTD+0, 7 
	GOTO        L_lineFollowNormal3540
	BTFSC       PORTB+0, 2 
	GOTO        L_lineFollowNormal3540
L__lineFollowNormal3705:
;Main 4.0V.c,364 :: 		turnLeft(FAST_PWM);
	MOVF        _FAST_PWM+0, 0 
	MOVWF       FARG_turnLeft_pwmRight+0 
	MOVF        _FAST_PWM+1, 0 
	MOVWF       FARG_turnLeft_pwmRight+1 
	CALL        _turnLeft+0, 0
	GOTO        L_lineFollowNormal3541
L_lineFollowNormal3540:
;Main 4.0V.c,365 :: 		else if( Sensor3==1 && Sensor4==1 && Sensor5==0 && Sensor6==0 && Sensor7==0)
	BTFSS       PORTD+0, 4 
	GOTO        L_lineFollowNormal3544
	BTFSS       PORTD+0, 5 
	GOTO        L_lineFollowNormal3544
	BTFSC       PORTD+0, 6 
	GOTO        L_lineFollowNormal3544
	BTFSC       PORTD+0, 7 
	GOTO        L_lineFollowNormal3544
	BTFSC       PORTB+0, 2 
	GOTO        L_lineFollowNormal3544
L__lineFollowNormal3704:
;Main 4.0V.c,367 :: 		turnLeft(FAST_PWM);
	MOVF        _FAST_PWM+0, 0 
	MOVWF       FARG_turnLeft_pwmRight+0 
	MOVF        _FAST_PWM+1, 0 
	MOVWF       FARG_turnLeft_pwmRight+1 
	CALL        _turnLeft+0, 0
	GOTO        L_lineFollowNormal3545
L_lineFollowNormal3544:
;Main 4.0V.c,368 :: 		else if( Sensor3==1 && Sensor4==1 && Sensor5==1 && Sensor6==0 && Sensor7==0)
	BTFSS       PORTD+0, 4 
	GOTO        L_lineFollowNormal3548
	BTFSS       PORTD+0, 5 
	GOTO        L_lineFollowNormal3548
	BTFSS       PORTD+0, 6 
	GOTO        L_lineFollowNormal3548
	BTFSC       PORTD+0, 7 
	GOTO        L_lineFollowNormal3548
	BTFSC       PORTB+0, 2 
	GOTO        L_lineFollowNormal3548
L__lineFollowNormal3703:
;Main 4.0V.c,370 :: 		turnLeft(FAST_PWM);
	MOVF        _FAST_PWM+0, 0 
	MOVWF       FARG_turnLeft_pwmRight+0 
	MOVF        _FAST_PWM+1, 0 
	MOVWF       FARG_turnLeft_pwmRight+1 
	CALL        _turnLeft+0, 0
	GOTO        L_lineFollowNormal3549
L_lineFollowNormal3548:
;Main 4.0V.c,371 :: 		else if( Sensor3==0 && Sensor4==1 && Sensor5==0 && Sensor6==0 && Sensor7==0)
	BTFSC       PORTD+0, 4 
	GOTO        L_lineFollowNormal3552
	BTFSS       PORTD+0, 5 
	GOTO        L_lineFollowNormal3552
	BTFSC       PORTD+0, 6 
	GOTO        L_lineFollowNormal3552
	BTFSC       PORTD+0, 7 
	GOTO        L_lineFollowNormal3552
	BTFSC       PORTB+0, 2 
	GOTO        L_lineFollowNormal3552
L__lineFollowNormal3702:
;Main 4.0V.c,373 :: 		turnLeft(FAST_PWM);
	MOVF        _FAST_PWM+0, 0 
	MOVWF       FARG_turnLeft_pwmRight+0 
	MOVF        _FAST_PWM+1, 0 
	MOVWF       FARG_turnLeft_pwmRight+1 
	CALL        _turnLeft+0, 0
	GOTO        L_lineFollowNormal3553
L_lineFollowNormal3552:
;Main 4.0V.c,376 :: 		else if( Sensor3==0 && Sensor4==0 && Sensor5==0 && Sensor6==1 && Sensor7==0)
	BTFSC       PORTD+0, 4 
	GOTO        L_lineFollowNormal3556
	BTFSC       PORTD+0, 5 
	GOTO        L_lineFollowNormal3556
	BTFSC       PORTD+0, 6 
	GOTO        L_lineFollowNormal3556
	BTFSS       PORTD+0, 7 
	GOTO        L_lineFollowNormal3556
	BTFSC       PORTB+0, 2 
	GOTO        L_lineFollowNormal3556
L__lineFollowNormal3701:
;Main 4.0V.c,378 :: 		turnRight(FAST_PWM);
	MOVF        _FAST_PWM+0, 0 
	MOVWF       FARG_turnRight_pwmLeft+0 
	MOVF        _FAST_PWM+1, 0 
	MOVWF       FARG_turnRight_pwmLeft+1 
	CALL        _turnRight+0, 0
	GOTO        L_lineFollowNormal3557
L_lineFollowNormal3556:
;Main 4.0V.c,379 :: 		else if( Sensor3==0 && Sensor4==0 && Sensor5==1 && Sensor6==1 && Sensor7==1)
	BTFSC       PORTD+0, 4 
	GOTO        L_lineFollowNormal3560
	BTFSC       PORTD+0, 5 
	GOTO        L_lineFollowNormal3560
	BTFSS       PORTD+0, 6 
	GOTO        L_lineFollowNormal3560
	BTFSS       PORTD+0, 7 
	GOTO        L_lineFollowNormal3560
	BTFSS       PORTB+0, 2 
	GOTO        L_lineFollowNormal3560
L__lineFollowNormal3700:
;Main 4.0V.c,381 :: 		turnRight(FAST_PWM);
	MOVF        _FAST_PWM+0, 0 
	MOVWF       FARG_turnRight_pwmLeft+0 
	MOVF        _FAST_PWM+1, 0 
	MOVWF       FARG_turnRight_pwmLeft+1 
	CALL        _turnRight+0, 0
	GOTO        L_lineFollowNormal3561
L_lineFollowNormal3560:
;Main 4.0V.c,382 :: 		else if( Sensor3==0 && Sensor4==0 && Sensor5==0 && Sensor6==1 && Sensor7==1)
	BTFSC       PORTD+0, 4 
	GOTO        L_lineFollowNormal3564
	BTFSC       PORTD+0, 5 
	GOTO        L_lineFollowNormal3564
	BTFSC       PORTD+0, 6 
	GOTO        L_lineFollowNormal3564
	BTFSS       PORTD+0, 7 
	GOTO        L_lineFollowNormal3564
	BTFSS       PORTB+0, 2 
	GOTO        L_lineFollowNormal3564
L__lineFollowNormal3699:
;Main 4.0V.c,384 :: 		turnRight(FAST_PWM);
	MOVF        _FAST_PWM+0, 0 
	MOVWF       FARG_turnRight_pwmLeft+0 
	MOVF        _FAST_PWM+1, 0 
	MOVWF       FARG_turnRight_pwmLeft+1 
	CALL        _turnRight+0, 0
	GOTO        L_lineFollowNormal3565
L_lineFollowNormal3564:
;Main 4.0V.c,385 :: 		else if( Sensor3==0 && Sensor4==0 && Sensor5==0 && Sensor6==0 && Sensor7==1)
	BTFSC       PORTD+0, 4 
	GOTO        L_lineFollowNormal3568
	BTFSC       PORTD+0, 5 
	GOTO        L_lineFollowNormal3568
	BTFSC       PORTD+0, 6 
	GOTO        L_lineFollowNormal3568
	BTFSC       PORTD+0, 7 
	GOTO        L_lineFollowNormal3568
	BTFSS       PORTB+0, 2 
	GOTO        L_lineFollowNormal3568
L__lineFollowNormal3698:
;Main 4.0V.c,387 :: 		turnRight(FAST_PWM);
	MOVF        _FAST_PWM+0, 0 
	MOVWF       FARG_turnRight_pwmLeft+0 
	MOVF        _FAST_PWM+1, 0 
	MOVWF       FARG_turnRight_pwmLeft+1 
	CALL        _turnRight+0, 0
	GOTO        L_lineFollowNormal3569
L_lineFollowNormal3568:
;Main 4.0V.c,390 :: 		else if( Sensor3==1 && Sensor4==1 && Sensor5==1 && Sensor6==1 && Sensor7==0)
	BTFSS       PORTD+0, 4 
	GOTO        L_lineFollowNormal3572
	BTFSS       PORTD+0, 5 
	GOTO        L_lineFollowNormal3572
	BTFSS       PORTD+0, 6 
	GOTO        L_lineFollowNormal3572
	BTFSS       PORTD+0, 7 
	GOTO        L_lineFollowNormal3572
	BTFSC       PORTB+0, 2 
	GOTO        L_lineFollowNormal3572
L__lineFollowNormal3697:
;Main 4.0V.c,391 :: 		moveForward(SLOW_PWM,FAST_PWM);
	MOVF        _SLOW_PWM+0, 0 
	MOVWF       FARG_moveForward_pwmLeft+0 
	MOVF        _SLOW_PWM+1, 0 
	MOVWF       FARG_moveForward_pwmLeft+1 
	MOVF        _FAST_PWM+0, 0 
	MOVWF       FARG_moveForward_pwmRight+0 
	MOVF        _FAST_PWM+1, 0 
	MOVWF       FARG_moveForward_pwmRight+1 
	CALL        _moveForward+0, 0
	GOTO        L_lineFollowNormal3573
L_lineFollowNormal3572:
;Main 4.0V.c,392 :: 		else if( Sensor3==0 && Sensor4==1 && Sensor5==1 && Sensor6==1 && Sensor7==1)
	BTFSC       PORTD+0, 4 
	GOTO        L_lineFollowNormal3576
	BTFSS       PORTD+0, 5 
	GOTO        L_lineFollowNormal3576
	BTFSS       PORTD+0, 6 
	GOTO        L_lineFollowNormal3576
	BTFSS       PORTD+0, 7 
	GOTO        L_lineFollowNormal3576
	BTFSS       PORTB+0, 2 
	GOTO        L_lineFollowNormal3576
L__lineFollowNormal3696:
;Main 4.0V.c,393 :: 		moveForward(FAST_PWM,SLOW_PWM);
	MOVF        _FAST_PWM+0, 0 
	MOVWF       FARG_moveForward_pwmLeft+0 
	MOVF        _FAST_PWM+1, 0 
	MOVWF       FARG_moveForward_pwmLeft+1 
	MOVF        _SLOW_PWM+0, 0 
	MOVWF       FARG_moveForward_pwmRight+0 
	MOVF        _SLOW_PWM+1, 0 
	MOVWF       FARG_moveForward_pwmRight+1 
	CALL        _moveForward+0, 0
	GOTO        L_lineFollowNormal3577
L_lineFollowNormal3576:
;Main 4.0V.c,396 :: 		else if( Sensor3==0 && Sensor4==1 && Sensor5==1 && Sensor6==0 && Sensor7==0)
	BTFSC       PORTD+0, 4 
	GOTO        L_lineFollowNormal3580
	BTFSS       PORTD+0, 5 
	GOTO        L_lineFollowNormal3580
	BTFSS       PORTD+0, 6 
	GOTO        L_lineFollowNormal3580
	BTFSC       PORTD+0, 7 
	GOTO        L_lineFollowNormal3580
	BTFSC       PORTB+0, 2 
	GOTO        L_lineFollowNormal3580
L__lineFollowNormal3695:
;Main 4.0V.c,397 :: 		moveForward(SLOW_PWM,FAST_PWM);
	MOVF        _SLOW_PWM+0, 0 
	MOVWF       FARG_moveForward_pwmLeft+0 
	MOVF        _SLOW_PWM+1, 0 
	MOVWF       FARG_moveForward_pwmLeft+1 
	MOVF        _FAST_PWM+0, 0 
	MOVWF       FARG_moveForward_pwmRight+0 
	MOVF        _FAST_PWM+1, 0 
	MOVWF       FARG_moveForward_pwmRight+1 
	CALL        _moveForward+0, 0
	GOTO        L_lineFollowNormal3581
L_lineFollowNormal3580:
;Main 4.0V.c,398 :: 		else if( Sensor3==0 && Sensor4==1 && Sensor5==1 && Sensor6==1 && Sensor7==0)
	BTFSC       PORTD+0, 4 
	GOTO        L_lineFollowNormal3584
	BTFSS       PORTD+0, 5 
	GOTO        L_lineFollowNormal3584
	BTFSS       PORTD+0, 6 
	GOTO        L_lineFollowNormal3584
	BTFSS       PORTD+0, 7 
	GOTO        L_lineFollowNormal3584
	BTFSC       PORTB+0, 2 
	GOTO        L_lineFollowNormal3584
L__lineFollowNormal3694:
;Main 4.0V.c,399 :: 		moveForward(FAST_PWM,FAST_PWM);
	MOVF        _FAST_PWM+0, 0 
	MOVWF       FARG_moveForward_pwmLeft+0 
	MOVF        _FAST_PWM+1, 0 
	MOVWF       FARG_moveForward_pwmLeft+1 
	MOVF        _FAST_PWM+0, 0 
	MOVWF       FARG_moveForward_pwmRight+0 
	MOVF        _FAST_PWM+1, 0 
	MOVWF       FARG_moveForward_pwmRight+1 
	CALL        _moveForward+0, 0
	GOTO        L_lineFollowNormal3585
L_lineFollowNormal3584:
;Main 4.0V.c,400 :: 		else if( Sensor3==0 && Sensor4==0 && Sensor5==1 && Sensor6==0 && Sensor7==0)
	BTFSC       PORTD+0, 4 
	GOTO        L_lineFollowNormal3588
	BTFSC       PORTD+0, 5 
	GOTO        L_lineFollowNormal3588
	BTFSS       PORTD+0, 6 
	GOTO        L_lineFollowNormal3588
	BTFSC       PORTD+0, 7 
	GOTO        L_lineFollowNormal3588
	BTFSC       PORTB+0, 2 
	GOTO        L_lineFollowNormal3588
L__lineFollowNormal3693:
;Main 4.0V.c,401 :: 		moveForward(FAST_PWM,FAST_PWM);
	MOVF        _FAST_PWM+0, 0 
	MOVWF       FARG_moveForward_pwmLeft+0 
	MOVF        _FAST_PWM+1, 0 
	MOVWF       FARG_moveForward_pwmLeft+1 
	MOVF        _FAST_PWM+0, 0 
	MOVWF       FARG_moveForward_pwmRight+0 
	MOVF        _FAST_PWM+1, 0 
	MOVWF       FARG_moveForward_pwmRight+1 
	CALL        _moveForward+0, 0
	GOTO        L_lineFollowNormal3589
L_lineFollowNormal3588:
;Main 4.0V.c,402 :: 		else if( Sensor3==0 && Sensor4==0 && Sensor5==1 && Sensor6==1 && Sensor7==0)
	BTFSC       PORTD+0, 4 
	GOTO        L_lineFollowNormal3592
	BTFSC       PORTD+0, 5 
	GOTO        L_lineFollowNormal3592
	BTFSS       PORTD+0, 6 
	GOTO        L_lineFollowNormal3592
	BTFSS       PORTD+0, 7 
	GOTO        L_lineFollowNormal3592
	BTFSC       PORTB+0, 2 
	GOTO        L_lineFollowNormal3592
L__lineFollowNormal3692:
;Main 4.0V.c,403 :: 		moveForward(FAST_PWM,SLOW_PWM);
	MOVF        _FAST_PWM+0, 0 
	MOVWF       FARG_moveForward_pwmLeft+0 
	MOVF        _FAST_PWM+1, 0 
	MOVWF       FARG_moveForward_pwmLeft+1 
	MOVF        _SLOW_PWM+0, 0 
	MOVWF       FARG_moveForward_pwmRight+0 
	MOVF        _SLOW_PWM+1, 0 
	MOVWF       FARG_moveForward_pwmRight+1 
	CALL        _moveForward+0, 0
	GOTO        L_lineFollowNormal3593
L_lineFollowNormal3592:
;Main 4.0V.c,406 :: 		else if(isAllWhite()){
	CALL        _isAllWhite+0, 0
	MOVF        R0, 0 
	IORWF       R1, 0 
	BTFSC       STATUS+0, 2 
	GOTO        L_lineFollowNormal3594
;Main 4.0V.c,409 :: 		reverse(FAST_PWM,FAST_PWM);
	MOVF        _FAST_PWM+0, 0 
	MOVWF       FARG_reverse_pwmLeft+0 
	MOVF        _FAST_PWM+1, 0 
	MOVWF       FARG_reverse_pwmLeft+1 
	MOVF        _FAST_PWM+0, 0 
	MOVWF       FARG_reverse_pwmRight+0 
	MOVF        _FAST_PWM+1, 0 
	MOVWF       FARG_reverse_pwmRight+1 
	CALL        _reverse+0, 0
;Main 4.0V.c,410 :: 		delay_ms(10);
	MOVLW       65
	MOVWF       R12, 0
	MOVLW       238
	MOVWF       R13, 0
L_lineFollowNormal3595:
	DECFSZ      R13, 1, 0
	BRA         L_lineFollowNormal3595
	DECFSZ      R12, 1, 0
	BRA         L_lineFollowNormal3595
	NOP
;Main 4.0V.c,411 :: 		sendSensorStatus();
	CALL        _sendSensorStatus+0, 0
;Main 4.0V.c,412 :: 		}
	GOTO        L_lineFollowNormal3596
L_lineFollowNormal3594:
;Main 4.0V.c,415 :: 		reverse(FAST_PWM,FAST_PWM);
	MOVF        _FAST_PWM+0, 0 
	MOVWF       FARG_reverse_pwmLeft+0 
	MOVF        _FAST_PWM+1, 0 
	MOVWF       FARG_reverse_pwmLeft+1 
	MOVF        _FAST_PWM+0, 0 
	MOVWF       FARG_reverse_pwmRight+0 
	MOVF        _FAST_PWM+1, 0 
	MOVWF       FARG_reverse_pwmRight+1 
	CALL        _reverse+0, 0
;Main 4.0V.c,416 :: 		delay_ms(10);
	MOVLW       65
	MOVWF       R12, 0
	MOVLW       238
	MOVWF       R13, 0
L_lineFollowNormal3597:
	DECFSZ      R13, 1, 0
	BRA         L_lineFollowNormal3597
	DECFSZ      R12, 1, 0
	BRA         L_lineFollowNormal3597
	NOP
;Main 4.0V.c,417 :: 		sendSensorStatus();
	CALL        _sendSensorStatus+0, 0
;Main 4.0V.c,419 :: 		}
L_lineFollowNormal3596:
L_lineFollowNormal3593:
L_lineFollowNormal3589:
L_lineFollowNormal3585:
L_lineFollowNormal3581:
L_lineFollowNormal3577:
L_lineFollowNormal3573:
L_lineFollowNormal3569:
L_lineFollowNormal3565:
L_lineFollowNormal3561:
L_lineFollowNormal3557:
L_lineFollowNormal3553:
L_lineFollowNormal3549:
L_lineFollowNormal3545:
L_lineFollowNormal3541:
L_lineFollowNormal3537:
L_lineFollowNormal3533:
L_lineFollowNormal3529:
L_lineFollowNormal3525:
L_lineFollowNormal3521:
L_lineFollowNormal3517:
;Main 4.0V.c,420 :: 		}
L_lineFollowNormal3513:
;Main 4.0V.c,421 :: 		}
	RETURN      0
; end of _lineFollowNormal3

_isOnThePath:

;Main 4.0V.c,423 :: 		int isOnThePath(){
;Main 4.0V.c,424 :: 		if(((Sensor3==0 && Sensor4==1 && Sensor5==1 && Sensor6==0 && Sensor7==0) || ( Sensor3==0 && Sensor4==1 && Sensor5==1 && Sensor6==1 && Sensor7==0) || ( Sensor3==0 && Sensor4==0 && Sensor5==1 && Sensor6==0 && Sensor7==0) || ( Sensor3==0 && Sensor4==0 && Sensor5==1 && Sensor6==1 && Sensor7==0)) && Sensor1==0 && Sensor2==0 && Sensor8==0 && Sensor9==0)
	BTFSC       PORTD+0, 4 
	GOTO        L__isOnThePath731
	BTFSS       PORTD+0, 5 
	GOTO        L__isOnThePath731
	BTFSS       PORTD+0, 6 
	GOTO        L__isOnThePath731
	BTFSC       PORTD+0, 7 
	GOTO        L__isOnThePath731
	BTFSC       PORTB+0, 2 
	GOTO        L__isOnThePath731
	GOTO        L__isOnThePath727
L__isOnThePath731:
	BTFSC       PORTD+0, 4 
	GOTO        L__isOnThePath730
	BTFSS       PORTD+0, 5 
	GOTO        L__isOnThePath730
	BTFSS       PORTD+0, 6 
	GOTO        L__isOnThePath730
	BTFSS       PORTD+0, 7 
	GOTO        L__isOnThePath730
	BTFSC       PORTB+0, 2 
	GOTO        L__isOnThePath730
	GOTO        L__isOnThePath727
L__isOnThePath730:
	BTFSC       PORTD+0, 4 
	GOTO        L__isOnThePath729
	BTFSC       PORTD+0, 5 
	GOTO        L__isOnThePath729
	BTFSS       PORTD+0, 6 
	GOTO        L__isOnThePath729
	BTFSC       PORTD+0, 7 
	GOTO        L__isOnThePath729
	BTFSC       PORTB+0, 2 
	GOTO        L__isOnThePath729
	GOTO        L__isOnThePath727
L__isOnThePath729:
	BTFSC       PORTD+0, 4 
	GOTO        L__isOnThePath728
	BTFSC       PORTD+0, 5 
	GOTO        L__isOnThePath728
	BTFSS       PORTD+0, 6 
	GOTO        L__isOnThePath728
	BTFSS       PORTD+0, 7 
	GOTO        L__isOnThePath728
	BTFSC       PORTB+0, 2 
	GOTO        L__isOnThePath728
	GOTO        L__isOnThePath727
L__isOnThePath728:
	GOTO        L_isOnThePath610
L__isOnThePath727:
	BTFSC       PORTB+0, 4 
	GOTO        L_isOnThePath610
	BTFSC       PORTB+0, 3 
	GOTO        L_isOnThePath610
	BTFSC       PORTB+0, 6 
	GOTO        L_isOnThePath610
	BTFSC       PORTB+0, 7 
	GOTO        L_isOnThePath610
L__isOnThePath726:
;Main 4.0V.c,425 :: 		return TRUE;
	MOVLW       1
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	RETURN      0
L_isOnThePath610:
;Main 4.0V.c,427 :: 		return FALSE;
	CLRF        R0 
	CLRF        R1 
;Main 4.0V.c,428 :: 		}
	RETURN      0
; end of _isOnThePath
