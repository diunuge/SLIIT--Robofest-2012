
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
L__isAllBlack523:
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
L__isAllWhite524:
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
;motion.h,67 :: 		motorLeft_foward(pwmLeft);
	MOVF        FARG_moveForward_pwmLeft+0, 0 
	MOVWF       FARG_motorLeft_foward_pwm+0 
	MOVF        FARG_moveForward_pwmLeft+1, 0 
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
	GOTO        L__rotateByDegree619
	MOVLW       166
	XORWF       FARG_rotateByDegree_degree+0, 0 
L__rotateByDegree619:
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
	GOTO        L__rotateByDegree620
	MOVLW       90
	XORWF       FARG_rotateByDegree_degree+0, 0 
L__rotateByDegree620:
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
	GOTO        L_rotateByDegree13
L_rotateByDegree11:
;motion.h,112 :: 		else if( degree == -30 ){
	MOVLW       255
	XORWF       FARG_rotateByDegree_degree+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__rotateByDegree621
	MOVLW       226
	XORWF       FARG_rotateByDegree_degree+0, 0 
L__rotateByDegree621:
	BTFSS       STATUS+0, 2 
	GOTO        L_rotateByDegree14
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
L_rotateByDegree15:
	DECFSZ      R13, 1, 0
	BRA         L_rotateByDegree15
	DECFSZ      R12, 1, 0
	BRA         L_rotateByDegree15
	DECFSZ      R11, 1, 0
	BRA         L_rotateByDegree15
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
L_rotateByDegree16:
	DECFSZ      R13, 1, 0
	BRA         L_rotateByDegree16
	DECFSZ      R12, 1, 0
	BRA         L_rotateByDegree16
	DECFSZ      R11, 1, 0
	BRA         L_rotateByDegree16
	NOP
	NOP
;motion.h,117 :: 		}
	GOTO        L_rotateByDegree17
L_rotateByDegree14:
;motion.h,118 :: 		else if( degree == 30 ){
	MOVLW       0
	XORWF       FARG_rotateByDegree_degree+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__rotateByDegree622
	MOVLW       30
	XORWF       FARG_rotateByDegree_degree+0, 0 
L__rotateByDegree622:
	BTFSS       STATUS+0, 2 
	GOTO        L_rotateByDegree18
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
L_rotateByDegree19:
	DECFSZ      R13, 1, 0
	BRA         L_rotateByDegree19
	DECFSZ      R12, 1, 0
	BRA         L_rotateByDegree19
	DECFSZ      R11, 1, 0
	BRA         L_rotateByDegree19
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
L_rotateByDegree20:
	DECFSZ      R13, 1, 0
	BRA         L_rotateByDegree20
	DECFSZ      R12, 1, 0
	BRA         L_rotateByDegree20
	DECFSZ      R11, 1, 0
	BRA         L_rotateByDegree20
	NOP
	NOP
;motion.h,123 :: 		}
	GOTO        L_rotateByDegree21
L_rotateByDegree18:
;motion.h,124 :: 		else if( degree == -60 ){
	MOVLW       255
	XORWF       FARG_rotateByDegree_degree+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__rotateByDegree623
	MOVLW       196
	XORWF       FARG_rotateByDegree_degree+0, 0 
L__rotateByDegree623:
	BTFSS       STATUS+0, 2 
	GOTO        L_rotateByDegree22
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
L_rotateByDegree23:
	DECFSZ      R13, 1, 0
	BRA         L_rotateByDegree23
	DECFSZ      R12, 1, 0
	BRA         L_rotateByDegree23
	DECFSZ      R11, 1, 0
	BRA         L_rotateByDegree23
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
L_rotateByDegree24:
	DECFSZ      R13, 1, 0
	BRA         L_rotateByDegree24
	DECFSZ      R12, 1, 0
	BRA         L_rotateByDegree24
	DECFSZ      R11, 1, 0
	BRA         L_rotateByDegree24
	NOP
	NOP
;motion.h,129 :: 		}
	GOTO        L_rotateByDegree25
L_rotateByDegree22:
;motion.h,130 :: 		else if( degree == 60 ){
	MOVLW       0
	XORWF       FARG_rotateByDegree_degree+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__rotateByDegree624
	MOVLW       60
	XORWF       FARG_rotateByDegree_degree+0, 0 
L__rotateByDegree624:
	BTFSS       STATUS+0, 2 
	GOTO        L_rotateByDegree26
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
L_rotateByDegree27:
	DECFSZ      R13, 1, 0
	BRA         L_rotateByDegree27
	DECFSZ      R12, 1, 0
	BRA         L_rotateByDegree27
	DECFSZ      R11, 1, 0
	BRA         L_rotateByDegree27
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
L_rotateByDegree28:
	DECFSZ      R13, 1, 0
	BRA         L_rotateByDegree28
	DECFSZ      R12, 1, 0
	BRA         L_rotateByDegree28
	DECFSZ      R11, 1, 0
	BRA         L_rotateByDegree28
	NOP
	NOP
;motion.h,135 :: 		}
	GOTO        L_rotateByDegree29
L_rotateByDegree26:
;motion.h,136 :: 		else if( degree == -45 ){
	MOVLW       255
	XORWF       FARG_rotateByDegree_degree+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__rotateByDegree625
	MOVLW       211
	XORWF       FARG_rotateByDegree_degree+0, 0 
L__rotateByDegree625:
	BTFSS       STATUS+0, 2 
	GOTO        L_rotateByDegree30
;motion.h,137 :: 		rotateAntiClockwise(255);
	MOVLW       255
	MOVWF       FARG_rotateAntiClockwise_pwm+0 
	MOVLW       0
	MOVWF       FARG_rotateAntiClockwise_pwm+1 
	CALL        _rotateAntiClockwise+0, 0
;motion.h,138 :: 		delay_ms(135);
	MOVLW       4
	MOVWF       R11, 0
	MOVLW       109
	MOVWF       R12, 0
	MOVLW       155
	MOVWF       R13, 0
L_rotateByDegree31:
	DECFSZ      R13, 1, 0
	BRA         L_rotateByDegree31
	DECFSZ      R12, 1, 0
	BRA         L_rotateByDegree31
	DECFSZ      R11, 1, 0
	BRA         L_rotateByDegree31
;motion.h,139 :: 		stop();
	CALL        _stop+0, 0
;motion.h,140 :: 		delay_ms(200);
	MOVLW       6
	MOVWF       R11, 0
	MOVLW       19
	MOVWF       R12, 0
	MOVLW       173
	MOVWF       R13, 0
L_rotateByDegree32:
	DECFSZ      R13, 1, 0
	BRA         L_rotateByDegree32
	DECFSZ      R12, 1, 0
	BRA         L_rotateByDegree32
	DECFSZ      R11, 1, 0
	BRA         L_rotateByDegree32
	NOP
	NOP
;motion.h,141 :: 		}
	GOTO        L_rotateByDegree33
L_rotateByDegree30:
;motion.h,142 :: 		else if( degree == 45 ){
	MOVLW       0
	XORWF       FARG_rotateByDegree_degree+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__rotateByDegree626
	MOVLW       45
	XORWF       FARG_rotateByDegree_degree+0, 0 
L__rotateByDegree626:
	BTFSS       STATUS+0, 2 
	GOTO        L_rotateByDegree34
;motion.h,143 :: 		rotateClockwise(255);
	MOVLW       255
	MOVWF       FARG_rotateClockwise_pwm+0 
	MOVLW       0
	MOVWF       FARG_rotateClockwise_pwm+1 
	CALL        _rotateClockwise+0, 0
;motion.h,144 :: 		delay_ms(135);
	MOVLW       4
	MOVWF       R11, 0
	MOVLW       109
	MOVWF       R12, 0
	MOVLW       155
	MOVWF       R13, 0
L_rotateByDegree35:
	DECFSZ      R13, 1, 0
	BRA         L_rotateByDegree35
	DECFSZ      R12, 1, 0
	BRA         L_rotateByDegree35
	DECFSZ      R11, 1, 0
	BRA         L_rotateByDegree35
;motion.h,145 :: 		stop();
	CALL        _stop+0, 0
;motion.h,146 :: 		delay_ms(200);
	MOVLW       6
	MOVWF       R11, 0
	MOVLW       19
	MOVWF       R12, 0
	MOVLW       173
	MOVWF       R13, 0
L_rotateByDegree36:
	DECFSZ      R13, 1, 0
	BRA         L_rotateByDegree36
	DECFSZ      R12, 1, 0
	BRA         L_rotateByDegree36
	DECFSZ      R11, 1, 0
	BRA         L_rotateByDegree36
	NOP
	NOP
;motion.h,147 :: 		}
L_rotateByDegree34:
L_rotateByDegree33:
L_rotateByDegree29:
L_rotateByDegree25:
L_rotateByDegree21:
L_rotateByDegree17:
L_rotateByDegree13:
L_rotateByDegree10:
;motion.h,148 :: 		}
	RETURN      0
; end of _rotateByDegree

_testMotion:

;motion.h,150 :: 		void testMotion(int pwm){
;motion.h,151 :: 		rotateClockwise(pwm);
	MOVF        FARG_testMotion_pwm+0, 0 
	MOVWF       FARG_rotateClockwise_pwm+0 
	MOVF        FARG_testMotion_pwm+1, 0 
	MOVWF       FARG_rotateClockwise_pwm+1 
	CALL        _rotateClockwise+0, 0
;motion.h,152 :: 		delay_ms(1000);
	MOVLW       26
	MOVWF       R11, 0
	MOVLW       94
	MOVWF       R12, 0
	MOVLW       110
	MOVWF       R13, 0
L_testMotion37:
	DECFSZ      R13, 1, 0
	BRA         L_testMotion37
	DECFSZ      R12, 1, 0
	BRA         L_testMotion37
	DECFSZ      R11, 1, 0
	BRA         L_testMotion37
	NOP
;motion.h,153 :: 		rotateAntiClockwise(pwm);
	MOVF        FARG_testMotion_pwm+0, 0 
	MOVWF       FARG_rotateAntiClockwise_pwm+0 
	MOVF        FARG_testMotion_pwm+1, 0 
	MOVWF       FARG_rotateAntiClockwise_pwm+1 
	CALL        _rotateAntiClockwise+0, 0
;motion.h,154 :: 		delay_ms(1000);
	MOVLW       26
	MOVWF       R11, 0
	MOVLW       94
	MOVWF       R12, 0
	MOVLW       110
	MOVWF       R13, 0
L_testMotion38:
	DECFSZ      R13, 1, 0
	BRA         L_testMotion38
	DECFSZ      R12, 1, 0
	BRA         L_testMotion38
	DECFSZ      R11, 1, 0
	BRA         L_testMotion38
	NOP
;motion.h,155 :: 		moveForward(pwm,pwm);
	MOVF        FARG_testMotion_pwm+0, 0 
	MOVWF       FARG_moveForward_pwmLeft+0 
	MOVF        FARG_testMotion_pwm+1, 0 
	MOVWF       FARG_moveForward_pwmLeft+1 
	MOVF        FARG_testMotion_pwm+0, 0 
	MOVWF       FARG_moveForward_pwmRight+0 
	MOVF        FARG_testMotion_pwm+1, 0 
	MOVWF       FARG_moveForward_pwmRight+1 
	CALL        _moveForward+0, 0
;motion.h,156 :: 		delay_ms(1000);
	MOVLW       26
	MOVWF       R11, 0
	MOVLW       94
	MOVWF       R12, 0
	MOVLW       110
	MOVWF       R13, 0
L_testMotion39:
	DECFSZ      R13, 1, 0
	BRA         L_testMotion39
	DECFSZ      R12, 1, 0
	BRA         L_testMotion39
	DECFSZ      R11, 1, 0
	BRA         L_testMotion39
	NOP
;motion.h,157 :: 		}
	RETURN      0
; end of _testMotion

_sendSensorStatus:

;debug.h,13 :: 		void sendSensorStatus(){
;debug.h,14 :: 		if( Sensor1 == 1){
	BTFSS       PORTB+0, 4 
	GOTO        L_sendSensorStatus40
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
	GOTO        L_sendSensorStatus41
L_sendSensorStatus40:
;debug.h,18 :: 		else if( Sensor1 == 0){
	BTFSC       PORTB+0, 4 
	GOTO        L_sendSensorStatus42
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
L_sendSensorStatus42:
L_sendSensorStatus41:
;debug.h,23 :: 		if( Sensor2 == 1){
	BTFSS       PORTB+0, 3 
	GOTO        L_sendSensorStatus43
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
	GOTO        L_sendSensorStatus44
L_sendSensorStatus43:
;debug.h,27 :: 		else if( Sensor2 == 0){
	BTFSC       PORTB+0, 3 
	GOTO        L_sendSensorStatus45
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
L_sendSensorStatus45:
L_sendSensorStatus44:
;debug.h,32 :: 		if( Sensor3 == 1){
	BTFSS       PORTD+0, 4 
	GOTO        L_sendSensorStatus46
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
	GOTO        L_sendSensorStatus47
L_sendSensorStatus46:
;debug.h,36 :: 		else if( Sensor3 == 0){
	BTFSC       PORTD+0, 4 
	GOTO        L_sendSensorStatus48
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
L_sendSensorStatus48:
L_sendSensorStatus47:
;debug.h,41 :: 		if( Sensor4 == 1){
	BTFSS       PORTD+0, 5 
	GOTO        L_sendSensorStatus49
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
	GOTO        L_sendSensorStatus50
L_sendSensorStatus49:
;debug.h,45 :: 		else if( Sensor4 == 0){
	BTFSC       PORTD+0, 5 
	GOTO        L_sendSensorStatus51
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
L_sendSensorStatus51:
L_sendSensorStatus50:
;debug.h,50 :: 		if( Sensor5 == 1){
	BTFSS       PORTD+0, 6 
	GOTO        L_sendSensorStatus52
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
	GOTO        L_sendSensorStatus53
L_sendSensorStatus52:
;debug.h,54 :: 		else if( Sensor5 == 0){
	BTFSC       PORTD+0, 6 
	GOTO        L_sendSensorStatus54
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
L_sendSensorStatus54:
L_sendSensorStatus53:
;debug.h,59 :: 		if( Sensor6 == 1){
	BTFSS       PORTD+0, 7 
	GOTO        L_sendSensorStatus55
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
	GOTO        L_sendSensorStatus56
L_sendSensorStatus55:
;debug.h,63 :: 		else if( Sensor6 == 0){
	BTFSC       PORTD+0, 7 
	GOTO        L_sendSensorStatus57
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
L_sendSensorStatus57:
L_sendSensorStatus56:
;debug.h,68 :: 		if( Sensor7 == 1){
	BTFSS       PORTB+0, 2 
	GOTO        L_sendSensorStatus58
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
	GOTO        L_sendSensorStatus59
L_sendSensorStatus58:
;debug.h,72 :: 		else if( Sensor7 == 0){
	BTFSC       PORTB+0, 2 
	GOTO        L_sendSensorStatus60
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
L_sendSensorStatus60:
L_sendSensorStatus59:
;debug.h,77 :: 		if( Sensor8 == 1){
	BTFSS       PORTB+0, 6 
	GOTO        L_sendSensorStatus61
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
	GOTO        L_sendSensorStatus62
L_sendSensorStatus61:
;debug.h,81 :: 		else if( Sensor8 == 0){
	BTFSC       PORTB+0, 6 
	GOTO        L_sendSensorStatus63
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
L_sendSensorStatus63:
L_sendSensorStatus62:
;debug.h,86 :: 		if( Sensor9 == 1){
	BTFSS       PORTB+0, 7 
	GOTO        L_sendSensorStatus64
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
	GOTO        L_sendSensorStatus65
L_sendSensorStatus64:
;debug.h,90 :: 		else if( Sensor9 == 0){
	BTFSC       PORTB+0, 7 
	GOTO        L_sendSensorStatus66
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
L_sendSensorStatus66:
L_sendSensorStatus65:
;debug.h,95 :: 		if( Scout == 1){
	BTFSS       PORTB+0, 5 
	GOTO        L_sendSensorStatus67
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
	GOTO        L_sendSensorStatus68
L_sendSensorStatus67:
;debug.h,99 :: 		else if( Scout == 0){
	BTFSC       PORTB+0, 5 
	GOTO        L_sendSensorStatus69
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
L_sendSensorStatus69:
L_sendSensorStatus68:
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
L_testPIC70:
	DECFSZ      R13, 1, 0
	BRA         L_testPIC70
	DECFSZ      R12, 1, 0
	BRA         L_testPIC70
	DECFSZ      R11, 1, 0
	BRA         L_testPIC70
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
L_testPIC71:
	DECFSZ      R13, 1, 0
	BRA         L_testPIC71
	DECFSZ      R12, 1, 0
	BRA         L_testPIC71
	DECFSZ      R11, 1, 0
	BRA         L_testPIC71
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
L_testPIC72:
	DECFSZ      R13, 1, 0
	BRA         L_testPIC72
	DECFSZ      R12, 1, 0
	BRA         L_testPIC72
	DECFSZ      R11, 1, 0
	BRA         L_testPIC72
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
L_testPIC73:
	MOVLW       128
	MOVWF       R0 
	MOVLW       128
	XORWF       _count+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__testPIC627
	MOVF        _count+0, 0 
	SUBLW       0
L__testPIC627:
	BTFSC       STATUS+0, 0 
	GOTO        L_testPIC74
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
L_testPIC76:
	DECFSZ      R13, 1, 0
	BRA         L_testPIC76
	DECFSZ      R12, 1, 0
	BRA         L_testPIC76
	DECFSZ      R11, 1, 0
	BRA         L_testPIC76
	NOP
	NOP
;debug.h,134 :: 		for( count=255; count>0; count--){
	MOVLW       1
	SUBWF       _count+0, 1 
	MOVLW       0
	SUBWFB      _count+1, 1 
;debug.h,139 :: 		}
	GOTO        L_testPIC73
L_testPIC74:
;debug.h,140 :: 		}
	RETURN      0
; end of _testPIC

_setPID:

;linefollow.h,18 :: 		void setPID(){
;linefollow.h,19 :: 		MIN_RPM = 215;       //155
	MOVLW       215
	MOVWF       _MIN_RPM+0 
	MOVLW       0
	MOVWF       _MIN_RPM+1 
;linefollow.h,20 :: 		MID_RPM = 235;
	MOVLW       235
	MOVWF       _MID_RPM+0 
	MOVLW       0
	MOVWF       _MID_RPM+1 
;linefollow.h,21 :: 		MAX_RPM = 255;
	MOVLW       255
	MOVWF       _MAX_RPM+0 
	MOVLW       0
	MOVWF       _MAX_RPM+1 
;linefollow.h,22 :: 		TEST_RPM = 200;
	MOVLW       200
	MOVWF       _TEST_RPM+0 
	MOVLW       0
	MOVWF       _TEST_RPM+1 
;linefollow.h,25 :: 		SLOW_PWM = 255;
	MOVLW       255
	MOVWF       _SLOW_PWM+0 
	MOVLW       0
	MOVWF       _SLOW_PWM+1 
;linefollow.h,26 :: 		MID_PWM = 200;
	MOVLW       200
	MOVWF       _MID_PWM+0 
	MOVLW       0
	MOVWF       _MID_PWM+1 
;linefollow.h,27 :: 		FAST_PWM = 255;
	MOVLW       255
	MOVWF       _FAST_PWM+0 
	MOVLW       0
	MOVWF       _FAST_PWM+1 
;linefollow.h,29 :: 		Kp = 2;
	MOVLW       0
	MOVWF       _Kp+0 
	MOVLW       0
	MOVWF       _Kp+1 
	MOVLW       0
	MOVWF       _Kp+2 
	MOVLW       128
	MOVWF       _Kp+3 
;linefollow.h,30 :: 		Ki = 0;
	CLRF        _Ki+0 
	CLRF        _Ki+1 
	CLRF        _Ki+2 
	CLRF        _Ki+3 
;linefollow.h,31 :: 		Kd = 0;
	CLRF        _Kd+0 
	CLRF        _Kd+1 
	CLRF        _Kd+2 
	CLRF        _Kd+3 
;linefollow.h,33 :: 		totalError = 0;
	CLRF        _totalError+0 
	CLRF        _totalError+1 
	CLRF        _totalError+2 
	CLRF        _totalError+3 
;linefollow.h,34 :: 		previousDeviation = 0;
	CLRF        _previousDeviation+0 
	CLRF        _previousDeviation+1 
;linefollow.h,35 :: 		PID_LeftRPM = 0;
	CLRF        _PID_LeftRPM+0 
	CLRF        _PID_LeftRPM+1 
;linefollow.h,36 :: 		PID_RightRPM = 0;
	CLRF        _PID_RightRPM+0 
	CLRF        _PID_RightRPM+1 
;linefollow.h,38 :: 		Pwm1_Set_Duty(MID_RPM);
	MOVLW       235
	MOVWF       FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;linefollow.h,39 :: 		Pwm2_Set_Duty(MID_RPM);
	MOVF        _MID_RPM+0, 0 
	MOVWF       FARG_PWM2_Set_Duty_new_duty+0 
	CALL        _PWM2_Set_Duty+0, 0
;linefollow.h,40 :: 		}
	RETURN      0
; end of _setPID

_lineFollowPID:

;linefollow.h,42 :: 		void lineFollowPID(){
;linefollow.h,65 :: 		if( Sensor3==1 && Sensor4==0 && Sensor5==0 && Sensor6==0 && Sensor7==0)
	BTFSS       PORTD+0, 4 
	GOTO        L_lineFollowPID79
	BTFSC       PORTD+0, 5 
	GOTO        L_lineFollowPID79
	BTFSC       PORTD+0, 6 
	GOTO        L_lineFollowPID79
	BTFSC       PORTD+0, 7 
	GOTO        L_lineFollowPID79
	BTFSC       PORTB+0, 2 
	GOTO        L_lineFollowPID79
L__lineFollowPID536:
;linefollow.h,66 :: 		deviation = 15;
	MOVLW       15
	MOVWF       _deviation+0 
	MOVLW       0
	MOVWF       _deviation+1 
L_lineFollowPID79:
;linefollow.h,67 :: 		if( Sensor3==1 && Sensor4==1 && Sensor5==0 && Sensor6==0 && Sensor7==0)
	BTFSS       PORTD+0, 4 
	GOTO        L_lineFollowPID82
	BTFSS       PORTD+0, 5 
	GOTO        L_lineFollowPID82
	BTFSC       PORTD+0, 6 
	GOTO        L_lineFollowPID82
	BTFSC       PORTD+0, 7 
	GOTO        L_lineFollowPID82
	BTFSC       PORTB+0, 2 
	GOTO        L_lineFollowPID82
L__lineFollowPID535:
;linefollow.h,68 :: 		deviation = 10;
	MOVLW       10
	MOVWF       _deviation+0 
	MOVLW       0
	MOVWF       _deviation+1 
L_lineFollowPID82:
;linefollow.h,69 :: 		if( Sensor3==1 && Sensor4==1 && Sensor5==1 && Sensor6==0 && Sensor7==0)
	BTFSS       PORTD+0, 4 
	GOTO        L_lineFollowPID85
	BTFSS       PORTD+0, 5 
	GOTO        L_lineFollowPID85
	BTFSS       PORTD+0, 6 
	GOTO        L_lineFollowPID85
	BTFSC       PORTD+0, 7 
	GOTO        L_lineFollowPID85
	BTFSC       PORTB+0, 2 
	GOTO        L_lineFollowPID85
L__lineFollowPID534:
;linefollow.h,70 :: 		deviation = 4;
	MOVLW       4
	MOVWF       _deviation+0 
	MOVLW       0
	MOVWF       _deviation+1 
L_lineFollowPID85:
;linefollow.h,71 :: 		if( Sensor3==0 && Sensor4==1 && Sensor5==0 && Sensor6==0 && Sensor7==0)
	BTFSC       PORTD+0, 4 
	GOTO        L_lineFollowPID88
	BTFSS       PORTD+0, 5 
	GOTO        L_lineFollowPID88
	BTFSC       PORTD+0, 6 
	GOTO        L_lineFollowPID88
	BTFSC       PORTD+0, 7 
	GOTO        L_lineFollowPID88
	BTFSC       PORTB+0, 2 
	GOTO        L_lineFollowPID88
L__lineFollowPID533:
;linefollow.h,72 :: 		deviation = 1;
	MOVLW       1
	MOVWF       _deviation+0 
	MOVLW       0
	MOVWF       _deviation+1 
L_lineFollowPID88:
;linefollow.h,74 :: 		if( Sensor3==0 && Sensor4==1 && Sensor5==1 && Sensor6==0 && Sensor7==0)
	BTFSC       PORTD+0, 4 
	GOTO        L_lineFollowPID91
	BTFSS       PORTD+0, 5 
	GOTO        L_lineFollowPID91
	BTFSS       PORTD+0, 6 
	GOTO        L_lineFollowPID91
	BTFSC       PORTD+0, 7 
	GOTO        L_lineFollowPID91
	BTFSC       PORTB+0, 2 
	GOTO        L_lineFollowPID91
L__lineFollowPID532:
;linefollow.h,75 :: 		deviation = 0;
	CLRF        _deviation+0 
	CLRF        _deviation+1 
L_lineFollowPID91:
;linefollow.h,76 :: 		if( Sensor3==0 && Sensor4==1 && Sensor5==1 && Sensor6==1 && Sensor7==0)
	BTFSC       PORTD+0, 4 
	GOTO        L_lineFollowPID94
	BTFSS       PORTD+0, 5 
	GOTO        L_lineFollowPID94
	BTFSS       PORTD+0, 6 
	GOTO        L_lineFollowPID94
	BTFSS       PORTD+0, 7 
	GOTO        L_lineFollowPID94
	BTFSC       PORTB+0, 2 
	GOTO        L_lineFollowPID94
L__lineFollowPID531:
;linefollow.h,77 :: 		deviation = 0;
	CLRF        _deviation+0 
	CLRF        _deviation+1 
L_lineFollowPID94:
;linefollow.h,78 :: 		if( Sensor3==0 && Sensor4==0 && Sensor5==1 && Sensor6==0 && Sensor7==0)
	BTFSC       PORTD+0, 4 
	GOTO        L_lineFollowPID97
	BTFSC       PORTD+0, 5 
	GOTO        L_lineFollowPID97
	BTFSS       PORTD+0, 6 
	GOTO        L_lineFollowPID97
	BTFSC       PORTD+0, 7 
	GOTO        L_lineFollowPID97
	BTFSC       PORTB+0, 2 
	GOTO        L_lineFollowPID97
L__lineFollowPID530:
;linefollow.h,79 :: 		deviation = 0;
	CLRF        _deviation+0 
	CLRF        _deviation+1 
L_lineFollowPID97:
;linefollow.h,80 :: 		if( Sensor3==0 && Sensor4==0 && Sensor5==1 && Sensor6==1 && Sensor7==0)
	BTFSC       PORTD+0, 4 
	GOTO        L_lineFollowPID100
	BTFSC       PORTD+0, 5 
	GOTO        L_lineFollowPID100
	BTFSS       PORTD+0, 6 
	GOTO        L_lineFollowPID100
	BTFSS       PORTD+0, 7 
	GOTO        L_lineFollowPID100
	BTFSC       PORTB+0, 2 
	GOTO        L_lineFollowPID100
L__lineFollowPID529:
;linefollow.h,81 :: 		deviation = 0;
	CLRF        _deviation+0 
	CLRF        _deviation+1 
L_lineFollowPID100:
;linefollow.h,83 :: 		if( Sensor3==0 && Sensor4==0 && Sensor5==0 && Sensor6==1 && Sensor7==0)
	BTFSC       PORTD+0, 4 
	GOTO        L_lineFollowPID103
	BTFSC       PORTD+0, 5 
	GOTO        L_lineFollowPID103
	BTFSC       PORTD+0, 6 
	GOTO        L_lineFollowPID103
	BTFSS       PORTD+0, 7 
	GOTO        L_lineFollowPID103
	BTFSC       PORTB+0, 2 
	GOTO        L_lineFollowPID103
L__lineFollowPID528:
;linefollow.h,84 :: 		deviation = -1;
	MOVLW       255
	MOVWF       _deviation+0 
	MOVLW       255
	MOVWF       _deviation+1 
L_lineFollowPID103:
;linefollow.h,85 :: 		if( Sensor3==0 && Sensor4==0 && Sensor5==1 && Sensor6==1 && Sensor7==1)
	BTFSC       PORTD+0, 4 
	GOTO        L_lineFollowPID106
	BTFSC       PORTD+0, 5 
	GOTO        L_lineFollowPID106
	BTFSS       PORTD+0, 6 
	GOTO        L_lineFollowPID106
	BTFSS       PORTD+0, 7 
	GOTO        L_lineFollowPID106
	BTFSS       PORTB+0, 2 
	GOTO        L_lineFollowPID106
L__lineFollowPID527:
;linefollow.h,86 :: 		deviation = -4;
	MOVLW       252
	MOVWF       _deviation+0 
	MOVLW       255
	MOVWF       _deviation+1 
L_lineFollowPID106:
;linefollow.h,87 :: 		if( Sensor3==0 && Sensor4==0 && Sensor5==0 && Sensor6==1 && Sensor7==1)
	BTFSC       PORTD+0, 4 
	GOTO        L_lineFollowPID109
	BTFSC       PORTD+0, 5 
	GOTO        L_lineFollowPID109
	BTFSC       PORTD+0, 6 
	GOTO        L_lineFollowPID109
	BTFSS       PORTD+0, 7 
	GOTO        L_lineFollowPID109
	BTFSS       PORTB+0, 2 
	GOTO        L_lineFollowPID109
L__lineFollowPID526:
;linefollow.h,88 :: 		deviation = -10;
	MOVLW       246
	MOVWF       _deviation+0 
	MOVLW       255
	MOVWF       _deviation+1 
L_lineFollowPID109:
;linefollow.h,89 :: 		if( Sensor3==0 && Sensor4==0 && Sensor5==0 && Sensor6==0 && Sensor7==1)
	BTFSC       PORTD+0, 4 
	GOTO        L_lineFollowPID112
	BTFSC       PORTD+0, 5 
	GOTO        L_lineFollowPID112
	BTFSC       PORTD+0, 6 
	GOTO        L_lineFollowPID112
	BTFSC       PORTD+0, 7 
	GOTO        L_lineFollowPID112
	BTFSS       PORTB+0, 2 
	GOTO        L_lineFollowPID112
L__lineFollowPID525:
;linefollow.h,90 :: 		deviation = -15;
	MOVLW       241
	MOVWF       _deviation+0 
	MOVLW       255
	MOVWF       _deviation+1 
L_lineFollowPID112:
;linefollow.h,92 :: 		correction =  Kp*deviation + Ki*totalError + Kd*(deviation-previousDeviation);
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
;linefollow.h,93 :: 		totalError += correction;
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
;linefollow.h,94 :: 		previousDeviation = deviation;
	MOVF        _deviation+0, 0 
	MOVWF       _previousDeviation+0 
	MOVF        _deviation+1, 0 
	MOVWF       _previousDeviation+1 
;linefollow.h,96 :: 		PID_LeftRPM = MID_RPM + correction;
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
	MOVWF       FLOC__lineFollowPID+0 
	MOVF        R1, 0 
	MOVWF       FLOC__lineFollowPID+1 
	MOVF        FLOC__lineFollowPID+0, 0 
	MOVWF       _PID_LeftRPM+0 
	MOVF        FLOC__lineFollowPID+1, 0 
	MOVWF       _PID_LeftRPM+1 
;linefollow.h,97 :: 		PID_RightRPM = MID_RPM - correction;
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
	MOVWF       _PID_RightRPM+0 
	MOVF        R1, 0 
	MOVWF       _PID_RightRPM+1 
;linefollow.h,99 :: 		moveForward(PID_LeftRPM, PID_RightRPM);
	MOVF        FLOC__lineFollowPID+0, 0 
	MOVWF       FARG_moveForward_pwmLeft+0 
	MOVF        FLOC__lineFollowPID+1, 0 
	MOVWF       FARG_moveForward_pwmLeft+1 
	MOVF        R0, 0 
	MOVWF       FARG_moveForward_pwmRight+0 
	MOVF        R1, 0 
	MOVWF       FARG_moveForward_pwmRight+1 
	CALL        _moveForward+0, 0
;linefollow.h,105 :: 		}
	RETURN      0
; end of _lineFollowPID

_lineFollowNormalWorked:

;linefollow.h,107 :: 		void lineFollowNormalWorked(){
;linefollow.h,108 :: 		if(Scout == 1){
	BTFSS       PORTB+0, 5 
	GOTO        L_lineFollowNormalWorked113
;linefollow.h,110 :: 		if( Sensor3==0 && Sensor4==1 && Sensor5==1 && Sensor6==0 && Sensor7==0)
	BTFSC       PORTD+0, 4 
	GOTO        L_lineFollowNormalWorked116
	BTFSS       PORTD+0, 5 
	GOTO        L_lineFollowNormalWorked116
	BTFSS       PORTD+0, 6 
	GOTO        L_lineFollowNormalWorked116
	BTFSC       PORTD+0, 7 
	GOTO        L_lineFollowNormalWorked116
	BTFSC       PORTB+0, 2 
	GOTO        L_lineFollowNormalWorked116
L__lineFollowNormalWorked571:
;linefollow.h,111 :: 		moveForward(SLOW_PWM,FAST_PWM);
	MOVF        _SLOW_PWM+0, 0 
	MOVWF       FARG_moveForward_pwmLeft+0 
	MOVF        _SLOW_PWM+1, 0 
	MOVWF       FARG_moveForward_pwmLeft+1 
	MOVF        _FAST_PWM+0, 0 
	MOVWF       FARG_moveForward_pwmRight+0 
	MOVF        _FAST_PWM+1, 0 
	MOVWF       FARG_moveForward_pwmRight+1 
	CALL        _moveForward+0, 0
	GOTO        L_lineFollowNormalWorked117
L_lineFollowNormalWorked116:
;linefollow.h,112 :: 		else if( Sensor3==0 && Sensor4==1 && Sensor5==1 && Sensor6==1 && Sensor7==0)
	BTFSC       PORTD+0, 4 
	GOTO        L_lineFollowNormalWorked120
	BTFSS       PORTD+0, 5 
	GOTO        L_lineFollowNormalWorked120
	BTFSS       PORTD+0, 6 
	GOTO        L_lineFollowNormalWorked120
	BTFSS       PORTD+0, 7 
	GOTO        L_lineFollowNormalWorked120
	BTFSC       PORTB+0, 2 
	GOTO        L_lineFollowNormalWorked120
L__lineFollowNormalWorked570:
;linefollow.h,113 :: 		moveForward(FAST_PWM,FAST_PWM);
	MOVF        _FAST_PWM+0, 0 
	MOVWF       FARG_moveForward_pwmLeft+0 
	MOVF        _FAST_PWM+1, 0 
	MOVWF       FARG_moveForward_pwmLeft+1 
	MOVF        _FAST_PWM+0, 0 
	MOVWF       FARG_moveForward_pwmRight+0 
	MOVF        _FAST_PWM+1, 0 
	MOVWF       FARG_moveForward_pwmRight+1 
	CALL        _moveForward+0, 0
	GOTO        L_lineFollowNormalWorked121
L_lineFollowNormalWorked120:
;linefollow.h,114 :: 		else if( Sensor3==0 && Sensor4==0 && Sensor5==1 && Sensor6==0 && Sensor7==0)
	BTFSC       PORTD+0, 4 
	GOTO        L_lineFollowNormalWorked124
	BTFSC       PORTD+0, 5 
	GOTO        L_lineFollowNormalWorked124
	BTFSS       PORTD+0, 6 
	GOTO        L_lineFollowNormalWorked124
	BTFSC       PORTD+0, 7 
	GOTO        L_lineFollowNormalWorked124
	BTFSC       PORTB+0, 2 
	GOTO        L_lineFollowNormalWorked124
L__lineFollowNormalWorked569:
;linefollow.h,115 :: 		moveForward(FAST_PWM,FAST_PWM);
	MOVF        _FAST_PWM+0, 0 
	MOVWF       FARG_moveForward_pwmLeft+0 
	MOVF        _FAST_PWM+1, 0 
	MOVWF       FARG_moveForward_pwmLeft+1 
	MOVF        _FAST_PWM+0, 0 
	MOVWF       FARG_moveForward_pwmRight+0 
	MOVF        _FAST_PWM+1, 0 
	MOVWF       FARG_moveForward_pwmRight+1 
	CALL        _moveForward+0, 0
	GOTO        L_lineFollowNormalWorked125
L_lineFollowNormalWorked124:
;linefollow.h,116 :: 		else if( Sensor3==0 && Sensor4==0 && Sensor5==1 && Sensor6==1 && Sensor7==0)
	BTFSC       PORTD+0, 4 
	GOTO        L_lineFollowNormalWorked128
	BTFSC       PORTD+0, 5 
	GOTO        L_lineFollowNormalWorked128
	BTFSS       PORTD+0, 6 
	GOTO        L_lineFollowNormalWorked128
	BTFSS       PORTD+0, 7 
	GOTO        L_lineFollowNormalWorked128
	BTFSC       PORTB+0, 2 
	GOTO        L_lineFollowNormalWorked128
L__lineFollowNormalWorked568:
;linefollow.h,117 :: 		moveForward(FAST_PWM,SLOW_PWM);
	MOVF        _FAST_PWM+0, 0 
	MOVWF       FARG_moveForward_pwmLeft+0 
	MOVF        _FAST_PWM+1, 0 
	MOVWF       FARG_moveForward_pwmLeft+1 
	MOVF        _SLOW_PWM+0, 0 
	MOVWF       FARG_moveForward_pwmRight+0 
	MOVF        _SLOW_PWM+1, 0 
	MOVWF       FARG_moveForward_pwmRight+1 
	CALL        _moveForward+0, 0
	GOTO        L_lineFollowNormalWorked129
L_lineFollowNormalWorked128:
;linefollow.h,122 :: 		else if( Sensor3==1 && Sensor4==0 && Sensor5==0 && Sensor6==0 && Sensor7==0)
	BTFSS       PORTD+0, 4 
	GOTO        L_lineFollowNormalWorked132
	BTFSC       PORTD+0, 5 
	GOTO        L_lineFollowNormalWorked132
	BTFSC       PORTD+0, 6 
	GOTO        L_lineFollowNormalWorked132
	BTFSC       PORTD+0, 7 
	GOTO        L_lineFollowNormalWorked132
	BTFSC       PORTB+0, 2 
	GOTO        L_lineFollowNormalWorked132
L__lineFollowNormalWorked567:
;linefollow.h,124 :: 		turnLeft(FAST_PWM);
	MOVF        _FAST_PWM+0, 0 
	MOVWF       FARG_turnLeft_pwmRight+0 
	MOVF        _FAST_PWM+1, 0 
	MOVWF       FARG_turnLeft_pwmRight+1 
	CALL        _turnLeft+0, 0
	GOTO        L_lineFollowNormalWorked133
L_lineFollowNormalWorked132:
;linefollow.h,125 :: 		else if( Sensor3==1 && Sensor4==1 && Sensor5==0 && Sensor6==0 && Sensor7==0)
	BTFSS       PORTD+0, 4 
	GOTO        L_lineFollowNormalWorked136
	BTFSS       PORTD+0, 5 
	GOTO        L_lineFollowNormalWorked136
	BTFSC       PORTD+0, 6 
	GOTO        L_lineFollowNormalWorked136
	BTFSC       PORTD+0, 7 
	GOTO        L_lineFollowNormalWorked136
	BTFSC       PORTB+0, 2 
	GOTO        L_lineFollowNormalWorked136
L__lineFollowNormalWorked566:
;linefollow.h,127 :: 		turnLeft(FAST_PWM);
	MOVF        _FAST_PWM+0, 0 
	MOVWF       FARG_turnLeft_pwmRight+0 
	MOVF        _FAST_PWM+1, 0 
	MOVWF       FARG_turnLeft_pwmRight+1 
	CALL        _turnLeft+0, 0
	GOTO        L_lineFollowNormalWorked137
L_lineFollowNormalWorked136:
;linefollow.h,128 :: 		else if( Sensor3==1 && Sensor4==1 && Sensor5==1 && Sensor6==0 && Sensor7==0)
	BTFSS       PORTD+0, 4 
	GOTO        L_lineFollowNormalWorked140
	BTFSS       PORTD+0, 5 
	GOTO        L_lineFollowNormalWorked140
	BTFSS       PORTD+0, 6 
	GOTO        L_lineFollowNormalWorked140
	BTFSC       PORTD+0, 7 
	GOTO        L_lineFollowNormalWorked140
	BTFSC       PORTB+0, 2 
	GOTO        L_lineFollowNormalWorked140
L__lineFollowNormalWorked565:
;linefollow.h,130 :: 		turnLeft(FAST_PWM);
	MOVF        _FAST_PWM+0, 0 
	MOVWF       FARG_turnLeft_pwmRight+0 
	MOVF        _FAST_PWM+1, 0 
	MOVWF       FARG_turnLeft_pwmRight+1 
	CALL        _turnLeft+0, 0
	GOTO        L_lineFollowNormalWorked141
L_lineFollowNormalWorked140:
;linefollow.h,131 :: 		else if( Sensor3==0 && Sensor4==1 && Sensor5==0 && Sensor6==0 && Sensor7==0)
	BTFSC       PORTD+0, 4 
	GOTO        L_lineFollowNormalWorked144
	BTFSS       PORTD+0, 5 
	GOTO        L_lineFollowNormalWorked144
	BTFSC       PORTD+0, 6 
	GOTO        L_lineFollowNormalWorked144
	BTFSC       PORTD+0, 7 
	GOTO        L_lineFollowNormalWorked144
	BTFSC       PORTB+0, 2 
	GOTO        L_lineFollowNormalWorked144
L__lineFollowNormalWorked564:
;linefollow.h,133 :: 		turnLeft(FAST_PWM);
	MOVF        _FAST_PWM+0, 0 
	MOVWF       FARG_turnLeft_pwmRight+0 
	MOVF        _FAST_PWM+1, 0 
	MOVWF       FARG_turnLeft_pwmRight+1 
	CALL        _turnLeft+0, 0
	GOTO        L_lineFollowNormalWorked145
L_lineFollowNormalWorked144:
;linefollow.h,136 :: 		else if( Sensor3==0 && Sensor4==0 && Sensor5==0 && Sensor6==1 && Sensor7==0)
	BTFSC       PORTD+0, 4 
	GOTO        L_lineFollowNormalWorked148
	BTFSC       PORTD+0, 5 
	GOTO        L_lineFollowNormalWorked148
	BTFSC       PORTD+0, 6 
	GOTO        L_lineFollowNormalWorked148
	BTFSS       PORTD+0, 7 
	GOTO        L_lineFollowNormalWorked148
	BTFSC       PORTB+0, 2 
	GOTO        L_lineFollowNormalWorked148
L__lineFollowNormalWorked563:
;linefollow.h,138 :: 		turnRight(FAST_PWM);
	MOVF        _FAST_PWM+0, 0 
	MOVWF       FARG_turnRight_pwmLeft+0 
	MOVF        _FAST_PWM+1, 0 
	MOVWF       FARG_turnRight_pwmLeft+1 
	CALL        _turnRight+0, 0
	GOTO        L_lineFollowNormalWorked149
L_lineFollowNormalWorked148:
;linefollow.h,139 :: 		else if( Sensor3==0 && Sensor4==0 && Sensor5==1 && Sensor6==1 && Sensor7==1)
	BTFSC       PORTD+0, 4 
	GOTO        L_lineFollowNormalWorked152
	BTFSC       PORTD+0, 5 
	GOTO        L_lineFollowNormalWorked152
	BTFSS       PORTD+0, 6 
	GOTO        L_lineFollowNormalWorked152
	BTFSS       PORTD+0, 7 
	GOTO        L_lineFollowNormalWorked152
	BTFSS       PORTB+0, 2 
	GOTO        L_lineFollowNormalWorked152
L__lineFollowNormalWorked562:
;linefollow.h,141 :: 		turnRight(FAST_PWM);
	MOVF        _FAST_PWM+0, 0 
	MOVWF       FARG_turnRight_pwmLeft+0 
	MOVF        _FAST_PWM+1, 0 
	MOVWF       FARG_turnRight_pwmLeft+1 
	CALL        _turnRight+0, 0
	GOTO        L_lineFollowNormalWorked153
L_lineFollowNormalWorked152:
;linefollow.h,142 :: 		else if( Sensor3==0 && Sensor4==0 && Sensor5==0 && Sensor6==1 && Sensor7==1)
	BTFSC       PORTD+0, 4 
	GOTO        L_lineFollowNormalWorked156
	BTFSC       PORTD+0, 5 
	GOTO        L_lineFollowNormalWorked156
	BTFSC       PORTD+0, 6 
	GOTO        L_lineFollowNormalWorked156
	BTFSS       PORTD+0, 7 
	GOTO        L_lineFollowNormalWorked156
	BTFSS       PORTB+0, 2 
	GOTO        L_lineFollowNormalWorked156
L__lineFollowNormalWorked561:
;linefollow.h,144 :: 		turnRight(FAST_PWM);
	MOVF        _FAST_PWM+0, 0 
	MOVWF       FARG_turnRight_pwmLeft+0 
	MOVF        _FAST_PWM+1, 0 
	MOVWF       FARG_turnRight_pwmLeft+1 
	CALL        _turnRight+0, 0
	GOTO        L_lineFollowNormalWorked157
L_lineFollowNormalWorked156:
;linefollow.h,145 :: 		else if( Sensor3==0 && Sensor4==0 && Sensor5==0 && Sensor6==0 && Sensor7==1)
	BTFSC       PORTD+0, 4 
	GOTO        L_lineFollowNormalWorked160
	BTFSC       PORTD+0, 5 
	GOTO        L_lineFollowNormalWorked160
	BTFSC       PORTD+0, 6 
	GOTO        L_lineFollowNormalWorked160
	BTFSC       PORTD+0, 7 
	GOTO        L_lineFollowNormalWorked160
	BTFSS       PORTB+0, 2 
	GOTO        L_lineFollowNormalWorked160
L__lineFollowNormalWorked560:
;linefollow.h,147 :: 		turnRight(FAST_PWM);
	MOVF        _FAST_PWM+0, 0 
	MOVWF       FARG_turnRight_pwmLeft+0 
	MOVF        _FAST_PWM+1, 0 
	MOVWF       FARG_turnRight_pwmLeft+1 
	CALL        _turnRight+0, 0
	GOTO        L_lineFollowNormalWorked161
L_lineFollowNormalWorked160:
;linefollow.h,150 :: 		else if( Sensor3==1 && Sensor4==1 && Sensor5==1 && Sensor6==1 && Sensor7==0)
	BTFSS       PORTD+0, 4 
	GOTO        L_lineFollowNormalWorked164
	BTFSS       PORTD+0, 5 
	GOTO        L_lineFollowNormalWorked164
	BTFSS       PORTD+0, 6 
	GOTO        L_lineFollowNormalWorked164
	BTFSS       PORTD+0, 7 
	GOTO        L_lineFollowNormalWorked164
	BTFSC       PORTB+0, 2 
	GOTO        L_lineFollowNormalWorked164
L__lineFollowNormalWorked559:
;linefollow.h,151 :: 		moveForward(FAST_PWM,FAST_PWM);
	MOVF        _FAST_PWM+0, 0 
	MOVWF       FARG_moveForward_pwmLeft+0 
	MOVF        _FAST_PWM+1, 0 
	MOVWF       FARG_moveForward_pwmLeft+1 
	MOVF        _FAST_PWM+0, 0 
	MOVWF       FARG_moveForward_pwmRight+0 
	MOVF        _FAST_PWM+1, 0 
	MOVWF       FARG_moveForward_pwmRight+1 
	CALL        _moveForward+0, 0
	GOTO        L_lineFollowNormalWorked165
L_lineFollowNormalWorked164:
;linefollow.h,152 :: 		else if( Sensor3==0 && Sensor4==1 && Sensor5==1 && Sensor6==1 && Sensor7==1)
	BTFSC       PORTD+0, 4 
	GOTO        L_lineFollowNormalWorked168
	BTFSS       PORTD+0, 5 
	GOTO        L_lineFollowNormalWorked168
	BTFSS       PORTD+0, 6 
	GOTO        L_lineFollowNormalWorked168
	BTFSS       PORTD+0, 7 
	GOTO        L_lineFollowNormalWorked168
	BTFSS       PORTB+0, 2 
	GOTO        L_lineFollowNormalWorked168
L__lineFollowNormalWorked558:
;linefollow.h,153 :: 		moveForward(FAST_PWM,FAST_PWM);
	MOVF        _FAST_PWM+0, 0 
	MOVWF       FARG_moveForward_pwmLeft+0 
	MOVF        _FAST_PWM+1, 0 
	MOVWF       FARG_moveForward_pwmLeft+1 
	MOVF        _FAST_PWM+0, 0 
	MOVWF       FARG_moveForward_pwmRight+0 
	MOVF        _FAST_PWM+1, 0 
	MOVWF       FARG_moveForward_pwmRight+1 
	CALL        _moveForward+0, 0
	GOTO        L_lineFollowNormalWorked169
L_lineFollowNormalWorked168:
;linefollow.h,155 :: 		else if(isAllBlack()){
	CALL        _isAllBlack+0, 0
	MOVF        R0, 0 
	IORWF       R1, 0 
	BTFSC       STATUS+0, 2 
	GOTO        L_lineFollowNormalWorked170
;linefollow.h,158 :: 		sendSensorStatus();
	CALL        _sendSensorStatus+0, 0
;linefollow.h,159 :: 		}
	GOTO        L_lineFollowNormalWorked171
L_lineFollowNormalWorked170:
;linefollow.h,162 :: 		reverse(220,220);
	MOVLW       220
	MOVWF       FARG_reverse_pwmLeft+0 
	MOVLW       0
	MOVWF       FARG_reverse_pwmLeft+1 
	MOVLW       220
	MOVWF       FARG_reverse_pwmRight+0 
	MOVLW       0
	MOVWF       FARG_reverse_pwmRight+1 
	CALL        _reverse+0, 0
;linefollow.h,163 :: 		sendSensorStatus();
	CALL        _sendSensorStatus+0, 0
;linefollow.h,165 :: 		}
L_lineFollowNormalWorked171:
L_lineFollowNormalWorked169:
L_lineFollowNormalWorked165:
L_lineFollowNormalWorked161:
L_lineFollowNormalWorked157:
L_lineFollowNormalWorked153:
L_lineFollowNormalWorked149:
L_lineFollowNormalWorked145:
L_lineFollowNormalWorked141:
L_lineFollowNormalWorked137:
L_lineFollowNormalWorked133:
L_lineFollowNormalWorked129:
L_lineFollowNormalWorked125:
L_lineFollowNormalWorked121:
L_lineFollowNormalWorked117:
;linefollow.h,166 :: 		}
	GOTO        L_lineFollowNormalWorked172
L_lineFollowNormalWorked113:
;linefollow.h,173 :: 		if( Sensor1==1 && Sensor2==1 && Sensor3==1 && Sensor4==1 && Sensor5==1 && Sensor6==0 && Sensor7==0 && Sensor8==0 && Sensor9==0)
	BTFSS       PORTB+0, 4 
	GOTO        L_lineFollowNormalWorked175
	BTFSS       PORTB+0, 3 
	GOTO        L_lineFollowNormalWorked175
	BTFSS       PORTD+0, 4 
	GOTO        L_lineFollowNormalWorked175
	BTFSS       PORTD+0, 5 
	GOTO        L_lineFollowNormalWorked175
	BTFSS       PORTD+0, 6 
	GOTO        L_lineFollowNormalWorked175
	BTFSC       PORTD+0, 7 
	GOTO        L_lineFollowNormalWorked175
	BTFSC       PORTB+0, 2 
	GOTO        L_lineFollowNormalWorked175
	BTFSC       PORTB+0, 6 
	GOTO        L_lineFollowNormalWorked175
	BTFSC       PORTB+0, 7 
	GOTO        L_lineFollowNormalWorked175
L__lineFollowNormalWorked557:
;linefollow.h,174 :: 		rotateByDegree(-90);
	MOVLW       166
	MOVWF       FARG_rotateByDegree_degree+0 
	MOVLW       255
	MOVWF       FARG_rotateByDegree_degree+1 
	CALL        _rotateByDegree+0, 0
	GOTO        L_lineFollowNormalWorked176
L_lineFollowNormalWorked175:
;linefollow.h,175 :: 		else if( Sensor1==1 && Sensor2==1 && Sensor3==1 && Sensor4==1 && Sensor5==1 && Sensor6==1 && Sensor7==0 && Sensor8==0 && Sensor9==0)
	BTFSS       PORTB+0, 4 
	GOTO        L_lineFollowNormalWorked179
	BTFSS       PORTB+0, 3 
	GOTO        L_lineFollowNormalWorked179
	BTFSS       PORTD+0, 4 
	GOTO        L_lineFollowNormalWorked179
	BTFSS       PORTD+0, 5 
	GOTO        L_lineFollowNormalWorked179
	BTFSS       PORTD+0, 6 
	GOTO        L_lineFollowNormalWorked179
	BTFSS       PORTD+0, 7 
	GOTO        L_lineFollowNormalWorked179
	BTFSC       PORTB+0, 2 
	GOTO        L_lineFollowNormalWorked179
	BTFSC       PORTB+0, 6 
	GOTO        L_lineFollowNormalWorked179
	BTFSC       PORTB+0, 7 
	GOTO        L_lineFollowNormalWorked179
L__lineFollowNormalWorked556:
;linefollow.h,176 :: 		rotateByDegree(-90);
	MOVLW       166
	MOVWF       FARG_rotateByDegree_degree+0 
	MOVLW       255
	MOVWF       FARG_rotateByDegree_degree+1 
	CALL        _rotateByDegree+0, 0
	GOTO        L_lineFollowNormalWorked180
L_lineFollowNormalWorked179:
;linefollow.h,177 :: 		else if( Sensor1==1 && Sensor2==1 && Sensor3==1 && Sensor4==1 && Sensor5==1 && Sensor6==1 && Sensor7==1 && Sensor8==0 && Sensor9==0)
	BTFSS       PORTB+0, 4 
	GOTO        L_lineFollowNormalWorked183
	BTFSS       PORTB+0, 3 
	GOTO        L_lineFollowNormalWorked183
	BTFSS       PORTD+0, 4 
	GOTO        L_lineFollowNormalWorked183
	BTFSS       PORTD+0, 5 
	GOTO        L_lineFollowNormalWorked183
	BTFSS       PORTD+0, 6 
	GOTO        L_lineFollowNormalWorked183
	BTFSS       PORTD+0, 7 
	GOTO        L_lineFollowNormalWorked183
	BTFSS       PORTB+0, 2 
	GOTO        L_lineFollowNormalWorked183
	BTFSC       PORTB+0, 6 
	GOTO        L_lineFollowNormalWorked183
	BTFSC       PORTB+0, 7 
	GOTO        L_lineFollowNormalWorked183
L__lineFollowNormalWorked555:
;linefollow.h,178 :: 		rotateByDegree(-90);
	MOVLW       166
	MOVWF       FARG_rotateByDegree_degree+0 
	MOVLW       255
	MOVWF       FARG_rotateByDegree_degree+1 
	CALL        _rotateByDegree+0, 0
	GOTO        L_lineFollowNormalWorked184
L_lineFollowNormalWorked183:
;linefollow.h,181 :: 		else if( Sensor1==0 && Sensor2==0 && Sensor3==1 && Sensor4==1 && Sensor5==1 && Sensor6==1 && Sensor7==1 && Sensor8==1 && Sensor9==1)
	BTFSC       PORTB+0, 4 
	GOTO        L_lineFollowNormalWorked187
	BTFSC       PORTB+0, 3 
	GOTO        L_lineFollowNormalWorked187
	BTFSS       PORTD+0, 4 
	GOTO        L_lineFollowNormalWorked187
	BTFSS       PORTD+0, 5 
	GOTO        L_lineFollowNormalWorked187
	BTFSS       PORTD+0, 6 
	GOTO        L_lineFollowNormalWorked187
	BTFSS       PORTD+0, 7 
	GOTO        L_lineFollowNormalWorked187
	BTFSS       PORTB+0, 2 
	GOTO        L_lineFollowNormalWorked187
	BTFSS       PORTB+0, 6 
	GOTO        L_lineFollowNormalWorked187
	BTFSS       PORTB+0, 7 
	GOTO        L_lineFollowNormalWorked187
L__lineFollowNormalWorked554:
;linefollow.h,182 :: 		rotateByDegree(90);
	MOVLW       90
	MOVWF       FARG_rotateByDegree_degree+0 
	MOVLW       0
	MOVWF       FARG_rotateByDegree_degree+1 
	CALL        _rotateByDegree+0, 0
	GOTO        L_lineFollowNormalWorked188
L_lineFollowNormalWorked187:
;linefollow.h,183 :: 		else if( Sensor1==0 && Sensor2==0 && Sensor3==0 && Sensor4==1 && Sensor5==1 && Sensor6==1 && Sensor7==1 && Sensor8==1 && Sensor9==1)
	BTFSC       PORTB+0, 4 
	GOTO        L_lineFollowNormalWorked191
	BTFSC       PORTB+0, 3 
	GOTO        L_lineFollowNormalWorked191
	BTFSC       PORTD+0, 4 
	GOTO        L_lineFollowNormalWorked191
	BTFSS       PORTD+0, 5 
	GOTO        L_lineFollowNormalWorked191
	BTFSS       PORTD+0, 6 
	GOTO        L_lineFollowNormalWorked191
	BTFSS       PORTD+0, 7 
	GOTO        L_lineFollowNormalWorked191
	BTFSS       PORTB+0, 2 
	GOTO        L_lineFollowNormalWorked191
	BTFSS       PORTB+0, 6 
	GOTO        L_lineFollowNormalWorked191
	BTFSS       PORTB+0, 7 
	GOTO        L_lineFollowNormalWorked191
L__lineFollowNormalWorked553:
;linefollow.h,184 :: 		rotateByDegree(90);
	MOVLW       90
	MOVWF       FARG_rotateByDegree_degree+0 
	MOVLW       0
	MOVWF       FARG_rotateByDegree_degree+1 
	CALL        _rotateByDegree+0, 0
	GOTO        L_lineFollowNormalWorked192
L_lineFollowNormalWorked191:
;linefollow.h,185 :: 		else if( Sensor1==0 && Sensor2==0 && Sensor3==0 && Sensor4==0 && Sensor5==1 && Sensor6==1 && Sensor7==1 && Sensor8==1 && Sensor9==1)
	BTFSC       PORTB+0, 4 
	GOTO        L_lineFollowNormalWorked195
	BTFSC       PORTB+0, 3 
	GOTO        L_lineFollowNormalWorked195
	BTFSC       PORTD+0, 4 
	GOTO        L_lineFollowNormalWorked195
	BTFSC       PORTD+0, 5 
	GOTO        L_lineFollowNormalWorked195
	BTFSS       PORTD+0, 6 
	GOTO        L_lineFollowNormalWorked195
	BTFSS       PORTD+0, 7 
	GOTO        L_lineFollowNormalWorked195
	BTFSS       PORTB+0, 2 
	GOTO        L_lineFollowNormalWorked195
	BTFSS       PORTB+0, 6 
	GOTO        L_lineFollowNormalWorked195
	BTFSS       PORTB+0, 7 
	GOTO        L_lineFollowNormalWorked195
L__lineFollowNormalWorked552:
;linefollow.h,186 :: 		rotateByDegree(90);
	MOVLW       90
	MOVWF       FARG_rotateByDegree_degree+0 
	MOVLW       0
	MOVWF       FARG_rotateByDegree_degree+1 
	CALL        _rotateByDegree+0, 0
	GOTO        L_lineFollowNormalWorked196
L_lineFollowNormalWorked195:
;linefollow.h,191 :: 		else if( Sensor3==1 && Sensor4==0 && Sensor5==0 && Sensor6==0 && Sensor7==0)
	BTFSS       PORTD+0, 4 
	GOTO        L_lineFollowNormalWorked199
	BTFSC       PORTD+0, 5 
	GOTO        L_lineFollowNormalWorked199
	BTFSC       PORTD+0, 6 
	GOTO        L_lineFollowNormalWorked199
	BTFSC       PORTD+0, 7 
	GOTO        L_lineFollowNormalWorked199
	BTFSC       PORTB+0, 2 
	GOTO        L_lineFollowNormalWorked199
L__lineFollowNormalWorked551:
;linefollow.h,193 :: 		turnLeft(FAST_PWM);
	MOVF        _FAST_PWM+0, 0 
	MOVWF       FARG_turnLeft_pwmRight+0 
	MOVF        _FAST_PWM+1, 0 
	MOVWF       FARG_turnLeft_pwmRight+1 
	CALL        _turnLeft+0, 0
	GOTO        L_lineFollowNormalWorked200
L_lineFollowNormalWorked199:
;linefollow.h,194 :: 		else if( Sensor3==1 && Sensor4==1 && Sensor5==0 && Sensor6==0 && Sensor7==0)
	BTFSS       PORTD+0, 4 
	GOTO        L_lineFollowNormalWorked203
	BTFSS       PORTD+0, 5 
	GOTO        L_lineFollowNormalWorked203
	BTFSC       PORTD+0, 6 
	GOTO        L_lineFollowNormalWorked203
	BTFSC       PORTD+0, 7 
	GOTO        L_lineFollowNormalWorked203
	BTFSC       PORTB+0, 2 
	GOTO        L_lineFollowNormalWorked203
L__lineFollowNormalWorked550:
;linefollow.h,196 :: 		turnLeft(FAST_PWM);
	MOVF        _FAST_PWM+0, 0 
	MOVWF       FARG_turnLeft_pwmRight+0 
	MOVF        _FAST_PWM+1, 0 
	MOVWF       FARG_turnLeft_pwmRight+1 
	CALL        _turnLeft+0, 0
	GOTO        L_lineFollowNormalWorked204
L_lineFollowNormalWorked203:
;linefollow.h,197 :: 		else if( Sensor3==1 && Sensor4==1 && Sensor5==1 && Sensor6==0 && Sensor7==0)
	BTFSS       PORTD+0, 4 
	GOTO        L_lineFollowNormalWorked207
	BTFSS       PORTD+0, 5 
	GOTO        L_lineFollowNormalWorked207
	BTFSS       PORTD+0, 6 
	GOTO        L_lineFollowNormalWorked207
	BTFSC       PORTD+0, 7 
	GOTO        L_lineFollowNormalWorked207
	BTFSC       PORTB+0, 2 
	GOTO        L_lineFollowNormalWorked207
L__lineFollowNormalWorked549:
;linefollow.h,199 :: 		turnLeft(FAST_PWM);
	MOVF        _FAST_PWM+0, 0 
	MOVWF       FARG_turnLeft_pwmRight+0 
	MOVF        _FAST_PWM+1, 0 
	MOVWF       FARG_turnLeft_pwmRight+1 
	CALL        _turnLeft+0, 0
	GOTO        L_lineFollowNormalWorked208
L_lineFollowNormalWorked207:
;linefollow.h,200 :: 		else if( Sensor3==0 && Sensor4==1 && Sensor5==0 && Sensor6==0 && Sensor7==0)
	BTFSC       PORTD+0, 4 
	GOTO        L_lineFollowNormalWorked211
	BTFSS       PORTD+0, 5 
	GOTO        L_lineFollowNormalWorked211
	BTFSC       PORTD+0, 6 
	GOTO        L_lineFollowNormalWorked211
	BTFSC       PORTD+0, 7 
	GOTO        L_lineFollowNormalWorked211
	BTFSC       PORTB+0, 2 
	GOTO        L_lineFollowNormalWorked211
L__lineFollowNormalWorked548:
;linefollow.h,202 :: 		turnLeft(FAST_PWM);
	MOVF        _FAST_PWM+0, 0 
	MOVWF       FARG_turnLeft_pwmRight+0 
	MOVF        _FAST_PWM+1, 0 
	MOVWF       FARG_turnLeft_pwmRight+1 
	CALL        _turnLeft+0, 0
	GOTO        L_lineFollowNormalWorked212
L_lineFollowNormalWorked211:
;linefollow.h,205 :: 		else if( Sensor3==0 && Sensor4==0 && Sensor5==0 && Sensor6==1 && Sensor7==0)
	BTFSC       PORTD+0, 4 
	GOTO        L_lineFollowNormalWorked215
	BTFSC       PORTD+0, 5 
	GOTO        L_lineFollowNormalWorked215
	BTFSC       PORTD+0, 6 
	GOTO        L_lineFollowNormalWorked215
	BTFSS       PORTD+0, 7 
	GOTO        L_lineFollowNormalWorked215
	BTFSC       PORTB+0, 2 
	GOTO        L_lineFollowNormalWorked215
L__lineFollowNormalWorked547:
;linefollow.h,207 :: 		turnRight(FAST_PWM);
	MOVF        _FAST_PWM+0, 0 
	MOVWF       FARG_turnRight_pwmLeft+0 
	MOVF        _FAST_PWM+1, 0 
	MOVWF       FARG_turnRight_pwmLeft+1 
	CALL        _turnRight+0, 0
	GOTO        L_lineFollowNormalWorked216
L_lineFollowNormalWorked215:
;linefollow.h,208 :: 		else if( Sensor3==0 && Sensor4==0 && Sensor5==1 && Sensor6==1 && Sensor7==1)
	BTFSC       PORTD+0, 4 
	GOTO        L_lineFollowNormalWorked219
	BTFSC       PORTD+0, 5 
	GOTO        L_lineFollowNormalWorked219
	BTFSS       PORTD+0, 6 
	GOTO        L_lineFollowNormalWorked219
	BTFSS       PORTD+0, 7 
	GOTO        L_lineFollowNormalWorked219
	BTFSS       PORTB+0, 2 
	GOTO        L_lineFollowNormalWorked219
L__lineFollowNormalWorked546:
;linefollow.h,210 :: 		turnRight(FAST_PWM);
	MOVF        _FAST_PWM+0, 0 
	MOVWF       FARG_turnRight_pwmLeft+0 
	MOVF        _FAST_PWM+1, 0 
	MOVWF       FARG_turnRight_pwmLeft+1 
	CALL        _turnRight+0, 0
	GOTO        L_lineFollowNormalWorked220
L_lineFollowNormalWorked219:
;linefollow.h,211 :: 		else if( Sensor3==0 && Sensor4==0 && Sensor5==0 && Sensor6==1 && Sensor7==1)
	BTFSC       PORTD+0, 4 
	GOTO        L_lineFollowNormalWorked223
	BTFSC       PORTD+0, 5 
	GOTO        L_lineFollowNormalWorked223
	BTFSC       PORTD+0, 6 
	GOTO        L_lineFollowNormalWorked223
	BTFSS       PORTD+0, 7 
	GOTO        L_lineFollowNormalWorked223
	BTFSS       PORTB+0, 2 
	GOTO        L_lineFollowNormalWorked223
L__lineFollowNormalWorked545:
;linefollow.h,213 :: 		turnRight(FAST_PWM);
	MOVF        _FAST_PWM+0, 0 
	MOVWF       FARG_turnRight_pwmLeft+0 
	MOVF        _FAST_PWM+1, 0 
	MOVWF       FARG_turnRight_pwmLeft+1 
	CALL        _turnRight+0, 0
	GOTO        L_lineFollowNormalWorked224
L_lineFollowNormalWorked223:
;linefollow.h,214 :: 		else if( Sensor3==0 && Sensor4==0 && Sensor5==0 && Sensor6==0 && Sensor7==1)
	BTFSC       PORTD+0, 4 
	GOTO        L_lineFollowNormalWorked227
	BTFSC       PORTD+0, 5 
	GOTO        L_lineFollowNormalWorked227
	BTFSC       PORTD+0, 6 
	GOTO        L_lineFollowNormalWorked227
	BTFSC       PORTD+0, 7 
	GOTO        L_lineFollowNormalWorked227
	BTFSS       PORTB+0, 2 
	GOTO        L_lineFollowNormalWorked227
L__lineFollowNormalWorked544:
;linefollow.h,216 :: 		turnRight(FAST_PWM);
	MOVF        _FAST_PWM+0, 0 
	MOVWF       FARG_turnRight_pwmLeft+0 
	MOVF        _FAST_PWM+1, 0 
	MOVWF       FARG_turnRight_pwmLeft+1 
	CALL        _turnRight+0, 0
	GOTO        L_lineFollowNormalWorked228
L_lineFollowNormalWorked227:
;linefollow.h,219 :: 		else if( Sensor3==1 && Sensor4==1 && Sensor5==1 && Sensor6==1 && Sensor7==0)
	BTFSS       PORTD+0, 4 
	GOTO        L_lineFollowNormalWorked231
	BTFSS       PORTD+0, 5 
	GOTO        L_lineFollowNormalWorked231
	BTFSS       PORTD+0, 6 
	GOTO        L_lineFollowNormalWorked231
	BTFSS       PORTD+0, 7 
	GOTO        L_lineFollowNormalWorked231
	BTFSC       PORTB+0, 2 
	GOTO        L_lineFollowNormalWorked231
L__lineFollowNormalWorked543:
;linefollow.h,220 :: 		moveForward(SLOW_PWM,FAST_PWM);
	MOVF        _SLOW_PWM+0, 0 
	MOVWF       FARG_moveForward_pwmLeft+0 
	MOVF        _SLOW_PWM+1, 0 
	MOVWF       FARG_moveForward_pwmLeft+1 
	MOVF        _FAST_PWM+0, 0 
	MOVWF       FARG_moveForward_pwmRight+0 
	MOVF        _FAST_PWM+1, 0 
	MOVWF       FARG_moveForward_pwmRight+1 
	CALL        _moveForward+0, 0
	GOTO        L_lineFollowNormalWorked232
L_lineFollowNormalWorked231:
;linefollow.h,221 :: 		else if( Sensor3==0 && Sensor4==1 && Sensor5==1 && Sensor6==1 && Sensor7==1)
	BTFSC       PORTD+0, 4 
	GOTO        L_lineFollowNormalWorked235
	BTFSS       PORTD+0, 5 
	GOTO        L_lineFollowNormalWorked235
	BTFSS       PORTD+0, 6 
	GOTO        L_lineFollowNormalWorked235
	BTFSS       PORTD+0, 7 
	GOTO        L_lineFollowNormalWorked235
	BTFSS       PORTB+0, 2 
	GOTO        L_lineFollowNormalWorked235
L__lineFollowNormalWorked542:
;linefollow.h,222 :: 		moveForward(FAST_PWM,SLOW_PWM);
	MOVF        _FAST_PWM+0, 0 
	MOVWF       FARG_moveForward_pwmLeft+0 
	MOVF        _FAST_PWM+1, 0 
	MOVWF       FARG_moveForward_pwmLeft+1 
	MOVF        _SLOW_PWM+0, 0 
	MOVWF       FARG_moveForward_pwmRight+0 
	MOVF        _SLOW_PWM+1, 0 
	MOVWF       FARG_moveForward_pwmRight+1 
	CALL        _moveForward+0, 0
	GOTO        L_lineFollowNormalWorked236
L_lineFollowNormalWorked235:
;linefollow.h,223 :: 		else if( Sensor2==1 && Sensor3==1 && Sensor4==1 && Sensor5==0 && Sensor6==1 && Sensor7==1 && Sensor8==1)
	BTFSS       PORTB+0, 3 
	GOTO        L_lineFollowNormalWorked239
	BTFSS       PORTD+0, 4 
	GOTO        L_lineFollowNormalWorked239
	BTFSS       PORTD+0, 5 
	GOTO        L_lineFollowNormalWorked239
	BTFSC       PORTD+0, 6 
	GOTO        L_lineFollowNormalWorked239
	BTFSS       PORTD+0, 7 
	GOTO        L_lineFollowNormalWorked239
	BTFSS       PORTB+0, 2 
	GOTO        L_lineFollowNormalWorked239
	BTFSS       PORTB+0, 6 
	GOTO        L_lineFollowNormalWorked239
L__lineFollowNormalWorked541:
;linefollow.h,224 :: 		while(Scout==0)
L_lineFollowNormalWorked240:
	BTFSC       PORTB+0, 5 
	GOTO        L_lineFollowNormalWorked241
;linefollow.h,225 :: 		rotateAntiClockwise(255);
	MOVLW       255
	MOVWF       FARG_rotateAntiClockwise_pwm+0 
	MOVLW       0
	MOVWF       FARG_rotateAntiClockwise_pwm+1 
	CALL        _rotateAntiClockwise+0, 0
	GOTO        L_lineFollowNormalWorked240
L_lineFollowNormalWorked241:
	GOTO        L_lineFollowNormalWorked242
L_lineFollowNormalWorked239:
;linefollow.h,228 :: 		else if( Sensor3==0 && Sensor4==1 && Sensor5==1 && Sensor6==0 && Sensor7==0)
	BTFSC       PORTD+0, 4 
	GOTO        L_lineFollowNormalWorked245
	BTFSS       PORTD+0, 5 
	GOTO        L_lineFollowNormalWorked245
	BTFSS       PORTD+0, 6 
	GOTO        L_lineFollowNormalWorked245
	BTFSC       PORTD+0, 7 
	GOTO        L_lineFollowNormalWorked245
	BTFSC       PORTB+0, 2 
	GOTO        L_lineFollowNormalWorked245
L__lineFollowNormalWorked540:
;linefollow.h,229 :: 		moveForward(SLOW_PWM,FAST_PWM);
	MOVF        _SLOW_PWM+0, 0 
	MOVWF       FARG_moveForward_pwmLeft+0 
	MOVF        _SLOW_PWM+1, 0 
	MOVWF       FARG_moveForward_pwmLeft+1 
	MOVF        _FAST_PWM+0, 0 
	MOVWF       FARG_moveForward_pwmRight+0 
	MOVF        _FAST_PWM+1, 0 
	MOVWF       FARG_moveForward_pwmRight+1 
	CALL        _moveForward+0, 0
	GOTO        L_lineFollowNormalWorked246
L_lineFollowNormalWorked245:
;linefollow.h,230 :: 		else if( Sensor3==0 && Sensor4==1 && Sensor5==1 && Sensor6==1 && Sensor7==0)
	BTFSC       PORTD+0, 4 
	GOTO        L_lineFollowNormalWorked249
	BTFSS       PORTD+0, 5 
	GOTO        L_lineFollowNormalWorked249
	BTFSS       PORTD+0, 6 
	GOTO        L_lineFollowNormalWorked249
	BTFSS       PORTD+0, 7 
	GOTO        L_lineFollowNormalWorked249
	BTFSC       PORTB+0, 2 
	GOTO        L_lineFollowNormalWorked249
L__lineFollowNormalWorked539:
;linefollow.h,231 :: 		moveForward(FAST_PWM,FAST_PWM);
	MOVF        _FAST_PWM+0, 0 
	MOVWF       FARG_moveForward_pwmLeft+0 
	MOVF        _FAST_PWM+1, 0 
	MOVWF       FARG_moveForward_pwmLeft+1 
	MOVF        _FAST_PWM+0, 0 
	MOVWF       FARG_moveForward_pwmRight+0 
	MOVF        _FAST_PWM+1, 0 
	MOVWF       FARG_moveForward_pwmRight+1 
	CALL        _moveForward+0, 0
	GOTO        L_lineFollowNormalWorked250
L_lineFollowNormalWorked249:
;linefollow.h,232 :: 		else if( Sensor3==0 && Sensor4==0 && Sensor5==1 && Sensor6==0 && Sensor7==0)
	BTFSC       PORTD+0, 4 
	GOTO        L_lineFollowNormalWorked253
	BTFSC       PORTD+0, 5 
	GOTO        L_lineFollowNormalWorked253
	BTFSS       PORTD+0, 6 
	GOTO        L_lineFollowNormalWorked253
	BTFSC       PORTD+0, 7 
	GOTO        L_lineFollowNormalWorked253
	BTFSC       PORTB+0, 2 
	GOTO        L_lineFollowNormalWorked253
L__lineFollowNormalWorked538:
;linefollow.h,233 :: 		moveForward(FAST_PWM,FAST_PWM);
	MOVF        _FAST_PWM+0, 0 
	MOVWF       FARG_moveForward_pwmLeft+0 
	MOVF        _FAST_PWM+1, 0 
	MOVWF       FARG_moveForward_pwmLeft+1 
	MOVF        _FAST_PWM+0, 0 
	MOVWF       FARG_moveForward_pwmRight+0 
	MOVF        _FAST_PWM+1, 0 
	MOVWF       FARG_moveForward_pwmRight+1 
	CALL        _moveForward+0, 0
	GOTO        L_lineFollowNormalWorked254
L_lineFollowNormalWorked253:
;linefollow.h,234 :: 		else if( Sensor3==0 && Sensor4==0 && Sensor5==1 && Sensor6==1 && Sensor7==0)
	BTFSC       PORTD+0, 4 
	GOTO        L_lineFollowNormalWorked257
	BTFSC       PORTD+0, 5 
	GOTO        L_lineFollowNormalWorked257
	BTFSS       PORTD+0, 6 
	GOTO        L_lineFollowNormalWorked257
	BTFSS       PORTD+0, 7 
	GOTO        L_lineFollowNormalWorked257
	BTFSC       PORTB+0, 2 
	GOTO        L_lineFollowNormalWorked257
L__lineFollowNormalWorked537:
;linefollow.h,235 :: 		moveForward(FAST_PWM,SLOW_PWM);
	MOVF        _FAST_PWM+0, 0 
	MOVWF       FARG_moveForward_pwmLeft+0 
	MOVF        _FAST_PWM+1, 0 
	MOVWF       FARG_moveForward_pwmLeft+1 
	MOVF        _SLOW_PWM+0, 0 
	MOVWF       FARG_moveForward_pwmRight+0 
	MOVF        _SLOW_PWM+1, 0 
	MOVWF       FARG_moveForward_pwmRight+1 
	CALL        _moveForward+0, 0
	GOTO        L_lineFollowNormalWorked258
L_lineFollowNormalWorked257:
;linefollow.h,238 :: 		else if(isAllWhite()){
	CALL        _isAllWhite+0, 0
	MOVF        R0, 0 
	IORWF       R1, 0 
	BTFSC       STATUS+0, 2 
	GOTO        L_lineFollowNormalWorked259
;linefollow.h,241 :: 		sendSensorStatus();
	CALL        _sendSensorStatus+0, 0
;linefollow.h,242 :: 		}
	GOTO        L_lineFollowNormalWorked260
L_lineFollowNormalWorked259:
;linefollow.h,245 :: 		reverse(220,220);
	MOVLW       220
	MOVWF       FARG_reverse_pwmLeft+0 
	MOVLW       0
	MOVWF       FARG_reverse_pwmLeft+1 
	MOVLW       220
	MOVWF       FARG_reverse_pwmRight+0 
	MOVLW       0
	MOVWF       FARG_reverse_pwmRight+1 
	CALL        _reverse+0, 0
;linefollow.h,246 :: 		sendSensorStatus();
	CALL        _sendSensorStatus+0, 0
;linefollow.h,248 :: 		}
L_lineFollowNormalWorked260:
L_lineFollowNormalWorked258:
L_lineFollowNormalWorked254:
L_lineFollowNormalWorked250:
L_lineFollowNormalWorked246:
L_lineFollowNormalWorked242:
L_lineFollowNormalWorked236:
L_lineFollowNormalWorked232:
L_lineFollowNormalWorked228:
L_lineFollowNormalWorked224:
L_lineFollowNormalWorked220:
L_lineFollowNormalWorked216:
L_lineFollowNormalWorked212:
L_lineFollowNormalWorked208:
L_lineFollowNormalWorked204:
L_lineFollowNormalWorked200:
L_lineFollowNormalWorked196:
L_lineFollowNormalWorked192:
L_lineFollowNormalWorked188:
L_lineFollowNormalWorked184:
L_lineFollowNormalWorked180:
L_lineFollowNormalWorked176:
;linefollow.h,249 :: 		}
L_lineFollowNormalWorked172:
;linefollow.h,250 :: 		}
	RETURN      0
; end of _lineFollowNormalWorked

_isOnThePath:

;linefollow.h,252 :: 		int isOnThePath(){
;linefollow.h,253 :: 		if(((Sensor3==0 && Sensor4==1 && Sensor5==1 && Sensor6==0 && Sensor7==0) || ( Sensor3==0 && Sensor4==1 && Sensor5==1 && Sensor6==1 && Sensor7==0) || ( Sensor3==0 && Sensor4==0 && Sensor5==1 && Sensor6==0 && Sensor7==0) || ( Sensor3==0 && Sensor4==0 && Sensor5==1 && Sensor6==1 && Sensor7==0)) && Sensor1==0 && Sensor2==0 && Sensor8==0 && Sensor9==0)
	BTFSC       PORTD+0, 4 
	GOTO        L__isOnThePath577
	BTFSS       PORTD+0, 5 
	GOTO        L__isOnThePath577
	BTFSS       PORTD+0, 6 
	GOTO        L__isOnThePath577
	BTFSC       PORTD+0, 7 
	GOTO        L__isOnThePath577
	BTFSC       PORTB+0, 2 
	GOTO        L__isOnThePath577
	GOTO        L__isOnThePath573
L__isOnThePath577:
	BTFSC       PORTD+0, 4 
	GOTO        L__isOnThePath576
	BTFSS       PORTD+0, 5 
	GOTO        L__isOnThePath576
	BTFSS       PORTD+0, 6 
	GOTO        L__isOnThePath576
	BTFSS       PORTD+0, 7 
	GOTO        L__isOnThePath576
	BTFSC       PORTB+0, 2 
	GOTO        L__isOnThePath576
	GOTO        L__isOnThePath573
L__isOnThePath576:
	BTFSC       PORTD+0, 4 
	GOTO        L__isOnThePath575
	BTFSC       PORTD+0, 5 
	GOTO        L__isOnThePath575
	BTFSS       PORTD+0, 6 
	GOTO        L__isOnThePath575
	BTFSC       PORTD+0, 7 
	GOTO        L__isOnThePath575
	BTFSC       PORTB+0, 2 
	GOTO        L__isOnThePath575
	GOTO        L__isOnThePath573
L__isOnThePath575:
	BTFSC       PORTD+0, 4 
	GOTO        L__isOnThePath574
	BTFSC       PORTD+0, 5 
	GOTO        L__isOnThePath574
	BTFSS       PORTD+0, 6 
	GOTO        L__isOnThePath574
	BTFSS       PORTD+0, 7 
	GOTO        L__isOnThePath574
	BTFSC       PORTB+0, 2 
	GOTO        L__isOnThePath574
	GOTO        L__isOnThePath573
L__isOnThePath574:
	GOTO        L_isOnThePath273
L__isOnThePath573:
	BTFSC       PORTB+0, 4 
	GOTO        L_isOnThePath273
	BTFSC       PORTB+0, 3 
	GOTO        L_isOnThePath273
	BTFSC       PORTB+0, 6 
	GOTO        L_isOnThePath273
	BTFSC       PORTB+0, 7 
	GOTO        L_isOnThePath273
L__isOnThePath572:
;linefollow.h,254 :: 		return 1;
	MOVLW       1
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	RETURN      0
L_isOnThePath273:
;linefollow.h,256 :: 		return 0;
	CLRF        R0 
	CLRF        R1 
;linefollow.h,257 :: 		}
	RETURN      0
; end of _isOnThePath

_lineFollow:

;linefollow.h,259 :: 		void lineFollow(){
;linefollow.h,261 :: 		while(1){
L_lineFollow275:
;linefollow.h,262 :: 		if( (Sensor3==1 || Sensor4==1 || Sensor5==1 || Sensor6==1 || Sensor7==1) && Sensor1==0 && Sensor2==0 && Sensor8==0 && Sensor9==0 ){
	BTFSC       PORTD+0, 4 
	GOTO        L__lineFollow582
	BTFSC       PORTD+0, 5 
	GOTO        L__lineFollow582
	BTFSC       PORTD+0, 6 
	GOTO        L__lineFollow582
	BTFSC       PORTD+0, 7 
	GOTO        L__lineFollow582
	BTFSC       PORTB+0, 2 
	GOTO        L__lineFollow582
	GOTO        L_lineFollow281
L__lineFollow582:
	BTFSC       PORTB+0, 4 
	GOTO        L_lineFollow281
	BTFSC       PORTB+0, 3 
	GOTO        L_lineFollow281
	BTFSC       PORTB+0, 6 
	GOTO        L_lineFollow281
	BTFSC       PORTB+0, 7 
	GOTO        L_lineFollow281
L__lineFollow581:
;linefollow.h,264 :: 		debugText = "Line follow PID..   ";
	MOVLW       ?lstr28_Main_325.0V+0
	MOVWF       _debugText+0 
	MOVLW       hi_addr(?lstr28_Main_325.0V+0)
	MOVWF       _debugText+1 
;linefollow.h,265 :: 		UART1_Write_Text(debugText);
	MOVF        _debugText+0, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVF        _debugText+1, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;linefollow.h,266 :: 		sendSensorStatus();
	CALL        _sendSensorStatus+0, 0
;linefollow.h,267 :: 		lineFollowPID();
	CALL        _lineFollowPID+0, 0
;linefollow.h,268 :: 		}
	GOTO        L_lineFollow282
L_lineFollow281:
;linefollow.h,269 :: 		else if( !( Scout==1 && Sensor1==1 && Sensor2==1 && Sensor3==1 && Sensor4==1 && Sensor5==1 && Sensor6==1 && Sensor7==1 && Sensor8==1 && Sensor9==1) || !( Scout==0 && Sensor1==0 && Sensor2==0 && Sensor3==0 && Sensor4==0 && Sensor5==0 && Sensor6==0 && Sensor7==0 && Sensor8==0 && Sensor9==0)){
	BTFSS       PORTB+0, 5 
	GOTO        L_lineFollow284
	BTFSS       PORTB+0, 4 
	GOTO        L_lineFollow284
	BTFSS       PORTB+0, 3 
	GOTO        L_lineFollow284
	BTFSS       PORTD+0, 4 
	GOTO        L_lineFollow284
	BTFSS       PORTD+0, 5 
	GOTO        L_lineFollow284
	BTFSS       PORTD+0, 6 
	GOTO        L_lineFollow284
	BTFSS       PORTD+0, 7 
	GOTO        L_lineFollow284
	BTFSS       PORTB+0, 2 
	GOTO        L_lineFollow284
	BTFSS       PORTB+0, 6 
	GOTO        L_lineFollow284
	BTFSS       PORTB+0, 7 
	GOTO        L_lineFollow284
	MOVLW       1
	MOVWF       R0 
	GOTO        L_lineFollow283
L_lineFollow284:
	CLRF        R0 
L_lineFollow283:
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L__lineFollow580
	BTFSC       PORTB+0, 5 
	GOTO        L_lineFollow286
	BTFSC       PORTB+0, 4 
	GOTO        L_lineFollow286
	BTFSC       PORTB+0, 3 
	GOTO        L_lineFollow286
	BTFSC       PORTD+0, 4 
	GOTO        L_lineFollow286
	BTFSC       PORTD+0, 5 
	GOTO        L_lineFollow286
	BTFSC       PORTD+0, 6 
	GOTO        L_lineFollow286
	BTFSC       PORTD+0, 7 
	GOTO        L_lineFollow286
	BTFSC       PORTB+0, 2 
	GOTO        L_lineFollow286
	BTFSC       PORTB+0, 6 
	GOTO        L_lineFollow286
	BTFSC       PORTB+0, 7 
	GOTO        L_lineFollow286
	MOVLW       1
	MOVWF       R0 
	GOTO        L_lineFollow285
L_lineFollow286:
	CLRF        R0 
L_lineFollow285:
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L__lineFollow580
	GOTO        L_lineFollow289
L__lineFollow580:
;linefollow.h,271 :: 		debugText = "Line follow Normal..   ";
	MOVLW       ?lstr29_Main_325.0V+0
	MOVWF       _debugText+0 
	MOVLW       hi_addr(?lstr29_Main_325.0V+0)
	MOVWF       _debugText+1 
;linefollow.h,272 :: 		UART1_Write_Text(debugText);
	MOVF        _debugText+0, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVF        _debugText+1, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;linefollow.h,273 :: 		sendSensorStatus();
	CALL        _sendSensorStatus+0, 0
;linefollow.h,274 :: 		lineFollowNormal();
	CALL        _lineFollowNormal+0, 0
;linefollow.h,275 :: 		}
	GOTO        L_lineFollow290
L_lineFollow289:
;linefollow.h,276 :: 		else if(( Scout==1 && Sensor1==1 && Sensor2==1 && Sensor3==1 && Sensor4==1 && Sensor5==1 && Sensor6==1 && Sensor7==1 && Sensor8==1 && Sensor9==1) || !( Scout==0 && Sensor1==0 && Sensor2==0 && Sensor3==0 && Sensor4==0 && Sensor5==0 && Sensor6==0 && Sensor7==0 && Sensor8==0 && Sensor9==0)){
	BTFSS       PORTB+0, 5 
	GOTO        L__lineFollow579
	BTFSS       PORTB+0, 4 
	GOTO        L__lineFollow579
	BTFSS       PORTB+0, 3 
	GOTO        L__lineFollow579
	BTFSS       PORTD+0, 4 
	GOTO        L__lineFollow579
	BTFSS       PORTD+0, 5 
	GOTO        L__lineFollow579
	BTFSS       PORTD+0, 6 
	GOTO        L__lineFollow579
	BTFSS       PORTD+0, 7 
	GOTO        L__lineFollow579
	BTFSS       PORTB+0, 2 
	GOTO        L__lineFollow579
	BTFSS       PORTB+0, 6 
	GOTO        L__lineFollow579
	BTFSS       PORTB+0, 7 
	GOTO        L__lineFollow579
	GOTO        L__lineFollow578
L__lineFollow579:
	BTFSC       PORTB+0, 5 
	GOTO        L_lineFollow294
	BTFSC       PORTB+0, 4 
	GOTO        L_lineFollow294
	BTFSC       PORTB+0, 3 
	GOTO        L_lineFollow294
	BTFSC       PORTD+0, 4 
	GOTO        L_lineFollow294
	BTFSC       PORTD+0, 5 
	GOTO        L_lineFollow294
	BTFSC       PORTD+0, 6 
	GOTO        L_lineFollow294
	BTFSC       PORTD+0, 7 
	GOTO        L_lineFollow294
	BTFSC       PORTB+0, 2 
	GOTO        L_lineFollow294
	BTFSC       PORTB+0, 6 
	GOTO        L_lineFollow294
	BTFSC       PORTB+0, 7 
	GOTO        L_lineFollow294
	MOVLW       1
	MOVWF       R0 
	GOTO        L_lineFollow293
L_lineFollow294:
	CLRF        R0 
L_lineFollow293:
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L__lineFollow578
	GOTO        L_lineFollow297
L__lineFollow578:
;linefollow.h,278 :: 		stop();
	CALL        _stop+0, 0
;linefollow.h,279 :: 		sendSensorStatus();
	CALL        _sendSensorStatus+0, 0
;linefollow.h,281 :: 		}
L_lineFollow297:
L_lineFollow290:
L_lineFollow282:
;linefollow.h,282 :: 		}
	GOTO        L_lineFollow275
;linefollow.h,283 :: 		}
	RETURN      0
; end of _lineFollow

_lineFollowNormal:

;linefollow.h,285 :: 		void lineFollowNormal(){
;linefollow.h,286 :: 		while(1){              //!((Sensor3==1 || Sensor4==1 || Sensor5==1 || Sensor6==1 || Sensor7==1) && Sensor1==0 && Sensor2==0 && Sensor8==0 && Sensor9==0)
L_lineFollowNormal298:
;linefollow.h,287 :: 		if( Scout==1 && Sensor1==1 && Sensor2==1 && Sensor3==1 && Sensor4==1 && Sensor5==1 && Sensor6==1 && Sensor7==1 && Sensor8==1 && Sensor9==1){
	BTFSS       PORTB+0, 5 
	GOTO        L_lineFollowNormal302
	BTFSS       PORTB+0, 4 
	GOTO        L_lineFollowNormal302
	BTFSS       PORTB+0, 3 
	GOTO        L_lineFollowNormal302
	BTFSS       PORTD+0, 4 
	GOTO        L_lineFollowNormal302
	BTFSS       PORTD+0, 5 
	GOTO        L_lineFollowNormal302
	BTFSS       PORTD+0, 6 
	GOTO        L_lineFollowNormal302
	BTFSS       PORTD+0, 7 
	GOTO        L_lineFollowNormal302
	BTFSS       PORTB+0, 2 
	GOTO        L_lineFollowNormal302
	BTFSS       PORTB+0, 6 
	GOTO        L_lineFollowNormal302
	BTFSS       PORTB+0, 7 
	GOTO        L_lineFollowNormal302
L__lineFollowNormal595:
;linefollow.h,288 :: 		stop();
	CALL        _stop+0, 0
;linefollow.h,289 :: 		}
	GOTO        L_lineFollowNormal303
L_lineFollowNormal302:
;linefollow.h,290 :: 		else if( (Scout==0 && Sensor1==0 && Sensor2==0 && Sensor3==0 && Sensor4==1 && Sensor5==1 && Sensor6==1 && Sensor7==1 && Sensor8==1 && Sensor9==1) || (Scout==0 && Sensor1==0 && Sensor2==0 && Sensor3==0 && Sensor4==0 && Sensor5==1 && Sensor6==1 && Sensor7==1 && Sensor8==1 && Sensor9==1)){
	BTFSC       PORTB+0, 5 
	GOTO        L__lineFollowNormal594
	BTFSC       PORTB+0, 4 
	GOTO        L__lineFollowNormal594
	BTFSC       PORTB+0, 3 
	GOTO        L__lineFollowNormal594
	BTFSC       PORTD+0, 4 
	GOTO        L__lineFollowNormal594
	BTFSS       PORTD+0, 5 
	GOTO        L__lineFollowNormal594
	BTFSS       PORTD+0, 6 
	GOTO        L__lineFollowNormal594
	BTFSS       PORTD+0, 7 
	GOTO        L__lineFollowNormal594
	BTFSS       PORTB+0, 2 
	GOTO        L__lineFollowNormal594
	BTFSS       PORTB+0, 6 
	GOTO        L__lineFollowNormal594
	BTFSS       PORTB+0, 7 
	GOTO        L__lineFollowNormal594
	GOTO        L__lineFollowNormal592
L__lineFollowNormal594:
	BTFSC       PORTB+0, 5 
	GOTO        L__lineFollowNormal593
	BTFSC       PORTB+0, 4 
	GOTO        L__lineFollowNormal593
	BTFSC       PORTB+0, 3 
	GOTO        L__lineFollowNormal593
	BTFSC       PORTD+0, 4 
	GOTO        L__lineFollowNormal593
	BTFSC       PORTD+0, 5 
	GOTO        L__lineFollowNormal593
	BTFSS       PORTD+0, 6 
	GOTO        L__lineFollowNormal593
	BTFSS       PORTD+0, 7 
	GOTO        L__lineFollowNormal593
	BTFSS       PORTB+0, 2 
	GOTO        L__lineFollowNormal593
	BTFSS       PORTB+0, 6 
	GOTO        L__lineFollowNormal593
	BTFSS       PORTB+0, 7 
	GOTO        L__lineFollowNormal593
	GOTO        L__lineFollowNormal592
L__lineFollowNormal593:
	GOTO        L_lineFollowNormal310
L__lineFollowNormal592:
;linefollow.h,292 :: 		debugText = "90 to right..   ";
	MOVLW       ?lstr30_Main_325.0V+0
	MOVWF       _debugText+0 
	MOVLW       hi_addr(?lstr30_Main_325.0V+0)
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
L_lineFollowNormal311:
	BTFSC       PORTB+0, 5 
	GOTO        L_lineFollowNormal312
;linefollow.h,296 :: 		rotateClockwise(TEST_RPM);
	MOVF        _TEST_RPM+0, 0 
	MOVWF       FARG_rotateClockwise_pwm+0 
	MOVF        _TEST_RPM+1, 0 
	MOVWF       FARG_rotateClockwise_pwm+1 
	CALL        _rotateClockwise+0, 0
;linefollow.h,297 :: 		}
	GOTO        L_lineFollowNormal311
L_lineFollowNormal312:
;linefollow.h,298 :: 		}
	GOTO        L_lineFollowNormal313
L_lineFollowNormal310:
;linefollow.h,299 :: 		else if( (Scout==0 && Sensor1==1 && Sensor2==1 && Sensor3==1 && Sensor4==1 && Sensor5==1 && Sensor6==0 && Sensor7==0 && Sensor8==0 && Sensor9==0) && (Scout==0 && Sensor1==1 && Sensor2==1 && Sensor3==1 && Sensor4==1 && Sensor5==0 && Sensor6==0 && Sensor7==0 && Sensor8==0 && Sensor9==0)){
	BTFSC       PORTB+0, 5 
	GOTO        L_lineFollowNormal320
	BTFSS       PORTB+0, 4 
	GOTO        L_lineFollowNormal320
	BTFSS       PORTB+0, 3 
	GOTO        L_lineFollowNormal320
	BTFSS       PORTD+0, 4 
	GOTO        L_lineFollowNormal320
	BTFSS       PORTD+0, 5 
	GOTO        L_lineFollowNormal320
	BTFSS       PORTD+0, 6 
	GOTO        L_lineFollowNormal320
	BTFSC       PORTD+0, 7 
	GOTO        L_lineFollowNormal320
	BTFSC       PORTB+0, 2 
	GOTO        L_lineFollowNormal320
	BTFSC       PORTB+0, 6 
	GOTO        L_lineFollowNormal320
	BTFSC       PORTB+0, 7 
	GOTO        L_lineFollowNormal320
L__lineFollowNormal591:
	BTFSC       PORTB+0, 5 
	GOTO        L_lineFollowNormal320
	BTFSS       PORTB+0, 4 
	GOTO        L_lineFollowNormal320
	BTFSS       PORTB+0, 3 
	GOTO        L_lineFollowNormal320
	BTFSS       PORTD+0, 4 
	GOTO        L_lineFollowNormal320
	BTFSS       PORTD+0, 5 
	GOTO        L_lineFollowNormal320
	BTFSC       PORTD+0, 6 
	GOTO        L_lineFollowNormal320
	BTFSC       PORTD+0, 7 
	GOTO        L_lineFollowNormal320
	BTFSC       PORTB+0, 2 
	GOTO        L_lineFollowNormal320
	BTFSC       PORTB+0, 6 
	GOTO        L_lineFollowNormal320
	BTFSC       PORTB+0, 7 
	GOTO        L_lineFollowNormal320
L__lineFollowNormal590:
L__lineFollowNormal589:
;linefollow.h,301 :: 		debugText = "90 to left..   ";
	MOVLW       ?lstr31_Main_325.0V+0
	MOVWF       _debugText+0 
	MOVLW       hi_addr(?lstr31_Main_325.0V+0)
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
L_lineFollowNormal321:
	BTFSC       PORTB+0, 5 
	GOTO        L_lineFollowNormal322
;linefollow.h,305 :: 		rotateAntiClockwise(TEST_RPM);
	MOVF        _TEST_RPM+0, 0 
	MOVWF       FARG_rotateAntiClockwise_pwm+0 
	MOVF        _TEST_RPM+1, 0 
	MOVWF       FARG_rotateAntiClockwise_pwm+1 
	CALL        _rotateAntiClockwise+0, 0
;linefollow.h,306 :: 		}
	GOTO        L_lineFollowNormal321
L_lineFollowNormal322:
;linefollow.h,307 :: 		}
	GOTO        L_lineFollowNormal323
L_lineFollowNormal320:
;linefollow.h,308 :: 		else if( Sensor4==1 && Sensor5==1){
	BTFSS       PORTD+0, 5 
	GOTO        L_lineFollowNormal326
	BTFSS       PORTD+0, 6 
	GOTO        L_lineFollowNormal326
L__lineFollowNormal588:
;linefollow.h,310 :: 		moveForward(TEST_RPM,TEST_RPM);
	MOVF        _TEST_RPM+0, 0 
	MOVWF       FARG_moveForward_pwmLeft+0 
	MOVF        _TEST_RPM+1, 0 
	MOVWF       FARG_moveForward_pwmLeft+1 
	MOVF        _TEST_RPM+0, 0 
	MOVWF       FARG_moveForward_pwmRight+0 
	MOVF        _TEST_RPM+1, 0 
	MOVWF       FARG_moveForward_pwmRight+1 
	CALL        _moveForward+0, 0
;linefollow.h,311 :: 		}
	GOTO        L_lineFollowNormal327
L_lineFollowNormal326:
;linefollow.h,312 :: 		else if( Sensor4==1 && Sensor5==0 && Scout==1){
	BTFSS       PORTD+0, 5 
	GOTO        L_lineFollowNormal330
	BTFSC       PORTD+0, 6 
	GOTO        L_lineFollowNormal330
	BTFSS       PORTB+0, 5 
	GOTO        L_lineFollowNormal330
L__lineFollowNormal587:
;linefollow.h,314 :: 		turnLeft(TEST_RPM);
	MOVF        _TEST_RPM+0, 0 
	MOVWF       FARG_turnLeft_pwmRight+0 
	MOVF        _TEST_RPM+1, 0 
	MOVWF       FARG_turnLeft_pwmRight+1 
	CALL        _turnLeft+0, 0
;linefollow.h,315 :: 		}
	GOTO        L_lineFollowNormal331
L_lineFollowNormal330:
;linefollow.h,316 :: 		else if( Sensor4==0 && Sensor5==1 && Scout==1){
	BTFSC       PORTD+0, 5 
	GOTO        L_lineFollowNormal334
	BTFSS       PORTD+0, 6 
	GOTO        L_lineFollowNormal334
	BTFSS       PORTB+0, 5 
	GOTO        L_lineFollowNormal334
L__lineFollowNormal586:
;linefollow.h,318 :: 		turnRight(TEST_RPM);
	MOVF        _TEST_RPM+0, 0 
	MOVWF       FARG_turnRight_pwmLeft+0 
	MOVF        _TEST_RPM+1, 0 
	MOVWF       FARG_turnRight_pwmLeft+1 
	CALL        _turnRight+0, 0
;linefollow.h,319 :: 		}
	GOTO        L_lineFollowNormal335
L_lineFollowNormal334:
;linefollow.h,320 :: 		else if( Sensor4==1 && Sensor5==0 && Scout==0){
	BTFSS       PORTD+0, 5 
	GOTO        L_lineFollowNormal338
	BTFSC       PORTD+0, 6 
	GOTO        L_lineFollowNormal338
	BTFSC       PORTB+0, 5 
	GOTO        L_lineFollowNormal338
L__lineFollowNormal585:
;linefollow.h,322 :: 		stop();
	CALL        _stop+0, 0
;linefollow.h,324 :: 		rotateAntiClockwise(TEST_RPM);
	MOVF        _TEST_RPM+0, 0 
	MOVWF       FARG_rotateAntiClockwise_pwm+0 
	MOVF        _TEST_RPM+1, 0 
	MOVWF       FARG_rotateAntiClockwise_pwm+1 
	CALL        _rotateAntiClockwise+0, 0
;linefollow.h,325 :: 		}
	GOTO        L_lineFollowNormal339
L_lineFollowNormal338:
;linefollow.h,326 :: 		else if( Sensor4==0 && Sensor5==1 && Scout==0){
	BTFSC       PORTD+0, 5 
	GOTO        L_lineFollowNormal342
	BTFSS       PORTD+0, 6 
	GOTO        L_lineFollowNormal342
	BTFSC       PORTB+0, 5 
	GOTO        L_lineFollowNormal342
L__lineFollowNormal584:
;linefollow.h,328 :: 		stop();
	CALL        _stop+0, 0
;linefollow.h,330 :: 		rotateClockwise(TEST_RPM);
	MOVF        _TEST_RPM+0, 0 
	MOVWF       FARG_rotateClockwise_pwm+0 
	MOVF        _TEST_RPM+1, 0 
	MOVWF       FARG_rotateClockwise_pwm+1 
	CALL        _rotateClockwise+0, 0
;linefollow.h,331 :: 		}
	GOTO        L_lineFollowNormal343
L_lineFollowNormal342:
;linefollow.h,332 :: 		else if( Sensor4==0 && Sensor5==0 ){
	BTFSC       PORTD+0, 5 
	GOTO        L_lineFollowNormal346
	BTFSC       PORTD+0, 6 
	GOTO        L_lineFollowNormal346
L__lineFollowNormal583:
;linefollow.h,333 :: 		if(Sensor3 ==1){
	BTFSS       PORTD+0, 4 
	GOTO        L_lineFollowNormal347
;linefollow.h,334 :: 		rotateAntiClockwise(TEST_RPM);
	MOVF        _TEST_RPM+0, 0 
	MOVWF       FARG_rotateAntiClockwise_pwm+0 
	MOVF        _TEST_RPM+1, 0 
	MOVWF       FARG_rotateAntiClockwise_pwm+1 
	CALL        _rotateAntiClockwise+0, 0
;linefollow.h,335 :: 		}
	GOTO        L_lineFollowNormal348
L_lineFollowNormal347:
;linefollow.h,336 :: 		else if(Sensor6 ==1){
	BTFSS       PORTD+0, 7 
	GOTO        L_lineFollowNormal349
;linefollow.h,337 :: 		rotateClockwise(TEST_RPM);
	MOVF        _TEST_RPM+0, 0 
	MOVWF       FARG_rotateClockwise_pwm+0 
	MOVF        _TEST_RPM+1, 0 
	MOVWF       FARG_rotateClockwise_pwm+1 
	CALL        _rotateClockwise+0, 0
;linefollow.h,338 :: 		}
	GOTO        L_lineFollowNormal350
L_lineFollowNormal349:
;linefollow.h,339 :: 		else if(Sensor2 ==1){
	BTFSS       PORTB+0, 3 
	GOTO        L_lineFollowNormal351
;linefollow.h,340 :: 		rotateAntiClockwise(TEST_RPM);
	MOVF        _TEST_RPM+0, 0 
	MOVWF       FARG_rotateAntiClockwise_pwm+0 
	MOVF        _TEST_RPM+1, 0 
	MOVWF       FARG_rotateAntiClockwise_pwm+1 
	CALL        _rotateAntiClockwise+0, 0
;linefollow.h,341 :: 		}
	GOTO        L_lineFollowNormal352
L_lineFollowNormal351:
;linefollow.h,342 :: 		else if(Sensor7 ==1){
	BTFSS       PORTB+0, 2 
	GOTO        L_lineFollowNormal353
;linefollow.h,343 :: 		rotateClockwise(TEST_RPM);
	MOVF        _TEST_RPM+0, 0 
	MOVWF       FARG_rotateClockwise_pwm+0 
	MOVF        _TEST_RPM+1, 0 
	MOVWF       FARG_rotateClockwise_pwm+1 
	CALL        _rotateClockwise+0, 0
;linefollow.h,344 :: 		}
	GOTO        L_lineFollowNormal354
L_lineFollowNormal353:
;linefollow.h,347 :: 		stop();
	CALL        _stop+0, 0
;linefollow.h,350 :: 		}
L_lineFollowNormal354:
L_lineFollowNormal352:
L_lineFollowNormal350:
L_lineFollowNormal348:
;linefollow.h,351 :: 		}
L_lineFollowNormal346:
L_lineFollowNormal343:
L_lineFollowNormal339:
L_lineFollowNormal335:
L_lineFollowNormal331:
L_lineFollowNormal327:
L_lineFollowNormal323:
L_lineFollowNormal313:
L_lineFollowNormal303:
;linefollow.h,353 :: 		}
	GOTO        L_lineFollowNormal298
;linefollow.h,355 :: 		}
	RETURN      0
; end of _lineFollowNormal

_configure:

;configuration.h,9 :: 		void configure(){
;configuration.h,12 :: 		TRISA = 0b11001010;
	MOVLW       202
	MOVWF       TRISA+0 
;configuration.h,13 :: 		TRISB = 0b11111111;
	MOVLW       255
	MOVWF       TRISB+0 
;configuration.h,14 :: 		TRISC = 0b00000000;
	CLRF        TRISC+0 
;configuration.h,15 :: 		TRISD = 0b11110010;
	MOVLW       242
	MOVWF       TRISD+0 
;configuration.h,16 :: 		TRISE = 0b00000101;
	MOVLW       5
	MOVWF       TRISE+0 
;configuration.h,18 :: 		PORTA = 0;
	CLRF        PORTA+0 
;configuration.h,19 :: 		PORTB = 0;
	CLRF        PORTB+0 
;configuration.h,20 :: 		PORTC = 0;
	CLRF        PORTC+0 
;configuration.h,21 :: 		PORTD = 0;
	CLRF        PORTD+0 
;configuration.h,22 :: 		PORTE = 0;
	CLRF        PORTE+0 
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
;configuration.h,37 :: 		ADCON1 = 0b00000110;   //ADCON1 = 0b00000000;
	MOVLW       6
	MOVWF       ADCON1+0 
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

;ir.h,10 :: 		float getDistanceIR_GP2D120(char sensor){           //10-bit results
;ir.h,11 :: 		if (sensor == 'M'){
	MOVF        FARG_getDistanceIR_GP2D120_sensor+0, 0 
	XORLW       77
	BTFSS       STATUS+0, 2 
	GOTO        L_getDistanceIR_GP2D120355
;ir.h,12 :: 		ir_value = ADC_Read(IRSensorCenter);
	MOVLW       0
	BTFSC       PORTA+0, 0 
	MOVLW       1
	MOVWF       FARG_ADC_Read_channel+0 
	CALL        _ADC_Read+0, 0
	MOVF        R0, 0 
	MOVWF       _ir_value+0 
	MOVF        R1, 0 
	MOVWF       _ir_value+1 
;ir.h,13 :: 		}
	GOTO        L_getDistanceIR_GP2D120356
L_getDistanceIR_GP2D120355:
;ir.h,14 :: 		else if(sensor == 'R'){
	MOVF        FARG_getDistanceIR_GP2D120_sensor+0, 0 
	XORLW       82
	BTFSS       STATUS+0, 2 
	GOTO        L_getDistanceIR_GP2D120357
;ir.h,15 :: 		ir_value = ADC_Read(IRSensorRight);
	MOVLW       0
	BTFSC       PORTA+0, 1 
	MOVLW       1
	MOVWF       FARG_ADC_Read_channel+0 
	CALL        _ADC_Read+0, 0
	MOVF        R0, 0 
	MOVWF       _ir_value+0 
	MOVF        R1, 0 
	MOVWF       _ir_value+1 
;ir.h,16 :: 		}
	GOTO        L_getDistanceIR_GP2D120358
L_getDistanceIR_GP2D120357:
;ir.h,17 :: 		else if(sensor == 'L'){
	MOVF        FARG_getDistanceIR_GP2D120_sensor+0, 0 
	XORLW       76
	BTFSS       STATUS+0, 2 
	GOTO        L_getDistanceIR_GP2D120359
;ir.h,18 :: 		ir_value = ADC_Read(IRSensorLeft);
	MOVLW       0
	BTFSC       PORTA+0, 2 
	MOVLW       1
	MOVWF       FARG_ADC_Read_channel+0 
	CALL        _ADC_Read+0, 0
	MOVF        R0, 0 
	MOVWF       _ir_value+0 
	MOVF        R1, 0 
	MOVWF       _ir_value+1 
;ir.h,19 :: 		}
	GOTO        L_getDistanceIR_GP2D120360
L_getDistanceIR_GP2D120359:
;ir.h,21 :: 		ir_value = 0;
	CLRF        _ir_value+0 
	CLRF        _ir_value+1 
L_getDistanceIR_GP2D120360:
L_getDistanceIR_GP2D120358:
L_getDistanceIR_GP2D120356:
;ir.h,23 :: 		voltage = (float)ir_value/1024*5;
	MOVF        _ir_value+0, 0 
	MOVWF       R0 
	MOVF        _ir_value+1, 0 
	MOVWF       R1 
	CALL        _Word2Double+0, 0
	MOVLW       0
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVLW       0
	MOVWF       R6 
	MOVLW       137
	MOVWF       R7 
	CALL        _Div_32x32_FP+0, 0
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
	MOVWF       _voltage+0 
	MOVF        R1, 0 
	MOVWF       _voltage+1 
	MOVF        R2, 0 
	MOVWF       _voltage+2 
	MOVF        R3, 0 
	MOVWF       _voltage+3 
;ir.h,24 :: 		if( 610<=ir_value && ir_value<623)         //3cm - 3.75cm
	MOVLW       2
	SUBWF       _ir_value+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__getDistanceIR_GP2D120628
	MOVLW       98
	SUBWF       _ir_value+0, 0 
L__getDistanceIR_GP2D120628:
	BTFSS       STATUS+0, 0 
	GOTO        L_getDistanceIR_GP2D120363
	MOVLW       2
	SUBWF       _ir_value+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__getDistanceIR_GP2D120629
	MOVLW       111
	SUBWF       _ir_value+0, 0 
L__getDistanceIR_GP2D120629:
	BTFSC       STATUS+0, 0 
	GOTO        L_getDistanceIR_GP2D120363
L__getDistanceIR_GP2D120612:
;ir.h,25 :: 		return 3.0 - 12.5*(voltage - 3.04);
	MOVLW       92
	MOVWF       R4 
	MOVLW       143
	MOVWF       R5 
	MOVLW       66
	MOVWF       R6 
	MOVLW       128
	MOVWF       R7 
	MOVF        _voltage+0, 0 
	MOVWF       R0 
	MOVF        _voltage+1, 0 
	MOVWF       R1 
	MOVF        _voltage+2, 0 
	MOVWF       R2 
	MOVF        _voltage+3, 0 
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
L_getDistanceIR_GP2D120363:
;ir.h,27 :: 		else if( 557<=ir_value && ir_value<610 )
	MOVLW       2
	SUBWF       _ir_value+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__getDistanceIR_GP2D120630
	MOVLW       45
	SUBWF       _ir_value+0, 0 
L__getDistanceIR_GP2D120630:
	BTFSS       STATUS+0, 0 
	GOTO        L_getDistanceIR_GP2D120367
	MOVLW       2
	SUBWF       _ir_value+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__getDistanceIR_GP2D120631
	MOVLW       98
	SUBWF       _ir_value+0, 0 
L__getDistanceIR_GP2D120631:
	BTFSC       STATUS+0, 0 
	GOTO        L_getDistanceIR_GP2D120367
L__getDistanceIR_GP2D120611:
;ir.h,28 :: 		return 3.75 - 1.04*(voltage - 2.98);  //3.75 - 4cm
	MOVLW       82
	MOVWF       R4 
	MOVLW       184
	MOVWF       R5 
	MOVLW       62
	MOVWF       R6 
	MOVLW       128
	MOVWF       R7 
	MOVF        _voltage+0, 0 
	MOVWF       R0 
	MOVF        _voltage+1, 0 
	MOVWF       R1 
	MOVF        _voltage+2, 0 
	MOVWF       R2 
	MOVF        _voltage+3, 0 
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
L_getDistanceIR_GP2D120367:
;ir.h,30 :: 		else if( 481<=ir_value && ir_value<557 )
	MOVLW       1
	SUBWF       _ir_value+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__getDistanceIR_GP2D120632
	MOVLW       225
	SUBWF       _ir_value+0, 0 
L__getDistanceIR_GP2D120632:
	BTFSS       STATUS+0, 0 
	GOTO        L_getDistanceIR_GP2D120371
	MOVLW       2
	SUBWF       _ir_value+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__getDistanceIR_GP2D120633
	MOVLW       45
	SUBWF       _ir_value+0, 0 
L__getDistanceIR_GP2D120633:
	BTFSC       STATUS+0, 0 
	GOTO        L_getDistanceIR_GP2D120371
L__getDistanceIR_GP2D120610:
;ir.h,31 :: 		return 5 - 2.5*(voltage - 2.75);       //4cm - 5cm
	MOVLW       0
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVLW       48
	MOVWF       R6 
	MOVLW       128
	MOVWF       R7 
	MOVF        _voltage+0, 0 
	MOVWF       R0 
	MOVF        _voltage+1, 0 
	MOVWF       R1 
	MOVF        _voltage+2, 0 
	MOVWF       R2 
	MOVF        _voltage+3, 0 
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
L_getDistanceIR_GP2D120371:
;ir.h,33 :: 		else if( 409<=ir_value && ir_value<481 )
	MOVLW       1
	SUBWF       _ir_value+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__getDistanceIR_GP2D120634
	MOVLW       153
	SUBWF       _ir_value+0, 0 
L__getDistanceIR_GP2D120634:
	BTFSS       STATUS+0, 0 
	GOTO        L_getDistanceIR_GP2D120375
	MOVLW       1
	SUBWF       _ir_value+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__getDistanceIR_GP2D120635
	MOVLW       225
	SUBWF       _ir_value+0, 0 
L__getDistanceIR_GP2D120635:
	BTFSC       STATUS+0, 0 
	GOTO        L_getDistanceIR_GP2D120375
L__getDistanceIR_GP2D120609:
;ir.h,34 :: 		return 6 - 2.85*(voltage - 2.35);       //5cm - 6cm
	MOVLW       102
	MOVWF       R4 
	MOVLW       102
	MOVWF       R5 
	MOVLW       22
	MOVWF       R6 
	MOVLW       128
	MOVWF       R7 
	MOVF        _voltage+0, 0 
	MOVWF       R0 
	MOVF        _voltage+1, 0 
	MOVWF       R1 
	MOVF        _voltage+2, 0 
	MOVWF       R2 
	MOVF        _voltage+3, 0 
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
L_getDistanceIR_GP2D120375:
;ir.h,36 :: 		else if( 364<=ir_value && ir_value<409 )
	MOVLW       1
	SUBWF       _ir_value+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__getDistanceIR_GP2D120636
	MOVLW       108
	SUBWF       _ir_value+0, 0 
L__getDistanceIR_GP2D120636:
	BTFSS       STATUS+0, 0 
	GOTO        L_getDistanceIR_GP2D120379
	MOVLW       1
	SUBWF       _ir_value+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__getDistanceIR_GP2D120637
	MOVLW       153
	SUBWF       _ir_value+0, 0 
L__getDistanceIR_GP2D120637:
	BTFSC       STATUS+0, 0 
	GOTO        L_getDistanceIR_GP2D120379
L__getDistanceIR_GP2D120608:
;ir.h,37 :: 		return 7 - 4*(voltage - 2);             //6cm - 7cm
	MOVLW       0
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVLW       0
	MOVWF       R6 
	MOVLW       128
	MOVWF       R7 
	MOVF        _voltage+0, 0 
	MOVWF       R0 
	MOVF        _voltage+1, 0 
	MOVWF       R1 
	MOVF        _voltage+2, 0 
	MOVWF       R2 
	MOVF        _voltage+3, 0 
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
L_getDistanceIR_GP2D120379:
;ir.h,39 :: 		else if( 317<=ir_value && ir_value<364 )
	MOVLW       1
	SUBWF       _ir_value+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__getDistanceIR_GP2D120638
	MOVLW       61
	SUBWF       _ir_value+0, 0 
L__getDistanceIR_GP2D120638:
	BTFSS       STATUS+0, 0 
	GOTO        L_getDistanceIR_GP2D120383
	MOVLW       1
	SUBWF       _ir_value+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__getDistanceIR_GP2D120639
	MOVLW       108
	SUBWF       _ir_value+0, 0 
L__getDistanceIR_GP2D120639:
	BTFSC       STATUS+0, 0 
	GOTO        L_getDistanceIR_GP2D120383
L__getDistanceIR_GP2D120607:
;ir.h,40 :: 		return 8 - 5*(voltage - 1.75);          //7cm - 8cm
	MOVLW       0
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVLW       96
	MOVWF       R6 
	MOVLW       127
	MOVWF       R7 
	MOVF        _voltage+0, 0 
	MOVWF       R0 
	MOVF        _voltage+1, 0 
	MOVWF       R1 
	MOVF        _voltage+2, 0 
	MOVWF       R2 
	MOVF        _voltage+3, 0 
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
L_getDistanceIR_GP2D120383:
;ir.h,42 :: 		else if( 286<=ir_value && ir_value<317 )
	MOVLW       1
	SUBWF       _ir_value+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__getDistanceIR_GP2D120640
	MOVLW       30
	SUBWF       _ir_value+0, 0 
L__getDistanceIR_GP2D120640:
	BTFSS       STATUS+0, 0 
	GOTO        L_getDistanceIR_GP2D120387
	MOVLW       1
	SUBWF       _ir_value+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__getDistanceIR_GP2D120641
	MOVLW       61
	SUBWF       _ir_value+0, 0 
L__getDistanceIR_GP2D120641:
	BTFSC       STATUS+0, 0 
	GOTO        L_getDistanceIR_GP2D120387
L__getDistanceIR_GP2D120606:
;ir.h,43 :: 		return 9 - 6.667*(voltage - 1.55);      //8cm - 9cm
	MOVLW       102
	MOVWF       R4 
	MOVLW       102
	MOVWF       R5 
	MOVLW       70
	MOVWF       R6 
	MOVLW       127
	MOVWF       R7 
	MOVF        _voltage+0, 0 
	MOVWF       R0 
	MOVF        _voltage+1, 0 
	MOVWF       R1 
	MOVF        _voltage+2, 0 
	MOVWF       R2 
	MOVF        _voltage+3, 0 
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
L_getDistanceIR_GP2D120387:
;ir.h,45 :: 		else if( 256<=ir_value && ir_value<286 )
	MOVLW       1
	SUBWF       _ir_value+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__getDistanceIR_GP2D120642
	MOVLW       0
	SUBWF       _ir_value+0, 0 
L__getDistanceIR_GP2D120642:
	BTFSS       STATUS+0, 0 
	GOTO        L_getDistanceIR_GP2D120391
	MOVLW       1
	SUBWF       _ir_value+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__getDistanceIR_GP2D120643
	MOVLW       30
	SUBWF       _ir_value+0, 0 
L__getDistanceIR_GP2D120643:
	BTFSC       STATUS+0, 0 
	GOTO        L_getDistanceIR_GP2D120391
L__getDistanceIR_GP2D120605:
;ir.h,46 :: 		return 10 - 6.667*(voltage - 1.4);       //9cm - 10cm
	MOVLW       51
	MOVWF       R4 
	MOVLW       51
	MOVWF       R5 
	MOVLW       51
	MOVWF       R6 
	MOVLW       127
	MOVWF       R7 
	MOVF        _voltage+0, 0 
	MOVWF       R0 
	MOVF        _voltage+1, 0 
	MOVWF       R1 
	MOVF        _voltage+2, 0 
	MOVWF       R2 
	MOVF        _voltage+3, 0 
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
L_getDistanceIR_GP2D120391:
;ir.h,48 :: 		else if( 215<=ir_value && ir_value<256 )
	MOVLW       0
	SUBWF       _ir_value+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__getDistanceIR_GP2D120644
	MOVLW       215
	SUBWF       _ir_value+0, 0 
L__getDistanceIR_GP2D120644:
	BTFSS       STATUS+0, 0 
	GOTO        L_getDistanceIR_GP2D120395
	MOVLW       1
	SUBWF       _ir_value+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__getDistanceIR_GP2D120645
	MOVLW       0
	SUBWF       _ir_value+0, 0 
L__getDistanceIR_GP2D120645:
	BTFSC       STATUS+0, 0 
	GOTO        L_getDistanceIR_GP2D120395
L__getDistanceIR_GP2D120604:
;ir.h,49 :: 		return 12 - 10*(voltage - 1.25);         //10cm - 12cm
	MOVLW       0
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVLW       32
	MOVWF       R6 
	MOVLW       127
	MOVWF       R7 
	MOVF        _voltage+0, 0 
	MOVWF       R0 
	MOVF        _voltage+1, 0 
	MOVWF       R1 
	MOVF        _voltage+2, 0 
	MOVWF       R2 
	MOVF        _voltage+3, 0 
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
L_getDistanceIR_GP2D120395:
;ir.h,51 :: 		else if( 186<=ir_value && ir_value<215 )
	MOVLW       0
	SUBWF       _ir_value+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__getDistanceIR_GP2D120646
	MOVLW       186
	SUBWF       _ir_value+0, 0 
L__getDistanceIR_GP2D120646:
	BTFSS       STATUS+0, 0 
	GOTO        L_getDistanceIR_GP2D120399
	MOVLW       0
	SUBWF       _ir_value+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__getDistanceIR_GP2D120647
	MOVLW       215
	SUBWF       _ir_value+0, 0 
L__getDistanceIR_GP2D120647:
	BTFSC       STATUS+0, 0 
	GOTO        L_getDistanceIR_GP2D120399
L__getDistanceIR_GP2D120603:
;ir.h,52 :: 		return 14 - 15.38*(voltage - 1.05);      //12cm - 14cm
	MOVLW       102
	MOVWF       R4 
	MOVLW       102
	MOVWF       R5 
	MOVLW       6
	MOVWF       R6 
	MOVLW       127
	MOVWF       R7 
	MOVF        _voltage+0, 0 
	MOVWF       R0 
	MOVF        _voltage+1, 0 
	MOVWF       R1 
	MOVF        _voltage+2, 0 
	MOVWF       R2 
	MOVF        _voltage+3, 0 
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
L_getDistanceIR_GP2D120399:
;ir.h,54 :: 		else if( 166<=ir_value && ir_value<186 )
	MOVLW       0
	SUBWF       _ir_value+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__getDistanceIR_GP2D120648
	MOVLW       166
	SUBWF       _ir_value+0, 0 
L__getDistanceIR_GP2D120648:
	BTFSS       STATUS+0, 0 
	GOTO        L_getDistanceIR_GP2D120403
	MOVLW       0
	SUBWF       _ir_value+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__getDistanceIR_GP2D120649
	MOVLW       186
	SUBWF       _ir_value+0, 0 
L__getDistanceIR_GP2D120649:
	BTFSC       STATUS+0, 0 
	GOTO        L_getDistanceIR_GP2D120403
L__getDistanceIR_GP2D120602:
;ir.h,55 :: 		return 16 - 20*(voltage - 0.94);         //14cm - 16cm
	MOVLW       215
	MOVWF       R4 
	MOVLW       163
	MOVWF       R5 
	MOVLW       112
	MOVWF       R6 
	MOVLW       126
	MOVWF       R7 
	MOVF        _voltage+0, 0 
	MOVWF       R0 
	MOVF        _voltage+1, 0 
	MOVWF       R1 
	MOVF        _voltage+2, 0 
	MOVWF       R2 
	MOVF        _voltage+3, 0 
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
L_getDistanceIR_GP2D120403:
;ir.h,57 :: 		else if( 147<=ir_value && ir_value<166 )
	MOVLW       0
	SUBWF       _ir_value+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__getDistanceIR_GP2D120650
	MOVLW       147
	SUBWF       _ir_value+0, 0 
L__getDistanceIR_GP2D120650:
	BTFSS       STATUS+0, 0 
	GOTO        L_getDistanceIR_GP2D120407
	MOVLW       0
	SUBWF       _ir_value+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__getDistanceIR_GP2D120651
	MOVLW       166
	SUBWF       _ir_value+0, 0 
L__getDistanceIR_GP2D120651:
	BTFSC       STATUS+0, 0 
	GOTO        L_getDistanceIR_GP2D120407
L__getDistanceIR_GP2D120601:
;ir.h,58 :: 		return 18 - 22.23*(voltage - 0.81);      //16cm - 18cm
	MOVLW       41
	MOVWF       R4 
	MOVLW       92
	MOVWF       R5 
	MOVLW       79
	MOVWF       R6 
	MOVLW       126
	MOVWF       R7 
	MOVF        _voltage+0, 0 
	MOVWF       R0 
	MOVF        _voltage+1, 0 
	MOVWF       R1 
	MOVF        _voltage+2, 0 
	MOVWF       R2 
	MOVF        _voltage+3, 0 
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
L_getDistanceIR_GP2D120407:
;ir.h,60 :: 		else if( 133<=ir_value && ir_value<147 )
	MOVLW       0
	SUBWF       _ir_value+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__getDistanceIR_GP2D120652
	MOVLW       133
	SUBWF       _ir_value+0, 0 
L__getDistanceIR_GP2D120652:
	BTFSS       STATUS+0, 0 
	GOTO        L_getDistanceIR_GP2D120411
	MOVLW       0
	SUBWF       _ir_value+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__getDistanceIR_GP2D120653
	MOVLW       147
	SUBWF       _ir_value+0, 0 
L__getDistanceIR_GP2D120653:
	BTFSC       STATUS+0, 0 
	GOTO        L_getDistanceIR_GP2D120411
L__getDistanceIR_GP2D120600:
;ir.h,61 :: 		return 20 - 28.57*(voltage - 0.65);       //18cm - 20cm
	MOVLW       102
	MOVWF       R4 
	MOVLW       102
	MOVWF       R5 
	MOVLW       38
	MOVWF       R6 
	MOVLW       126
	MOVWF       R7 
	MOVF        _voltage+0, 0 
	MOVWF       R0 
	MOVF        _voltage+1, 0 
	MOVWF       R1 
	MOVF        _voltage+2, 0 
	MOVWF       R2 
	MOVF        _voltage+3, 0 
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
L_getDistanceIR_GP2D120411:
;ir.h,63 :: 		else if( 106<=ir_value && ir_value<133 )
	MOVLW       0
	SUBWF       _ir_value+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__getDistanceIR_GP2D120654
	MOVLW       106
	SUBWF       _ir_value+0, 0 
L__getDistanceIR_GP2D120654:
	BTFSS       STATUS+0, 0 
	GOTO        L_getDistanceIR_GP2D120415
	MOVLW       0
	SUBWF       _ir_value+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__getDistanceIR_GP2D120655
	MOVLW       133
	SUBWF       _ir_value+0, 0 
L__getDistanceIR_GP2D120655:
	BTFSC       STATUS+0, 0 
	GOTO        L_getDistanceIR_GP2D120415
L__getDistanceIR_GP2D120599:
;ir.h,64 :: 		return 25 - 45.45*(voltage - 0.52);       //20cm - 25cm
	MOVLW       184
	MOVWF       R4 
	MOVLW       30
	MOVWF       R5 
	MOVLW       5
	MOVWF       R6 
	MOVLW       126
	MOVWF       R7 
	MOVF        _voltage+0, 0 
	MOVWF       R0 
	MOVF        _voltage+1, 0 
	MOVWF       R1 
	MOVF        _voltage+2, 0 
	MOVWF       R2 
	MOVF        _voltage+3, 0 
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
L_getDistanceIR_GP2D120415:
;ir.h,66 :: 		else if( 88<=ir_value && ir_value<106 )
	MOVLW       0
	SUBWF       _ir_value+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__getDistanceIR_GP2D120656
	MOVLW       88
	SUBWF       _ir_value+0, 0 
L__getDistanceIR_GP2D120656:
	BTFSS       STATUS+0, 0 
	GOTO        L_getDistanceIR_GP2D120419
	MOVLW       0
	SUBWF       _ir_value+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__getDistanceIR_GP2D120657
	MOVLW       106
	SUBWF       _ir_value+0, 0 
L__getDistanceIR_GP2D120657:
	BTFSC       STATUS+0, 0 
	GOTO        L_getDistanceIR_GP2D120419
L__getDistanceIR_GP2D120598:
;ir.h,67 :: 		return 30 - 55*(voltage - 0.43);           //25cm - 30cm
	MOVLW       246
	MOVWF       R4 
	MOVLW       40
	MOVWF       R5 
	MOVLW       92
	MOVWF       R6 
	MOVLW       125
	MOVWF       R7 
	MOVF        _voltage+0, 0 
	MOVWF       R0 
	MOVF        _voltage+1, 0 
	MOVWF       R1 
	MOVF        _voltage+2, 0 
	MOVWF       R2 
	MOVF        _voltage+3, 0 
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
L_getDistanceIR_GP2D120419:
;ir.h,69 :: 		else if( 78<=ir_value && ir_value<88 )
	MOVLW       0
	SUBWF       _ir_value+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__getDistanceIR_GP2D120658
	MOVLW       78
	SUBWF       _ir_value+0, 0 
L__getDistanceIR_GP2D120658:
	BTFSS       STATUS+0, 0 
	GOTO        L_getDistanceIR_GP2D120423
	MOVLW       0
	SUBWF       _ir_value+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__getDistanceIR_GP2D120659
	MOVLW       88
	SUBWF       _ir_value+0, 0 
L__getDistanceIR_GP2D120659:
	BTFSC       STATUS+0, 0 
	GOTO        L_getDistanceIR_GP2D120423
L__getDistanceIR_GP2D120597:
;ir.h,70 :: 		return 35 - 100*(voltage - 0.38);         //30cm - 35cm
	MOVLW       92
	MOVWF       R4 
	MOVLW       143
	MOVWF       R5 
	MOVLW       66
	MOVWF       R6 
	MOVLW       125
	MOVWF       R7 
	MOVF        _voltage+0, 0 
	MOVWF       R0 
	MOVF        _voltage+1, 0 
	MOVWF       R1 
	MOVF        _voltage+2, 0 
	MOVWF       R2 
	MOVF        _voltage+3, 0 
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
L_getDistanceIR_GP2D120423:
;ir.h,72 :: 		else if( 65<=ir_value && ir_value<78 )
	MOVLW       0
	SUBWF       _ir_value+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__getDistanceIR_GP2D120660
	MOVLW       65
	SUBWF       _ir_value+0, 0 
L__getDistanceIR_GP2D120660:
	BTFSS       STATUS+0, 0 
	GOTO        L_getDistanceIR_GP2D120427
	MOVLW       0
	SUBWF       _ir_value+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__getDistanceIR_GP2D120661
	MOVLW       78
	SUBWF       _ir_value+0, 0 
L__getDistanceIR_GP2D120661:
	BTFSC       STATUS+0, 0 
	GOTO        L_getDistanceIR_GP2D120427
L__getDistanceIR_GP2D120596:
;ir.h,73 :: 		return 40 - 83.33*(voltage - 0.32);       //35cm - 40cm
	MOVLW       10
	MOVWF       R4 
	MOVLW       215
	MOVWF       R5 
	MOVLW       35
	MOVWF       R6 
	MOVLW       125
	MOVWF       R7 
	MOVF        _voltage+0, 0 
	MOVWF       R0 
	MOVF        _voltage+1, 0 
	MOVWF       R1 
	MOVF        _voltage+2, 0 
	MOVWF       R2 
	MOVF        _voltage+3, 0 
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
L_getDistanceIR_GP2D120427:
;ir.h,75 :: 		return 50;
	MOVLW       0
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	MOVLW       72
	MOVWF       R2 
	MOVLW       132
	MOVWF       R3 
;ir.h,76 :: 		}
	RETURN      0
; end of _getDistanceIR_GP2D120

_getSonarDistance:

;sonar.h,14 :: 		float getSonarDistance(){
;sonar.h,15 :: 		TRIG_MIDDLE = 0;
	BCF         PORTA+0, 5 
;sonar.h,16 :: 		delay_us(10);
	MOVLW       16
	MOVWF       R13, 0
L_getSonarDistance429:
	DECFSZ      R13, 1, 0
	BRA         L_getSonarDistance429
	NOP
;sonar.h,17 :: 		TRIG_MIDDLE = 1;
	BSF         PORTA+0, 5 
;sonar.h,18 :: 		delay_us(10);
	MOVLW       16
	MOVWF       R13, 0
L_getSonarDistance430:
	DECFSZ      R13, 1, 0
	BRA         L_getSonarDistance430
	NOP
;sonar.h,19 :: 		TRIG_MIDDLE = 0;
	BCF         PORTA+0, 5 
;sonar.h,21 :: 		while(ECHO_MIDDLE==0);
L_getSonarDistance431:
	BTFSC       PORTE+0, 0 
	GOTO        L_getSonarDistance432
	GOTO        L_getSonarDistance431
L_getSonarDistance432:
;sonar.h,22 :: 		_counter = 0;
	CLRF        __counter+0 
	CLRF        __counter+1 
;sonar.h,24 :: 		while(ECHO_MIDDLE==1){
L_getSonarDistance433:
	BTFSS       PORTE+0, 0 
	GOTO        L_getSonarDistance434
;sonar.h,25 :: 		_counter++;
	INFSNZ      __counter+0, 1 
	INCF        __counter+1, 1 
;sonar.h,26 :: 		}
	GOTO        L_getSonarDistance433
L_getSonarDistance434:
;sonar.h,27 :: 		_responseTime = _counter * 0.2 * 0.000001; //in s
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
;sonar.h,28 :: 		_distance = 340 * _responseTime * 100 /2;// in cm
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
;sonar.h,29 :: 		return _distance;
;sonar.h,30 :: 		}
	RETURN      0
; end of _getSonarDistance

_getDistanceSonar2:

;sonar.h,32 :: 		unsigned short getDistanceSonar2(char Sensor){
;sonar.h,36 :: 		TMR1H=0x00;
	CLRF        TMR1H+0 
;sonar.h,37 :: 		TMR1L=0x00;
	CLRF        TMR1L+0 
;sonar.h,38 :: 		if(Sensor=='M'){
	MOVF        FARG_getDistanceSonar2_Sensor+0, 0 
	XORLW       77
	BTFSS       STATUS+0, 2 
	GOTO        L_getDistanceSonar2435
;sonar.h,40 :: 		TRIG_MIDDLE = 0;
	BCF         PORTA+0, 5 
;sonar.h,41 :: 		delay_us(2);
	MOVLW       3
	MOVWF       R13, 0
L_getDistanceSonar2436:
	DECFSZ      R13, 1, 0
	BRA         L_getDistanceSonar2436
;sonar.h,42 :: 		TRIG_MIDDLE = 1;
	BSF         PORTA+0, 5 
;sonar.h,43 :: 		delay_us(5);
	MOVLW       8
	MOVWF       R13, 0
L_getDistanceSonar2437:
	DECFSZ      R13, 1, 0
	BRA         L_getDistanceSonar2437
;sonar.h,44 :: 		TRIG_MIDDLE =0;
	BCF         PORTA+0, 5 
;sonar.h,46 :: 		while(!ECHO_MIDDLE)
L_getDistanceSonar2438:
	BTFSC       PORTE+0, 0 
	GOTO        L_getDistanceSonar2439
;sonar.h,48 :: 		L=(TMR1L);
	MOVF        TMR1L+0, 0 
	MOVWF       getDistanceSonar2_L_L0+0 
	MOVLW       0
	MOVWF       getDistanceSonar2_L_L0+1 
;sonar.h,49 :: 		H=(TMR1H);
	MOVF        TMR1H+0, 0 
	MOVWF       getDistanceSonar2_H_L0+0 
	MOVLW       0
	MOVWF       getDistanceSonar2_H_L0+1 
;sonar.h,50 :: 		if(H>0xF0)
	MOVLW       0
	MOVWF       R0 
	MOVF        getDistanceSonar2_H_L0+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__getDistanceSonar2662
	MOVF        getDistanceSonar2_H_L0+0, 0 
	SUBLW       240
L__getDistanceSonar2662:
	BTFSC       STATUS+0, 0 
	GOTO        L_getDistanceSonar2440
;sonar.h,51 :: 		break;
	GOTO        L_getDistanceSonar2439
L_getDistanceSonar2440:
;sonar.h,52 :: 		}
	GOTO        L_getDistanceSonar2438
L_getDistanceSonar2439:
;sonar.h,53 :: 		TMR1H=0;
	CLRF        TMR1H+0 
;sonar.h,54 :: 		TMR1L=0;
	CLRF        TMR1L+0 
;sonar.h,55 :: 		T1CON.TMR1ON=1;
	BSF         T1CON+0, 0 
;sonar.h,56 :: 		while(ECHO_MIDDLE)
L_getDistanceSonar2441:
	BTFSS       PORTE+0, 0 
	GOTO        L_getDistanceSonar2442
;sonar.h,58 :: 		L=(TMR1L);
	MOVF        TMR1L+0, 0 
	MOVWF       getDistanceSonar2_L_L0+0 
	MOVLW       0
	MOVWF       getDistanceSonar2_L_L0+1 
;sonar.h,59 :: 		H=(TMR1H);
	MOVF        TMR1H+0, 0 
	MOVWF       getDistanceSonar2_H_L0+0 
	MOVLW       0
	MOVWF       getDistanceSonar2_H_L0+1 
;sonar.h,60 :: 		if(H>0xF0)
	MOVLW       0
	MOVWF       R0 
	MOVF        getDistanceSonar2_H_L0+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__getDistanceSonar2663
	MOVF        getDistanceSonar2_H_L0+0, 0 
	SUBLW       240
L__getDistanceSonar2663:
	BTFSC       STATUS+0, 0 
	GOTO        L_getDistanceSonar2443
;sonar.h,61 :: 		break;
	GOTO        L_getDistanceSonar2442
L_getDistanceSonar2443:
;sonar.h,62 :: 		}
	GOTO        L_getDistanceSonar2441
L_getDistanceSonar2442:
;sonar.h,63 :: 		L=(TMR1L);
	MOVF        TMR1L+0, 0 
	MOVWF       getDistanceSonar2_L_L0+0 
	MOVLW       0
	MOVWF       getDistanceSonar2_L_L0+1 
;sonar.h,64 :: 		H=(TMR1H);
	MOVF        TMR1H+0, 0 
	MOVWF       getDistanceSonar2_H_L0+0 
	MOVLW       0
	MOVWF       getDistanceSonar2_H_L0+1 
;sonar.h,65 :: 		x=(H*256 + L)*0.2;
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
;sonar.h,66 :: 		y= (x/2)/29.1;
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
;sonar.h,67 :: 		return (int)y;
	CALL        _Double2Int+0, 0
	RETURN      0
;sonar.h,68 :: 		}
L_getDistanceSonar2435:
;sonar.h,69 :: 		else if(Sensor == 'R'){
	MOVF        FARG_getDistanceSonar2_Sensor+0, 0 
	XORLW       82
	BTFSS       STATUS+0, 2 
	GOTO        L_getDistanceSonar2445
;sonar.h,70 :: 		TRIG_RIGHT = 0;
	BCF         PORTA+0, 0 
;sonar.h,71 :: 		delay_us(2);
	MOVLW       3
	MOVWF       R13, 0
L_getDistanceSonar2446:
	DECFSZ      R13, 1, 0
	BRA         L_getDistanceSonar2446
;sonar.h,72 :: 		TRIG_RIGHT = 1;
	BSF         PORTA+0, 0 
;sonar.h,73 :: 		delay_us(5);
	MOVLW       8
	MOVWF       R13, 0
L_getDistanceSonar2447:
	DECFSZ      R13, 1, 0
	BRA         L_getDistanceSonar2447
;sonar.h,74 :: 		TRIG_RIGHT =0;
	BCF         PORTA+0, 0 
;sonar.h,76 :: 		while(!ECHO_RIGHT)
L_getDistanceSonar2448:
	BTFSC       PORTA+0, 1 
	GOTO        L_getDistanceSonar2449
;sonar.h,78 :: 		L=(TMR1L);
	MOVF        TMR1L+0, 0 
	MOVWF       getDistanceSonar2_L_L0+0 
	MOVLW       0
	MOVWF       getDistanceSonar2_L_L0+1 
;sonar.h,79 :: 		H=(TMR1H);
	MOVF        TMR1H+0, 0 
	MOVWF       getDistanceSonar2_H_L0+0 
	MOVLW       0
	MOVWF       getDistanceSonar2_H_L0+1 
;sonar.h,80 :: 		if(H>0xF0)
	MOVLW       0
	MOVWF       R0 
	MOVF        getDistanceSonar2_H_L0+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__getDistanceSonar2664
	MOVF        getDistanceSonar2_H_L0+0, 0 
	SUBLW       240
L__getDistanceSonar2664:
	BTFSC       STATUS+0, 0 
	GOTO        L_getDistanceSonar2450
;sonar.h,81 :: 		break;
	GOTO        L_getDistanceSonar2449
L_getDistanceSonar2450:
;sonar.h,82 :: 		}
	GOTO        L_getDistanceSonar2448
L_getDistanceSonar2449:
;sonar.h,83 :: 		TMR1H=0;
	CLRF        TMR1H+0 
;sonar.h,84 :: 		TMR1L=0;
	CLRF        TMR1L+0 
;sonar.h,85 :: 		T1CON.TMR1ON=1;
	BSF         T1CON+0, 0 
;sonar.h,86 :: 		while(ECHO_RIGHT)
L_getDistanceSonar2451:
	BTFSS       PORTA+0, 1 
	GOTO        L_getDistanceSonar2452
;sonar.h,88 :: 		L=(TMR1L);
	MOVF        TMR1L+0, 0 
	MOVWF       getDistanceSonar2_L_L0+0 
	MOVLW       0
	MOVWF       getDistanceSonar2_L_L0+1 
;sonar.h,89 :: 		H=(TMR1H);
	MOVF        TMR1H+0, 0 
	MOVWF       getDistanceSonar2_H_L0+0 
	MOVLW       0
	MOVWF       getDistanceSonar2_H_L0+1 
;sonar.h,90 :: 		if(H>0xF0)
	MOVLW       0
	MOVWF       R0 
	MOVF        getDistanceSonar2_H_L0+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__getDistanceSonar2665
	MOVF        getDistanceSonar2_H_L0+0, 0 
	SUBLW       240
L__getDistanceSonar2665:
	BTFSC       STATUS+0, 0 
	GOTO        L_getDistanceSonar2453
;sonar.h,91 :: 		break;
	GOTO        L_getDistanceSonar2452
L_getDistanceSonar2453:
;sonar.h,92 :: 		}
	GOTO        L_getDistanceSonar2451
L_getDistanceSonar2452:
;sonar.h,93 :: 		L=(TMR1L);
	MOVF        TMR1L+0, 0 
	MOVWF       getDistanceSonar2_L_L0+0 
	MOVLW       0
	MOVWF       getDistanceSonar2_L_L0+1 
;sonar.h,94 :: 		H=(TMR1H);
	MOVF        TMR1H+0, 0 
	MOVWF       getDistanceSonar2_H_L0+0 
	MOVLW       0
	MOVWF       getDistanceSonar2_H_L0+1 
;sonar.h,95 :: 		x=(H*256 + L)*0.2;
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
;sonar.h,96 :: 		y= (x/2)/29.1;
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
;sonar.h,97 :: 		return (int)y;
	CALL        _Double2Int+0, 0
	RETURN      0
;sonar.h,98 :: 		}
L_getDistanceSonar2445:
;sonar.h,99 :: 		else if(Sensor == 'L'){
	MOVF        FARG_getDistanceSonar2_Sensor+0, 0 
	XORLW       76
	BTFSS       STATUS+0, 2 
	GOTO        L_getDistanceSonar2455
;sonar.h,100 :: 		TRIG_LEFT = 0;
	BCF         PORTA+0, 2 
;sonar.h,101 :: 		delay_us(2);
	MOVLW       3
	MOVWF       R13, 0
L_getDistanceSonar2456:
	DECFSZ      R13, 1, 0
	BRA         L_getDistanceSonar2456
;sonar.h,102 :: 		TRIG_LEFT = 1;
	BSF         PORTA+0, 2 
;sonar.h,103 :: 		delay_us(5);
	MOVLW       8
	MOVWF       R13, 0
L_getDistanceSonar2457:
	DECFSZ      R13, 1, 0
	BRA         L_getDistanceSonar2457
;sonar.h,104 :: 		TRIG_LEFT =0;
	BCF         PORTA+0, 2 
;sonar.h,106 :: 		while(!ECHO_LEFT)
L_getDistanceSonar2458:
	BTFSC       PORTA+0, 3 
	GOTO        L_getDistanceSonar2459
;sonar.h,108 :: 		L=(TMR1L);
	MOVF        TMR1L+0, 0 
	MOVWF       getDistanceSonar2_L_L0+0 
	MOVLW       0
	MOVWF       getDistanceSonar2_L_L0+1 
;sonar.h,109 :: 		H=(TMR1H);
	MOVF        TMR1H+0, 0 
	MOVWF       getDistanceSonar2_H_L0+0 
	MOVLW       0
	MOVWF       getDistanceSonar2_H_L0+1 
;sonar.h,110 :: 		if(H>0xF0)
	MOVLW       0
	MOVWF       R0 
	MOVF        getDistanceSonar2_H_L0+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__getDistanceSonar2666
	MOVF        getDistanceSonar2_H_L0+0, 0 
	SUBLW       240
L__getDistanceSonar2666:
	BTFSC       STATUS+0, 0 
	GOTO        L_getDistanceSonar2460
;sonar.h,111 :: 		break;
	GOTO        L_getDistanceSonar2459
L_getDistanceSonar2460:
;sonar.h,112 :: 		}
	GOTO        L_getDistanceSonar2458
L_getDistanceSonar2459:
;sonar.h,113 :: 		TMR1H=0;
	CLRF        TMR1H+0 
;sonar.h,114 :: 		TMR1L=0;
	CLRF        TMR1L+0 
;sonar.h,115 :: 		T1CON.TMR1ON=1;
	BSF         T1CON+0, 0 
;sonar.h,116 :: 		while(ECHO_LEFT)
L_getDistanceSonar2461:
	BTFSS       PORTA+0, 3 
	GOTO        L_getDistanceSonar2462
;sonar.h,118 :: 		L=(TMR1L);
	MOVF        TMR1L+0, 0 
	MOVWF       getDistanceSonar2_L_L0+0 
	MOVLW       0
	MOVWF       getDistanceSonar2_L_L0+1 
;sonar.h,119 :: 		H=(TMR1H);
	MOVF        TMR1H+0, 0 
	MOVWF       getDistanceSonar2_H_L0+0 
	MOVLW       0
	MOVWF       getDistanceSonar2_H_L0+1 
;sonar.h,120 :: 		if(H>0xF0)
	MOVLW       0
	MOVWF       R0 
	MOVF        getDistanceSonar2_H_L0+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__getDistanceSonar2667
	MOVF        getDistanceSonar2_H_L0+0, 0 
	SUBLW       240
L__getDistanceSonar2667:
	BTFSC       STATUS+0, 0 
	GOTO        L_getDistanceSonar2463
;sonar.h,121 :: 		break;
	GOTO        L_getDistanceSonar2462
L_getDistanceSonar2463:
;sonar.h,122 :: 		}
	GOTO        L_getDistanceSonar2461
L_getDistanceSonar2462:
;sonar.h,123 :: 		L=(TMR1L);
	MOVF        TMR1L+0, 0 
	MOVWF       getDistanceSonar2_L_L0+0 
	MOVLW       0
	MOVWF       getDistanceSonar2_L_L0+1 
;sonar.h,124 :: 		H=(TMR1H);
	MOVF        TMR1H+0, 0 
	MOVWF       getDistanceSonar2_H_L0+0 
	MOVLW       0
	MOVWF       getDistanceSonar2_H_L0+1 
;sonar.h,125 :: 		x=(H*256 + L)*0.2;
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
;sonar.h,126 :: 		y= (x/2)/29.1;
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
;sonar.h,127 :: 		return (int)y;
	CALL        _Double2Int+0, 0
	RETURN      0
;sonar.h,128 :: 		}
L_getDistanceSonar2455:
;sonar.h,129 :: 		}
	RETURN      0
; end of _getDistanceSonar2

_checkSonar:

;Main 5.0V.c,23 :: 		void checkSonar(char Sensor){
;Main 5.0V.c,24 :: 		if(Sensor == 'L'){
	MOVF        FARG_checkSonar_Sensor+0, 0 
	XORLW       76
	BTFSS       STATUS+0, 2 
	GOTO        L_checkSonar464
;Main 5.0V.c,25 :: 		distanceSonar = getDistanceSonar2('L');
	MOVLW       76
	MOVWF       FARG_getDistanceSonar2_Sensor+0 
	CALL        _getDistanceSonar2+0, 0
	MOVF        R0, 0 
	MOVWF       _distanceSonar+0 
;Main 5.0V.c,26 :: 		if(distanceSonar < 10)
	MOVLW       10
	SUBWF       R0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_checkSonar465
;Main 5.0V.c,27 :: 		sendText("Obstacle" );
	MOVLW       ?lstr32_Main_325.0V+0
	MOVWF       FARG_sendText_aText+0 
	MOVLW       hi_addr(?lstr32_Main_325.0V+0)
	MOVWF       FARG_sendText_aText+1 
	CALL        _sendText+0, 0
L_checkSonar465:
;Main 5.0V.c,28 :: 		}
	GOTO        L_checkSonar466
L_checkSonar464:
;Main 5.0V.c,29 :: 		else if(Sensor == 'M'){
	MOVF        FARG_checkSonar_Sensor+0, 0 
	XORLW       77
	BTFSS       STATUS+0, 2 
	GOTO        L_checkSonar467
;Main 5.0V.c,30 :: 		distanceSonar = getDistanceSonar2('M');
	MOVLW       77
	MOVWF       FARG_getDistanceSonar2_Sensor+0 
	CALL        _getDistanceSonar2+0, 0
	MOVF        R0, 0 
	MOVWF       _distanceSonar+0 
;Main 5.0V.c,31 :: 		if(distanceSonar < 10)
	MOVLW       10
	SUBWF       R0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_checkSonar468
;Main 5.0V.c,32 :: 		sendText("Obstacle" );
	MOVLW       ?lstr33_Main_325.0V+0
	MOVWF       FARG_sendText_aText+0 
	MOVLW       hi_addr(?lstr33_Main_325.0V+0)
	MOVWF       FARG_sendText_aText+1 
	CALL        _sendText+0, 0
L_checkSonar468:
;Main 5.0V.c,33 :: 		}
	GOTO        L_checkSonar469
L_checkSonar467:
;Main 5.0V.c,34 :: 		else if(Sensor == 'R'){
	MOVF        FARG_checkSonar_Sensor+0, 0 
	XORLW       82
	BTFSS       STATUS+0, 2 
	GOTO        L_checkSonar470
;Main 5.0V.c,35 :: 		distanceSonar = getDistanceSonar2('R');
	MOVLW       82
	MOVWF       FARG_getDistanceSonar2_Sensor+0 
	CALL        _getDistanceSonar2+0, 0
	MOVF        R0, 0 
	MOVWF       _distanceSonar+0 
;Main 5.0V.c,36 :: 		if(distanceSonar < 10)
	MOVLW       10
	SUBWF       R0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_checkSonar471
;Main 5.0V.c,37 :: 		sendText("Obstacle" );
	MOVLW       ?lstr34_Main_325.0V+0
	MOVWF       FARG_sendText_aText+0 
	MOVLW       hi_addr(?lstr34_Main_325.0V+0)
	MOVWF       FARG_sendText_aText+1 
	CALL        _sendText+0, 0
L_checkSonar471:
;Main 5.0V.c,38 :: 		}
L_checkSonar470:
L_checkSonar469:
L_checkSonar466:
;Main 5.0V.c,39 :: 		delay_ms(500);
	MOVLW       13
	MOVWF       R11, 0
	MOVLW       175
	MOVWF       R12, 0
	MOVLW       182
	MOVWF       R13, 0
L_checkSonar472:
	DECFSZ      R13, 1, 0
	BRA         L_checkSonar472
	DECFSZ      R12, 1, 0
	BRA         L_checkSonar472
	DECFSZ      R11, 1, 0
	BRA         L_checkSonar472
	NOP
;Main 5.0V.c,40 :: 		}
	RETURN      0
; end of _checkSonar

_main:

;Main 5.0V.c,42 :: 		void main() {
;Main 5.0V.c,43 :: 		configure();
	CALL        _configure+0, 0
;Main 5.0V.c,44 :: 		setPID();
	CALL        _setPID+0, 0
;Main 5.0V.c,45 :: 		sendText("Starting...");
	MOVLW       ?lstr35_Main_325.0V+0
	MOVWF       FARG_sendText_aText+0 
	MOVLW       hi_addr(?lstr35_Main_325.0V+0)
	MOVWF       FARG_sendText_aText+1 
	CALL        _sendText+0, 0
;Main 5.0V.c,52 :: 		LEVEL1_STATE = NOT_REACHED;
	CLRF        _LEVEL1_STATE+0 
	CLRF        _LEVEL1_STATE+1 
;Main 5.0V.c,53 :: 		sendText("Starting Block  ");
	MOVLW       ?lstr36_Main_325.0V+0
	MOVWF       FARG_sendText_aText+0 
	MOVLW       hi_addr(?lstr36_Main_325.0V+0)
	MOVWF       FARG_sendText_aText+1 
	CALL        _sendText+0, 0
;Main 5.0V.c,54 :: 		LEVEL = 0;
	CLRF        _LEVEL+0 
	CLRF        _LEVEL+1 
;Main 5.0V.c,56 :: 		while(isAllWhite())
L_main473:
	CALL        _isAllWhite+0, 0
	MOVF        R0, 0 
	IORWF       R1, 0 
	BTFSC       STATUS+0, 2 
	GOTO        L_main474
;Main 5.0V.c,57 :: 		moveStraightSlow();
	CALL        _moveStraightSlow+0, 0
	GOTO        L_main473
L_main474:
;Main 5.0V.c,58 :: 		LEVEL = 1;
	MOVLW       1
	MOVWF       _LEVEL+0 
	MOVLW       0
	MOVWF       _LEVEL+1 
;Main 5.0V.c,59 :: 		sendText("Level 1 Starting  ");
	MOVLW       ?lstr37_Main_325.0V+0
	MOVWF       FARG_sendText_aText+0 
	MOVLW       hi_addr(?lstr37_Main_325.0V+0)
	MOVWF       FARG_sendText_aText+1 
	CALL        _sendText+0, 0
;Main 5.0V.c,60 :: 		LEVEL1_STATE = REACHED;
	MOVLW       1
	MOVWF       _LEVEL1_STATE+0 
	MOVLW       0
	MOVWF       _LEVEL1_STATE+1 
;Main 5.0V.c,61 :: 		stop();
	CALL        _stop+0, 0
;Main 5.0V.c,65 :: 		moveForward(205,200);
	MOVLW       205
	MOVWF       FARG_moveForward_pwmLeft+0 
	MOVLW       0
	MOVWF       FARG_moveForward_pwmLeft+1 
	MOVLW       200
	MOVWF       FARG_moveForward_pwmRight+0 
	MOVLW       0
	MOVWF       FARG_moveForward_pwmRight+1 
	CALL        _moveForward+0, 0
;Main 5.0V.c,66 :: 		delay_ms(100);
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       138
	MOVWF       R12, 0
	MOVLW       85
	MOVWF       R13, 0
L_main475:
	DECFSZ      R13, 1, 0
	BRA         L_main475
	DECFSZ      R12, 1, 0
	BRA         L_main475
	DECFSZ      R11, 1, 0
	BRA         L_main475
	NOP
	NOP
;Main 5.0V.c,67 :: 		while(!isAllBlack()){
L_main476:
	CALL        _isAllBlack+0, 0
	MOVF        R0, 0 
	IORWF       R1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_main477
;Main 5.0V.c,69 :: 		if( Scout==1 &&(Sensor3==1 || Sensor4==1 || Sensor5==1 || Sensor6==1 || Sensor7==1) && Sensor1==0 && Sensor2==0 && Sensor8==0 && Sensor9==0)
	BTFSS       PORTB+0, 5 
	GOTO        L_main482
	BTFSC       PORTD+0, 4 
	GOTO        L__main614
	BTFSC       PORTD+0, 5 
	GOTO        L__main614
	BTFSC       PORTD+0, 6 
	GOTO        L__main614
	BTFSC       PORTD+0, 7 
	GOTO        L__main614
	BTFSC       PORTB+0, 2 
	GOTO        L__main614
	GOTO        L_main482
L__main614:
	BTFSC       PORTB+0, 4 
	GOTO        L_main482
	BTFSC       PORTB+0, 3 
	GOTO        L_main482
	BTFSC       PORTB+0, 6 
	GOTO        L_main482
	BTFSC       PORTB+0, 7 
	GOTO        L_main482
L__main613:
;Main 5.0V.c,70 :: 		lineFollowPID();
	CALL        _lineFollowPID+0, 0
	GOTO        L_main483
L_main482:
;Main 5.0V.c,72 :: 		lineFollowNormalWorked();
	CALL        _lineFollowNormalWorked+0, 0
L_main483:
;Main 5.0V.c,73 :: 		}
	GOTO        L_main476
L_main477:
;Main 5.0V.c,74 :: 		stop();
	CALL        _stop+0, 0
;Main 5.0V.c,75 :: 		sendText("  End of Level 1. Level 2 Starting  ");
	MOVLW       ?lstr38_Main_325.0V+0
	MOVWF       FARG_sendText_aText+0 
	MOVLW       hi_addr(?lstr38_Main_325.0V+0)
	MOVWF       FARG_sendText_aText+1 
	CALL        _sendText+0, 0
;Main 5.0V.c,76 :: 		LEVEL1_STATE = COMPLETED;
	MOVLW       2
	MOVWF       _LEVEL1_STATE+0 
	MOVLW       0
	MOVWF       _LEVEL1_STATE+1 
;Main 5.0V.c,77 :: 		LEVEL2_STATE = REACHED;
	MOVLW       1
	MOVWF       _LEVEL2_STATE+0 
	MOVLW       0
	MOVWF       _LEVEL2_STATE+1 
;Main 5.0V.c,78 :: 		LEVEL = 2;
	MOVLW       2
	MOVWF       _LEVEL+0 
	MOVLW       0
	MOVWF       _LEVEL+1 
;Main 5.0V.c,82 :: 		while(!isAllWhite()){
L_main484:
	CALL        _isAllWhite+0, 0
	MOVF        R0, 0 
	IORWF       R1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_main485
;Main 5.0V.c,83 :: 		goThroughObstaclesJay();
	CALL        _goThroughObstaclesJay+0, 0
;Main 5.0V.c,84 :: 		}
	GOTO        L_main484
L_main485:
;Main 5.0V.c,86 :: 		stop();
	CALL        _stop+0, 0
;Main 5.0V.c,87 :: 		sendText("  End of Level 2. Level 3 Starting  ");
	MOVLW       ?lstr39_Main_325.0V+0
	MOVWF       FARG_sendText_aText+0 
	MOVLW       hi_addr(?lstr39_Main_325.0V+0)
	MOVWF       FARG_sendText_aText+1 
	CALL        _sendText+0, 0
;Main 5.0V.c,88 :: 		LEVEL2_STATE = COMPLETED;
	MOVLW       2
	MOVWF       _LEVEL2_STATE+0 
	MOVLW       0
	MOVWF       _LEVEL2_STATE+1 
;Main 5.0V.c,89 :: 		LEVEL3_STATE = REACHED;
	MOVLW       1
	MOVWF       _LEVEL3_STATE+0 
	MOVLW       0
	MOVWF       _LEVEL3_STATE+1 
;Main 5.0V.c,90 :: 		LEVEL = 3;
	MOVLW       3
	MOVWF       _LEVEL+0 
	MOVLW       0
	MOVWF       _LEVEL+1 
;Main 5.0V.c,94 :: 		level3Aligning();
	CALL        _level3Aligning+0, 0
;Main 5.0V.c,96 :: 		while(!isAllBlack()){
L_main486:
	CALL        _isAllBlack+0, 0
	MOVF        R0, 0 
	IORWF       R1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_main487
;Main 5.0V.c,97 :: 		stop();
	CALL        _stop+0, 0
;Main 5.0V.c,98 :: 		}
	GOTO        L_main486
L_main487:
;Main 5.0V.c,101 :: 		}
	GOTO        $+0
; end of _main

_isRightSafe:

;Main 5.0V.c,103 :: 		int isRightSafe(){
;Main 5.0V.c,104 :: 		ir_value = ADC_Read(IRSensorRight);
	MOVLW       0
	BTFSC       PORTA+0, 1 
	MOVLW       1
	MOVWF       FARG_ADC_Read_channel+0 
	CALL        _ADC_Read+0, 0
	MOVF        R0, 0 
	MOVWF       _ir_value+0 
	MOVF        R1, 0 
	MOVWF       _ir_value+1 
;Main 5.0V.c,105 :: 		if(250<=ir_value && ir_value<800){                         // ~5cm
	MOVLW       0
	SUBWF       R1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__isRightSafe668
	MOVLW       250
	SUBWF       R0, 0 
L__isRightSafe668:
	BTFSS       STATUS+0, 0 
	GOTO        L_isRightSafe490
	MOVLW       3
	SUBWF       _ir_value+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__isRightSafe669
	MOVLW       32
	SUBWF       _ir_value+0, 0 
L__isRightSafe669:
	BTFSC       STATUS+0, 0 
	GOTO        L_isRightSafe490
L__isRightSafe615:
;Main 5.0V.c,106 :: 		return FALSE;
	CLRF        R0 
	CLRF        R1 
	RETURN      0
;Main 5.0V.c,107 :: 		}
L_isRightSafe490:
;Main 5.0V.c,108 :: 		return TRUE;
	MOVLW       1
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
;Main 5.0V.c,109 :: 		}
	RETURN      0
; end of _isRightSafe

_isMiddleSafe:

;Main 5.0V.c,111 :: 		int isMiddleSafe(){
;Main 5.0V.c,112 :: 		ir_value = ADC_Read(IRSensorCenter);
	MOVLW       0
	BTFSC       PORTA+0, 0 
	MOVLW       1
	MOVWF       FARG_ADC_Read_channel+0 
	CALL        _ADC_Read+0, 0
	MOVF        R0, 0 
	MOVWF       _ir_value+0 
	MOVF        R1, 0 
	MOVWF       _ir_value+1 
;Main 5.0V.c,113 :: 		if(250<=ir_value && ir_value<800){                         // ~5cm
	MOVLW       0
	SUBWF       R1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__isMiddleSafe670
	MOVLW       250
	SUBWF       R0, 0 
L__isMiddleSafe670:
	BTFSS       STATUS+0, 0 
	GOTO        L_isMiddleSafe493
	MOVLW       3
	SUBWF       _ir_value+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__isMiddleSafe671
	MOVLW       32
	SUBWF       _ir_value+0, 0 
L__isMiddleSafe671:
	BTFSC       STATUS+0, 0 
	GOTO        L_isMiddleSafe493
L__isMiddleSafe616:
;Main 5.0V.c,114 :: 		return FALSE;
	CLRF        R0 
	CLRF        R1 
	RETURN      0
;Main 5.0V.c,115 :: 		}
L_isMiddleSafe493:
;Main 5.0V.c,116 :: 		return TRUE;
	MOVLW       1
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
;Main 5.0V.c,117 :: 		}
	RETURN      0
; end of _isMiddleSafe

_isLeftSafe:

;Main 5.0V.c,119 :: 		int isLeftSafe(){
;Main 5.0V.c,120 :: 		ir_value = ADC_Read(IRSensorLeft);
	MOVLW       0
	BTFSC       PORTA+0, 2 
	MOVLW       1
	MOVWF       FARG_ADC_Read_channel+0 
	CALL        _ADC_Read+0, 0
	MOVF        R0, 0 
	MOVWF       _ir_value+0 
	MOVF        R1, 0 
	MOVWF       _ir_value+1 
;Main 5.0V.c,121 :: 		if(250<=ir_value && ir_value<800){                         // ~5cm
	MOVLW       0
	SUBWF       R1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__isLeftSafe672
	MOVLW       250
	SUBWF       R0, 0 
L__isLeftSafe672:
	BTFSS       STATUS+0, 0 
	GOTO        L_isLeftSafe496
	MOVLW       3
	SUBWF       _ir_value+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__isLeftSafe673
	MOVLW       32
	SUBWF       _ir_value+0, 0 
L__isLeftSafe673:
	BTFSC       STATUS+0, 0 
	GOTO        L_isLeftSafe496
L__isLeftSafe617:
;Main 5.0V.c,122 :: 		return FALSE;
	CLRF        R0 
	CLRF        R1 
	RETURN      0
;Main 5.0V.c,123 :: 		}
L_isLeftSafe496:
;Main 5.0V.c,124 :: 		return TRUE;
	MOVLW       1
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
;Main 5.0V.c,125 :: 		}
	RETURN      0
; end of _isLeftSafe

_moveStraightSlow:

;Main 5.0V.c,127 :: 		void moveStraightSlow(){
;Main 5.0V.c,128 :: 		moveForward(205,200);
	MOVLW       205
	MOVWF       FARG_moveForward_pwmLeft+0 
	MOVLW       0
	MOVWF       FARG_moveForward_pwmLeft+1 
	MOVLW       200
	MOVWF       FARG_moveForward_pwmRight+0 
	MOVLW       0
	MOVWF       FARG_moveForward_pwmRight+1 
	CALL        _moveForward+0, 0
;Main 5.0V.c,129 :: 		}
	RETURN      0
; end of _moveStraightSlow

_moveStraightFast:

;Main 5.0V.c,131 :: 		void moveStraightFast(){
;Main 5.0V.c,132 :: 		moveForward(255,250);
	MOVLW       255
	MOVWF       FARG_moveForward_pwmLeft+0 
	MOVLW       0
	MOVWF       FARG_moveForward_pwmLeft+1 
	MOVLW       250
	MOVWF       FARG_moveForward_pwmRight+0 
	MOVLW       0
	MOVWF       FARG_moveForward_pwmRight+1 
	CALL        _moveForward+0, 0
;Main 5.0V.c,133 :: 		}
	RETURN      0
; end of _moveStraightFast

_goThroughObstacles:

;Main 5.0V.c,135 :: 		void goThroughObstacles(){
;Main 5.0V.c,136 :: 		if(getDistanceSonar2('M') < 10 ){
	MOVLW       77
	MOVWF       FARG_getDistanceSonar2_Sensor+0 
	CALL        _getDistanceSonar2+0, 0
	MOVLW       10
	SUBWF       R0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_goThroughObstacles497
;Main 5.0V.c,137 :: 		stop();
	CALL        _stop+0, 0
;Main 5.0V.c,138 :: 		if(DIRECTION<0){
	MOVLW       128
	XORWF       _DIRECTION+1, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__goThroughObstacles674
	MOVLW       0
	SUBWF       _DIRECTION+0, 0 
L__goThroughObstacles674:
	BTFSC       STATUS+0, 0 
	GOTO        L_goThroughObstacles498
;Main 5.0V.c,139 :: 		rotateByDegree(45);
	MOVLW       45
	MOVWF       FARG_rotateByDegree_degree+0 
	MOVLW       0
	MOVWF       FARG_rotateByDegree_degree+1 
	CALL        _rotateByDegree+0, 0
;Main 5.0V.c,140 :: 		DIRECTION +=45;
	MOVLW       45
	ADDWF       _DIRECTION+0, 1 
	MOVLW       0
	ADDWFC      _DIRECTION+1, 1 
;Main 5.0V.c,141 :: 		if(getDistanceSonar2('M') < 10 ){
	MOVLW       77
	MOVWF       FARG_getDistanceSonar2_Sensor+0 
	CALL        _getDistanceSonar2+0, 0
	MOVLW       10
	SUBWF       R0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_goThroughObstacles499
;Main 5.0V.c,142 :: 		rotateByDegree(-45);
	MOVLW       211
	MOVWF       FARG_rotateByDegree_degree+0 
	MOVLW       255
	MOVWF       FARG_rotateByDegree_degree+1 
	CALL        _rotateByDegree+0, 0
;Main 5.0V.c,143 :: 		rotateByDegree(-45);
	MOVLW       211
	MOVWF       FARG_rotateByDegree_degree+0 
	MOVLW       255
	MOVWF       FARG_rotateByDegree_degree+1 
	CALL        _rotateByDegree+0, 0
;Main 5.0V.c,144 :: 		DIRECTION -=90;
	MOVLW       90
	SUBWF       _DIRECTION+0, 1 
	MOVLW       0
	SUBWFB      _DIRECTION+1, 1 
;Main 5.0V.c,145 :: 		}
L_goThroughObstacles499:
;Main 5.0V.c,146 :: 		}
	GOTO        L_goThroughObstacles500
L_goThroughObstacles498:
;Main 5.0V.c,148 :: 		rotateByDegree(-45);
	MOVLW       211
	MOVWF       FARG_rotateByDegree_degree+0 
	MOVLW       255
	MOVWF       FARG_rotateByDegree_degree+1 
	CALL        _rotateByDegree+0, 0
;Main 5.0V.c,149 :: 		DIRECTION -=45;
	MOVLW       45
	SUBWF       _DIRECTION+0, 1 
	MOVLW       0
	SUBWFB      _DIRECTION+1, 1 
;Main 5.0V.c,150 :: 		if(getDistanceSonar2('M') < 10 ){
	MOVLW       77
	MOVWF       FARG_getDistanceSonar2_Sensor+0 
	CALL        _getDistanceSonar2+0, 0
	MOVLW       10
	SUBWF       R0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_goThroughObstacles501
;Main 5.0V.c,151 :: 		rotateByDegree(45);
	MOVLW       45
	MOVWF       FARG_rotateByDegree_degree+0 
	MOVLW       0
	MOVWF       FARG_rotateByDegree_degree+1 
	CALL        _rotateByDegree+0, 0
;Main 5.0V.c,152 :: 		rotateByDegree(45);
	MOVLW       45
	MOVWF       FARG_rotateByDegree_degree+0 
	MOVLW       0
	MOVWF       FARG_rotateByDegree_degree+1 
	CALL        _rotateByDegree+0, 0
;Main 5.0V.c,153 :: 		DIRECTION +=90;
	MOVLW       90
	ADDWF       _DIRECTION+0, 1 
	MOVLW       0
	ADDWFC      _DIRECTION+1, 1 
;Main 5.0V.c,154 :: 		}
L_goThroughObstacles501:
;Main 5.0V.c,155 :: 		}
L_goThroughObstacles500:
;Main 5.0V.c,156 :: 		}
	GOTO        L_goThroughObstacles502
L_goThroughObstacles497:
;Main 5.0V.c,158 :: 		moveStraightFast();
	CALL        _moveStraightFast+0, 0
;Main 5.0V.c,159 :: 		}
L_goThroughObstacles502:
;Main 5.0V.c,160 :: 		delay_ms(10);
	MOVLW       65
	MOVWF       R12, 0
	MOVLW       238
	MOVWF       R13, 0
L_goThroughObstacles503:
	DECFSZ      R13, 1, 0
	BRA         L_goThroughObstacles503
	DECFSZ      R12, 1, 0
	BRA         L_goThroughObstacles503
	NOP
;Main 5.0V.c,161 :: 		}
	RETURN      0
; end of _goThroughObstacles

_goThroughObstaclesJay:

;Main 5.0V.c,163 :: 		void goThroughObstaclesJay(){
;Main 5.0V.c,164 :: 		if(isPathClearSonar() == 0) {
	CALL        _isPathClearSonar+0, 0
	MOVLW       0
	XORWF       R1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__goThroughObstaclesJay675
	MOVLW       0
	XORWF       R0, 0 
L__goThroughObstaclesJay675:
	BTFSS       STATUS+0, 2 
	GOTO        L_goThroughObstaclesJay504
;Main 5.0V.c,165 :: 		rotateByDegree(30);
	MOVLW       30
	MOVWF       FARG_rotateByDegree_degree+0 
	MOVLW       0
	MOVWF       FARG_rotateByDegree_degree+1 
	CALL        _rotateByDegree+0, 0
;Main 5.0V.c,166 :: 		if(isPathClearSonar() == 0) {
	CALL        _isPathClearSonar+0, 0
	MOVLW       0
	XORWF       R1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__goThroughObstaclesJay676
	MOVLW       0
	XORWF       R0, 0 
L__goThroughObstaclesJay676:
	BTFSS       STATUS+0, 2 
	GOTO        L_goThroughObstaclesJay505
;Main 5.0V.c,167 :: 		rotateByDegree(-60);
	MOVLW       196
	MOVWF       FARG_rotateByDegree_degree+0 
	MOVLW       255
	MOVWF       FARG_rotateByDegree_degree+1 
	CALL        _rotateByDegree+0, 0
;Main 5.0V.c,168 :: 		if(isPathClearSonar() == 0) {
	CALL        _isPathClearSonar+0, 0
	MOVLW       0
	XORWF       R1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__goThroughObstaclesJay677
	MOVLW       0
	XORWF       R0, 0 
L__goThroughObstaclesJay677:
	BTFSS       STATUS+0, 2 
	GOTO        L_goThroughObstaclesJay506
;Main 5.0V.c,169 :: 		rotateByDegree(90);
	MOVLW       90
	MOVWF       FARG_rotateByDegree_degree+0 
	MOVLW       0
	MOVWF       FARG_rotateByDegree_degree+1 
	CALL        _rotateByDegree+0, 0
;Main 5.0V.c,170 :: 		if(isPathClearSonar() == 0) {
	CALL        _isPathClearSonar+0, 0
	MOVLW       0
	XORWF       R1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__goThroughObstaclesJay678
	MOVLW       0
	XORWF       R0, 0 
L__goThroughObstaclesJay678:
	BTFSS       STATUS+0, 2 
	GOTO        L_goThroughObstaclesJay507
;Main 5.0V.c,171 :: 		rotateByDegree(-90);
	MOVLW       166
	MOVWF       FARG_rotateByDegree_degree+0 
	MOVLW       255
	MOVWF       FARG_rotateByDegree_degree+1 
	CALL        _rotateByDegree+0, 0
;Main 5.0V.c,172 :: 		rotateByDegree(-30);
	MOVLW       226
	MOVWF       FARG_rotateByDegree_degree+0 
	MOVLW       255
	MOVWF       FARG_rotateByDegree_degree+1 
	CALL        _rotateByDegree+0, 0
;Main 5.0V.c,173 :: 		if(isPathClearSonar() == 0) {
	CALL        _isPathClearSonar+0, 0
	MOVLW       0
	XORWF       R1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__goThroughObstaclesJay679
	MOVLW       0
	XORWF       R0, 0 
L__goThroughObstaclesJay679:
	BTFSS       STATUS+0, 2 
	GOTO        L_goThroughObstaclesJay508
;Main 5.0V.c,174 :: 		rotateByDegree(90);
	MOVLW       90
	MOVWF       FARG_rotateByDegree_degree+0 
	MOVLW       0
	MOVWF       FARG_rotateByDegree_degree+1 
	CALL        _rotateByDegree+0, 0
;Main 5.0V.c,175 :: 		rotateByDegree(60);
	MOVLW       60
	MOVWF       FARG_rotateByDegree_degree+0 
	MOVLW       0
	MOVWF       FARG_rotateByDegree_degree+1 
	CALL        _rotateByDegree+0, 0
;Main 5.0V.c,176 :: 		if(isPathClearSonar() == 0) {
	CALL        _isPathClearSonar+0, 0
	MOVLW       0
	XORWF       R1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__goThroughObstaclesJay680
	MOVLW       0
	XORWF       R0, 0 
L__goThroughObstaclesJay680:
	BTFSS       STATUS+0, 2 
	GOTO        L_goThroughObstaclesJay509
;Main 5.0V.c,177 :: 		rotateByDegree(-90);
	MOVLW       166
	MOVWF       FARG_rotateByDegree_degree+0 
	MOVLW       255
	MOVWF       FARG_rotateByDegree_degree+1 
	CALL        _rotateByDegree+0, 0
;Main 5.0V.c,178 :: 		rotateByDegree(-90);
	MOVLW       166
	MOVWF       FARG_rotateByDegree_degree+0 
	MOVLW       255
	MOVWF       FARG_rotateByDegree_degree+1 
	CALL        _rotateByDegree+0, 0
;Main 5.0V.c,179 :: 		}
L_goThroughObstaclesJay509:
;Main 5.0V.c,180 :: 		}
L_goThroughObstaclesJay508:
;Main 5.0V.c,181 :: 		}
L_goThroughObstaclesJay507:
;Main 5.0V.c,182 :: 		}
L_goThroughObstaclesJay506:
;Main 5.0V.c,183 :: 		}
L_goThroughObstaclesJay505:
;Main 5.0V.c,184 :: 		}
L_goThroughObstaclesJay504:
;Main 5.0V.c,185 :: 		moveStraightSlow();
	CALL        _moveStraightSlow+0, 0
;Main 5.0V.c,186 :: 		delay_ms(10);
	MOVLW       65
	MOVWF       R12, 0
	MOVLW       238
	MOVWF       R13, 0
L_goThroughObstaclesJay510:
	DECFSZ      R13, 1, 0
	BRA         L_goThroughObstaclesJay510
	DECFSZ      R12, 1, 0
	BRA         L_goThroughObstaclesJay510
	NOP
;Main 5.0V.c,187 :: 		}
	RETURN      0
; end of _goThroughObstaclesJay

_level3Aligning:

;Main 5.0V.c,189 :: 		void level3Aligning(){
;Main 5.0V.c,190 :: 		while(Sensor5 == 1)
L_level3Aligning511:
	BTFSS       PORTD+0, 6 
	GOTO        L_level3Aligning512
;Main 5.0V.c,191 :: 		reverse(255,255);
	MOVLW       255
	MOVWF       FARG_reverse_pwmLeft+0 
	MOVLW       0
	MOVWF       FARG_reverse_pwmLeft+1 
	MOVLW       255
	MOVWF       FARG_reverse_pwmRight+0 
	MOVLW       0
	MOVWF       FARG_reverse_pwmRight+1 
	CALL        _reverse+0, 0
	GOTO        L_level3Aligning511
L_level3Aligning512:
;Main 5.0V.c,192 :: 		stop();
	CALL        _stop+0, 0
;Main 5.0V.c,193 :: 		delay_ms(500);
	MOVLW       13
	MOVWF       R11, 0
	MOVLW       175
	MOVWF       R12, 0
	MOVLW       182
	MOVWF       R13, 0
L_level3Aligning513:
	DECFSZ      R13, 1, 0
	BRA         L_level3Aligning513
	DECFSZ      R12, 1, 0
	BRA         L_level3Aligning513
	DECFSZ      R11, 1, 0
	BRA         L_level3Aligning513
	NOP
;Main 5.0V.c,194 :: 		while(!isAllBlack()){
L_level3Aligning514:
	CALL        _isAllBlack+0, 0
	MOVF        R0, 0 
	IORWF       R1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_level3Aligning515
;Main 5.0V.c,195 :: 		if(Sensor9 == 1)
	BTFSS       PORTB+0, 7 
	GOTO        L_level3Aligning516
;Main 5.0V.c,196 :: 		rotateAntiClockwise(220);
	MOVLW       220
	MOVWF       FARG_rotateAntiClockwise_pwm+0 
	MOVLW       0
	MOVWF       FARG_rotateAntiClockwise_pwm+1 
	CALL        _rotateAntiClockwise+0, 0
	GOTO        L_level3Aligning517
L_level3Aligning516:
;Main 5.0V.c,197 :: 		else if(Sensor1 == 1)
	BTFSS       PORTB+0, 4 
	GOTO        L_level3Aligning518
;Main 5.0V.c,198 :: 		rotateClockwise(220);
	MOVLW       220
	MOVWF       FARG_rotateClockwise_pwm+0 
	MOVLW       0
	MOVWF       FARG_rotateClockwise_pwm+1 
	CALL        _rotateClockwise+0, 0
L_level3Aligning518:
L_level3Aligning517:
;Main 5.0V.c,199 :: 		}
	GOTO        L_level3Aligning514
L_level3Aligning515:
;Main 5.0V.c,201 :: 		}
	RETURN      0
; end of _level3Aligning

_isPathClearSonar:

;Main 5.0V.c,203 :: 		int isPathClearSonar() {
;Main 5.0V.c,204 :: 		if(getDistanceSonar2('L') < 10 || getDistanceSonar2('M') < 15 || getDistanceSonar2('R') < 10) {
	MOVLW       76
	MOVWF       FARG_getDistanceSonar2_Sensor+0 
	CALL        _getDistanceSonar2+0, 0
	MOVLW       10
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 0 
	GOTO        L__isPathClearSonar618
	MOVLW       77
	MOVWF       FARG_getDistanceSonar2_Sensor+0 
	CALL        _getDistanceSonar2+0, 0
	MOVLW       15
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 0 
	GOTO        L__isPathClearSonar618
	MOVLW       82
	MOVWF       FARG_getDistanceSonar2_Sensor+0 
	CALL        _getDistanceSonar2+0, 0
	MOVLW       10
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 0 
	GOTO        L__isPathClearSonar618
	GOTO        L_isPathClearSonar521
L__isPathClearSonar618:
;Main 5.0V.c,205 :: 		return 0;     // Not Clear
	CLRF        R0 
	CLRF        R1 
	RETURN      0
;Main 5.0V.c,206 :: 		} else {
L_isPathClearSonar521:
;Main 5.0V.c,207 :: 		return 1;
	MOVLW       1
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
;Main 5.0V.c,209 :: 		}
	RETURN      0
; end of _isPathClearSonar
