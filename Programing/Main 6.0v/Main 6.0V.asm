
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
L__isAllBlack589:
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
L__isAllWhite590:
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

;motion.h,30 :: 		void motorLeft_foward(int pwm){
;motion.h,31 :: 		Motor_Left_Forward = 1;
	BSF         PORTD+0, 2 
;motion.h,32 :: 		Motor_Left_Reverse = 0;
	BCF         PORTD+0, 3 
;motion.h,33 :: 		PWM2_Set_Duty(pwm);
	MOVF        FARG_motorLeft_foward_pwm+0, 0 
	MOVWF       FARG_PWM2_Set_Duty_new_duty+0 
	CALL        _PWM2_Set_Duty+0, 0
;motion.h,34 :: 		}
	RETURN      0
; end of _motorLeft_foward

_motorRight_foward:

;motion.h,36 :: 		void motorRight_foward(int pwm){
;motion.h,37 :: 		Motor_Right_Forward = 1;
	BSF         PORTC+0, 4 
;motion.h,38 :: 		Motor_Right_Reverse = 0;
	BCF         PORTC+0, 5 
;motion.h,39 :: 		PWM1_Set_Duty(pwm);
	MOVF        FARG_motorRight_foward_pwm+0, 0 
	MOVWF       FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;motion.h,40 :: 		}
	RETURN      0
; end of _motorRight_foward

_motorLeft_reverse:

;motion.h,42 :: 		void motorLeft_reverse(int pwm){
;motion.h,43 :: 		Motor_Left_Forward = 0;
	BCF         PORTD+0, 2 
;motion.h,44 :: 		Motor_Left_Reverse = 1;
	BSF         PORTD+0, 3 
;motion.h,45 :: 		PWM2_Set_Duty(pwm);
	MOVF        FARG_motorLeft_reverse_pwm+0, 0 
	MOVWF       FARG_PWM2_Set_Duty_new_duty+0 
	CALL        _PWM2_Set_Duty+0, 0
;motion.h,46 :: 		}
	RETURN      0
; end of _motorLeft_reverse

_motorRight_reverse:

;motion.h,48 :: 		void motorRight_reverse(int pwm){
;motion.h,49 :: 		Motor_Right_Forward = 0;
	BCF         PORTC+0, 4 
;motion.h,50 :: 		Motor_Right_Reverse = 1;
	BSF         PORTC+0, 5 
;motion.h,51 :: 		PWM1_Set_Duty(pwm);
	MOVF        FARG_motorRight_reverse_pwm+0, 0 
	MOVWF       FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;motion.h,52 :: 		}
	RETURN      0
; end of _motorRight_reverse

_motorLeft_stop:

;motion.h,54 :: 		void motorLeft_stop(){
;motion.h,55 :: 		Motor_Left_Forward = 1;
	BSF         PORTD+0, 2 
;motion.h,56 :: 		Motor_Left_Reverse = 1;
	BSF         PORTD+0, 3 
;motion.h,57 :: 		}
	RETURN      0
; end of _motorLeft_stop

_motorRight_stop:

;motion.h,59 :: 		void motorRight_stop(){
;motion.h,60 :: 		Motor_Right_Forward = 1;
	BSF         PORTC+0, 4 
;motion.h,61 :: 		Motor_Right_Reverse = 1;
	BSF         PORTC+0, 5 
;motion.h,62 :: 		}
	RETURN      0
; end of _motorRight_stop

_moveForward:

;motion.h,64 :: 		void moveForward(int pwmLeft, int pwmRight){
;motion.h,65 :: 		motorLeft_foward(pwmLeft);
	MOVF        FARG_moveForward_pwmLeft+0, 0 
	MOVWF       FARG_motorLeft_foward_pwm+0 
	MOVF        FARG_moveForward_pwmLeft+1, 0 
	MOVWF       FARG_motorLeft_foward_pwm+1 
	CALL        _motorLeft_foward+0, 0
;motion.h,66 :: 		motorRight_foward(pwmRight);
	MOVF        FARG_moveForward_pwmRight+0, 0 
	MOVWF       FARG_motorRight_foward_pwm+0 
	MOVF        FARG_moveForward_pwmRight+1, 0 
	MOVWF       FARG_motorRight_foward_pwm+1 
	CALL        _motorRight_foward+0, 0
;motion.h,67 :: 		}
	RETURN      0
; end of _moveForward

_reverse:

;motion.h,69 :: 		void reverse(int pwmLeft, int pwmRight){
;motion.h,70 :: 		motorLeft_reverse(pwmLeft);
	MOVF        FARG_reverse_pwmLeft+0, 0 
	MOVWF       FARG_motorLeft_reverse_pwm+0 
	MOVF        FARG_reverse_pwmLeft+1, 0 
	MOVWF       FARG_motorLeft_reverse_pwm+1 
	CALL        _motorLeft_reverse+0, 0
;motion.h,71 :: 		motorRight_reverse(pwmRight);
	MOVF        FARG_reverse_pwmRight+0, 0 
	MOVWF       FARG_motorRight_reverse_pwm+0 
	MOVF        FARG_reverse_pwmRight+1, 0 
	MOVWF       FARG_motorRight_reverse_pwm+1 
	CALL        _motorRight_reverse+0, 0
;motion.h,72 :: 		}
	RETURN      0
; end of _reverse

_turnRight:

;motion.h,74 :: 		void turnRight(int pwmLeft){
;motion.h,75 :: 		motorLeft_foward(pwmLeft);
	MOVF        FARG_turnRight_pwmLeft+0, 0 
	MOVWF       FARG_motorLeft_foward_pwm+0 
	MOVF        FARG_turnRight_pwmLeft+1, 0 
	MOVWF       FARG_motorLeft_foward_pwm+1 
	CALL        _motorLeft_foward+0, 0
;motion.h,76 :: 		motorRight_stop();
	CALL        _motorRight_stop+0, 0
;motion.h,77 :: 		}
	RETURN      0
; end of _turnRight

_turnLeft:

;motion.h,79 :: 		void turnLeft(int pwmRight){
;motion.h,80 :: 		motorRight_foward(pwmRight);
	MOVF        FARG_turnLeft_pwmRight+0, 0 
	MOVWF       FARG_motorRight_foward_pwm+0 
	MOVF        FARG_turnLeft_pwmRight+1, 0 
	MOVWF       FARG_motorRight_foward_pwm+1 
	CALL        _motorRight_foward+0, 0
;motion.h,81 :: 		motorLeft_stop();
	CALL        _motorLeft_stop+0, 0
;motion.h,82 :: 		}
	RETURN      0
; end of _turnLeft

_rotateClockwise:

;motion.h,84 :: 		void rotateClockwise(int pwm){
;motion.h,85 :: 		motorLeft_foward(pwm);
	MOVF        FARG_rotateClockwise_pwm+0, 0 
	MOVWF       FARG_motorLeft_foward_pwm+0 
	MOVF        FARG_rotateClockwise_pwm+1, 0 
	MOVWF       FARG_motorLeft_foward_pwm+1 
	CALL        _motorLeft_foward+0, 0
;motion.h,86 :: 		motorRight_reverse(pwm);
	MOVF        FARG_rotateClockwise_pwm+0, 0 
	MOVWF       FARG_motorRight_reverse_pwm+0 
	MOVF        FARG_rotateClockwise_pwm+1, 0 
	MOVWF       FARG_motorRight_reverse_pwm+1 
	CALL        _motorRight_reverse+0, 0
;motion.h,87 :: 		}
	RETURN      0
; end of _rotateClockwise

_rotateAntiClockwise:

;motion.h,89 :: 		void rotateAntiClockwise(int pwm){
;motion.h,90 :: 		motorLeft_reverse(pwm);
	MOVF        FARG_rotateAntiClockwise_pwm+0, 0 
	MOVWF       FARG_motorLeft_reverse_pwm+0 
	MOVF        FARG_rotateAntiClockwise_pwm+1, 0 
	MOVWF       FARG_motorLeft_reverse_pwm+1 
	CALL        _motorLeft_reverse+0, 0
;motion.h,91 :: 		motorRight_foward(pwm);
	MOVF        FARG_rotateAntiClockwise_pwm+0, 0 
	MOVWF       FARG_motorRight_foward_pwm+0 
	MOVF        FARG_rotateAntiClockwise_pwm+1, 0 
	MOVWF       FARG_motorRight_foward_pwm+1 
	CALL        _motorRight_foward+0, 0
;motion.h,92 :: 		}
	RETURN      0
; end of _rotateAntiClockwise

_stop:

;motion.h,94 :: 		void stop(){
;motion.h,95 :: 		motorLeft_stop();
	CALL        _motorLeft_stop+0, 0
;motion.h,96 :: 		motorRight_stop();
	CALL        _motorRight_stop+0, 0
;motion.h,97 :: 		}
	RETURN      0
; end of _stop

_rotateByDegree:

;motion.h,99 :: 		void rotateByDegree(int degree){
;motion.h,100 :: 		if( degree == -90 ){
	MOVLW       255
	XORWF       FARG_rotateByDegree_degree+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__rotateByDegree695
	MOVLW       166
	XORWF       FARG_rotateByDegree_degree+0, 0 
L__rotateByDegree695:
	BTFSS       STATUS+0, 2 
	GOTO        L_rotateByDegree8
;motion.h,101 :: 		rotateAntiClockwise(255);
	MOVLW       255
	MOVWF       FARG_rotateAntiClockwise_pwm+0 
	MOVLW       0
	MOVWF       FARG_rotateAntiClockwise_pwm+1 
	CALL        _rotateAntiClockwise+0, 0
;motion.h,102 :: 		delay_ms(230);
	MOVLW       6
	MOVWF       R11, 0
	MOVLW       214
	MOVWF       R12, 0
	MOVLW       123
	MOVWF       R13, 0
L_rotateByDegree9:
	DECFSZ      R13, 1, 0
	BRA         L_rotateByDegree9
	DECFSZ      R12, 1, 0
	BRA         L_rotateByDegree9
	DECFSZ      R11, 1, 0
	BRA         L_rotateByDegree9
	NOP
	NOP
;motion.h,103 :: 		stop();
	CALL        _stop+0, 0
;motion.h,104 :: 		}
	GOTO        L_rotateByDegree10
L_rotateByDegree8:
;motion.h,105 :: 		else if( degree == 90 ){
	MOVLW       0
	XORWF       FARG_rotateByDegree_degree+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__rotateByDegree696
	MOVLW       90
	XORWF       FARG_rotateByDegree_degree+0, 0 
L__rotateByDegree696:
	BTFSS       STATUS+0, 2 
	GOTO        L_rotateByDegree11
;motion.h,106 :: 		rotateClockwise(255);
	MOVLW       255
	MOVWF       FARG_rotateClockwise_pwm+0 
	MOVLW       0
	MOVWF       FARG_rotateClockwise_pwm+1 
	CALL        _rotateClockwise+0, 0
;motion.h,107 :: 		delay_ms(230);
	MOVLW       6
	MOVWF       R11, 0
	MOVLW       214
	MOVWF       R12, 0
	MOVLW       123
	MOVWF       R13, 0
L_rotateByDegree12:
	DECFSZ      R13, 1, 0
	BRA         L_rotateByDegree12
	DECFSZ      R12, 1, 0
	BRA         L_rotateByDegree12
	DECFSZ      R11, 1, 0
	BRA         L_rotateByDegree12
	NOP
	NOP
;motion.h,108 :: 		stop();
	CALL        _stop+0, 0
;motion.h,109 :: 		}
	GOTO        L_rotateByDegree13
L_rotateByDegree11:
;motion.h,110 :: 		else if( degree == -30 ){
	MOVLW       255
	XORWF       FARG_rotateByDegree_degree+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__rotateByDegree697
	MOVLW       226
	XORWF       FARG_rotateByDegree_degree+0, 0 
L__rotateByDegree697:
	BTFSS       STATUS+0, 2 
	GOTO        L_rotateByDegree14
;motion.h,111 :: 		rotateAntiClockwise(255);
	MOVLW       255
	MOVWF       FARG_rotateAntiClockwise_pwm+0 
	MOVLW       0
	MOVWF       FARG_rotateAntiClockwise_pwm+1 
	CALL        _rotateAntiClockwise+0, 0
;motion.h,112 :: 		delay_ms(100);
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
;motion.h,113 :: 		stop();
	CALL        _stop+0, 0
;motion.h,114 :: 		delay_ms(200);
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
;motion.h,115 :: 		}
	GOTO        L_rotateByDegree17
L_rotateByDegree14:
;motion.h,116 :: 		else if( degree == 30 ){
	MOVLW       0
	XORWF       FARG_rotateByDegree_degree+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__rotateByDegree698
	MOVLW       30
	XORWF       FARG_rotateByDegree_degree+0, 0 
L__rotateByDegree698:
	BTFSS       STATUS+0, 2 
	GOTO        L_rotateByDegree18
;motion.h,117 :: 		rotateClockwise(255);
	MOVLW       255
	MOVWF       FARG_rotateClockwise_pwm+0 
	MOVLW       0
	MOVWF       FARG_rotateClockwise_pwm+1 
	CALL        _rotateClockwise+0, 0
;motion.h,118 :: 		delay_ms(100);
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
;motion.h,119 :: 		stop();
	CALL        _stop+0, 0
;motion.h,120 :: 		delay_ms(200);
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
;motion.h,121 :: 		}
	GOTO        L_rotateByDegree21
L_rotateByDegree18:
;motion.h,122 :: 		else if( degree == -60 ){
	MOVLW       255
	XORWF       FARG_rotateByDegree_degree+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__rotateByDegree699
	MOVLW       196
	XORWF       FARG_rotateByDegree_degree+0, 0 
L__rotateByDegree699:
	BTFSS       STATUS+0, 2 
	GOTO        L_rotateByDegree22
;motion.h,123 :: 		rotateAntiClockwise(255);
	MOVLW       255
	MOVWF       FARG_rotateAntiClockwise_pwm+0 
	MOVLW       0
	MOVWF       FARG_rotateAntiClockwise_pwm+1 
	CALL        _rotateAntiClockwise+0, 0
;motion.h,124 :: 		delay_ms(155);
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
;motion.h,125 :: 		stop();
	CALL        _stop+0, 0
;motion.h,126 :: 		delay_ms(200);
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
;motion.h,127 :: 		}
	GOTO        L_rotateByDegree25
L_rotateByDegree22:
;motion.h,128 :: 		else if( degree == 60 ){
	MOVLW       0
	XORWF       FARG_rotateByDegree_degree+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__rotateByDegree700
	MOVLW       60
	XORWF       FARG_rotateByDegree_degree+0, 0 
L__rotateByDegree700:
	BTFSS       STATUS+0, 2 
	GOTO        L_rotateByDegree26
;motion.h,129 :: 		rotateClockwise(255);
	MOVLW       255
	MOVWF       FARG_rotateClockwise_pwm+0 
	MOVLW       0
	MOVWF       FARG_rotateClockwise_pwm+1 
	CALL        _rotateClockwise+0, 0
;motion.h,130 :: 		delay_ms(155);
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
;motion.h,131 :: 		stop();
	CALL        _stop+0, 0
;motion.h,132 :: 		delay_ms(200);
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
;motion.h,133 :: 		}
	GOTO        L_rotateByDegree29
L_rotateByDegree26:
;motion.h,134 :: 		else if( degree == -45 ){
	MOVLW       255
	XORWF       FARG_rotateByDegree_degree+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__rotateByDegree701
	MOVLW       211
	XORWF       FARG_rotateByDegree_degree+0, 0 
L__rotateByDegree701:
	BTFSS       STATUS+0, 2 
	GOTO        L_rotateByDegree30
;motion.h,135 :: 		rotateAntiClockwise(255);
	MOVLW       255
	MOVWF       FARG_rotateAntiClockwise_pwm+0 
	MOVLW       0
	MOVWF       FARG_rotateAntiClockwise_pwm+1 
	CALL        _rotateAntiClockwise+0, 0
;motion.h,136 :: 		delay_ms(135);
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
;motion.h,137 :: 		stop();
	CALL        _stop+0, 0
;motion.h,138 :: 		delay_ms(200);
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
;motion.h,139 :: 		}
	GOTO        L_rotateByDegree33
L_rotateByDegree30:
;motion.h,140 :: 		else if( degree == 45 ){
	MOVLW       0
	XORWF       FARG_rotateByDegree_degree+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__rotateByDegree702
	MOVLW       45
	XORWF       FARG_rotateByDegree_degree+0, 0 
L__rotateByDegree702:
	BTFSS       STATUS+0, 2 
	GOTO        L_rotateByDegree34
;motion.h,141 :: 		rotateClockwise(255);
	MOVLW       255
	MOVWF       FARG_rotateClockwise_pwm+0 
	MOVLW       0
	MOVWF       FARG_rotateClockwise_pwm+1 
	CALL        _rotateClockwise+0, 0
;motion.h,142 :: 		delay_ms(135);
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
;motion.h,143 :: 		stop();
	CALL        _stop+0, 0
;motion.h,144 :: 		delay_ms(200);
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
;motion.h,145 :: 		}
	GOTO        L_rotateByDegree37
L_rotateByDegree34:
;motion.h,146 :: 		else if( degree == -2 ){
	MOVLW       255
	XORWF       FARG_rotateByDegree_degree+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__rotateByDegree703
	MOVLW       254
	XORWF       FARG_rotateByDegree_degree+0, 0 
L__rotateByDegree703:
	BTFSS       STATUS+0, 2 
	GOTO        L_rotateByDegree38
;motion.h,147 :: 		rotateAntiClockwise(255);
	MOVLW       255
	MOVWF       FARG_rotateAntiClockwise_pwm+0 
	MOVLW       0
	MOVWF       FARG_rotateAntiClockwise_pwm+1 
	CALL        _rotateAntiClockwise+0, 0
;motion.h,148 :: 		delay_ms(6);
	MOVLW       39
	MOVWF       R12, 0
	MOVLW       245
	MOVWF       R13, 0
L_rotateByDegree39:
	DECFSZ      R13, 1, 0
	BRA         L_rotateByDegree39
	DECFSZ      R12, 1, 0
	BRA         L_rotateByDegree39
;motion.h,149 :: 		stop();
	CALL        _stop+0, 0
;motion.h,150 :: 		delay_ms(50);
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       69
	MOVWF       R12, 0
	MOVLW       169
	MOVWF       R13, 0
L_rotateByDegree40:
	DECFSZ      R13, 1, 0
	BRA         L_rotateByDegree40
	DECFSZ      R12, 1, 0
	BRA         L_rotateByDegree40
	DECFSZ      R11, 1, 0
	BRA         L_rotateByDegree40
	NOP
	NOP
;motion.h,151 :: 		}
	GOTO        L_rotateByDegree41
L_rotateByDegree38:
;motion.h,152 :: 		else if( degree == 2 ){
	MOVLW       0
	XORWF       FARG_rotateByDegree_degree+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__rotateByDegree704
	MOVLW       2
	XORWF       FARG_rotateByDegree_degree+0, 0 
L__rotateByDegree704:
	BTFSS       STATUS+0, 2 
	GOTO        L_rotateByDegree42
;motion.h,153 :: 		rotateClockwise(255);
	MOVLW       255
	MOVWF       FARG_rotateClockwise_pwm+0 
	MOVLW       0
	MOVWF       FARG_rotateClockwise_pwm+1 
	CALL        _rotateClockwise+0, 0
;motion.h,154 :: 		delay_ms(6);
	MOVLW       39
	MOVWF       R12, 0
	MOVLW       245
	MOVWF       R13, 0
L_rotateByDegree43:
	DECFSZ      R13, 1, 0
	BRA         L_rotateByDegree43
	DECFSZ      R12, 1, 0
	BRA         L_rotateByDegree43
;motion.h,155 :: 		stop();
	CALL        _stop+0, 0
;motion.h,156 :: 		delay_ms(50);
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       69
	MOVWF       R12, 0
	MOVLW       169
	MOVWF       R13, 0
L_rotateByDegree44:
	DECFSZ      R13, 1, 0
	BRA         L_rotateByDegree44
	DECFSZ      R12, 1, 0
	BRA         L_rotateByDegree44
	DECFSZ      R11, 1, 0
	BRA         L_rotateByDegree44
	NOP
	NOP
;motion.h,157 :: 		}
L_rotateByDegree42:
L_rotateByDegree41:
L_rotateByDegree37:
L_rotateByDegree33:
L_rotateByDegree29:
L_rotateByDegree25:
L_rotateByDegree21:
L_rotateByDegree17:
L_rotateByDegree13:
L_rotateByDegree10:
;motion.h,158 :: 		}
	RETURN      0
; end of _rotateByDegree

_testMotion:

;motion.h,160 :: 		void testMotion(int pwm){
;motion.h,161 :: 		rotateClockwise(pwm);
	MOVF        FARG_testMotion_pwm+0, 0 
	MOVWF       FARG_rotateClockwise_pwm+0 
	MOVF        FARG_testMotion_pwm+1, 0 
	MOVWF       FARG_rotateClockwise_pwm+1 
	CALL        _rotateClockwise+0, 0
;motion.h,162 :: 		delay_ms(1000);
	MOVLW       26
	MOVWF       R11, 0
	MOVLW       94
	MOVWF       R12, 0
	MOVLW       110
	MOVWF       R13, 0
L_testMotion45:
	DECFSZ      R13, 1, 0
	BRA         L_testMotion45
	DECFSZ      R12, 1, 0
	BRA         L_testMotion45
	DECFSZ      R11, 1, 0
	BRA         L_testMotion45
	NOP
;motion.h,163 :: 		rotateAntiClockwise(pwm);
	MOVF        FARG_testMotion_pwm+0, 0 
	MOVWF       FARG_rotateAntiClockwise_pwm+0 
	MOVF        FARG_testMotion_pwm+1, 0 
	MOVWF       FARG_rotateAntiClockwise_pwm+1 
	CALL        _rotateAntiClockwise+0, 0
;motion.h,164 :: 		delay_ms(1000);
	MOVLW       26
	MOVWF       R11, 0
	MOVLW       94
	MOVWF       R12, 0
	MOVLW       110
	MOVWF       R13, 0
L_testMotion46:
	DECFSZ      R13, 1, 0
	BRA         L_testMotion46
	DECFSZ      R12, 1, 0
	BRA         L_testMotion46
	DECFSZ      R11, 1, 0
	BRA         L_testMotion46
	NOP
;motion.h,165 :: 		moveForward(pwm,pwm);
	MOVF        FARG_testMotion_pwm+0, 0 
	MOVWF       FARG_moveForward_pwmLeft+0 
	MOVF        FARG_testMotion_pwm+1, 0 
	MOVWF       FARG_moveForward_pwmLeft+1 
	MOVF        FARG_testMotion_pwm+0, 0 
	MOVWF       FARG_moveForward_pwmRight+0 
	MOVF        FARG_testMotion_pwm+1, 0 
	MOVWF       FARG_moveForward_pwmRight+1 
	CALL        _moveForward+0, 0
;motion.h,166 :: 		delay_ms(1000);
	MOVLW       26
	MOVWF       R11, 0
	MOVLW       94
	MOVWF       R12, 0
	MOVLW       110
	MOVWF       R13, 0
L_testMotion47:
	DECFSZ      R13, 1, 0
	BRA         L_testMotion47
	DECFSZ      R12, 1, 0
	BRA         L_testMotion47
	DECFSZ      R11, 1, 0
	BRA         L_testMotion47
	NOP
;motion.h,167 :: 		}
	RETURN      0
; end of _testMotion

_sendSensorStatus:

;debug.h,13 :: 		void sendSensorStatus(){
;debug.h,14 :: 		if( Sensor1 == 1){
	BTFSS       PORTB+0, 4 
	GOTO        L_sendSensorStatus48
;debug.h,15 :: 		debugText = "1";
	MOVLW       ?lstr3_Main_326.0V+0
	MOVWF       _debugText+0 
	MOVLW       hi_addr(?lstr3_Main_326.0V+0)
	MOVWF       _debugText+1 
;debug.h,16 :: 		UART1_Write_Text(debugText);
	MOVF        _debugText+0, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVF        _debugText+1, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;debug.h,17 :: 		}
	GOTO        L_sendSensorStatus49
L_sendSensorStatus48:
;debug.h,18 :: 		else if( Sensor1 == 0){
	BTFSC       PORTB+0, 4 
	GOTO        L_sendSensorStatus50
;debug.h,19 :: 		debugText = "0";
	MOVLW       ?lstr4_Main_326.0V+0
	MOVWF       _debugText+0 
	MOVLW       hi_addr(?lstr4_Main_326.0V+0)
	MOVWF       _debugText+1 
;debug.h,20 :: 		UART1_Write_Text(debugText);
	MOVF        _debugText+0, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVF        _debugText+1, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;debug.h,21 :: 		}
L_sendSensorStatus50:
L_sendSensorStatus49:
;debug.h,23 :: 		if( Sensor2 == 1){
	BTFSS       PORTB+0, 3 
	GOTO        L_sendSensorStatus51
;debug.h,24 :: 		debugText = "1";
	MOVLW       ?lstr5_Main_326.0V+0
	MOVWF       _debugText+0 
	MOVLW       hi_addr(?lstr5_Main_326.0V+0)
	MOVWF       _debugText+1 
;debug.h,25 :: 		UART1_Write_Text(debugText);
	MOVF        _debugText+0, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVF        _debugText+1, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;debug.h,26 :: 		}
	GOTO        L_sendSensorStatus52
L_sendSensorStatus51:
;debug.h,27 :: 		else if( Sensor2 == 0){
	BTFSC       PORTB+0, 3 
	GOTO        L_sendSensorStatus53
;debug.h,28 :: 		debugText = "0";
	MOVLW       ?lstr6_Main_326.0V+0
	MOVWF       _debugText+0 
	MOVLW       hi_addr(?lstr6_Main_326.0V+0)
	MOVWF       _debugText+1 
;debug.h,29 :: 		UART1_Write_Text(debugText);
	MOVF        _debugText+0, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVF        _debugText+1, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;debug.h,30 :: 		}
L_sendSensorStatus53:
L_sendSensorStatus52:
;debug.h,32 :: 		if( Sensor3 == 1){
	BTFSS       PORTD+0, 4 
	GOTO        L_sendSensorStatus54
;debug.h,33 :: 		debugText = "1";
	MOVLW       ?lstr7_Main_326.0V+0
	MOVWF       _debugText+0 
	MOVLW       hi_addr(?lstr7_Main_326.0V+0)
	MOVWF       _debugText+1 
;debug.h,34 :: 		UART1_Write_Text(debugText);
	MOVF        _debugText+0, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVF        _debugText+1, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;debug.h,35 :: 		}
	GOTO        L_sendSensorStatus55
L_sendSensorStatus54:
;debug.h,36 :: 		else if( Sensor3 == 0){
	BTFSC       PORTD+0, 4 
	GOTO        L_sendSensorStatus56
;debug.h,37 :: 		debugText = "0";
	MOVLW       ?lstr8_Main_326.0V+0
	MOVWF       _debugText+0 
	MOVLW       hi_addr(?lstr8_Main_326.0V+0)
	MOVWF       _debugText+1 
;debug.h,38 :: 		UART1_Write_Text(debugText);
	MOVF        _debugText+0, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVF        _debugText+1, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;debug.h,39 :: 		}
L_sendSensorStatus56:
L_sendSensorStatus55:
;debug.h,41 :: 		if( Sensor4 == 1){
	BTFSS       PORTD+0, 5 
	GOTO        L_sendSensorStatus57
;debug.h,42 :: 		debugText = "1";
	MOVLW       ?lstr9_Main_326.0V+0
	MOVWF       _debugText+0 
	MOVLW       hi_addr(?lstr9_Main_326.0V+0)
	MOVWF       _debugText+1 
;debug.h,43 :: 		UART1_Write_Text(debugText);
	MOVF        _debugText+0, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVF        _debugText+1, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;debug.h,44 :: 		}
	GOTO        L_sendSensorStatus58
L_sendSensorStatus57:
;debug.h,45 :: 		else if( Sensor4 == 0){
	BTFSC       PORTD+0, 5 
	GOTO        L_sendSensorStatus59
;debug.h,46 :: 		debugText = "0";
	MOVLW       ?lstr10_Main_326.0V+0
	MOVWF       _debugText+0 
	MOVLW       hi_addr(?lstr10_Main_326.0V+0)
	MOVWF       _debugText+1 
;debug.h,47 :: 		UART1_Write_Text(debugText);
	MOVF        _debugText+0, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVF        _debugText+1, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;debug.h,48 :: 		}
L_sendSensorStatus59:
L_sendSensorStatus58:
;debug.h,50 :: 		if( Sensor5 == 1){
	BTFSS       PORTD+0, 6 
	GOTO        L_sendSensorStatus60
;debug.h,51 :: 		debugText = "1";
	MOVLW       ?lstr11_Main_326.0V+0
	MOVWF       _debugText+0 
	MOVLW       hi_addr(?lstr11_Main_326.0V+0)
	MOVWF       _debugText+1 
;debug.h,52 :: 		UART1_Write_Text(debugText);
	MOVF        _debugText+0, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVF        _debugText+1, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;debug.h,53 :: 		}
	GOTO        L_sendSensorStatus61
L_sendSensorStatus60:
;debug.h,54 :: 		else if( Sensor5 == 0){
	BTFSC       PORTD+0, 6 
	GOTO        L_sendSensorStatus62
;debug.h,55 :: 		debugText = "0";
	MOVLW       ?lstr12_Main_326.0V+0
	MOVWF       _debugText+0 
	MOVLW       hi_addr(?lstr12_Main_326.0V+0)
	MOVWF       _debugText+1 
;debug.h,56 :: 		UART1_Write_Text(debugText);
	MOVF        _debugText+0, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVF        _debugText+1, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;debug.h,57 :: 		}
L_sendSensorStatus62:
L_sendSensorStatus61:
;debug.h,59 :: 		if( Sensor6 == 1){
	BTFSS       PORTD+0, 7 
	GOTO        L_sendSensorStatus63
;debug.h,60 :: 		debugText = "1";
	MOVLW       ?lstr13_Main_326.0V+0
	MOVWF       _debugText+0 
	MOVLW       hi_addr(?lstr13_Main_326.0V+0)
	MOVWF       _debugText+1 
;debug.h,61 :: 		UART1_Write_Text(debugText);
	MOVF        _debugText+0, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVF        _debugText+1, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;debug.h,62 :: 		}
	GOTO        L_sendSensorStatus64
L_sendSensorStatus63:
;debug.h,63 :: 		else if( Sensor6 == 0){
	BTFSC       PORTD+0, 7 
	GOTO        L_sendSensorStatus65
;debug.h,64 :: 		debugText = "0";
	MOVLW       ?lstr14_Main_326.0V+0
	MOVWF       _debugText+0 
	MOVLW       hi_addr(?lstr14_Main_326.0V+0)
	MOVWF       _debugText+1 
;debug.h,65 :: 		UART1_Write_Text(debugText);
	MOVF        _debugText+0, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVF        _debugText+1, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;debug.h,66 :: 		}
L_sendSensorStatus65:
L_sendSensorStatus64:
;debug.h,68 :: 		if( Sensor7 == 1){
	BTFSS       PORTB+0, 2 
	GOTO        L_sendSensorStatus66
;debug.h,69 :: 		debugText = "1";
	MOVLW       ?lstr15_Main_326.0V+0
	MOVWF       _debugText+0 
	MOVLW       hi_addr(?lstr15_Main_326.0V+0)
	MOVWF       _debugText+1 
;debug.h,70 :: 		UART1_Write_Text(debugText);
	MOVF        _debugText+0, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVF        _debugText+1, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;debug.h,71 :: 		}
	GOTO        L_sendSensorStatus67
L_sendSensorStatus66:
;debug.h,72 :: 		else if( Sensor7 == 0){
	BTFSC       PORTB+0, 2 
	GOTO        L_sendSensorStatus68
;debug.h,73 :: 		debugText = "0";
	MOVLW       ?lstr16_Main_326.0V+0
	MOVWF       _debugText+0 
	MOVLW       hi_addr(?lstr16_Main_326.0V+0)
	MOVWF       _debugText+1 
;debug.h,74 :: 		UART1_Write_Text(debugText);
	MOVF        _debugText+0, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVF        _debugText+1, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;debug.h,75 :: 		}
L_sendSensorStatus68:
L_sendSensorStatus67:
;debug.h,77 :: 		if( Sensor8 == 1){
	BTFSS       PORTB+0, 6 
	GOTO        L_sendSensorStatus69
;debug.h,78 :: 		debugText = "1";
	MOVLW       ?lstr17_Main_326.0V+0
	MOVWF       _debugText+0 
	MOVLW       hi_addr(?lstr17_Main_326.0V+0)
	MOVWF       _debugText+1 
;debug.h,79 :: 		UART1_Write_Text(debugText);
	MOVF        _debugText+0, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVF        _debugText+1, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;debug.h,80 :: 		}
	GOTO        L_sendSensorStatus70
L_sendSensorStatus69:
;debug.h,81 :: 		else if( Sensor8 == 0){
	BTFSC       PORTB+0, 6 
	GOTO        L_sendSensorStatus71
;debug.h,82 :: 		debugText = "0";
	MOVLW       ?lstr18_Main_326.0V+0
	MOVWF       _debugText+0 
	MOVLW       hi_addr(?lstr18_Main_326.0V+0)
	MOVWF       _debugText+1 
;debug.h,83 :: 		UART1_Write_Text(debugText);
	MOVF        _debugText+0, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVF        _debugText+1, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;debug.h,84 :: 		}
L_sendSensorStatus71:
L_sendSensorStatus70:
;debug.h,86 :: 		if( Sensor9 == 1){
	BTFSS       PORTB+0, 7 
	GOTO        L_sendSensorStatus72
;debug.h,87 :: 		debugText = "1";
	MOVLW       ?lstr19_Main_326.0V+0
	MOVWF       _debugText+0 
	MOVLW       hi_addr(?lstr19_Main_326.0V+0)
	MOVWF       _debugText+1 
;debug.h,88 :: 		UART1_Write_Text(debugText);
	MOVF        _debugText+0, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVF        _debugText+1, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;debug.h,89 :: 		}
	GOTO        L_sendSensorStatus73
L_sendSensorStatus72:
;debug.h,90 :: 		else if( Sensor9 == 0){
	BTFSC       PORTB+0, 7 
	GOTO        L_sendSensorStatus74
;debug.h,91 :: 		debugText = "0";
	MOVLW       ?lstr20_Main_326.0V+0
	MOVWF       _debugText+0 
	MOVLW       hi_addr(?lstr20_Main_326.0V+0)
	MOVWF       _debugText+1 
;debug.h,92 :: 		UART1_Write_Text(debugText);
	MOVF        _debugText+0, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVF        _debugText+1, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;debug.h,93 :: 		}
L_sendSensorStatus74:
L_sendSensorStatus73:
;debug.h,95 :: 		if( Scout == 1){
	BTFSS       PORTB+0, 5 
	GOTO        L_sendSensorStatus75
;debug.h,96 :: 		debugText = " 1; ";
	MOVLW       ?lstr21_Main_326.0V+0
	MOVWF       _debugText+0 
	MOVLW       hi_addr(?lstr21_Main_326.0V+0)
	MOVWF       _debugText+1 
;debug.h,97 :: 		UART1_Write_Text(debugText);
	MOVF        _debugText+0, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVF        _debugText+1, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;debug.h,98 :: 		}
	GOTO        L_sendSensorStatus76
L_sendSensorStatus75:
;debug.h,99 :: 		else if( Scout == 0){
	BTFSC       PORTB+0, 5 
	GOTO        L_sendSensorStatus77
;debug.h,100 :: 		debugText = " 0; ";
	MOVLW       ?lstr22_Main_326.0V+0
	MOVWF       _debugText+0 
	MOVLW       hi_addr(?lstr22_Main_326.0V+0)
	MOVWF       _debugText+1 
;debug.h,101 :: 		UART1_Write_Text(debugText);
	MOVF        _debugText+0, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVF        _debugText+1, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;debug.h,102 :: 		}
L_sendSensorStatus77:
L_sendSensorStatus76:
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
	MOVLW       ?lstr23_Main_326.0V+0
	MOVWF       _debugText+0 
	MOVLW       hi_addr(?lstr23_Main_326.0V+0)
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
L_testPIC78:
	DECFSZ      R13, 1, 0
	BRA         L_testPIC78
	DECFSZ      R12, 1, 0
	BRA         L_testPIC78
	DECFSZ      R11, 1, 0
	BRA         L_testPIC78
	NOP
	NOP
;debug.h,115 :: 		motorRight_foward(255);
	MOVLW       255
	MOVWF       FARG_motorRight_foward_pwm+0 
	MOVLW       0
	MOVWF       FARG_motorRight_foward_pwm+1 
	CALL        _motorRight_foward+0, 0
;debug.h,116 :: 		debugText = "turn Left";
	MOVLW       ?lstr24_Main_326.0V+0
	MOVWF       _debugText+0 
	MOVLW       hi_addr(?lstr24_Main_326.0V+0)
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
L_testPIC79:
	DECFSZ      R13, 1, 0
	BRA         L_testPIC79
	DECFSZ      R12, 1, 0
	BRA         L_testPIC79
	DECFSZ      R11, 1, 0
	BRA         L_testPIC79
	NOP
	NOP
;debug.h,121 :: 		motorLeft_foward(255);
	MOVLW       255
	MOVWF       FARG_motorLeft_foward_pwm+0 
	MOVLW       0
	MOVWF       FARG_motorLeft_foward_pwm+1 
	CALL        _motorLeft_foward+0, 0
;debug.h,122 :: 		debugText = "turn Right";
	MOVLW       ?lstr25_Main_326.0V+0
	MOVWF       _debugText+0 
	MOVLW       hi_addr(?lstr25_Main_326.0V+0)
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
L_testPIC80:
	DECFSZ      R13, 1, 0
	BRA         L_testPIC80
	DECFSZ      R12, 1, 0
	BRA         L_testPIC80
	DECFSZ      R11, 1, 0
	BRA         L_testPIC80
	NOP
	NOP
;debug.h,127 :: 		stop();
	CALL        _stop+0, 0
;debug.h,128 :: 		debugText = "Stopping..   ";
	MOVLW       ?lstr26_Main_326.0V+0
	MOVWF       _debugText+0 
	MOVLW       hi_addr(?lstr26_Main_326.0V+0)
	MOVWF       _debugText+1 
;debug.h,129 :: 		UART1_Write_Text(debugText);
	MOVF        _debugText+0, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVF        _debugText+1, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;debug.h,131 :: 		debugText = "Decrease PWM..   ";
	MOVLW       ?lstr27_Main_326.0V+0
	MOVWF       _debugText+0 
	MOVLW       hi_addr(?lstr27_Main_326.0V+0)
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
L_testPIC81:
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
	GOTO        L_testPIC82
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
L_testPIC84:
	DECFSZ      R13, 1, 0
	BRA         L_testPIC84
	DECFSZ      R12, 1, 0
	BRA         L_testPIC84
	DECFSZ      R11, 1, 0
	BRA         L_testPIC84
	NOP
	NOP
;debug.h,134 :: 		for( count=255; count>0; count--){
	MOVLW       1
	SUBWF       _count+0, 1 
	MOVLW       0
	SUBWFB      _count+1, 1 
;debug.h,139 :: 		}
	GOTO        L_testPIC81
L_testPIC82:
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
	GOTO        L_lineFollowPID87
	BTFSC       PORTD+0, 5 
	GOTO        L_lineFollowPID87
	BTFSC       PORTD+0, 6 
	GOTO        L_lineFollowPID87
	BTFSC       PORTD+0, 7 
	GOTO        L_lineFollowPID87
	BTFSC       PORTB+0, 2 
	GOTO        L_lineFollowPID87
L__lineFollowPID602:
;linefollow.h,66 :: 		deviation = 15;
	MOVLW       15
	MOVWF       _deviation+0 
	MOVLW       0
	MOVWF       _deviation+1 
L_lineFollowPID87:
;linefollow.h,67 :: 		if( Sensor3==1 && Sensor4==1 && Sensor5==0 && Sensor6==0 && Sensor7==0)
	BTFSS       PORTD+0, 4 
	GOTO        L_lineFollowPID90
	BTFSS       PORTD+0, 5 
	GOTO        L_lineFollowPID90
	BTFSC       PORTD+0, 6 
	GOTO        L_lineFollowPID90
	BTFSC       PORTD+0, 7 
	GOTO        L_lineFollowPID90
	BTFSC       PORTB+0, 2 
	GOTO        L_lineFollowPID90
L__lineFollowPID601:
;linefollow.h,68 :: 		deviation = 10;
	MOVLW       10
	MOVWF       _deviation+0 
	MOVLW       0
	MOVWF       _deviation+1 
L_lineFollowPID90:
;linefollow.h,69 :: 		if( Sensor3==1 && Sensor4==1 && Sensor5==1 && Sensor6==0 && Sensor7==0)
	BTFSS       PORTD+0, 4 
	GOTO        L_lineFollowPID93
	BTFSS       PORTD+0, 5 
	GOTO        L_lineFollowPID93
	BTFSS       PORTD+0, 6 
	GOTO        L_lineFollowPID93
	BTFSC       PORTD+0, 7 
	GOTO        L_lineFollowPID93
	BTFSC       PORTB+0, 2 
	GOTO        L_lineFollowPID93
L__lineFollowPID600:
;linefollow.h,70 :: 		deviation = 4;
	MOVLW       4
	MOVWF       _deviation+0 
	MOVLW       0
	MOVWF       _deviation+1 
L_lineFollowPID93:
;linefollow.h,71 :: 		if( Sensor3==0 && Sensor4==1 && Sensor5==0 && Sensor6==0 && Sensor7==0)
	BTFSC       PORTD+0, 4 
	GOTO        L_lineFollowPID96
	BTFSS       PORTD+0, 5 
	GOTO        L_lineFollowPID96
	BTFSC       PORTD+0, 6 
	GOTO        L_lineFollowPID96
	BTFSC       PORTD+0, 7 
	GOTO        L_lineFollowPID96
	BTFSC       PORTB+0, 2 
	GOTO        L_lineFollowPID96
L__lineFollowPID599:
;linefollow.h,72 :: 		deviation = 1;
	MOVLW       1
	MOVWF       _deviation+0 
	MOVLW       0
	MOVWF       _deviation+1 
L_lineFollowPID96:
;linefollow.h,74 :: 		if( Sensor3==0 && Sensor4==1 && Sensor5==1 && Sensor6==0 && Sensor7==0)
	BTFSC       PORTD+0, 4 
	GOTO        L_lineFollowPID99
	BTFSS       PORTD+0, 5 
	GOTO        L_lineFollowPID99
	BTFSS       PORTD+0, 6 
	GOTO        L_lineFollowPID99
	BTFSC       PORTD+0, 7 
	GOTO        L_lineFollowPID99
	BTFSC       PORTB+0, 2 
	GOTO        L_lineFollowPID99
L__lineFollowPID598:
;linefollow.h,75 :: 		deviation = 0;
	CLRF        _deviation+0 
	CLRF        _deviation+1 
L_lineFollowPID99:
;linefollow.h,76 :: 		if( Sensor3==0 && Sensor4==1 && Sensor5==1 && Sensor6==1 && Sensor7==0)
	BTFSC       PORTD+0, 4 
	GOTO        L_lineFollowPID102
	BTFSS       PORTD+0, 5 
	GOTO        L_lineFollowPID102
	BTFSS       PORTD+0, 6 
	GOTO        L_lineFollowPID102
	BTFSS       PORTD+0, 7 
	GOTO        L_lineFollowPID102
	BTFSC       PORTB+0, 2 
	GOTO        L_lineFollowPID102
L__lineFollowPID597:
;linefollow.h,77 :: 		deviation = 0;
	CLRF        _deviation+0 
	CLRF        _deviation+1 
L_lineFollowPID102:
;linefollow.h,78 :: 		if( Sensor3==0 && Sensor4==0 && Sensor5==1 && Sensor6==0 && Sensor7==0)
	BTFSC       PORTD+0, 4 
	GOTO        L_lineFollowPID105
	BTFSC       PORTD+0, 5 
	GOTO        L_lineFollowPID105
	BTFSS       PORTD+0, 6 
	GOTO        L_lineFollowPID105
	BTFSC       PORTD+0, 7 
	GOTO        L_lineFollowPID105
	BTFSC       PORTB+0, 2 
	GOTO        L_lineFollowPID105
L__lineFollowPID596:
;linefollow.h,79 :: 		deviation = 0;
	CLRF        _deviation+0 
	CLRF        _deviation+1 
L_lineFollowPID105:
;linefollow.h,80 :: 		if( Sensor3==0 && Sensor4==0 && Sensor5==1 && Sensor6==1 && Sensor7==0)
	BTFSC       PORTD+0, 4 
	GOTO        L_lineFollowPID108
	BTFSC       PORTD+0, 5 
	GOTO        L_lineFollowPID108
	BTFSS       PORTD+0, 6 
	GOTO        L_lineFollowPID108
	BTFSS       PORTD+0, 7 
	GOTO        L_lineFollowPID108
	BTFSC       PORTB+0, 2 
	GOTO        L_lineFollowPID108
L__lineFollowPID595:
;linefollow.h,81 :: 		deviation = 0;
	CLRF        _deviation+0 
	CLRF        _deviation+1 
L_lineFollowPID108:
;linefollow.h,83 :: 		if( Sensor3==0 && Sensor4==0 && Sensor5==0 && Sensor6==1 && Sensor7==0)
	BTFSC       PORTD+0, 4 
	GOTO        L_lineFollowPID111
	BTFSC       PORTD+0, 5 
	GOTO        L_lineFollowPID111
	BTFSC       PORTD+0, 6 
	GOTO        L_lineFollowPID111
	BTFSS       PORTD+0, 7 
	GOTO        L_lineFollowPID111
	BTFSC       PORTB+0, 2 
	GOTO        L_lineFollowPID111
L__lineFollowPID594:
;linefollow.h,84 :: 		deviation = -1;
	MOVLW       255
	MOVWF       _deviation+0 
	MOVLW       255
	MOVWF       _deviation+1 
L_lineFollowPID111:
;linefollow.h,85 :: 		if( Sensor3==0 && Sensor4==0 && Sensor5==1 && Sensor6==1 && Sensor7==1)
	BTFSC       PORTD+0, 4 
	GOTO        L_lineFollowPID114
	BTFSC       PORTD+0, 5 
	GOTO        L_lineFollowPID114
	BTFSS       PORTD+0, 6 
	GOTO        L_lineFollowPID114
	BTFSS       PORTD+0, 7 
	GOTO        L_lineFollowPID114
	BTFSS       PORTB+0, 2 
	GOTO        L_lineFollowPID114
L__lineFollowPID593:
;linefollow.h,86 :: 		deviation = -4;
	MOVLW       252
	MOVWF       _deviation+0 
	MOVLW       255
	MOVWF       _deviation+1 
L_lineFollowPID114:
;linefollow.h,87 :: 		if( Sensor3==0 && Sensor4==0 && Sensor5==0 && Sensor6==1 && Sensor7==1)
	BTFSC       PORTD+0, 4 
	GOTO        L_lineFollowPID117
	BTFSC       PORTD+0, 5 
	GOTO        L_lineFollowPID117
	BTFSC       PORTD+0, 6 
	GOTO        L_lineFollowPID117
	BTFSS       PORTD+0, 7 
	GOTO        L_lineFollowPID117
	BTFSS       PORTB+0, 2 
	GOTO        L_lineFollowPID117
L__lineFollowPID592:
;linefollow.h,88 :: 		deviation = -10;
	MOVLW       246
	MOVWF       _deviation+0 
	MOVLW       255
	MOVWF       _deviation+1 
L_lineFollowPID117:
;linefollow.h,89 :: 		if( Sensor3==0 && Sensor4==0 && Sensor5==0 && Sensor6==0 && Sensor7==1)
	BTFSC       PORTD+0, 4 
	GOTO        L_lineFollowPID120
	BTFSC       PORTD+0, 5 
	GOTO        L_lineFollowPID120
	BTFSC       PORTD+0, 6 
	GOTO        L_lineFollowPID120
	BTFSC       PORTD+0, 7 
	GOTO        L_lineFollowPID120
	BTFSS       PORTB+0, 2 
	GOTO        L_lineFollowPID120
L__lineFollowPID591:
;linefollow.h,90 :: 		deviation = -15;
	MOVLW       241
	MOVWF       _deviation+0 
	MOVLW       255
	MOVWF       _deviation+1 
L_lineFollowPID120:
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
	GOTO        L_lineFollowNormalWorked121
;linefollow.h,110 :: 		if( Sensor3==0 && Sensor4==1 && Sensor5==1 && Sensor6==0 && Sensor7==0)
	BTFSC       PORTD+0, 4 
	GOTO        L_lineFollowNormalWorked124
	BTFSS       PORTD+0, 5 
	GOTO        L_lineFollowNormalWorked124
	BTFSS       PORTD+0, 6 
	GOTO        L_lineFollowNormalWorked124
	BTFSC       PORTD+0, 7 
	GOTO        L_lineFollowNormalWorked124
	BTFSC       PORTB+0, 2 
	GOTO        L_lineFollowNormalWorked124
L__lineFollowNormalWorked640:
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
	GOTO        L_lineFollowNormalWorked125
L_lineFollowNormalWorked124:
;linefollow.h,112 :: 		else if( Sensor3==0 && Sensor4==1 && Sensor5==1 && Sensor6==1 && Sensor7==0)
	BTFSC       PORTD+0, 4 
	GOTO        L_lineFollowNormalWorked128
	BTFSS       PORTD+0, 5 
	GOTO        L_lineFollowNormalWorked128
	BTFSS       PORTD+0, 6 
	GOTO        L_lineFollowNormalWorked128
	BTFSS       PORTD+0, 7 
	GOTO        L_lineFollowNormalWorked128
	BTFSC       PORTB+0, 2 
	GOTO        L_lineFollowNormalWorked128
L__lineFollowNormalWorked639:
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
	GOTO        L_lineFollowNormalWorked129
L_lineFollowNormalWorked128:
;linefollow.h,114 :: 		else if( Sensor3==0 && Sensor4==0 && Sensor5==1 && Sensor6==0 && Sensor7==0)
	BTFSC       PORTD+0, 4 
	GOTO        L_lineFollowNormalWorked132
	BTFSC       PORTD+0, 5 
	GOTO        L_lineFollowNormalWorked132
	BTFSS       PORTD+0, 6 
	GOTO        L_lineFollowNormalWorked132
	BTFSC       PORTD+0, 7 
	GOTO        L_lineFollowNormalWorked132
	BTFSC       PORTB+0, 2 
	GOTO        L_lineFollowNormalWorked132
L__lineFollowNormalWorked638:
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
	GOTO        L_lineFollowNormalWorked133
L_lineFollowNormalWorked132:
;linefollow.h,116 :: 		else if( Sensor3==0 && Sensor4==0 && Sensor5==1 && Sensor6==1 && Sensor7==0)
	BTFSC       PORTD+0, 4 
	GOTO        L_lineFollowNormalWorked136
	BTFSC       PORTD+0, 5 
	GOTO        L_lineFollowNormalWorked136
	BTFSS       PORTD+0, 6 
	GOTO        L_lineFollowNormalWorked136
	BTFSS       PORTD+0, 7 
	GOTO        L_lineFollowNormalWorked136
	BTFSC       PORTB+0, 2 
	GOTO        L_lineFollowNormalWorked136
L__lineFollowNormalWorked637:
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
	GOTO        L_lineFollowNormalWorked137
L_lineFollowNormalWorked136:
;linefollow.h,122 :: 		else if( Sensor3==1 && Sensor4==0 && Sensor5==0 && Sensor6==0 && Sensor7==0)
	BTFSS       PORTD+0, 4 
	GOTO        L_lineFollowNormalWorked140
	BTFSC       PORTD+0, 5 
	GOTO        L_lineFollowNormalWorked140
	BTFSC       PORTD+0, 6 
	GOTO        L_lineFollowNormalWorked140
	BTFSC       PORTD+0, 7 
	GOTO        L_lineFollowNormalWorked140
	BTFSC       PORTB+0, 2 
	GOTO        L_lineFollowNormalWorked140
L__lineFollowNormalWorked636:
;linefollow.h,124 :: 		turnLeft(FAST_PWM);
	MOVF        _FAST_PWM+0, 0 
	MOVWF       FARG_turnLeft_pwmRight+0 
	MOVF        _FAST_PWM+1, 0 
	MOVWF       FARG_turnLeft_pwmRight+1 
	CALL        _turnLeft+0, 0
	GOTO        L_lineFollowNormalWorked141
L_lineFollowNormalWorked140:
;linefollow.h,125 :: 		else if( Sensor3==1 && Sensor4==1 && Sensor5==0 && Sensor6==0 && Sensor7==0)
	BTFSS       PORTD+0, 4 
	GOTO        L_lineFollowNormalWorked144
	BTFSS       PORTD+0, 5 
	GOTO        L_lineFollowNormalWorked144
	BTFSC       PORTD+0, 6 
	GOTO        L_lineFollowNormalWorked144
	BTFSC       PORTD+0, 7 
	GOTO        L_lineFollowNormalWorked144
	BTFSC       PORTB+0, 2 
	GOTO        L_lineFollowNormalWorked144
L__lineFollowNormalWorked635:
;linefollow.h,127 :: 		turnLeft(FAST_PWM);
	MOVF        _FAST_PWM+0, 0 
	MOVWF       FARG_turnLeft_pwmRight+0 
	MOVF        _FAST_PWM+1, 0 
	MOVWF       FARG_turnLeft_pwmRight+1 
	CALL        _turnLeft+0, 0
	GOTO        L_lineFollowNormalWorked145
L_lineFollowNormalWorked144:
;linefollow.h,128 :: 		else if( Sensor3==1 && Sensor4==1 && Sensor5==1 && Sensor6==0 && Sensor7==0)
	BTFSS       PORTD+0, 4 
	GOTO        L_lineFollowNormalWorked148
	BTFSS       PORTD+0, 5 
	GOTO        L_lineFollowNormalWorked148
	BTFSS       PORTD+0, 6 
	GOTO        L_lineFollowNormalWorked148
	BTFSC       PORTD+0, 7 
	GOTO        L_lineFollowNormalWorked148
	BTFSC       PORTB+0, 2 
	GOTO        L_lineFollowNormalWorked148
L__lineFollowNormalWorked634:
;linefollow.h,130 :: 		turnLeft(FAST_PWM);
	MOVF        _FAST_PWM+0, 0 
	MOVWF       FARG_turnLeft_pwmRight+0 
	MOVF        _FAST_PWM+1, 0 
	MOVWF       FARG_turnLeft_pwmRight+1 
	CALL        _turnLeft+0, 0
	GOTO        L_lineFollowNormalWorked149
L_lineFollowNormalWorked148:
;linefollow.h,131 :: 		else if( Sensor3==0 && Sensor4==1 && Sensor5==0 && Sensor6==0 && Sensor7==0)
	BTFSC       PORTD+0, 4 
	GOTO        L_lineFollowNormalWorked152
	BTFSS       PORTD+0, 5 
	GOTO        L_lineFollowNormalWorked152
	BTFSC       PORTD+0, 6 
	GOTO        L_lineFollowNormalWorked152
	BTFSC       PORTD+0, 7 
	GOTO        L_lineFollowNormalWorked152
	BTFSC       PORTB+0, 2 
	GOTO        L_lineFollowNormalWorked152
L__lineFollowNormalWorked633:
;linefollow.h,133 :: 		turnLeft(FAST_PWM);
	MOVF        _FAST_PWM+0, 0 
	MOVWF       FARG_turnLeft_pwmRight+0 
	MOVF        _FAST_PWM+1, 0 
	MOVWF       FARG_turnLeft_pwmRight+1 
	CALL        _turnLeft+0, 0
	GOTO        L_lineFollowNormalWorked153
L_lineFollowNormalWorked152:
;linefollow.h,136 :: 		else if( Sensor3==0 && Sensor4==0 && Sensor5==0 && Sensor6==1 && Sensor7==0)
	BTFSC       PORTD+0, 4 
	GOTO        L_lineFollowNormalWorked156
	BTFSC       PORTD+0, 5 
	GOTO        L_lineFollowNormalWorked156
	BTFSC       PORTD+0, 6 
	GOTO        L_lineFollowNormalWorked156
	BTFSS       PORTD+0, 7 
	GOTO        L_lineFollowNormalWorked156
	BTFSC       PORTB+0, 2 
	GOTO        L_lineFollowNormalWorked156
L__lineFollowNormalWorked632:
;linefollow.h,138 :: 		turnRight(FAST_PWM);
	MOVF        _FAST_PWM+0, 0 
	MOVWF       FARG_turnRight_pwmLeft+0 
	MOVF        _FAST_PWM+1, 0 
	MOVWF       FARG_turnRight_pwmLeft+1 
	CALL        _turnRight+0, 0
	GOTO        L_lineFollowNormalWorked157
L_lineFollowNormalWorked156:
;linefollow.h,139 :: 		else if( Sensor3==0 && Sensor4==0 && Sensor5==1 && Sensor6==1 && Sensor7==1)
	BTFSC       PORTD+0, 4 
	GOTO        L_lineFollowNormalWorked160
	BTFSC       PORTD+0, 5 
	GOTO        L_lineFollowNormalWorked160
	BTFSS       PORTD+0, 6 
	GOTO        L_lineFollowNormalWorked160
	BTFSS       PORTD+0, 7 
	GOTO        L_lineFollowNormalWorked160
	BTFSS       PORTB+0, 2 
	GOTO        L_lineFollowNormalWorked160
L__lineFollowNormalWorked631:
;linefollow.h,141 :: 		turnRight(FAST_PWM);
	MOVF        _FAST_PWM+0, 0 
	MOVWF       FARG_turnRight_pwmLeft+0 
	MOVF        _FAST_PWM+1, 0 
	MOVWF       FARG_turnRight_pwmLeft+1 
	CALL        _turnRight+0, 0
	GOTO        L_lineFollowNormalWorked161
L_lineFollowNormalWorked160:
;linefollow.h,142 :: 		else if( Sensor3==0 && Sensor4==0 && Sensor5==0 && Sensor6==1 && Sensor7==1)
	BTFSC       PORTD+0, 4 
	GOTO        L_lineFollowNormalWorked164
	BTFSC       PORTD+0, 5 
	GOTO        L_lineFollowNormalWorked164
	BTFSC       PORTD+0, 6 
	GOTO        L_lineFollowNormalWorked164
	BTFSS       PORTD+0, 7 
	GOTO        L_lineFollowNormalWorked164
	BTFSS       PORTB+0, 2 
	GOTO        L_lineFollowNormalWorked164
L__lineFollowNormalWorked630:
;linefollow.h,144 :: 		turnRight(FAST_PWM);
	MOVF        _FAST_PWM+0, 0 
	MOVWF       FARG_turnRight_pwmLeft+0 
	MOVF        _FAST_PWM+1, 0 
	MOVWF       FARG_turnRight_pwmLeft+1 
	CALL        _turnRight+0, 0
	GOTO        L_lineFollowNormalWorked165
L_lineFollowNormalWorked164:
;linefollow.h,145 :: 		else if( Sensor3==0 && Sensor4==0 && Sensor5==0 && Sensor6==0 && Sensor7==1)
	BTFSC       PORTD+0, 4 
	GOTO        L_lineFollowNormalWorked168
	BTFSC       PORTD+0, 5 
	GOTO        L_lineFollowNormalWorked168
	BTFSC       PORTD+0, 6 
	GOTO        L_lineFollowNormalWorked168
	BTFSC       PORTD+0, 7 
	GOTO        L_lineFollowNormalWorked168
	BTFSS       PORTB+0, 2 
	GOTO        L_lineFollowNormalWorked168
L__lineFollowNormalWorked629:
;linefollow.h,147 :: 		turnRight(FAST_PWM);
	MOVF        _FAST_PWM+0, 0 
	MOVWF       FARG_turnRight_pwmLeft+0 
	MOVF        _FAST_PWM+1, 0 
	MOVWF       FARG_turnRight_pwmLeft+1 
	CALL        _turnRight+0, 0
	GOTO        L_lineFollowNormalWorked169
L_lineFollowNormalWorked168:
;linefollow.h,150 :: 		else if( Sensor3==1 && Sensor4==1 && Sensor5==1 && Sensor6==1 && Sensor7==0)
	BTFSS       PORTD+0, 4 
	GOTO        L_lineFollowNormalWorked172
	BTFSS       PORTD+0, 5 
	GOTO        L_lineFollowNormalWorked172
	BTFSS       PORTD+0, 6 
	GOTO        L_lineFollowNormalWorked172
	BTFSS       PORTD+0, 7 
	GOTO        L_lineFollowNormalWorked172
	BTFSC       PORTB+0, 2 
	GOTO        L_lineFollowNormalWorked172
L__lineFollowNormalWorked628:
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
	GOTO        L_lineFollowNormalWorked173
L_lineFollowNormalWorked172:
;linefollow.h,152 :: 		else if( Sensor3==0 && Sensor4==1 && Sensor5==1 && Sensor6==1 && Sensor7==1)
	BTFSC       PORTD+0, 4 
	GOTO        L_lineFollowNormalWorked176
	BTFSS       PORTD+0, 5 
	GOTO        L_lineFollowNormalWorked176
	BTFSS       PORTD+0, 6 
	GOTO        L_lineFollowNormalWorked176
	BTFSS       PORTD+0, 7 
	GOTO        L_lineFollowNormalWorked176
	BTFSS       PORTB+0, 2 
	GOTO        L_lineFollowNormalWorked176
L__lineFollowNormalWorked627:
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
	GOTO        L_lineFollowNormalWorked177
L_lineFollowNormalWorked176:
;linefollow.h,154 :: 		else if( Sensor1==0 && Sensor2==0 && Sensor3==0 && Sensor4==0 && Sensor5==0 && Sensor6==0 && Sensor7==0 && Sensor8==0 && Sensor9==0)
	BTFSC       PORTB+0, 4 
	GOTO        L_lineFollowNormalWorked180
	BTFSC       PORTB+0, 3 
	GOTO        L_lineFollowNormalWorked180
	BTFSC       PORTD+0, 4 
	GOTO        L_lineFollowNormalWorked180
	BTFSC       PORTD+0, 5 
	GOTO        L_lineFollowNormalWorked180
	BTFSC       PORTD+0, 6 
	GOTO        L_lineFollowNormalWorked180
	BTFSC       PORTD+0, 7 
	GOTO        L_lineFollowNormalWorked180
	BTFSC       PORTB+0, 2 
	GOTO        L_lineFollowNormalWorked180
	BTFSC       PORTB+0, 6 
	GOTO        L_lineFollowNormalWorked180
	BTFSC       PORTB+0, 7 
	GOTO        L_lineFollowNormalWorked180
L__lineFollowNormalWorked626:
;linefollow.h,155 :: 		moveForward(255,255);
	MOVLW       255
	MOVWF       FARG_moveForward_pwmLeft+0 
	MOVLW       0
	MOVWF       FARG_moveForward_pwmLeft+1 
	MOVLW       255
	MOVWF       FARG_moveForward_pwmRight+0 
	MOVLW       0
	MOVWF       FARG_moveForward_pwmRight+1 
	CALL        _moveForward+0, 0
	GOTO        L_lineFollowNormalWorked181
L_lineFollowNormalWorked180:
;linefollow.h,157 :: 		else if(isAllBlack()){
	CALL        _isAllBlack+0, 0
	MOVF        R0, 0 
	IORWF       R1, 0 
	BTFSC       STATUS+0, 2 
	GOTO        L_lineFollowNormalWorked182
;linefollow.h,160 :: 		sendSensorStatus();
	CALL        _sendSensorStatus+0, 0
;linefollow.h,161 :: 		}
	GOTO        L_lineFollowNormalWorked183
L_lineFollowNormalWorked182:
;linefollow.h,164 :: 		reverse(220,220);
	MOVLW       220
	MOVWF       FARG_reverse_pwmLeft+0 
	MOVLW       0
	MOVWF       FARG_reverse_pwmLeft+1 
	MOVLW       220
	MOVWF       FARG_reverse_pwmRight+0 
	MOVLW       0
	MOVWF       FARG_reverse_pwmRight+1 
	CALL        _reverse+0, 0
;linefollow.h,165 :: 		sendSensorStatus();
	CALL        _sendSensorStatus+0, 0
;linefollow.h,167 :: 		}
L_lineFollowNormalWorked183:
L_lineFollowNormalWorked181:
L_lineFollowNormalWorked177:
L_lineFollowNormalWorked173:
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
;linefollow.h,168 :: 		}
	GOTO        L_lineFollowNormalWorked184
L_lineFollowNormalWorked121:
;linefollow.h,175 :: 		if( Sensor1==1 && Sensor2==1 && Sensor3==1 && Sensor4==1 && Sensor5==1 && Sensor6==0 && Sensor7==0 && Sensor8==0 && Sensor9==0)
	BTFSS       PORTB+0, 4 
	GOTO        L_lineFollowNormalWorked187
	BTFSS       PORTB+0, 3 
	GOTO        L_lineFollowNormalWorked187
	BTFSS       PORTD+0, 4 
	GOTO        L_lineFollowNormalWorked187
	BTFSS       PORTD+0, 5 
	GOTO        L_lineFollowNormalWorked187
	BTFSS       PORTD+0, 6 
	GOTO        L_lineFollowNormalWorked187
	BTFSC       PORTD+0, 7 
	GOTO        L_lineFollowNormalWorked187
	BTFSC       PORTB+0, 2 
	GOTO        L_lineFollowNormalWorked187
	BTFSC       PORTB+0, 6 
	GOTO        L_lineFollowNormalWorked187
	BTFSC       PORTB+0, 7 
	GOTO        L_lineFollowNormalWorked187
L__lineFollowNormalWorked625:
;linefollow.h,176 :: 		rotateByDegree(-90);
	MOVLW       166
	MOVWF       FARG_rotateByDegree_degree+0 
	MOVLW       255
	MOVWF       FARG_rotateByDegree_degree+1 
	CALL        _rotateByDegree+0, 0
	GOTO        L_lineFollowNormalWorked188
L_lineFollowNormalWorked187:
;linefollow.h,177 :: 		else if( Sensor1==1 && Sensor2==1 && Sensor3==1 && Sensor4==1 && Sensor5==1 && Sensor6==1 && Sensor7==0 && Sensor8==0 && Sensor9==0)
	BTFSS       PORTB+0, 4 
	GOTO        L_lineFollowNormalWorked191
	BTFSS       PORTB+0, 3 
	GOTO        L_lineFollowNormalWorked191
	BTFSS       PORTD+0, 4 
	GOTO        L_lineFollowNormalWorked191
	BTFSS       PORTD+0, 5 
	GOTO        L_lineFollowNormalWorked191
	BTFSS       PORTD+0, 6 
	GOTO        L_lineFollowNormalWorked191
	BTFSS       PORTD+0, 7 
	GOTO        L_lineFollowNormalWorked191
	BTFSC       PORTB+0, 2 
	GOTO        L_lineFollowNormalWorked191
	BTFSC       PORTB+0, 6 
	GOTO        L_lineFollowNormalWorked191
	BTFSC       PORTB+0, 7 
	GOTO        L_lineFollowNormalWorked191
L__lineFollowNormalWorked624:
;linefollow.h,178 :: 		rotateByDegree(-90);
	MOVLW       166
	MOVWF       FARG_rotateByDegree_degree+0 
	MOVLW       255
	MOVWF       FARG_rotateByDegree_degree+1 
	CALL        _rotateByDegree+0, 0
	GOTO        L_lineFollowNormalWorked192
L_lineFollowNormalWorked191:
;linefollow.h,179 :: 		else if( Sensor1==1 && Sensor2==1 && Sensor3==1 && Sensor4==1 && Sensor5==1 && Sensor6==1 && Sensor7==1 && Sensor8==0 && Sensor9==0)
	BTFSS       PORTB+0, 4 
	GOTO        L_lineFollowNormalWorked195
	BTFSS       PORTB+0, 3 
	GOTO        L_lineFollowNormalWorked195
	BTFSS       PORTD+0, 4 
	GOTO        L_lineFollowNormalWorked195
	BTFSS       PORTD+0, 5 
	GOTO        L_lineFollowNormalWorked195
	BTFSS       PORTD+0, 6 
	GOTO        L_lineFollowNormalWorked195
	BTFSS       PORTD+0, 7 
	GOTO        L_lineFollowNormalWorked195
	BTFSS       PORTB+0, 2 
	GOTO        L_lineFollowNormalWorked195
	BTFSC       PORTB+0, 6 
	GOTO        L_lineFollowNormalWorked195
	BTFSC       PORTB+0, 7 
	GOTO        L_lineFollowNormalWorked195
L__lineFollowNormalWorked623:
;linefollow.h,180 :: 		rotateByDegree(-90);
	MOVLW       166
	MOVWF       FARG_rotateByDegree_degree+0 
	MOVLW       255
	MOVWF       FARG_rotateByDegree_degree+1 
	CALL        _rotateByDegree+0, 0
	GOTO        L_lineFollowNormalWorked196
L_lineFollowNormalWorked195:
;linefollow.h,183 :: 		else if( Sensor1==0 && Sensor2==0 && Sensor3==1 && Sensor4==1 && Sensor5==1 && Sensor6==1 && Sensor7==1 && Sensor8==1 && Sensor9==1)
	BTFSC       PORTB+0, 4 
	GOTO        L_lineFollowNormalWorked199
	BTFSC       PORTB+0, 3 
	GOTO        L_lineFollowNormalWorked199
	BTFSS       PORTD+0, 4 
	GOTO        L_lineFollowNormalWorked199
	BTFSS       PORTD+0, 5 
	GOTO        L_lineFollowNormalWorked199
	BTFSS       PORTD+0, 6 
	GOTO        L_lineFollowNormalWorked199
	BTFSS       PORTD+0, 7 
	GOTO        L_lineFollowNormalWorked199
	BTFSS       PORTB+0, 2 
	GOTO        L_lineFollowNormalWorked199
	BTFSS       PORTB+0, 6 
	GOTO        L_lineFollowNormalWorked199
	BTFSS       PORTB+0, 7 
	GOTO        L_lineFollowNormalWorked199
L__lineFollowNormalWorked622:
;linefollow.h,184 :: 		rotateByDegree(90);
	MOVLW       90
	MOVWF       FARG_rotateByDegree_degree+0 
	MOVLW       0
	MOVWF       FARG_rotateByDegree_degree+1 
	CALL        _rotateByDegree+0, 0
	GOTO        L_lineFollowNormalWorked200
L_lineFollowNormalWorked199:
;linefollow.h,185 :: 		else if( Sensor1==0 && Sensor2==0 && Sensor3==0 && Sensor4==1 && Sensor5==1 && Sensor6==1 && Sensor7==1 && Sensor8==1 && Sensor9==1)
	BTFSC       PORTB+0, 4 
	GOTO        L_lineFollowNormalWorked203
	BTFSC       PORTB+0, 3 
	GOTO        L_lineFollowNormalWorked203
	BTFSC       PORTD+0, 4 
	GOTO        L_lineFollowNormalWorked203
	BTFSS       PORTD+0, 5 
	GOTO        L_lineFollowNormalWorked203
	BTFSS       PORTD+0, 6 
	GOTO        L_lineFollowNormalWorked203
	BTFSS       PORTD+0, 7 
	GOTO        L_lineFollowNormalWorked203
	BTFSS       PORTB+0, 2 
	GOTO        L_lineFollowNormalWorked203
	BTFSS       PORTB+0, 6 
	GOTO        L_lineFollowNormalWorked203
	BTFSS       PORTB+0, 7 
	GOTO        L_lineFollowNormalWorked203
L__lineFollowNormalWorked621:
;linefollow.h,186 :: 		rotateByDegree(90);
	MOVLW       90
	MOVWF       FARG_rotateByDegree_degree+0 
	MOVLW       0
	MOVWF       FARG_rotateByDegree_degree+1 
	CALL        _rotateByDegree+0, 0
	GOTO        L_lineFollowNormalWorked204
L_lineFollowNormalWorked203:
;linefollow.h,187 :: 		else if( Sensor1==0 && Sensor2==0 && Sensor3==0 && Sensor4==0 && Sensor5==1 && Sensor6==1 && Sensor7==1 && Sensor8==1 && Sensor9==1)
	BTFSC       PORTB+0, 4 
	GOTO        L_lineFollowNormalWorked207
	BTFSC       PORTB+0, 3 
	GOTO        L_lineFollowNormalWorked207
	BTFSC       PORTD+0, 4 
	GOTO        L_lineFollowNormalWorked207
	BTFSC       PORTD+0, 5 
	GOTO        L_lineFollowNormalWorked207
	BTFSS       PORTD+0, 6 
	GOTO        L_lineFollowNormalWorked207
	BTFSS       PORTD+0, 7 
	GOTO        L_lineFollowNormalWorked207
	BTFSS       PORTB+0, 2 
	GOTO        L_lineFollowNormalWorked207
	BTFSS       PORTB+0, 6 
	GOTO        L_lineFollowNormalWorked207
	BTFSS       PORTB+0, 7 
	GOTO        L_lineFollowNormalWorked207
L__lineFollowNormalWorked620:
;linefollow.h,188 :: 		rotateByDegree(90);
	MOVLW       90
	MOVWF       FARG_rotateByDegree_degree+0 
	MOVLW       0
	MOVWF       FARG_rotateByDegree_degree+1 
	CALL        _rotateByDegree+0, 0
	GOTO        L_lineFollowNormalWorked208
L_lineFollowNormalWorked207:
;linefollow.h,193 :: 		else if( Sensor3==1 && Sensor4==0 && Sensor5==0 && Sensor6==0 && Sensor7==0)
	BTFSS       PORTD+0, 4 
	GOTO        L_lineFollowNormalWorked211
	BTFSC       PORTD+0, 5 
	GOTO        L_lineFollowNormalWorked211
	BTFSC       PORTD+0, 6 
	GOTO        L_lineFollowNormalWorked211
	BTFSC       PORTD+0, 7 
	GOTO        L_lineFollowNormalWorked211
	BTFSC       PORTB+0, 2 
	GOTO        L_lineFollowNormalWorked211
L__lineFollowNormalWorked619:
;linefollow.h,195 :: 		turnLeft(FAST_PWM);
	MOVF        _FAST_PWM+0, 0 
	MOVWF       FARG_turnLeft_pwmRight+0 
	MOVF        _FAST_PWM+1, 0 
	MOVWF       FARG_turnLeft_pwmRight+1 
	CALL        _turnLeft+0, 0
	GOTO        L_lineFollowNormalWorked212
L_lineFollowNormalWorked211:
;linefollow.h,196 :: 		else if( Sensor3==1 && Sensor4==1 && Sensor5==0 && Sensor6==0 && Sensor7==0)
	BTFSS       PORTD+0, 4 
	GOTO        L_lineFollowNormalWorked215
	BTFSS       PORTD+0, 5 
	GOTO        L_lineFollowNormalWorked215
	BTFSC       PORTD+0, 6 
	GOTO        L_lineFollowNormalWorked215
	BTFSC       PORTD+0, 7 
	GOTO        L_lineFollowNormalWorked215
	BTFSC       PORTB+0, 2 
	GOTO        L_lineFollowNormalWorked215
L__lineFollowNormalWorked618:
;linefollow.h,198 :: 		turnLeft(FAST_PWM);
	MOVF        _FAST_PWM+0, 0 
	MOVWF       FARG_turnLeft_pwmRight+0 
	MOVF        _FAST_PWM+1, 0 
	MOVWF       FARG_turnLeft_pwmRight+1 
	CALL        _turnLeft+0, 0
	GOTO        L_lineFollowNormalWorked216
L_lineFollowNormalWorked215:
;linefollow.h,199 :: 		else if( Sensor3==1 && Sensor4==1 && Sensor5==1 && Sensor6==0 && Sensor7==0)
	BTFSS       PORTD+0, 4 
	GOTO        L_lineFollowNormalWorked219
	BTFSS       PORTD+0, 5 
	GOTO        L_lineFollowNormalWorked219
	BTFSS       PORTD+0, 6 
	GOTO        L_lineFollowNormalWorked219
	BTFSC       PORTD+0, 7 
	GOTO        L_lineFollowNormalWorked219
	BTFSC       PORTB+0, 2 
	GOTO        L_lineFollowNormalWorked219
L__lineFollowNormalWorked617:
;linefollow.h,201 :: 		turnLeft(FAST_PWM);
	MOVF        _FAST_PWM+0, 0 
	MOVWF       FARG_turnLeft_pwmRight+0 
	MOVF        _FAST_PWM+1, 0 
	MOVWF       FARG_turnLeft_pwmRight+1 
	CALL        _turnLeft+0, 0
	GOTO        L_lineFollowNormalWorked220
L_lineFollowNormalWorked219:
;linefollow.h,202 :: 		else if( Sensor3==0 && Sensor4==1 && Sensor5==0 && Sensor6==0 && Sensor7==0)
	BTFSC       PORTD+0, 4 
	GOTO        L_lineFollowNormalWorked223
	BTFSS       PORTD+0, 5 
	GOTO        L_lineFollowNormalWorked223
	BTFSC       PORTD+0, 6 
	GOTO        L_lineFollowNormalWorked223
	BTFSC       PORTD+0, 7 
	GOTO        L_lineFollowNormalWorked223
	BTFSC       PORTB+0, 2 
	GOTO        L_lineFollowNormalWorked223
L__lineFollowNormalWorked616:
;linefollow.h,204 :: 		turnLeft(FAST_PWM);
	MOVF        _FAST_PWM+0, 0 
	MOVWF       FARG_turnLeft_pwmRight+0 
	MOVF        _FAST_PWM+1, 0 
	MOVWF       FARG_turnLeft_pwmRight+1 
	CALL        _turnLeft+0, 0
	GOTO        L_lineFollowNormalWorked224
L_lineFollowNormalWorked223:
;linefollow.h,207 :: 		else if( Sensor3==0 && Sensor4==0 && Sensor5==0 && Sensor6==1 && Sensor7==0)
	BTFSC       PORTD+0, 4 
	GOTO        L_lineFollowNormalWorked227
	BTFSC       PORTD+0, 5 
	GOTO        L_lineFollowNormalWorked227
	BTFSC       PORTD+0, 6 
	GOTO        L_lineFollowNormalWorked227
	BTFSS       PORTD+0, 7 
	GOTO        L_lineFollowNormalWorked227
	BTFSC       PORTB+0, 2 
	GOTO        L_lineFollowNormalWorked227
L__lineFollowNormalWorked615:
;linefollow.h,209 :: 		turnRight(FAST_PWM);
	MOVF        _FAST_PWM+0, 0 
	MOVWF       FARG_turnRight_pwmLeft+0 
	MOVF        _FAST_PWM+1, 0 
	MOVWF       FARG_turnRight_pwmLeft+1 
	CALL        _turnRight+0, 0
	GOTO        L_lineFollowNormalWorked228
L_lineFollowNormalWorked227:
;linefollow.h,210 :: 		else if( Sensor3==0 && Sensor4==0 && Sensor5==1 && Sensor6==1 && Sensor7==1)
	BTFSC       PORTD+0, 4 
	GOTO        L_lineFollowNormalWorked231
	BTFSC       PORTD+0, 5 
	GOTO        L_lineFollowNormalWorked231
	BTFSS       PORTD+0, 6 
	GOTO        L_lineFollowNormalWorked231
	BTFSS       PORTD+0, 7 
	GOTO        L_lineFollowNormalWorked231
	BTFSS       PORTB+0, 2 
	GOTO        L_lineFollowNormalWorked231
L__lineFollowNormalWorked614:
;linefollow.h,212 :: 		turnRight(FAST_PWM);
	MOVF        _FAST_PWM+0, 0 
	MOVWF       FARG_turnRight_pwmLeft+0 
	MOVF        _FAST_PWM+1, 0 
	MOVWF       FARG_turnRight_pwmLeft+1 
	CALL        _turnRight+0, 0
	GOTO        L_lineFollowNormalWorked232
L_lineFollowNormalWorked231:
;linefollow.h,213 :: 		else if( Sensor3==0 && Sensor4==0 && Sensor5==0 && Sensor6==1 && Sensor7==1)
	BTFSC       PORTD+0, 4 
	GOTO        L_lineFollowNormalWorked235
	BTFSC       PORTD+0, 5 
	GOTO        L_lineFollowNormalWorked235
	BTFSC       PORTD+0, 6 
	GOTO        L_lineFollowNormalWorked235
	BTFSS       PORTD+0, 7 
	GOTO        L_lineFollowNormalWorked235
	BTFSS       PORTB+0, 2 
	GOTO        L_lineFollowNormalWorked235
L__lineFollowNormalWorked613:
;linefollow.h,215 :: 		turnRight(FAST_PWM);
	MOVF        _FAST_PWM+0, 0 
	MOVWF       FARG_turnRight_pwmLeft+0 
	MOVF        _FAST_PWM+1, 0 
	MOVWF       FARG_turnRight_pwmLeft+1 
	CALL        _turnRight+0, 0
	GOTO        L_lineFollowNormalWorked236
L_lineFollowNormalWorked235:
;linefollow.h,216 :: 		else if( Sensor3==0 && Sensor4==0 && Sensor5==0 && Sensor6==0 && Sensor7==1)
	BTFSC       PORTD+0, 4 
	GOTO        L_lineFollowNormalWorked239
	BTFSC       PORTD+0, 5 
	GOTO        L_lineFollowNormalWorked239
	BTFSC       PORTD+0, 6 
	GOTO        L_lineFollowNormalWorked239
	BTFSC       PORTD+0, 7 
	GOTO        L_lineFollowNormalWorked239
	BTFSS       PORTB+0, 2 
	GOTO        L_lineFollowNormalWorked239
L__lineFollowNormalWorked612:
;linefollow.h,218 :: 		turnRight(FAST_PWM);
	MOVF        _FAST_PWM+0, 0 
	MOVWF       FARG_turnRight_pwmLeft+0 
	MOVF        _FAST_PWM+1, 0 
	MOVWF       FARG_turnRight_pwmLeft+1 
	CALL        _turnRight+0, 0
	GOTO        L_lineFollowNormalWorked240
L_lineFollowNormalWorked239:
;linefollow.h,221 :: 		else if( Sensor3==1 && Sensor4==1 && Sensor5==1 && Sensor6==1 && Sensor7==0)
	BTFSS       PORTD+0, 4 
	GOTO        L_lineFollowNormalWorked243
	BTFSS       PORTD+0, 5 
	GOTO        L_lineFollowNormalWorked243
	BTFSS       PORTD+0, 6 
	GOTO        L_lineFollowNormalWorked243
	BTFSS       PORTD+0, 7 
	GOTO        L_lineFollowNormalWorked243
	BTFSC       PORTB+0, 2 
	GOTO        L_lineFollowNormalWorked243
L__lineFollowNormalWorked611:
;linefollow.h,222 :: 		moveForward(SLOW_PWM,FAST_PWM);
	MOVF        _SLOW_PWM+0, 0 
	MOVWF       FARG_moveForward_pwmLeft+0 
	MOVF        _SLOW_PWM+1, 0 
	MOVWF       FARG_moveForward_pwmLeft+1 
	MOVF        _FAST_PWM+0, 0 
	MOVWF       FARG_moveForward_pwmRight+0 
	MOVF        _FAST_PWM+1, 0 
	MOVWF       FARG_moveForward_pwmRight+1 
	CALL        _moveForward+0, 0
	GOTO        L_lineFollowNormalWorked244
L_lineFollowNormalWorked243:
;linefollow.h,223 :: 		else if( Sensor3==0 && Sensor4==1 && Sensor5==1 && Sensor6==1 && Sensor7==1)
	BTFSC       PORTD+0, 4 
	GOTO        L_lineFollowNormalWorked247
	BTFSS       PORTD+0, 5 
	GOTO        L_lineFollowNormalWorked247
	BTFSS       PORTD+0, 6 
	GOTO        L_lineFollowNormalWorked247
	BTFSS       PORTD+0, 7 
	GOTO        L_lineFollowNormalWorked247
	BTFSS       PORTB+0, 2 
	GOTO        L_lineFollowNormalWorked247
L__lineFollowNormalWorked610:
;linefollow.h,224 :: 		moveForward(FAST_PWM,SLOW_PWM);
	MOVF        _FAST_PWM+0, 0 
	MOVWF       FARG_moveForward_pwmLeft+0 
	MOVF        _FAST_PWM+1, 0 
	MOVWF       FARG_moveForward_pwmLeft+1 
	MOVF        _SLOW_PWM+0, 0 
	MOVWF       FARG_moveForward_pwmRight+0 
	MOVF        _SLOW_PWM+1, 0 
	MOVWF       FARG_moveForward_pwmRight+1 
	CALL        _moveForward+0, 0
	GOTO        L_lineFollowNormalWorked248
L_lineFollowNormalWorked247:
;linefollow.h,225 :: 		else if( Sensor2==1 && Sensor3==1 && Sensor4==1 && Sensor5==0 && Sensor6==1 && Sensor7==1 && Sensor8==1)
	BTFSS       PORTB+0, 3 
	GOTO        L_lineFollowNormalWorked251
	BTFSS       PORTD+0, 4 
	GOTO        L_lineFollowNormalWorked251
	BTFSS       PORTD+0, 5 
	GOTO        L_lineFollowNormalWorked251
	BTFSC       PORTD+0, 6 
	GOTO        L_lineFollowNormalWorked251
	BTFSS       PORTD+0, 7 
	GOTO        L_lineFollowNormalWorked251
	BTFSS       PORTB+0, 2 
	GOTO        L_lineFollowNormalWorked251
	BTFSS       PORTB+0, 6 
	GOTO        L_lineFollowNormalWorked251
L__lineFollowNormalWorked609:
;linefollow.h,226 :: 		while(Scout==0)
L_lineFollowNormalWorked252:
	BTFSC       PORTB+0, 5 
	GOTO        L_lineFollowNormalWorked253
;linefollow.h,227 :: 		rotateAntiClockwise(255);
	MOVLW       255
	MOVWF       FARG_rotateAntiClockwise_pwm+0 
	MOVLW       0
	MOVWF       FARG_rotateAntiClockwise_pwm+1 
	CALL        _rotateAntiClockwise+0, 0
	GOTO        L_lineFollowNormalWorked252
L_lineFollowNormalWorked253:
	GOTO        L_lineFollowNormalWorked254
L_lineFollowNormalWorked251:
;linefollow.h,228 :: 		else if( Sensor1==0 && Sensor2==0 && Sensor3==0 && Sensor4==0 && Sensor5==0 && Sensor6==0 && Sensor7==0 && Sensor8==1 && Sensor9==1)
	BTFSC       PORTB+0, 4 
	GOTO        L_lineFollowNormalWorked257
	BTFSC       PORTB+0, 3 
	GOTO        L_lineFollowNormalWorked257
	BTFSC       PORTD+0, 4 
	GOTO        L_lineFollowNormalWorked257
	BTFSC       PORTD+0, 5 
	GOTO        L_lineFollowNormalWorked257
	BTFSC       PORTD+0, 6 
	GOTO        L_lineFollowNormalWorked257
	BTFSC       PORTD+0, 7 
	GOTO        L_lineFollowNormalWorked257
	BTFSC       PORTB+0, 2 
	GOTO        L_lineFollowNormalWorked257
	BTFSS       PORTB+0, 6 
	GOTO        L_lineFollowNormalWorked257
	BTFSS       PORTB+0, 7 
	GOTO        L_lineFollowNormalWorked257
L__lineFollowNormalWorked608:
;linefollow.h,229 :: 		while(Scout==0)
L_lineFollowNormalWorked258:
	BTFSC       PORTB+0, 5 
	GOTO        L_lineFollowNormalWorked259
;linefollow.h,230 :: 		rotateClockwise(255);
	MOVLW       255
	MOVWF       FARG_rotateClockwise_pwm+0 
	MOVLW       0
	MOVWF       FARG_rotateClockwise_pwm+1 
	CALL        _rotateClockwise+0, 0
	GOTO        L_lineFollowNormalWorked258
L_lineFollowNormalWorked259:
	GOTO        L_lineFollowNormalWorked260
L_lineFollowNormalWorked257:
;linefollow.h,231 :: 		else if( Sensor1==1 && Sensor2==1 && Sensor3==0 && Sensor4==0 && Sensor5==0 && Sensor6==0 && Sensor7==0 && Sensor8==0 && Sensor9==0)
	BTFSS       PORTB+0, 4 
	GOTO        L_lineFollowNormalWorked263
	BTFSS       PORTB+0, 3 
	GOTO        L_lineFollowNormalWorked263
	BTFSC       PORTD+0, 4 
	GOTO        L_lineFollowNormalWorked263
	BTFSC       PORTD+0, 5 
	GOTO        L_lineFollowNormalWorked263
	BTFSC       PORTD+0, 6 
	GOTO        L_lineFollowNormalWorked263
	BTFSC       PORTD+0, 7 
	GOTO        L_lineFollowNormalWorked263
	BTFSC       PORTB+0, 2 
	GOTO        L_lineFollowNormalWorked263
	BTFSC       PORTB+0, 6 
	GOTO        L_lineFollowNormalWorked263
	BTFSC       PORTB+0, 7 
	GOTO        L_lineFollowNormalWorked263
L__lineFollowNormalWorked607:
;linefollow.h,232 :: 		while(Scout==0)
L_lineFollowNormalWorked264:
	BTFSC       PORTB+0, 5 
	GOTO        L_lineFollowNormalWorked265
;linefollow.h,233 :: 		rotateAntiClockwise(255);
	MOVLW       255
	MOVWF       FARG_rotateAntiClockwise_pwm+0 
	MOVLW       0
	MOVWF       FARG_rotateAntiClockwise_pwm+1 
	CALL        _rotateAntiClockwise+0, 0
	GOTO        L_lineFollowNormalWorked264
L_lineFollowNormalWorked265:
	GOTO        L_lineFollowNormalWorked266
L_lineFollowNormalWorked263:
;linefollow.h,236 :: 		else if( Sensor3==0 && Sensor4==1 && Sensor5==1 && Sensor6==0 && Sensor7==0)
	BTFSC       PORTD+0, 4 
	GOTO        L_lineFollowNormalWorked269
	BTFSS       PORTD+0, 5 
	GOTO        L_lineFollowNormalWorked269
	BTFSS       PORTD+0, 6 
	GOTO        L_lineFollowNormalWorked269
	BTFSC       PORTD+0, 7 
	GOTO        L_lineFollowNormalWorked269
	BTFSC       PORTB+0, 2 
	GOTO        L_lineFollowNormalWorked269
L__lineFollowNormalWorked606:
;linefollow.h,237 :: 		moveForward(SLOW_PWM,FAST_PWM);
	MOVF        _SLOW_PWM+0, 0 
	MOVWF       FARG_moveForward_pwmLeft+0 
	MOVF        _SLOW_PWM+1, 0 
	MOVWF       FARG_moveForward_pwmLeft+1 
	MOVF        _FAST_PWM+0, 0 
	MOVWF       FARG_moveForward_pwmRight+0 
	MOVF        _FAST_PWM+1, 0 
	MOVWF       FARG_moveForward_pwmRight+1 
	CALL        _moveForward+0, 0
	GOTO        L_lineFollowNormalWorked270
L_lineFollowNormalWorked269:
;linefollow.h,238 :: 		else if( Sensor3==0 && Sensor4==1 && Sensor5==1 && Sensor6==1 && Sensor7==0)
	BTFSC       PORTD+0, 4 
	GOTO        L_lineFollowNormalWorked273
	BTFSS       PORTD+0, 5 
	GOTO        L_lineFollowNormalWorked273
	BTFSS       PORTD+0, 6 
	GOTO        L_lineFollowNormalWorked273
	BTFSS       PORTD+0, 7 
	GOTO        L_lineFollowNormalWorked273
	BTFSC       PORTB+0, 2 
	GOTO        L_lineFollowNormalWorked273
L__lineFollowNormalWorked605:
;linefollow.h,239 :: 		moveForward(FAST_PWM,FAST_PWM);
	MOVF        _FAST_PWM+0, 0 
	MOVWF       FARG_moveForward_pwmLeft+0 
	MOVF        _FAST_PWM+1, 0 
	MOVWF       FARG_moveForward_pwmLeft+1 
	MOVF        _FAST_PWM+0, 0 
	MOVWF       FARG_moveForward_pwmRight+0 
	MOVF        _FAST_PWM+1, 0 
	MOVWF       FARG_moveForward_pwmRight+1 
	CALL        _moveForward+0, 0
	GOTO        L_lineFollowNormalWorked274
L_lineFollowNormalWorked273:
;linefollow.h,240 :: 		else if( Sensor3==0 && Sensor4==0 && Sensor5==1 && Sensor6==0 && Sensor7==0)
	BTFSC       PORTD+0, 4 
	GOTO        L_lineFollowNormalWorked277
	BTFSC       PORTD+0, 5 
	GOTO        L_lineFollowNormalWorked277
	BTFSS       PORTD+0, 6 
	GOTO        L_lineFollowNormalWorked277
	BTFSC       PORTD+0, 7 
	GOTO        L_lineFollowNormalWorked277
	BTFSC       PORTB+0, 2 
	GOTO        L_lineFollowNormalWorked277
L__lineFollowNormalWorked604:
;linefollow.h,241 :: 		moveForward(FAST_PWM,FAST_PWM);
	MOVF        _FAST_PWM+0, 0 
	MOVWF       FARG_moveForward_pwmLeft+0 
	MOVF        _FAST_PWM+1, 0 
	MOVWF       FARG_moveForward_pwmLeft+1 
	MOVF        _FAST_PWM+0, 0 
	MOVWF       FARG_moveForward_pwmRight+0 
	MOVF        _FAST_PWM+1, 0 
	MOVWF       FARG_moveForward_pwmRight+1 
	CALL        _moveForward+0, 0
	GOTO        L_lineFollowNormalWorked278
L_lineFollowNormalWorked277:
;linefollow.h,242 :: 		else if( Sensor3==0 && Sensor4==0 && Sensor5==1 && Sensor6==1 && Sensor7==0)
	BTFSC       PORTD+0, 4 
	GOTO        L_lineFollowNormalWorked281
	BTFSC       PORTD+0, 5 
	GOTO        L_lineFollowNormalWorked281
	BTFSS       PORTD+0, 6 
	GOTO        L_lineFollowNormalWorked281
	BTFSS       PORTD+0, 7 
	GOTO        L_lineFollowNormalWorked281
	BTFSC       PORTB+0, 2 
	GOTO        L_lineFollowNormalWorked281
L__lineFollowNormalWorked603:
;linefollow.h,243 :: 		moveForward(FAST_PWM,SLOW_PWM);
	MOVF        _FAST_PWM+0, 0 
	MOVWF       FARG_moveForward_pwmLeft+0 
	MOVF        _FAST_PWM+1, 0 
	MOVWF       FARG_moveForward_pwmLeft+1 
	MOVF        _SLOW_PWM+0, 0 
	MOVWF       FARG_moveForward_pwmRight+0 
	MOVF        _SLOW_PWM+1, 0 
	MOVWF       FARG_moveForward_pwmRight+1 
	CALL        _moveForward+0, 0
	GOTO        L_lineFollowNormalWorked282
L_lineFollowNormalWorked281:
;linefollow.h,246 :: 		else if(isAllWhite()){
	CALL        _isAllWhite+0, 0
	MOVF        R0, 0 
	IORWF       R1, 0 
	BTFSC       STATUS+0, 2 
	GOTO        L_lineFollowNormalWorked283
;linefollow.h,249 :: 		sendSensorStatus();
	CALL        _sendSensorStatus+0, 0
;linefollow.h,250 :: 		}
	GOTO        L_lineFollowNormalWorked284
L_lineFollowNormalWorked283:
;linefollow.h,253 :: 		reverse(220,220);
	MOVLW       220
	MOVWF       FARG_reverse_pwmLeft+0 
	MOVLW       0
	MOVWF       FARG_reverse_pwmLeft+1 
	MOVLW       220
	MOVWF       FARG_reverse_pwmRight+0 
	MOVLW       0
	MOVWF       FARG_reverse_pwmRight+1 
	CALL        _reverse+0, 0
;linefollow.h,254 :: 		sendSensorStatus();
	CALL        _sendSensorStatus+0, 0
;linefollow.h,256 :: 		}
L_lineFollowNormalWorked284:
L_lineFollowNormalWorked282:
L_lineFollowNormalWorked278:
L_lineFollowNormalWorked274:
L_lineFollowNormalWorked270:
L_lineFollowNormalWorked266:
L_lineFollowNormalWorked260:
L_lineFollowNormalWorked254:
L_lineFollowNormalWorked248:
L_lineFollowNormalWorked244:
L_lineFollowNormalWorked240:
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
;linefollow.h,257 :: 		}
L_lineFollowNormalWorked184:
;linefollow.h,258 :: 		}
	RETURN      0
; end of _lineFollowNormalWorked

_isOnThePath:

;linefollow.h,260 :: 		int isOnThePath(){
;linefollow.h,261 :: 		if(((Sensor3==0 && Sensor4==1 && Sensor5==1 && Sensor6==0 && Sensor7==0) || ( Sensor3==0 && Sensor4==1 && Sensor5==1 && Sensor6==1 && Sensor7==0) || ( Sensor3==0 && Sensor4==0 && Sensor5==1 && Sensor6==0 && Sensor7==0) || ( Sensor3==0 && Sensor4==0 && Sensor5==1 && Sensor6==1 && Sensor7==0)) && Sensor1==0 && Sensor2==0 && Sensor8==0 && Sensor9==0)
	BTFSC       PORTD+0, 4 
	GOTO        L__isOnThePath646
	BTFSS       PORTD+0, 5 
	GOTO        L__isOnThePath646
	BTFSS       PORTD+0, 6 
	GOTO        L__isOnThePath646
	BTFSC       PORTD+0, 7 
	GOTO        L__isOnThePath646
	BTFSC       PORTB+0, 2 
	GOTO        L__isOnThePath646
	GOTO        L__isOnThePath642
L__isOnThePath646:
	BTFSC       PORTD+0, 4 
	GOTO        L__isOnThePath645
	BTFSS       PORTD+0, 5 
	GOTO        L__isOnThePath645
	BTFSS       PORTD+0, 6 
	GOTO        L__isOnThePath645
	BTFSS       PORTD+0, 7 
	GOTO        L__isOnThePath645
	BTFSC       PORTB+0, 2 
	GOTO        L__isOnThePath645
	GOTO        L__isOnThePath642
L__isOnThePath645:
	BTFSC       PORTD+0, 4 
	GOTO        L__isOnThePath644
	BTFSC       PORTD+0, 5 
	GOTO        L__isOnThePath644
	BTFSS       PORTD+0, 6 
	GOTO        L__isOnThePath644
	BTFSC       PORTD+0, 7 
	GOTO        L__isOnThePath644
	BTFSC       PORTB+0, 2 
	GOTO        L__isOnThePath644
	GOTO        L__isOnThePath642
L__isOnThePath644:
	BTFSC       PORTD+0, 4 
	GOTO        L__isOnThePath643
	BTFSC       PORTD+0, 5 
	GOTO        L__isOnThePath643
	BTFSS       PORTD+0, 6 
	GOTO        L__isOnThePath643
	BTFSS       PORTD+0, 7 
	GOTO        L__isOnThePath643
	BTFSC       PORTB+0, 2 
	GOTO        L__isOnThePath643
	GOTO        L__isOnThePath642
L__isOnThePath643:
	GOTO        L_isOnThePath297
L__isOnThePath642:
	BTFSC       PORTB+0, 4 
	GOTO        L_isOnThePath297
	BTFSC       PORTB+0, 3 
	GOTO        L_isOnThePath297
	BTFSC       PORTB+0, 6 
	GOTO        L_isOnThePath297
	BTFSC       PORTB+0, 7 
	GOTO        L_isOnThePath297
L__isOnThePath641:
;linefollow.h,262 :: 		return 1;
	MOVLW       1
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	RETURN      0
L_isOnThePath297:
;linefollow.h,264 :: 		return 0;
	CLRF        R0 
	CLRF        R1 
;linefollow.h,265 :: 		}
	RETURN      0
; end of _isOnThePath

_lineFollow:

;linefollow.h,267 :: 		void lineFollow(){
;linefollow.h,269 :: 		while(1){
L_lineFollow299:
;linefollow.h,270 :: 		if( (Sensor3==1 || Sensor4==1 || Sensor5==1 || Sensor6==1 || Sensor7==1) && Sensor1==0 && Sensor2==0 && Sensor8==0 && Sensor9==0 ){
	BTFSC       PORTD+0, 4 
	GOTO        L__lineFollow651
	BTFSC       PORTD+0, 5 
	GOTO        L__lineFollow651
	BTFSC       PORTD+0, 6 
	GOTO        L__lineFollow651
	BTFSC       PORTD+0, 7 
	GOTO        L__lineFollow651
	BTFSC       PORTB+0, 2 
	GOTO        L__lineFollow651
	GOTO        L_lineFollow305
L__lineFollow651:
	BTFSC       PORTB+0, 4 
	GOTO        L_lineFollow305
	BTFSC       PORTB+0, 3 
	GOTO        L_lineFollow305
	BTFSC       PORTB+0, 6 
	GOTO        L_lineFollow305
	BTFSC       PORTB+0, 7 
	GOTO        L_lineFollow305
L__lineFollow650:
;linefollow.h,272 :: 		debugText = "Line follow PID..   ";
	MOVLW       ?lstr28_Main_326.0V+0
	MOVWF       _debugText+0 
	MOVLW       hi_addr(?lstr28_Main_326.0V+0)
	MOVWF       _debugText+1 
;linefollow.h,273 :: 		UART1_Write_Text(debugText);
	MOVF        _debugText+0, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVF        _debugText+1, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;linefollow.h,274 :: 		sendSensorStatus();
	CALL        _sendSensorStatus+0, 0
;linefollow.h,275 :: 		lineFollowPID();
	CALL        _lineFollowPID+0, 0
;linefollow.h,276 :: 		}
	GOTO        L_lineFollow306
L_lineFollow305:
;linefollow.h,277 :: 		else if( !( Scout==1 && Sensor1==1 && Sensor2==1 && Sensor3==1 && Sensor4==1 && Sensor5==1 && Sensor6==1 && Sensor7==1 && Sensor8==1 && Sensor9==1) || !( Scout==0 && Sensor1==0 && Sensor2==0 && Sensor3==0 && Sensor4==0 && Sensor5==0 && Sensor6==0 && Sensor7==0 && Sensor8==0 && Sensor9==0)){
	BTFSS       PORTB+0, 5 
	GOTO        L_lineFollow308
	BTFSS       PORTB+0, 4 
	GOTO        L_lineFollow308
	BTFSS       PORTB+0, 3 
	GOTO        L_lineFollow308
	BTFSS       PORTD+0, 4 
	GOTO        L_lineFollow308
	BTFSS       PORTD+0, 5 
	GOTO        L_lineFollow308
	BTFSS       PORTD+0, 6 
	GOTO        L_lineFollow308
	BTFSS       PORTD+0, 7 
	GOTO        L_lineFollow308
	BTFSS       PORTB+0, 2 
	GOTO        L_lineFollow308
	BTFSS       PORTB+0, 6 
	GOTO        L_lineFollow308
	BTFSS       PORTB+0, 7 
	GOTO        L_lineFollow308
	MOVLW       1
	MOVWF       R0 
	GOTO        L_lineFollow307
L_lineFollow308:
	CLRF        R0 
L_lineFollow307:
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L__lineFollow649
	BTFSC       PORTB+0, 5 
	GOTO        L_lineFollow310
	BTFSC       PORTB+0, 4 
	GOTO        L_lineFollow310
	BTFSC       PORTB+0, 3 
	GOTO        L_lineFollow310
	BTFSC       PORTD+0, 4 
	GOTO        L_lineFollow310
	BTFSC       PORTD+0, 5 
	GOTO        L_lineFollow310
	BTFSC       PORTD+0, 6 
	GOTO        L_lineFollow310
	BTFSC       PORTD+0, 7 
	GOTO        L_lineFollow310
	BTFSC       PORTB+0, 2 
	GOTO        L_lineFollow310
	BTFSC       PORTB+0, 6 
	GOTO        L_lineFollow310
	BTFSC       PORTB+0, 7 
	GOTO        L_lineFollow310
	MOVLW       1
	MOVWF       R0 
	GOTO        L_lineFollow309
L_lineFollow310:
	CLRF        R0 
L_lineFollow309:
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L__lineFollow649
	GOTO        L_lineFollow313
L__lineFollow649:
;linefollow.h,279 :: 		debugText = "Line follow Normal..   ";
	MOVLW       ?lstr29_Main_326.0V+0
	MOVWF       _debugText+0 
	MOVLW       hi_addr(?lstr29_Main_326.0V+0)
	MOVWF       _debugText+1 
;linefollow.h,280 :: 		UART1_Write_Text(debugText);
	MOVF        _debugText+0, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVF        _debugText+1, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;linefollow.h,281 :: 		sendSensorStatus();
	CALL        _sendSensorStatus+0, 0
;linefollow.h,282 :: 		lineFollowNormal();
	CALL        _lineFollowNormal+0, 0
;linefollow.h,283 :: 		}
	GOTO        L_lineFollow314
L_lineFollow313:
;linefollow.h,284 :: 		else if(( Scout==1 && Sensor1==1 && Sensor2==1 && Sensor3==1 && Sensor4==1 && Sensor5==1 && Sensor6==1 && Sensor7==1 && Sensor8==1 && Sensor9==1) || !( Scout==0 && Sensor1==0 && Sensor2==0 && Sensor3==0 && Sensor4==0 && Sensor5==0 && Sensor6==0 && Sensor7==0 && Sensor8==0 && Sensor9==0)){
	BTFSS       PORTB+0, 5 
	GOTO        L__lineFollow648
	BTFSS       PORTB+0, 4 
	GOTO        L__lineFollow648
	BTFSS       PORTB+0, 3 
	GOTO        L__lineFollow648
	BTFSS       PORTD+0, 4 
	GOTO        L__lineFollow648
	BTFSS       PORTD+0, 5 
	GOTO        L__lineFollow648
	BTFSS       PORTD+0, 6 
	GOTO        L__lineFollow648
	BTFSS       PORTD+0, 7 
	GOTO        L__lineFollow648
	BTFSS       PORTB+0, 2 
	GOTO        L__lineFollow648
	BTFSS       PORTB+0, 6 
	GOTO        L__lineFollow648
	BTFSS       PORTB+0, 7 
	GOTO        L__lineFollow648
	GOTO        L__lineFollow647
L__lineFollow648:
	BTFSC       PORTB+0, 5 
	GOTO        L_lineFollow318
	BTFSC       PORTB+0, 4 
	GOTO        L_lineFollow318
	BTFSC       PORTB+0, 3 
	GOTO        L_lineFollow318
	BTFSC       PORTD+0, 4 
	GOTO        L_lineFollow318
	BTFSC       PORTD+0, 5 
	GOTO        L_lineFollow318
	BTFSC       PORTD+0, 6 
	GOTO        L_lineFollow318
	BTFSC       PORTD+0, 7 
	GOTO        L_lineFollow318
	BTFSC       PORTB+0, 2 
	GOTO        L_lineFollow318
	BTFSC       PORTB+0, 6 
	GOTO        L_lineFollow318
	BTFSC       PORTB+0, 7 
	GOTO        L_lineFollow318
	MOVLW       1
	MOVWF       R0 
	GOTO        L_lineFollow317
L_lineFollow318:
	CLRF        R0 
L_lineFollow317:
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L__lineFollow647
	GOTO        L_lineFollow321
L__lineFollow647:
;linefollow.h,286 :: 		stop();
	CALL        _stop+0, 0
;linefollow.h,287 :: 		sendSensorStatus();
	CALL        _sendSensorStatus+0, 0
;linefollow.h,289 :: 		}
L_lineFollow321:
L_lineFollow314:
L_lineFollow306:
;linefollow.h,290 :: 		}
	GOTO        L_lineFollow299
;linefollow.h,291 :: 		}
	RETURN      0
; end of _lineFollow

_lineFollowNormal:

;linefollow.h,293 :: 		void lineFollowNormal(){
;linefollow.h,294 :: 		while(1){              //!((Sensor3==1 || Sensor4==1 || Sensor5==1 || Sensor6==1 || Sensor7==1) && Sensor1==0 && Sensor2==0 && Sensor8==0 && Sensor9==0)
L_lineFollowNormal322:
;linefollow.h,295 :: 		if( Scout==1 && Sensor1==1 && Sensor2==1 && Sensor3==1 && Sensor4==1 && Sensor5==1 && Sensor6==1 && Sensor7==1 && Sensor8==1 && Sensor9==1){
	BTFSS       PORTB+0, 5 
	GOTO        L_lineFollowNormal326
	BTFSS       PORTB+0, 4 
	GOTO        L_lineFollowNormal326
	BTFSS       PORTB+0, 3 
	GOTO        L_lineFollowNormal326
	BTFSS       PORTD+0, 4 
	GOTO        L_lineFollowNormal326
	BTFSS       PORTD+0, 5 
	GOTO        L_lineFollowNormal326
	BTFSS       PORTD+0, 6 
	GOTO        L_lineFollowNormal326
	BTFSS       PORTD+0, 7 
	GOTO        L_lineFollowNormal326
	BTFSS       PORTB+0, 2 
	GOTO        L_lineFollowNormal326
	BTFSS       PORTB+0, 6 
	GOTO        L_lineFollowNormal326
	BTFSS       PORTB+0, 7 
	GOTO        L_lineFollowNormal326
L__lineFollowNormal664:
;linefollow.h,296 :: 		stop();
	CALL        _stop+0, 0
;linefollow.h,297 :: 		}
	GOTO        L_lineFollowNormal327
L_lineFollowNormal326:
;linefollow.h,298 :: 		else if( (Scout==0 && Sensor1==0 && Sensor2==0 && Sensor3==0 && Sensor4==1 && Sensor5==1 && Sensor6==1 && Sensor7==1 && Sensor8==1 && Sensor9==1) || (Scout==0 && Sensor1==0 && Sensor2==0 && Sensor3==0 && Sensor4==0 && Sensor5==1 && Sensor6==1 && Sensor7==1 && Sensor8==1 && Sensor9==1)){
	BTFSC       PORTB+0, 5 
	GOTO        L__lineFollowNormal663
	BTFSC       PORTB+0, 4 
	GOTO        L__lineFollowNormal663
	BTFSC       PORTB+0, 3 
	GOTO        L__lineFollowNormal663
	BTFSC       PORTD+0, 4 
	GOTO        L__lineFollowNormal663
	BTFSS       PORTD+0, 5 
	GOTO        L__lineFollowNormal663
	BTFSS       PORTD+0, 6 
	GOTO        L__lineFollowNormal663
	BTFSS       PORTD+0, 7 
	GOTO        L__lineFollowNormal663
	BTFSS       PORTB+0, 2 
	GOTO        L__lineFollowNormal663
	BTFSS       PORTB+0, 6 
	GOTO        L__lineFollowNormal663
	BTFSS       PORTB+0, 7 
	GOTO        L__lineFollowNormal663
	GOTO        L__lineFollowNormal661
L__lineFollowNormal663:
	BTFSC       PORTB+0, 5 
	GOTO        L__lineFollowNormal662
	BTFSC       PORTB+0, 4 
	GOTO        L__lineFollowNormal662
	BTFSC       PORTB+0, 3 
	GOTO        L__lineFollowNormal662
	BTFSC       PORTD+0, 4 
	GOTO        L__lineFollowNormal662
	BTFSC       PORTD+0, 5 
	GOTO        L__lineFollowNormal662
	BTFSS       PORTD+0, 6 
	GOTO        L__lineFollowNormal662
	BTFSS       PORTD+0, 7 
	GOTO        L__lineFollowNormal662
	BTFSS       PORTB+0, 2 
	GOTO        L__lineFollowNormal662
	BTFSS       PORTB+0, 6 
	GOTO        L__lineFollowNormal662
	BTFSS       PORTB+0, 7 
	GOTO        L__lineFollowNormal662
	GOTO        L__lineFollowNormal661
L__lineFollowNormal662:
	GOTO        L_lineFollowNormal334
L__lineFollowNormal661:
;linefollow.h,300 :: 		debugText = "90 to right..   ";
	MOVLW       ?lstr30_Main_326.0V+0
	MOVWF       _debugText+0 
	MOVLW       hi_addr(?lstr30_Main_326.0V+0)
	MOVWF       _debugText+1 
;linefollow.h,301 :: 		UART1_Write_Text(debugText);
	MOVF        _debugText+0, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVF        _debugText+1, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;linefollow.h,302 :: 		sendSensorStatus();
	CALL        _sendSensorStatus+0, 0
;linefollow.h,303 :: 		while(Scout==0){
L_lineFollowNormal335:
	BTFSC       PORTB+0, 5 
	GOTO        L_lineFollowNormal336
;linefollow.h,304 :: 		rotateClockwise(TEST_RPM);
	MOVF        _TEST_RPM+0, 0 
	MOVWF       FARG_rotateClockwise_pwm+0 
	MOVF        _TEST_RPM+1, 0 
	MOVWF       FARG_rotateClockwise_pwm+1 
	CALL        _rotateClockwise+0, 0
;linefollow.h,305 :: 		}
	GOTO        L_lineFollowNormal335
L_lineFollowNormal336:
;linefollow.h,306 :: 		}
	GOTO        L_lineFollowNormal337
L_lineFollowNormal334:
;linefollow.h,307 :: 		else if( (Scout==0 && Sensor1==1 && Sensor2==1 && Sensor3==1 && Sensor4==1 && Sensor5==1 && Sensor6==0 && Sensor7==0 && Sensor8==0 && Sensor9==0) && (Scout==0 && Sensor1==1 && Sensor2==1 && Sensor3==1 && Sensor4==1 && Sensor5==0 && Sensor6==0 && Sensor7==0 && Sensor8==0 && Sensor9==0)){
	BTFSC       PORTB+0, 5 
	GOTO        L_lineFollowNormal344
	BTFSS       PORTB+0, 4 
	GOTO        L_lineFollowNormal344
	BTFSS       PORTB+0, 3 
	GOTO        L_lineFollowNormal344
	BTFSS       PORTD+0, 4 
	GOTO        L_lineFollowNormal344
	BTFSS       PORTD+0, 5 
	GOTO        L_lineFollowNormal344
	BTFSS       PORTD+0, 6 
	GOTO        L_lineFollowNormal344
	BTFSC       PORTD+0, 7 
	GOTO        L_lineFollowNormal344
	BTFSC       PORTB+0, 2 
	GOTO        L_lineFollowNormal344
	BTFSC       PORTB+0, 6 
	GOTO        L_lineFollowNormal344
	BTFSC       PORTB+0, 7 
	GOTO        L_lineFollowNormal344
L__lineFollowNormal660:
	BTFSC       PORTB+0, 5 
	GOTO        L_lineFollowNormal344
	BTFSS       PORTB+0, 4 
	GOTO        L_lineFollowNormal344
	BTFSS       PORTB+0, 3 
	GOTO        L_lineFollowNormal344
	BTFSS       PORTD+0, 4 
	GOTO        L_lineFollowNormal344
	BTFSS       PORTD+0, 5 
	GOTO        L_lineFollowNormal344
	BTFSC       PORTD+0, 6 
	GOTO        L_lineFollowNormal344
	BTFSC       PORTD+0, 7 
	GOTO        L_lineFollowNormal344
	BTFSC       PORTB+0, 2 
	GOTO        L_lineFollowNormal344
	BTFSC       PORTB+0, 6 
	GOTO        L_lineFollowNormal344
	BTFSC       PORTB+0, 7 
	GOTO        L_lineFollowNormal344
L__lineFollowNormal659:
L__lineFollowNormal658:
;linefollow.h,309 :: 		debugText = "90 to left..   ";
	MOVLW       ?lstr31_Main_326.0V+0
	MOVWF       _debugText+0 
	MOVLW       hi_addr(?lstr31_Main_326.0V+0)
	MOVWF       _debugText+1 
;linefollow.h,310 :: 		UART1_Write_Text(debugText);
	MOVF        _debugText+0, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVF        _debugText+1, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;linefollow.h,311 :: 		sendSensorStatus();
	CALL        _sendSensorStatus+0, 0
;linefollow.h,312 :: 		while(Scout==0){
L_lineFollowNormal345:
	BTFSC       PORTB+0, 5 
	GOTO        L_lineFollowNormal346
;linefollow.h,313 :: 		rotateAntiClockwise(TEST_RPM);
	MOVF        _TEST_RPM+0, 0 
	MOVWF       FARG_rotateAntiClockwise_pwm+0 
	MOVF        _TEST_RPM+1, 0 
	MOVWF       FARG_rotateAntiClockwise_pwm+1 
	CALL        _rotateAntiClockwise+0, 0
;linefollow.h,314 :: 		}
	GOTO        L_lineFollowNormal345
L_lineFollowNormal346:
;linefollow.h,315 :: 		}
	GOTO        L_lineFollowNormal347
L_lineFollowNormal344:
;linefollow.h,316 :: 		else if( Sensor4==1 && Sensor5==1){
	BTFSS       PORTD+0, 5 
	GOTO        L_lineFollowNormal350
	BTFSS       PORTD+0, 6 
	GOTO        L_lineFollowNormal350
L__lineFollowNormal657:
;linefollow.h,318 :: 		moveForward(TEST_RPM,TEST_RPM);
	MOVF        _TEST_RPM+0, 0 
	MOVWF       FARG_moveForward_pwmLeft+0 
	MOVF        _TEST_RPM+1, 0 
	MOVWF       FARG_moveForward_pwmLeft+1 
	MOVF        _TEST_RPM+0, 0 
	MOVWF       FARG_moveForward_pwmRight+0 
	MOVF        _TEST_RPM+1, 0 
	MOVWF       FARG_moveForward_pwmRight+1 
	CALL        _moveForward+0, 0
;linefollow.h,319 :: 		}
	GOTO        L_lineFollowNormal351
L_lineFollowNormal350:
;linefollow.h,320 :: 		else if( Sensor4==1 && Sensor5==0 && Scout==1){
	BTFSS       PORTD+0, 5 
	GOTO        L_lineFollowNormal354
	BTFSC       PORTD+0, 6 
	GOTO        L_lineFollowNormal354
	BTFSS       PORTB+0, 5 
	GOTO        L_lineFollowNormal354
L__lineFollowNormal656:
;linefollow.h,322 :: 		turnLeft(TEST_RPM);
	MOVF        _TEST_RPM+0, 0 
	MOVWF       FARG_turnLeft_pwmRight+0 
	MOVF        _TEST_RPM+1, 0 
	MOVWF       FARG_turnLeft_pwmRight+1 
	CALL        _turnLeft+0, 0
;linefollow.h,323 :: 		}
	GOTO        L_lineFollowNormal355
L_lineFollowNormal354:
;linefollow.h,324 :: 		else if( Sensor4==0 && Sensor5==1 && Scout==1){
	BTFSC       PORTD+0, 5 
	GOTO        L_lineFollowNormal358
	BTFSS       PORTD+0, 6 
	GOTO        L_lineFollowNormal358
	BTFSS       PORTB+0, 5 
	GOTO        L_lineFollowNormal358
L__lineFollowNormal655:
;linefollow.h,326 :: 		turnRight(TEST_RPM);
	MOVF        _TEST_RPM+0, 0 
	MOVWF       FARG_turnRight_pwmLeft+0 
	MOVF        _TEST_RPM+1, 0 
	MOVWF       FARG_turnRight_pwmLeft+1 
	CALL        _turnRight+0, 0
;linefollow.h,327 :: 		}
	GOTO        L_lineFollowNormal359
L_lineFollowNormal358:
;linefollow.h,328 :: 		else if( Sensor4==1 && Sensor5==0 && Scout==0){
	BTFSS       PORTD+0, 5 
	GOTO        L_lineFollowNormal362
	BTFSC       PORTD+0, 6 
	GOTO        L_lineFollowNormal362
	BTFSC       PORTB+0, 5 
	GOTO        L_lineFollowNormal362
L__lineFollowNormal654:
;linefollow.h,330 :: 		stop();
	CALL        _stop+0, 0
;linefollow.h,332 :: 		rotateAntiClockwise(TEST_RPM);
	MOVF        _TEST_RPM+0, 0 
	MOVWF       FARG_rotateAntiClockwise_pwm+0 
	MOVF        _TEST_RPM+1, 0 
	MOVWF       FARG_rotateAntiClockwise_pwm+1 
	CALL        _rotateAntiClockwise+0, 0
;linefollow.h,333 :: 		}
	GOTO        L_lineFollowNormal363
L_lineFollowNormal362:
;linefollow.h,334 :: 		else if( Sensor4==0 && Sensor5==1 && Scout==0){
	BTFSC       PORTD+0, 5 
	GOTO        L_lineFollowNormal366
	BTFSS       PORTD+0, 6 
	GOTO        L_lineFollowNormal366
	BTFSC       PORTB+0, 5 
	GOTO        L_lineFollowNormal366
L__lineFollowNormal653:
;linefollow.h,336 :: 		stop();
	CALL        _stop+0, 0
;linefollow.h,338 :: 		rotateClockwise(TEST_RPM);
	MOVF        _TEST_RPM+0, 0 
	MOVWF       FARG_rotateClockwise_pwm+0 
	MOVF        _TEST_RPM+1, 0 
	MOVWF       FARG_rotateClockwise_pwm+1 
	CALL        _rotateClockwise+0, 0
;linefollow.h,339 :: 		}
	GOTO        L_lineFollowNormal367
L_lineFollowNormal366:
;linefollow.h,340 :: 		else if( Sensor4==0 && Sensor5==0 ){
	BTFSC       PORTD+0, 5 
	GOTO        L_lineFollowNormal370
	BTFSC       PORTD+0, 6 
	GOTO        L_lineFollowNormal370
L__lineFollowNormal652:
;linefollow.h,341 :: 		if(Sensor3 ==1){
	BTFSS       PORTD+0, 4 
	GOTO        L_lineFollowNormal371
;linefollow.h,342 :: 		rotateAntiClockwise(TEST_RPM);
	MOVF        _TEST_RPM+0, 0 
	MOVWF       FARG_rotateAntiClockwise_pwm+0 
	MOVF        _TEST_RPM+1, 0 
	MOVWF       FARG_rotateAntiClockwise_pwm+1 
	CALL        _rotateAntiClockwise+0, 0
;linefollow.h,343 :: 		}
	GOTO        L_lineFollowNormal372
L_lineFollowNormal371:
;linefollow.h,344 :: 		else if(Sensor6 ==1){
	BTFSS       PORTD+0, 7 
	GOTO        L_lineFollowNormal373
;linefollow.h,345 :: 		rotateClockwise(TEST_RPM);
	MOVF        _TEST_RPM+0, 0 
	MOVWF       FARG_rotateClockwise_pwm+0 
	MOVF        _TEST_RPM+1, 0 
	MOVWF       FARG_rotateClockwise_pwm+1 
	CALL        _rotateClockwise+0, 0
;linefollow.h,346 :: 		}
	GOTO        L_lineFollowNormal374
L_lineFollowNormal373:
;linefollow.h,347 :: 		else if(Sensor2 ==1){
	BTFSS       PORTB+0, 3 
	GOTO        L_lineFollowNormal375
;linefollow.h,348 :: 		rotateAntiClockwise(TEST_RPM);
	MOVF        _TEST_RPM+0, 0 
	MOVWF       FARG_rotateAntiClockwise_pwm+0 
	MOVF        _TEST_RPM+1, 0 
	MOVWF       FARG_rotateAntiClockwise_pwm+1 
	CALL        _rotateAntiClockwise+0, 0
;linefollow.h,349 :: 		}
	GOTO        L_lineFollowNormal376
L_lineFollowNormal375:
;linefollow.h,350 :: 		else if(Sensor7 ==1){
	BTFSS       PORTB+0, 2 
	GOTO        L_lineFollowNormal377
;linefollow.h,351 :: 		rotateClockwise(TEST_RPM);
	MOVF        _TEST_RPM+0, 0 
	MOVWF       FARG_rotateClockwise_pwm+0 
	MOVF        _TEST_RPM+1, 0 
	MOVWF       FARG_rotateClockwise_pwm+1 
	CALL        _rotateClockwise+0, 0
;linefollow.h,352 :: 		}
	GOTO        L_lineFollowNormal378
L_lineFollowNormal377:
;linefollow.h,355 :: 		stop();
	CALL        _stop+0, 0
;linefollow.h,358 :: 		}
L_lineFollowNormal378:
L_lineFollowNormal376:
L_lineFollowNormal374:
L_lineFollowNormal372:
;linefollow.h,359 :: 		}
L_lineFollowNormal370:
L_lineFollowNormal367:
L_lineFollowNormal363:
L_lineFollowNormal359:
L_lineFollowNormal355:
L_lineFollowNormal351:
L_lineFollowNormal347:
L_lineFollowNormal337:
L_lineFollowNormal327:
;linefollow.h,361 :: 		}
	GOTO        L_lineFollowNormal322
;linefollow.h,363 :: 		}
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
	GOTO        L_getDistanceIR_GP2D120379
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
	GOTO        L_getDistanceIR_GP2D120380
L_getDistanceIR_GP2D120379:
;ir.h,14 :: 		else if(sensor == 'R'){
	MOVF        FARG_getDistanceIR_GP2D120_sensor+0, 0 
	XORLW       82
	BTFSS       STATUS+0, 2 
	GOTO        L_getDistanceIR_GP2D120381
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
	GOTO        L_getDistanceIR_GP2D120382
L_getDistanceIR_GP2D120381:
;ir.h,17 :: 		else if(sensor == 'L'){
	MOVF        FARG_getDistanceIR_GP2D120_sensor+0, 0 
	XORLW       76
	BTFSS       STATUS+0, 2 
	GOTO        L_getDistanceIR_GP2D120383
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
	GOTO        L_getDistanceIR_GP2D120384
L_getDistanceIR_GP2D120383:
;ir.h,21 :: 		ir_value = 0;
	CLRF        _ir_value+0 
	CLRF        _ir_value+1 
L_getDistanceIR_GP2D120384:
L_getDistanceIR_GP2D120382:
L_getDistanceIR_GP2D120380:
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
	GOTO        L__getDistanceIR_GP2D120706
	MOVLW       98
	SUBWF       _ir_value+0, 0 
L__getDistanceIR_GP2D120706:
	BTFSS       STATUS+0, 0 
	GOTO        L_getDistanceIR_GP2D120387
	MOVLW       2
	SUBWF       _ir_value+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__getDistanceIR_GP2D120707
	MOVLW       111
	SUBWF       _ir_value+0, 0 
L__getDistanceIR_GP2D120707:
	BTFSC       STATUS+0, 0 
	GOTO        L_getDistanceIR_GP2D120387
L__getDistanceIR_GP2D120681:
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
L_getDistanceIR_GP2D120387:
;ir.h,27 :: 		else if( 557<=ir_value && ir_value<610 )
	MOVLW       2
	SUBWF       _ir_value+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__getDistanceIR_GP2D120708
	MOVLW       45
	SUBWF       _ir_value+0, 0 
L__getDistanceIR_GP2D120708:
	BTFSS       STATUS+0, 0 
	GOTO        L_getDistanceIR_GP2D120391
	MOVLW       2
	SUBWF       _ir_value+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__getDistanceIR_GP2D120709
	MOVLW       98
	SUBWF       _ir_value+0, 0 
L__getDistanceIR_GP2D120709:
	BTFSC       STATUS+0, 0 
	GOTO        L_getDistanceIR_GP2D120391
L__getDistanceIR_GP2D120680:
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
L_getDistanceIR_GP2D120391:
;ir.h,30 :: 		else if( 481<=ir_value && ir_value<557 )
	MOVLW       1
	SUBWF       _ir_value+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__getDistanceIR_GP2D120710
	MOVLW       225
	SUBWF       _ir_value+0, 0 
L__getDistanceIR_GP2D120710:
	BTFSS       STATUS+0, 0 
	GOTO        L_getDistanceIR_GP2D120395
	MOVLW       2
	SUBWF       _ir_value+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__getDistanceIR_GP2D120711
	MOVLW       45
	SUBWF       _ir_value+0, 0 
L__getDistanceIR_GP2D120711:
	BTFSC       STATUS+0, 0 
	GOTO        L_getDistanceIR_GP2D120395
L__getDistanceIR_GP2D120679:
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
L_getDistanceIR_GP2D120395:
;ir.h,33 :: 		else if( 409<=ir_value && ir_value<481 )
	MOVLW       1
	SUBWF       _ir_value+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__getDistanceIR_GP2D120712
	MOVLW       153
	SUBWF       _ir_value+0, 0 
L__getDistanceIR_GP2D120712:
	BTFSS       STATUS+0, 0 
	GOTO        L_getDistanceIR_GP2D120399
	MOVLW       1
	SUBWF       _ir_value+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__getDistanceIR_GP2D120713
	MOVLW       225
	SUBWF       _ir_value+0, 0 
L__getDistanceIR_GP2D120713:
	BTFSC       STATUS+0, 0 
	GOTO        L_getDistanceIR_GP2D120399
L__getDistanceIR_GP2D120678:
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
L_getDistanceIR_GP2D120399:
;ir.h,36 :: 		else if( 364<=ir_value && ir_value<409 )
	MOVLW       1
	SUBWF       _ir_value+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__getDistanceIR_GP2D120714
	MOVLW       108
	SUBWF       _ir_value+0, 0 
L__getDistanceIR_GP2D120714:
	BTFSS       STATUS+0, 0 
	GOTO        L_getDistanceIR_GP2D120403
	MOVLW       1
	SUBWF       _ir_value+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__getDistanceIR_GP2D120715
	MOVLW       153
	SUBWF       _ir_value+0, 0 
L__getDistanceIR_GP2D120715:
	BTFSC       STATUS+0, 0 
	GOTO        L_getDistanceIR_GP2D120403
L__getDistanceIR_GP2D120677:
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
L_getDistanceIR_GP2D120403:
;ir.h,39 :: 		else if( 317<=ir_value && ir_value<364 )
	MOVLW       1
	SUBWF       _ir_value+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__getDistanceIR_GP2D120716
	MOVLW       61
	SUBWF       _ir_value+0, 0 
L__getDistanceIR_GP2D120716:
	BTFSS       STATUS+0, 0 
	GOTO        L_getDistanceIR_GP2D120407
	MOVLW       1
	SUBWF       _ir_value+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__getDistanceIR_GP2D120717
	MOVLW       108
	SUBWF       _ir_value+0, 0 
L__getDistanceIR_GP2D120717:
	BTFSC       STATUS+0, 0 
	GOTO        L_getDistanceIR_GP2D120407
L__getDistanceIR_GP2D120676:
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
L_getDistanceIR_GP2D120407:
;ir.h,42 :: 		else if( 286<=ir_value && ir_value<317 )
	MOVLW       1
	SUBWF       _ir_value+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__getDistanceIR_GP2D120718
	MOVLW       30
	SUBWF       _ir_value+0, 0 
L__getDistanceIR_GP2D120718:
	BTFSS       STATUS+0, 0 
	GOTO        L_getDistanceIR_GP2D120411
	MOVLW       1
	SUBWF       _ir_value+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__getDistanceIR_GP2D120719
	MOVLW       61
	SUBWF       _ir_value+0, 0 
L__getDistanceIR_GP2D120719:
	BTFSC       STATUS+0, 0 
	GOTO        L_getDistanceIR_GP2D120411
L__getDistanceIR_GP2D120675:
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
L_getDistanceIR_GP2D120411:
;ir.h,45 :: 		else if( 256<=ir_value && ir_value<286 )
	MOVLW       1
	SUBWF       _ir_value+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__getDistanceIR_GP2D120720
	MOVLW       0
	SUBWF       _ir_value+0, 0 
L__getDistanceIR_GP2D120720:
	BTFSS       STATUS+0, 0 
	GOTO        L_getDistanceIR_GP2D120415
	MOVLW       1
	SUBWF       _ir_value+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__getDistanceIR_GP2D120721
	MOVLW       30
	SUBWF       _ir_value+0, 0 
L__getDistanceIR_GP2D120721:
	BTFSC       STATUS+0, 0 
	GOTO        L_getDistanceIR_GP2D120415
L__getDistanceIR_GP2D120674:
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
L_getDistanceIR_GP2D120415:
;ir.h,48 :: 		else if( 215<=ir_value && ir_value<256 )
	MOVLW       0
	SUBWF       _ir_value+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__getDistanceIR_GP2D120722
	MOVLW       215
	SUBWF       _ir_value+0, 0 
L__getDistanceIR_GP2D120722:
	BTFSS       STATUS+0, 0 
	GOTO        L_getDistanceIR_GP2D120419
	MOVLW       1
	SUBWF       _ir_value+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__getDistanceIR_GP2D120723
	MOVLW       0
	SUBWF       _ir_value+0, 0 
L__getDistanceIR_GP2D120723:
	BTFSC       STATUS+0, 0 
	GOTO        L_getDistanceIR_GP2D120419
L__getDistanceIR_GP2D120673:
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
L_getDistanceIR_GP2D120419:
;ir.h,51 :: 		else if( 186<=ir_value && ir_value<215 )
	MOVLW       0
	SUBWF       _ir_value+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__getDistanceIR_GP2D120724
	MOVLW       186
	SUBWF       _ir_value+0, 0 
L__getDistanceIR_GP2D120724:
	BTFSS       STATUS+0, 0 
	GOTO        L_getDistanceIR_GP2D120423
	MOVLW       0
	SUBWF       _ir_value+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__getDistanceIR_GP2D120725
	MOVLW       215
	SUBWF       _ir_value+0, 0 
L__getDistanceIR_GP2D120725:
	BTFSC       STATUS+0, 0 
	GOTO        L_getDistanceIR_GP2D120423
L__getDistanceIR_GP2D120672:
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
L_getDistanceIR_GP2D120423:
;ir.h,54 :: 		else if( 166<=ir_value && ir_value<186 )
	MOVLW       0
	SUBWF       _ir_value+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__getDistanceIR_GP2D120726
	MOVLW       166
	SUBWF       _ir_value+0, 0 
L__getDistanceIR_GP2D120726:
	BTFSS       STATUS+0, 0 
	GOTO        L_getDistanceIR_GP2D120427
	MOVLW       0
	SUBWF       _ir_value+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__getDistanceIR_GP2D120727
	MOVLW       186
	SUBWF       _ir_value+0, 0 
L__getDistanceIR_GP2D120727:
	BTFSC       STATUS+0, 0 
	GOTO        L_getDistanceIR_GP2D120427
L__getDistanceIR_GP2D120671:
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
L_getDistanceIR_GP2D120427:
;ir.h,57 :: 		else if( 147<=ir_value && ir_value<166 )
	MOVLW       0
	SUBWF       _ir_value+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__getDistanceIR_GP2D120728
	MOVLW       147
	SUBWF       _ir_value+0, 0 
L__getDistanceIR_GP2D120728:
	BTFSS       STATUS+0, 0 
	GOTO        L_getDistanceIR_GP2D120431
	MOVLW       0
	SUBWF       _ir_value+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__getDistanceIR_GP2D120729
	MOVLW       166
	SUBWF       _ir_value+0, 0 
L__getDistanceIR_GP2D120729:
	BTFSC       STATUS+0, 0 
	GOTO        L_getDistanceIR_GP2D120431
L__getDistanceIR_GP2D120670:
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
L_getDistanceIR_GP2D120431:
;ir.h,60 :: 		else if( 133<=ir_value && ir_value<147 )
	MOVLW       0
	SUBWF       _ir_value+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__getDistanceIR_GP2D120730
	MOVLW       133
	SUBWF       _ir_value+0, 0 
L__getDistanceIR_GP2D120730:
	BTFSS       STATUS+0, 0 
	GOTO        L_getDistanceIR_GP2D120435
	MOVLW       0
	SUBWF       _ir_value+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__getDistanceIR_GP2D120731
	MOVLW       147
	SUBWF       _ir_value+0, 0 
L__getDistanceIR_GP2D120731:
	BTFSC       STATUS+0, 0 
	GOTO        L_getDistanceIR_GP2D120435
L__getDistanceIR_GP2D120669:
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
L_getDistanceIR_GP2D120435:
;ir.h,63 :: 		else if( 106<=ir_value && ir_value<133 )
	MOVLW       0
	SUBWF       _ir_value+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__getDistanceIR_GP2D120732
	MOVLW       106
	SUBWF       _ir_value+0, 0 
L__getDistanceIR_GP2D120732:
	BTFSS       STATUS+0, 0 
	GOTO        L_getDistanceIR_GP2D120439
	MOVLW       0
	SUBWF       _ir_value+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__getDistanceIR_GP2D120733
	MOVLW       133
	SUBWF       _ir_value+0, 0 
L__getDistanceIR_GP2D120733:
	BTFSC       STATUS+0, 0 
	GOTO        L_getDistanceIR_GP2D120439
L__getDistanceIR_GP2D120668:
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
L_getDistanceIR_GP2D120439:
;ir.h,66 :: 		else if( 88<=ir_value && ir_value<106 )
	MOVLW       0
	SUBWF       _ir_value+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__getDistanceIR_GP2D120734
	MOVLW       88
	SUBWF       _ir_value+0, 0 
L__getDistanceIR_GP2D120734:
	BTFSS       STATUS+0, 0 
	GOTO        L_getDistanceIR_GP2D120443
	MOVLW       0
	SUBWF       _ir_value+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__getDistanceIR_GP2D120735
	MOVLW       106
	SUBWF       _ir_value+0, 0 
L__getDistanceIR_GP2D120735:
	BTFSC       STATUS+0, 0 
	GOTO        L_getDistanceIR_GP2D120443
L__getDistanceIR_GP2D120667:
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
L_getDistanceIR_GP2D120443:
;ir.h,69 :: 		else if( 78<=ir_value && ir_value<88 )
	MOVLW       0
	SUBWF       _ir_value+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__getDistanceIR_GP2D120736
	MOVLW       78
	SUBWF       _ir_value+0, 0 
L__getDistanceIR_GP2D120736:
	BTFSS       STATUS+0, 0 
	GOTO        L_getDistanceIR_GP2D120447
	MOVLW       0
	SUBWF       _ir_value+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__getDistanceIR_GP2D120737
	MOVLW       88
	SUBWF       _ir_value+0, 0 
L__getDistanceIR_GP2D120737:
	BTFSC       STATUS+0, 0 
	GOTO        L_getDistanceIR_GP2D120447
L__getDistanceIR_GP2D120666:
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
L_getDistanceIR_GP2D120447:
;ir.h,72 :: 		else if( 65<=ir_value && ir_value<78 )
	MOVLW       0
	SUBWF       _ir_value+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__getDistanceIR_GP2D120738
	MOVLW       65
	SUBWF       _ir_value+0, 0 
L__getDistanceIR_GP2D120738:
	BTFSS       STATUS+0, 0 
	GOTO        L_getDistanceIR_GP2D120451
	MOVLW       0
	SUBWF       _ir_value+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__getDistanceIR_GP2D120739
	MOVLW       78
	SUBWF       _ir_value+0, 0 
L__getDistanceIR_GP2D120739:
	BTFSC       STATUS+0, 0 
	GOTO        L_getDistanceIR_GP2D120451
L__getDistanceIR_GP2D120665:
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
L_getDistanceIR_GP2D120451:
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
L_getSonarDistance453:
	DECFSZ      R13, 1, 0
	BRA         L_getSonarDistance453
	NOP
;sonar.h,17 :: 		TRIG_MIDDLE = 1;
	BSF         PORTA+0, 5 
;sonar.h,18 :: 		delay_us(10);
	MOVLW       16
	MOVWF       R13, 0
L_getSonarDistance454:
	DECFSZ      R13, 1, 0
	BRA         L_getSonarDistance454
	NOP
;sonar.h,19 :: 		TRIG_MIDDLE = 0;
	BCF         PORTA+0, 5 
;sonar.h,21 :: 		while(ECHO_MIDDLE==0);
L_getSonarDistance455:
	BTFSC       PORTE+0, 0 
	GOTO        L_getSonarDistance456
	GOTO        L_getSonarDistance455
L_getSonarDistance456:
;sonar.h,22 :: 		_counter = 0;
	CLRF        __counter+0 
	CLRF        __counter+1 
;sonar.h,24 :: 		while(ECHO_MIDDLE==1){
L_getSonarDistance457:
	BTFSS       PORTE+0, 0 
	GOTO        L_getSonarDistance458
;sonar.h,25 :: 		_counter++;
	INFSNZ      __counter+0, 1 
	INCF        __counter+1, 1 
;sonar.h,26 :: 		}
	GOTO        L_getSonarDistance457
L_getSonarDistance458:
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
	GOTO        L_getDistanceSonar2459
;sonar.h,40 :: 		TRIG_MIDDLE = 0;
	BCF         PORTA+0, 5 
;sonar.h,41 :: 		delay_us(2);
	MOVLW       3
	MOVWF       R13, 0
L_getDistanceSonar2460:
	DECFSZ      R13, 1, 0
	BRA         L_getDistanceSonar2460
;sonar.h,42 :: 		TRIG_MIDDLE = 1;
	BSF         PORTA+0, 5 
;sonar.h,43 :: 		delay_us(5);
	MOVLW       8
	MOVWF       R13, 0
L_getDistanceSonar2461:
	DECFSZ      R13, 1, 0
	BRA         L_getDistanceSonar2461
;sonar.h,44 :: 		TRIG_MIDDLE =0;
	BCF         PORTA+0, 5 
;sonar.h,46 :: 		while(!ECHO_MIDDLE)
L_getDistanceSonar2462:
	BTFSC       PORTE+0, 0 
	GOTO        L_getDistanceSonar2463
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
	GOTO        L__getDistanceSonar2740
	MOVF        getDistanceSonar2_H_L0+0, 0 
	SUBLW       240
L__getDistanceSonar2740:
	BTFSC       STATUS+0, 0 
	GOTO        L_getDistanceSonar2464
;sonar.h,51 :: 		break;
	GOTO        L_getDistanceSonar2463
L_getDistanceSonar2464:
;sonar.h,52 :: 		}
	GOTO        L_getDistanceSonar2462
L_getDistanceSonar2463:
;sonar.h,53 :: 		TMR1H=0;
	CLRF        TMR1H+0 
;sonar.h,54 :: 		TMR1L=0;
	CLRF        TMR1L+0 
;sonar.h,55 :: 		T1CON.TMR1ON=1;
	BSF         T1CON+0, 0 
;sonar.h,56 :: 		while(ECHO_MIDDLE)
L_getDistanceSonar2465:
	BTFSS       PORTE+0, 0 
	GOTO        L_getDistanceSonar2466
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
	GOTO        L__getDistanceSonar2741
	MOVF        getDistanceSonar2_H_L0+0, 0 
	SUBLW       240
L__getDistanceSonar2741:
	BTFSC       STATUS+0, 0 
	GOTO        L_getDistanceSonar2467
;sonar.h,61 :: 		break;
	GOTO        L_getDistanceSonar2466
L_getDistanceSonar2467:
;sonar.h,62 :: 		}
	GOTO        L_getDistanceSonar2465
L_getDistanceSonar2466:
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
L_getDistanceSonar2459:
;sonar.h,69 :: 		else if(Sensor == 'R'){
	MOVF        FARG_getDistanceSonar2_Sensor+0, 0 
	XORLW       82
	BTFSS       STATUS+0, 2 
	GOTO        L_getDistanceSonar2469
;sonar.h,70 :: 		TRIG_RIGHT = 0;
	BCF         PORTA+0, 0 
;sonar.h,71 :: 		delay_us(2);
	MOVLW       3
	MOVWF       R13, 0
L_getDistanceSonar2470:
	DECFSZ      R13, 1, 0
	BRA         L_getDistanceSonar2470
;sonar.h,72 :: 		TRIG_RIGHT = 1;
	BSF         PORTA+0, 0 
;sonar.h,73 :: 		delay_us(5);
	MOVLW       8
	MOVWF       R13, 0
L_getDistanceSonar2471:
	DECFSZ      R13, 1, 0
	BRA         L_getDistanceSonar2471
;sonar.h,74 :: 		TRIG_RIGHT =0;
	BCF         PORTA+0, 0 
;sonar.h,76 :: 		while(!ECHO_RIGHT)
L_getDistanceSonar2472:
	BTFSC       PORTA+0, 1 
	GOTO        L_getDistanceSonar2473
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
	GOTO        L__getDistanceSonar2742
	MOVF        getDistanceSonar2_H_L0+0, 0 
	SUBLW       240
L__getDistanceSonar2742:
	BTFSC       STATUS+0, 0 
	GOTO        L_getDistanceSonar2474
;sonar.h,81 :: 		break;
	GOTO        L_getDistanceSonar2473
L_getDistanceSonar2474:
;sonar.h,82 :: 		}
	GOTO        L_getDistanceSonar2472
L_getDistanceSonar2473:
;sonar.h,83 :: 		TMR1H=0;
	CLRF        TMR1H+0 
;sonar.h,84 :: 		TMR1L=0;
	CLRF        TMR1L+0 
;sonar.h,85 :: 		T1CON.TMR1ON=1;
	BSF         T1CON+0, 0 
;sonar.h,86 :: 		while(ECHO_RIGHT)
L_getDistanceSonar2475:
	BTFSS       PORTA+0, 1 
	GOTO        L_getDistanceSonar2476
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
	GOTO        L__getDistanceSonar2743
	MOVF        getDistanceSonar2_H_L0+0, 0 
	SUBLW       240
L__getDistanceSonar2743:
	BTFSC       STATUS+0, 0 
	GOTO        L_getDistanceSonar2477
;sonar.h,91 :: 		break;
	GOTO        L_getDistanceSonar2476
L_getDistanceSonar2477:
;sonar.h,92 :: 		}
	GOTO        L_getDistanceSonar2475
L_getDistanceSonar2476:
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
L_getDistanceSonar2469:
;sonar.h,99 :: 		else if(Sensor == 'L'){
	MOVF        FARG_getDistanceSonar2_Sensor+0, 0 
	XORLW       76
	BTFSS       STATUS+0, 2 
	GOTO        L_getDistanceSonar2479
;sonar.h,100 :: 		TRIG_LEFT = 0;
	BCF         PORTA+0, 2 
;sonar.h,101 :: 		delay_us(2);
	MOVLW       3
	MOVWF       R13, 0
L_getDistanceSonar2480:
	DECFSZ      R13, 1, 0
	BRA         L_getDistanceSonar2480
;sonar.h,102 :: 		TRIG_LEFT = 1;
	BSF         PORTA+0, 2 
;sonar.h,103 :: 		delay_us(5);
	MOVLW       8
	MOVWF       R13, 0
L_getDistanceSonar2481:
	DECFSZ      R13, 1, 0
	BRA         L_getDistanceSonar2481
;sonar.h,104 :: 		TRIG_LEFT =0;
	BCF         PORTA+0, 2 
;sonar.h,106 :: 		while(!ECHO_LEFT)
L_getDistanceSonar2482:
	BTFSC       PORTA+0, 3 
	GOTO        L_getDistanceSonar2483
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
	GOTO        L__getDistanceSonar2744
	MOVF        getDistanceSonar2_H_L0+0, 0 
	SUBLW       240
L__getDistanceSonar2744:
	BTFSC       STATUS+0, 0 
	GOTO        L_getDistanceSonar2484
;sonar.h,111 :: 		break;
	GOTO        L_getDistanceSonar2483
L_getDistanceSonar2484:
;sonar.h,112 :: 		}
	GOTO        L_getDistanceSonar2482
L_getDistanceSonar2483:
;sonar.h,113 :: 		TMR1H=0;
	CLRF        TMR1H+0 
;sonar.h,114 :: 		TMR1L=0;
	CLRF        TMR1L+0 
;sonar.h,115 :: 		T1CON.TMR1ON=1;
	BSF         T1CON+0, 0 
;sonar.h,116 :: 		while(ECHO_LEFT)
L_getDistanceSonar2485:
	BTFSS       PORTA+0, 3 
	GOTO        L_getDistanceSonar2486
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
	GOTO        L__getDistanceSonar2745
	MOVF        getDistanceSonar2_H_L0+0, 0 
	SUBLW       240
L__getDistanceSonar2745:
	BTFSC       STATUS+0, 0 
	GOTO        L_getDistanceSonar2487
;sonar.h,121 :: 		break;
	GOTO        L_getDistanceSonar2486
L_getDistanceSonar2487:
;sonar.h,122 :: 		}
	GOTO        L_getDistanceSonar2485
L_getDistanceSonar2486:
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
L_getDistanceSonar2479:
;sonar.h,129 :: 		}
	RETURN      0
; end of _getDistanceSonar2

_level3Aligning:

;Main 6.0V.c,25 :: 		void level3Aligning(){
;Main 6.0V.c,26 :: 		while(Sensor4 == 0 || Sensor5 == 0 || Sensor6 == 0)
L_level3Aligning488:
	BTFSS       PORTD+0, 5 
	GOTO        L__level3Aligning683
	BTFSS       PORTD+0, 6 
	GOTO        L__level3Aligning683
	BTFSS       PORTD+0, 7 
	GOTO        L__level3Aligning683
	GOTO        L_level3Aligning489
L__level3Aligning683:
;Main 6.0V.c,27 :: 		reverse(220,220);
	MOVLW       220
	MOVWF       FARG_reverse_pwmLeft+0 
	MOVLW       0
	MOVWF       FARG_reverse_pwmLeft+1 
	MOVLW       220
	MOVWF       FARG_reverse_pwmRight+0 
	MOVLW       0
	MOVWF       FARG_reverse_pwmRight+1 
	CALL        _reverse+0, 0
	GOTO        L_level3Aligning488
L_level3Aligning489:
;Main 6.0V.c,28 :: 		delay_ms(1);
	MOVLW       7
	MOVWF       R12, 0
	MOVLW       125
	MOVWF       R13, 0
L_level3Aligning492:
	DECFSZ      R13, 1, 0
	BRA         L_level3Aligning492
	DECFSZ      R12, 1, 0
	BRA         L_level3Aligning492
;Main 6.0V.c,29 :: 		stop();
	CALL        _stop+0, 0
;Main 6.0V.c,30 :: 		sendText("Sensor5 at LEVEL 2 ");
	MOVLW       ?lstr32_Main_326.0V+0
	MOVWF       FARG_sendText_aText+0 
	MOVLW       hi_addr(?lstr32_Main_326.0V+0)
	MOVWF       FARG_sendText_aText+1 
	CALL        _sendText+0, 0
;Main 6.0V.c,31 :: 		delay_ms(500);
	MOVLW       13
	MOVWF       R11, 0
	MOVLW       175
	MOVWF       R12, 0
	MOVLW       182
	MOVWF       R13, 0
L_level3Aligning493:
	DECFSZ      R13, 1, 0
	BRA         L_level3Aligning493
	DECFSZ      R12, 1, 0
	BRA         L_level3Aligning493
	DECFSZ      R11, 1, 0
	BRA         L_level3Aligning493
	NOP
;Main 6.0V.c,32 :: 		while(Sensor1==0 || Sensor2==0 || Sensor3==0 || Sensor4==0 || Sensor5==0 || Sensor6==0 || Sensor7==0 || Sensor8==0 || Sensor9==0){
L_level3Aligning494:
	BTFSS       PORTB+0, 4 
	GOTO        L__level3Aligning682
	BTFSS       PORTB+0, 3 
	GOTO        L__level3Aligning682
	BTFSS       PORTD+0, 4 
	GOTO        L__level3Aligning682
	BTFSS       PORTD+0, 5 
	GOTO        L__level3Aligning682
	BTFSS       PORTD+0, 6 
	GOTO        L__level3Aligning682
	BTFSS       PORTD+0, 7 
	GOTO        L__level3Aligning682
	BTFSS       PORTB+0, 2 
	GOTO        L__level3Aligning682
	BTFSS       PORTB+0, 6 
	GOTO        L__level3Aligning682
	BTFSS       PORTB+0, 7 
	GOTO        L__level3Aligning682
	GOTO        L_level3Aligning495
L__level3Aligning682:
;Main 6.0V.c,33 :: 		if(Sensor9 == 1)
	BTFSS       PORTB+0, 7 
	GOTO        L_level3Aligning498
;Main 6.0V.c,34 :: 		rotateAntiClockwise(220);
	MOVLW       220
	MOVWF       FARG_rotateAntiClockwise_pwm+0 
	MOVLW       0
	MOVWF       FARG_rotateAntiClockwise_pwm+1 
	CALL        _rotateAntiClockwise+0, 0
	GOTO        L_level3Aligning499
L_level3Aligning498:
;Main 6.0V.c,36 :: 		else if(Sensor1 == 1)
	BTFSS       PORTB+0, 4 
	GOTO        L_level3Aligning500
;Main 6.0V.c,37 :: 		rotateClockwise(220);
	MOVLW       220
	MOVWF       FARG_rotateClockwise_pwm+0 
	MOVLW       0
	MOVWF       FARG_rotateClockwise_pwm+1 
	CALL        _rotateClockwise+0, 0
L_level3Aligning500:
L_level3Aligning499:
;Main 6.0V.c,39 :: 		}
	GOTO        L_level3Aligning494
L_level3Aligning495:
;Main 6.0V.c,40 :: 		stop();
	CALL        _stop+0, 0
;Main 6.0V.c,41 :: 		}
	RETURN      0
; end of _level3Aligning

_level2Aligning:

;Main 6.0V.c,43 :: 		void level2Aligning(){
;Main 6.0V.c,44 :: 		while((Sensor1 == 0 || Sensor2 == 0 || Sensor3 == 0 || Sensor4 == 0 || Sensor5 == 0 || Sensor6 == 0) && (Sensor4 == 0 || Sensor5 == 0 || Sensor6 == 0 || Sensor7 == 0 || Sensor8 == 0 || Sensor9 == 0))
L_level2Aligning501:
	BTFSS       PORTB+0, 4 
	GOTO        L__level2Aligning687
	BTFSS       PORTB+0, 3 
	GOTO        L__level2Aligning687
	BTFSS       PORTD+0, 4 
	GOTO        L__level2Aligning687
	BTFSS       PORTD+0, 5 
	GOTO        L__level2Aligning687
	BTFSS       PORTD+0, 6 
	GOTO        L__level2Aligning687
	BTFSS       PORTD+0, 7 
	GOTO        L__level2Aligning687
	GOTO        L_level2Aligning502
L__level2Aligning687:
	BTFSS       PORTD+0, 5 
	GOTO        L__level2Aligning686
	BTFSS       PORTD+0, 6 
	GOTO        L__level2Aligning686
	BTFSS       PORTD+0, 7 
	GOTO        L__level2Aligning686
	BTFSS       PORTB+0, 2 
	GOTO        L__level2Aligning686
	BTFSS       PORTB+0, 6 
	GOTO        L__level2Aligning686
	BTFSS       PORTB+0, 7 
	GOTO        L__level2Aligning686
	GOTO        L_level2Aligning502
L__level2Aligning686:
L__level2Aligning685:
;Main 6.0V.c,45 :: 		moveForward(220,220);
	MOVLW       220
	MOVWF       FARG_moveForward_pwmLeft+0 
	MOVLW       0
	MOVWF       FARG_moveForward_pwmLeft+1 
	MOVLW       220
	MOVWF       FARG_moveForward_pwmRight+0 
	MOVLW       0
	MOVWF       FARG_moveForward_pwmRight+1 
	CALL        _moveForward+0, 0
	GOTO        L_level2Aligning501
L_level2Aligning502:
;Main 6.0V.c,46 :: 		delay_ms(1);
	MOVLW       7
	MOVWF       R12, 0
	MOVLW       125
	MOVWF       R13, 0
L_level2Aligning509:
	DECFSZ      R13, 1, 0
	BRA         L_level2Aligning509
	DECFSZ      R12, 1, 0
	BRA         L_level2Aligning509
;Main 6.0V.c,47 :: 		stop();
	CALL        _stop+0, 0
;Main 6.0V.c,48 :: 		sendText("Sensor5 at LEVEL 2 ");
	MOVLW       ?lstr33_Main_326.0V+0
	MOVWF       FARG_sendText_aText+0 
	MOVLW       hi_addr(?lstr33_Main_326.0V+0)
	MOVWF       FARG_sendText_aText+1 
	CALL        _sendText+0, 0
;Main 6.0V.c,49 :: 		delay_ms(500);
	MOVLW       13
	MOVWF       R11, 0
	MOVLW       175
	MOVWF       R12, 0
	MOVLW       182
	MOVWF       R13, 0
L_level2Aligning510:
	DECFSZ      R13, 1, 0
	BRA         L_level2Aligning510
	DECFSZ      R12, 1, 0
	BRA         L_level2Aligning510
	DECFSZ      R11, 1, 0
	BRA         L_level2Aligning510
	NOP
;Main 6.0V.c,50 :: 		while(Sensor1==0 || Sensor2==0 || Sensor3==0 || Sensor4==0 || Sensor5==0 || Sensor6==0 || Sensor7==0 || Sensor8==0 || Sensor9==0){
L_level2Aligning511:
	BTFSS       PORTB+0, 4 
	GOTO        L__level2Aligning684
	BTFSS       PORTB+0, 3 
	GOTO        L__level2Aligning684
	BTFSS       PORTD+0, 4 
	GOTO        L__level2Aligning684
	BTFSS       PORTD+0, 5 
	GOTO        L__level2Aligning684
	BTFSS       PORTD+0, 6 
	GOTO        L__level2Aligning684
	BTFSS       PORTD+0, 7 
	GOTO        L__level2Aligning684
	BTFSS       PORTB+0, 2 
	GOTO        L__level2Aligning684
	BTFSS       PORTB+0, 6 
	GOTO        L__level2Aligning684
	BTFSS       PORTB+0, 7 
	GOTO        L__level2Aligning684
	GOTO        L_level2Aligning512
L__level2Aligning684:
;Main 6.0V.c,51 :: 		if(Sensor9 == 1)
	BTFSS       PORTB+0, 7 
	GOTO        L_level2Aligning515
;Main 6.0V.c,52 :: 		rotateClockwise(220);
	MOVLW       220
	MOVWF       FARG_rotateClockwise_pwm+0 
	MOVLW       0
	MOVWF       FARG_rotateClockwise_pwm+1 
	CALL        _rotateClockwise+0, 0
	GOTO        L_level2Aligning516
L_level2Aligning515:
;Main 6.0V.c,54 :: 		else if(Sensor1 == 1)
	BTFSS       PORTB+0, 4 
	GOTO        L_level2Aligning517
;Main 6.0V.c,55 :: 		rotateAntiClockwise(220);
	MOVLW       220
	MOVWF       FARG_rotateAntiClockwise_pwm+0 
	MOVLW       0
	MOVWF       FARG_rotateAntiClockwise_pwm+1 
	CALL        _rotateAntiClockwise+0, 0
L_level2Aligning517:
L_level2Aligning516:
;Main 6.0V.c,57 :: 		}
	GOTO        L_level2Aligning511
L_level2Aligning512:
;Main 6.0V.c,58 :: 		stop();
	CALL        _stop+0, 0
;Main 6.0V.c,59 :: 		}
	RETURN      0
; end of _level2Aligning

_main:

;Main 6.0V.c,61 :: 		void main() {
;Main 6.0V.c,62 :: 		configure();
	CALL        _configure+0, 0
;Main 6.0V.c,63 :: 		setPID();
	CALL        _setPID+0, 0
;Main 6.0V.c,64 :: 		sendText("Starting...");
	MOVLW       ?lstr34_Main_326.0V+0
	MOVWF       FARG_sendText_aText+0 
	MOVLW       hi_addr(?lstr34_Main_326.0V+0)
	MOVWF       FARG_sendText_aText+1 
	CALL        _sendText+0, 0
;Main 6.0V.c,76 :: 		LEVEL1_STATE = NOT_REACHED;
	CLRF        _LEVEL1_STATE+0 
	CLRF        _LEVEL1_STATE+1 
;Main 6.0V.c,77 :: 		sendText("Starting Block  ");
	MOVLW       ?lstr35_Main_326.0V+0
	MOVWF       FARG_sendText_aText+0 
	MOVLW       hi_addr(?lstr35_Main_326.0V+0)
	MOVWF       FARG_sendText_aText+1 
	CALL        _sendText+0, 0
;Main 6.0V.c,78 :: 		LEVEL = 0;
	CLRF        _LEVEL+0 
	CLRF        _LEVEL+1 
;Main 6.0V.c,80 :: 		while(isAllWhite())
L_main518:
	CALL        _isAllWhite+0, 0
	MOVF        R0, 0 
	IORWF       R1, 0 
	BTFSC       STATUS+0, 2 
	GOTO        L_main519
;Main 6.0V.c,81 :: 		moveStraightSlow();
	CALL        _moveStraightSlow+0, 0
	GOTO        L_main518
L_main519:
;Main 6.0V.c,82 :: 		delay_ms(10);
	MOVLW       65
	MOVWF       R12, 0
	MOVLW       238
	MOVWF       R13, 0
L_main520:
	DECFSZ      R13, 1, 0
	BRA         L_main520
	DECFSZ      R12, 1, 0
	BRA         L_main520
	NOP
;Main 6.0V.c,83 :: 		LEVEL = 1;
	MOVLW       1
	MOVWF       _LEVEL+0 
	MOVLW       0
	MOVWF       _LEVEL+1 
;Main 6.0V.c,84 :: 		sendText("Level 1 Starting  ");
	MOVLW       ?lstr36_Main_326.0V+0
	MOVWF       FARG_sendText_aText+0 
	MOVLW       hi_addr(?lstr36_Main_326.0V+0)
	MOVWF       FARG_sendText_aText+1 
	CALL        _sendText+0, 0
;Main 6.0V.c,85 :: 		LEVEL1_STATE = REACHED;
	MOVLW       1
	MOVWF       _LEVEL1_STATE+0 
	MOVLW       0
	MOVWF       _LEVEL1_STATE+1 
;Main 6.0V.c,86 :: 		stop();
	CALL        _stop+0, 0
;Main 6.0V.c,90 :: 		moveForward(205,200);
	MOVLW       205
	MOVWF       FARG_moveForward_pwmLeft+0 
	MOVLW       0
	MOVWF       FARG_moveForward_pwmLeft+1 
	MOVLW       200
	MOVWF       FARG_moveForward_pwmRight+0 
	MOVLW       0
	MOVWF       FARG_moveForward_pwmRight+1 
	CALL        _moveForward+0, 0
;Main 6.0V.c,91 :: 		delay_ms(100);
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       138
	MOVWF       R12, 0
	MOVLW       85
	MOVWF       R13, 0
L_main521:
	DECFSZ      R13, 1, 0
	BRA         L_main521
	DECFSZ      R12, 1, 0
	BRA         L_main521
	DECFSZ      R11, 1, 0
	BRA         L_main521
	NOP
	NOP
;Main 6.0V.c,92 :: 		while(!isAllBlack()){
L_main522:
	CALL        _isAllBlack+0, 0
	MOVF        R0, 0 
	IORWF       R1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_main523
;Main 6.0V.c,94 :: 		if( Scout==1 &&(Sensor3==1 || Sensor4==1 || Sensor5==1 || Sensor6==1 || Sensor7==1) && Sensor1==0 && Sensor2==0 && Sensor8==0 && Sensor9==0)
	BTFSS       PORTB+0, 5 
	GOTO        L_main528
	BTFSC       PORTD+0, 4 
	GOTO        L__main690
	BTFSC       PORTD+0, 5 
	GOTO        L__main690
	BTFSC       PORTD+0, 6 
	GOTO        L__main690
	BTFSC       PORTD+0, 7 
	GOTO        L__main690
	BTFSC       PORTB+0, 2 
	GOTO        L__main690
	GOTO        L_main528
L__main690:
	BTFSC       PORTB+0, 4 
	GOTO        L_main528
	BTFSC       PORTB+0, 3 
	GOTO        L_main528
	BTFSC       PORTB+0, 6 
	GOTO        L_main528
	BTFSC       PORTB+0, 7 
	GOTO        L_main528
L__main689:
;Main 6.0V.c,95 :: 		lineFollowPID();
	CALL        _lineFollowPID+0, 0
	GOTO        L_main529
L_main528:
;Main 6.0V.c,97 :: 		lineFollowNormalWorked();
	CALL        _lineFollowNormalWorked+0, 0
L_main529:
;Main 6.0V.c,98 :: 		}
	GOTO        L_main522
L_main523:
;Main 6.0V.c,99 :: 		stop();
	CALL        _stop+0, 0
;Main 6.0V.c,100 :: 		sendText("  End of Level 1. Level 2 Starting  ");
	MOVLW       ?lstr37_Main_326.0V+0
	MOVWF       FARG_sendText_aText+0 
	MOVLW       hi_addr(?lstr37_Main_326.0V+0)
	MOVWF       FARG_sendText_aText+1 
	CALL        _sendText+0, 0
;Main 6.0V.c,101 :: 		LEVEL1_STATE = COMPLETED;
	MOVLW       2
	MOVWF       _LEVEL1_STATE+0 
	MOVLW       0
	MOVWF       _LEVEL1_STATE+1 
;Main 6.0V.c,102 :: 		LEVEL2_STATE = REACHED;
	MOVLW       1
	MOVWF       _LEVEL2_STATE+0 
	MOVLW       0
	MOVWF       _LEVEL2_STATE+1 
;Main 6.0V.c,103 :: 		LEVEL = 2;
	MOVLW       2
	MOVWF       _LEVEL+0 
	MOVLW       0
	MOVWF       _LEVEL+1 
;Main 6.0V.c,107 :: 		while(!isAllWhite() && LEVEL2_STATE != COMPLETED){
L_main530:
	CALL        _isAllWhite+0, 0
	MOVF        R0, 0 
	IORWF       R1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_main531
	MOVLW       0
	XORWF       _LEVEL2_STATE+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main746
	MOVLW       2
	XORWF       _LEVEL2_STATE+0, 0 
L__main746:
	BTFSC       STATUS+0, 2 
	GOTO        L_main531
L__main688:
;Main 6.0V.c,108 :: 		goThroughObstaclesJay();
	CALL        _goThroughObstaclesJay+0, 0
;Main 6.0V.c,109 :: 		}
	GOTO        L_main530
L_main531:
;Main 6.0V.c,111 :: 		stop();
	CALL        _stop+0, 0
;Main 6.0V.c,112 :: 		sendText("  End of Level 2. Level 3 Starting  ");
	MOVLW       ?lstr38_Main_326.0V+0
	MOVWF       FARG_sendText_aText+0 
	MOVLW       hi_addr(?lstr38_Main_326.0V+0)
	MOVWF       FARG_sendText_aText+1 
	CALL        _sendText+0, 0
;Main 6.0V.c,113 :: 		LEVEL2_STATE = COMPLETED;
	MOVLW       2
	MOVWF       _LEVEL2_STATE+0 
	MOVLW       0
	MOVWF       _LEVEL2_STATE+1 
;Main 6.0V.c,114 :: 		LEVEL3_STATE = REACHED;
	MOVLW       1
	MOVWF       _LEVEL3_STATE+0 
	MOVLW       0
	MOVWF       _LEVEL3_STATE+1 
;Main 6.0V.c,115 :: 		LEVEL = 3;
	MOVLW       3
	MOVWF       _LEVEL+0 
	MOVLW       0
	MOVWF       _LEVEL+1 
;Main 6.0V.c,119 :: 		level3Aligning();
	CALL        _level3Aligning+0, 0
;Main 6.0V.c,126 :: 		while(!isAllBlack()){
L_main534:
	CALL        _isAllBlack+0, 0
	MOVF        R0, 0 
	IORWF       R1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_main535
;Main 6.0V.c,127 :: 		stop();
	CALL        _stop+0, 0
;Main 6.0V.c,128 :: 		}
	GOTO        L_main534
L_main535:
;Main 6.0V.c,131 :: 		}
	GOTO        $+0
; end of _main

_isRightSafe:

;Main 6.0V.c,133 :: 		int isRightSafe(){
;Main 6.0V.c,134 :: 		ir_value = ADC_Read(IRSensorRight);
	MOVLW       0
	BTFSC       PORTA+0, 1 
	MOVLW       1
	MOVWF       FARG_ADC_Read_channel+0 
	CALL        _ADC_Read+0, 0
	MOVF        R0, 0 
	MOVWF       _ir_value+0 
	MOVF        R1, 0 
	MOVWF       _ir_value+1 
;Main 6.0V.c,135 :: 		if(250<=ir_value && ir_value<800){                         // ~5cm
	MOVLW       0
	SUBWF       R1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__isRightSafe747
	MOVLW       250
	SUBWF       R0, 0 
L__isRightSafe747:
	BTFSS       STATUS+0, 0 
	GOTO        L_isRightSafe538
	MOVLW       3
	SUBWF       _ir_value+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__isRightSafe748
	MOVLW       32
	SUBWF       _ir_value+0, 0 
L__isRightSafe748:
	BTFSC       STATUS+0, 0 
	GOTO        L_isRightSafe538
L__isRightSafe691:
;Main 6.0V.c,136 :: 		return FALSE;
	CLRF        R0 
	CLRF        R1 
	RETURN      0
;Main 6.0V.c,137 :: 		}
L_isRightSafe538:
;Main 6.0V.c,138 :: 		return TRUE;
	MOVLW       1
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
;Main 6.0V.c,139 :: 		}
	RETURN      0
; end of _isRightSafe

_isMiddleSafe:

;Main 6.0V.c,141 :: 		int isMiddleSafe(){
;Main 6.0V.c,142 :: 		ir_value = ADC_Read(IRSensorCenter);
	MOVLW       0
	BTFSC       PORTA+0, 0 
	MOVLW       1
	MOVWF       FARG_ADC_Read_channel+0 
	CALL        _ADC_Read+0, 0
	MOVF        R0, 0 
	MOVWF       _ir_value+0 
	MOVF        R1, 0 
	MOVWF       _ir_value+1 
;Main 6.0V.c,143 :: 		if(250<=ir_value && ir_value<800){                         // ~5cm
	MOVLW       0
	SUBWF       R1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__isMiddleSafe749
	MOVLW       250
	SUBWF       R0, 0 
L__isMiddleSafe749:
	BTFSS       STATUS+0, 0 
	GOTO        L_isMiddleSafe541
	MOVLW       3
	SUBWF       _ir_value+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__isMiddleSafe750
	MOVLW       32
	SUBWF       _ir_value+0, 0 
L__isMiddleSafe750:
	BTFSC       STATUS+0, 0 
	GOTO        L_isMiddleSafe541
L__isMiddleSafe692:
;Main 6.0V.c,144 :: 		return FALSE;
	CLRF        R0 
	CLRF        R1 
	RETURN      0
;Main 6.0V.c,145 :: 		}
L_isMiddleSafe541:
;Main 6.0V.c,146 :: 		return TRUE;
	MOVLW       1
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
;Main 6.0V.c,147 :: 		}
	RETURN      0
; end of _isMiddleSafe

_isLeftSafe:

;Main 6.0V.c,149 :: 		int isLeftSafe(){
;Main 6.0V.c,150 :: 		ir_value = ADC_Read(IRSensorLeft);
	MOVLW       0
	BTFSC       PORTA+0, 2 
	MOVLW       1
	MOVWF       FARG_ADC_Read_channel+0 
	CALL        _ADC_Read+0, 0
	MOVF        R0, 0 
	MOVWF       _ir_value+0 
	MOVF        R1, 0 
	MOVWF       _ir_value+1 
;Main 6.0V.c,151 :: 		if(250<=ir_value && ir_value<800){                         // ~5cm
	MOVLW       0
	SUBWF       R1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__isLeftSafe751
	MOVLW       250
	SUBWF       R0, 0 
L__isLeftSafe751:
	BTFSS       STATUS+0, 0 
	GOTO        L_isLeftSafe544
	MOVLW       3
	SUBWF       _ir_value+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__isLeftSafe752
	MOVLW       32
	SUBWF       _ir_value+0, 0 
L__isLeftSafe752:
	BTFSC       STATUS+0, 0 
	GOTO        L_isLeftSafe544
L__isLeftSafe693:
;Main 6.0V.c,152 :: 		return FALSE;
	CLRF        R0 
	CLRF        R1 
	RETURN      0
;Main 6.0V.c,153 :: 		}
L_isLeftSafe544:
;Main 6.0V.c,154 :: 		return TRUE;
	MOVLW       1
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
;Main 6.0V.c,155 :: 		}
	RETURN      0
; end of _isLeftSafe

_moveStraightSlow:

;Main 6.0V.c,157 :: 		void moveStraightSlow(){
;Main 6.0V.c,158 :: 		moveForward(205,200);
	MOVLW       205
	MOVWF       FARG_moveForward_pwmLeft+0 
	MOVLW       0
	MOVWF       FARG_moveForward_pwmLeft+1 
	MOVLW       200
	MOVWF       FARG_moveForward_pwmRight+0 
	MOVLW       0
	MOVWF       FARG_moveForward_pwmRight+1 
	CALL        _moveForward+0, 0
;Main 6.0V.c,159 :: 		}
	RETURN      0
; end of _moveStraightSlow

_moveStraightFast:

;Main 6.0V.c,161 :: 		void moveStraightFast(){
;Main 6.0V.c,162 :: 		moveForward(255,250);
	MOVLW       255
	MOVWF       FARG_moveForward_pwmLeft+0 
	MOVLW       0
	MOVWF       FARG_moveForward_pwmLeft+1 
	MOVLW       250
	MOVWF       FARG_moveForward_pwmRight+0 
	MOVLW       0
	MOVWF       FARG_moveForward_pwmRight+1 
	CALL        _moveForward+0, 0
;Main 6.0V.c,163 :: 		}
	RETURN      0
; end of _moveStraightFast

_goThroughObstaclesWorking:

;Main 6.0V.c,165 :: 		void goThroughObstaclesWorking(){
;Main 6.0V.c,166 :: 		ROTATION_ANGLE = 0;
	CLRF        _ROTATION_ANGLE+0 
	CLRF        _ROTATION_ANGLE+1 
;Main 6.0V.c,167 :: 		if(isPathClear() == 0) {    // if not clear
	CALL        _isPathClear+0, 0
	MOVLW       0
	XORWF       R1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__goThroughObstaclesWorking753
	MOVLW       0
	XORWF       R0, 0 
L__goThroughObstaclesWorking753:
	BTFSS       STATUS+0, 2 
	GOTO        L_goThroughObstaclesWorking545
;Main 6.0V.c,169 :: 		for(counter = 1; counter <= 6; counter++) {
	MOVLW       1
	MOVWF       _counter+0 
	MOVLW       0
	MOVWF       _counter+1 
L_goThroughObstaclesWorking546:
	MOVLW       128
	MOVWF       R0 
	MOVLW       128
	XORWF       _counter+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__goThroughObstaclesWorking754
	MOVF        _counter+0, 0 
	SUBLW       6
L__goThroughObstaclesWorking754:
	BTFSS       STATUS+0, 0 
	GOTO        L_goThroughObstaclesWorking547
;Main 6.0V.c,171 :: 		if(counter % 2 == 0) {
	MOVLW       2
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVF        _counter+0, 0 
	MOVWF       R0 
	MOVF        _counter+1, 0 
	MOVWF       R1 
	CALL        _Div_16x16_S+0, 0
	MOVF        R8, 0 
	MOVWF       R0 
	MOVF        R9, 0 
	MOVWF       R1 
	MOVLW       0
	XORWF       R1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__goThroughObstaclesWorking755
	MOVLW       0
	XORWF       R0, 0 
L__goThroughObstaclesWorking755:
	BTFSS       STATUS+0, 2 
	GOTO        L_goThroughObstaclesWorking549
;Main 6.0V.c,172 :: 		odd = -1;
	MOVLW       255
	MOVWF       _odd+0 
	MOVLW       255
	MOVWF       _odd+1 
;Main 6.0V.c,173 :: 		} else {
	GOTO        L_goThroughObstaclesWorking550
L_goThroughObstaclesWorking549:
;Main 6.0V.c,174 :: 		odd = 1;
	MOVLW       1
	MOVWF       _odd+0 
	MOVLW       0
	MOVWF       _odd+1 
;Main 6.0V.c,175 :: 		}
L_goThroughObstaclesWorking550:
;Main 6.0V.c,177 :: 		degree = odd * counter * 30;
	MOVF        _odd+0, 0 
	MOVWF       R0 
	MOVF        _odd+1, 0 
	MOVWF       R1 
	MOVF        _counter+0, 0 
	MOVWF       R4 
	MOVF        _counter+1, 0 
	MOVWF       R5 
	CALL        _Mul_16x16_U+0, 0
	MOVLW       30
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	CALL        _Mul_16x16_U+0, 0
	MOVF        R0, 0 
	MOVWF       _degree+0 
	MOVF        R1, 0 
	MOVWF       _degree+1 
;Main 6.0V.c,178 :: 		rotateByDegree(degree);
	MOVF        R0, 0 
	MOVWF       FARG_rotateByDegree_degree+0 
	MOVF        R1, 0 
	MOVWF       FARG_rotateByDegree_degree+1 
	CALL        _rotateByDegree+0, 0
;Main 6.0V.c,179 :: 		ROTATION_ANGLE += degree;
	MOVF        _degree+0, 0 
	ADDWF       _ROTATION_ANGLE+0, 1 
	MOVF        _degree+1, 0 
	ADDWFC      _ROTATION_ANGLE+1, 1 
;Main 6.0V.c,180 :: 		if(isPathClear() == 0) {
	CALL        _isPathClear+0, 0
	MOVLW       0
	XORWF       R1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__goThroughObstaclesWorking756
	MOVLW       0
	XORWF       R0, 0 
L__goThroughObstaclesWorking756:
	BTFSS       STATUS+0, 2 
	GOTO        L_goThroughObstaclesWorking551
;Main 6.0V.c,181 :: 		continue;
	GOTO        L_goThroughObstaclesWorking548
;Main 6.0V.c,182 :: 		} else {
L_goThroughObstaclesWorking551:
;Main 6.0V.c,183 :: 		break;
	GOTO        L_goThroughObstaclesWorking547
;Main 6.0V.c,186 :: 		}
L_goThroughObstaclesWorking548:
;Main 6.0V.c,169 :: 		for(counter = 1; counter <= 6; counter++) {
	INFSNZ      _counter+0, 1 
	INCF        _counter+1, 1 
;Main 6.0V.c,186 :: 		}
	GOTO        L_goThroughObstaclesWorking546
L_goThroughObstaclesWorking547:
;Main 6.0V.c,187 :: 		}
L_goThroughObstaclesWorking545:
;Main 6.0V.c,188 :: 		DIRECTION += ROTATION_ANGLE;
	MOVF        _ROTATION_ANGLE+0, 0 
	ADDWF       _DIRECTION+0, 1 
	MOVF        _ROTATION_ANGLE+1, 0 
	ADDWFC      _DIRECTION+1, 1 
;Main 6.0V.c,189 :: 		moveStraightSlow();
	CALL        _moveStraightSlow+0, 0
;Main 6.0V.c,190 :: 		delay_ms(10);
	MOVLW       65
	MOVWF       R12, 0
	MOVLW       238
	MOVWF       R13, 0
L_goThroughObstaclesWorking553:
	DECFSZ      R13, 1, 0
	BRA         L_goThroughObstaclesWorking553
	DECFSZ      R12, 1, 0
	BRA         L_goThroughObstaclesWorking553
	NOP
;Main 6.0V.c,193 :: 		if(isAllWhite()) {
	CALL        _isAllWhite+0, 0
	MOVF        R0, 0 
	IORWF       R1, 0 
	BTFSC       STATUS+0, 2 
	GOTO        L_goThroughObstaclesWorking554
;Main 6.0V.c,195 :: 		if(abs(DIRECTION) >= 90) {
	MOVF        _DIRECTION+0, 0 
	MOVWF       FARG_abs_a+0 
	MOVF        _DIRECTION+1, 0 
	MOVWF       FARG_abs_a+1 
	CALL        _abs+0, 0
	MOVLW       128
	XORWF       R1, 0 
	MOVWF       R2 
	MOVLW       128
	SUBWF       R2, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__goThroughObstaclesWorking757
	MOVLW       90
	SUBWF       R0, 0 
L__goThroughObstaclesWorking757:
	BTFSS       STATUS+0, 0 
	GOTO        L_goThroughObstaclesWorking555
;Main 6.0V.c,196 :: 		sendText("Wrong Direction !!!");
	MOVLW       ?lstr39_Main_326.0V+0
	MOVWF       FARG_sendText_aText+0 
	MOVLW       hi_addr(?lstr39_Main_326.0V+0)
	MOVWF       FARG_sendText_aText+1 
	CALL        _sendText+0, 0
;Main 6.0V.c,197 :: 		rotateByDegree(90);
	MOVLW       90
	MOVWF       FARG_rotateByDegree_degree+0 
	MOVLW       0
	MOVWF       FARG_rotateByDegree_degree+1 
	CALL        _rotateByDegree+0, 0
;Main 6.0V.c,198 :: 		rotateByDegree(90);
	MOVLW       90
	MOVWF       FARG_rotateByDegree_degree+0 
	MOVLW       0
	MOVWF       FARG_rotateByDegree_degree+1 
	CALL        _rotateByDegree+0, 0
;Main 6.0V.c,199 :: 		DIRECTION = 0;
	CLRF        _DIRECTION+0 
	CLRF        _DIRECTION+1 
;Main 6.0V.c,201 :: 		while(!isAllBlack()){
L_goThroughObstaclesWorking556:
	CALL        _isAllBlack+0, 0
	MOVF        R0, 0 
	IORWF       R1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_goThroughObstaclesWorking557
;Main 6.0V.c,202 :: 		moveStraightSlow();
	CALL        _moveStraightSlow+0, 0
;Main 6.0V.c,203 :: 		}
	GOTO        L_goThroughObstaclesWorking556
L_goThroughObstaclesWorking557:
;Main 6.0V.c,204 :: 		} else {
	GOTO        L_goThroughObstaclesWorking558
L_goThroughObstaclesWorking555:
;Main 6.0V.c,205 :: 		LEVEL2_STATE = COMPLETED;
	MOVLW       2
	MOVWF       _LEVEL2_STATE+0 
	MOVLW       0
	MOVWF       _LEVEL2_STATE+1 
;Main 6.0V.c,206 :: 		}
L_goThroughObstaclesWorking558:
;Main 6.0V.c,208 :: 		}
L_goThroughObstaclesWorking554:
;Main 6.0V.c,209 :: 		}
	RETURN      0
; end of _goThroughObstaclesWorking

_goThroughObstacles:

;Main 6.0V.c,211 :: 		void goThroughObstacles(){
;Main 6.0V.c,212 :: 		if(getDistanceSonar2('M') < 10 ){
	MOVLW       77
	MOVWF       FARG_getDistanceSonar2_Sensor+0 
	CALL        _getDistanceSonar2+0, 0
	MOVLW       10
	SUBWF       R0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_goThroughObstacles559
;Main 6.0V.c,213 :: 		stop();
	CALL        _stop+0, 0
;Main 6.0V.c,214 :: 		if(DIRECTION<0){
	MOVLW       128
	XORWF       _DIRECTION+1, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__goThroughObstacles758
	MOVLW       0
	SUBWF       _DIRECTION+0, 0 
L__goThroughObstacles758:
	BTFSC       STATUS+0, 0 
	GOTO        L_goThroughObstacles560
;Main 6.0V.c,215 :: 		rotateByDegree(45);
	MOVLW       45
	MOVWF       FARG_rotateByDegree_degree+0 
	MOVLW       0
	MOVWF       FARG_rotateByDegree_degree+1 
	CALL        _rotateByDegree+0, 0
;Main 6.0V.c,216 :: 		DIRECTION +=45;
	MOVLW       45
	ADDWF       _DIRECTION+0, 1 
	MOVLW       0
	ADDWFC      _DIRECTION+1, 1 
;Main 6.0V.c,217 :: 		if(getDistanceSonar2('M') < 10 ){
	MOVLW       77
	MOVWF       FARG_getDistanceSonar2_Sensor+0 
	CALL        _getDistanceSonar2+0, 0
	MOVLW       10
	SUBWF       R0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_goThroughObstacles561
;Main 6.0V.c,218 :: 		rotateByDegree(-45);
	MOVLW       211
	MOVWF       FARG_rotateByDegree_degree+0 
	MOVLW       255
	MOVWF       FARG_rotateByDegree_degree+1 
	CALL        _rotateByDegree+0, 0
;Main 6.0V.c,219 :: 		rotateByDegree(-45);
	MOVLW       211
	MOVWF       FARG_rotateByDegree_degree+0 
	MOVLW       255
	MOVWF       FARG_rotateByDegree_degree+1 
	CALL        _rotateByDegree+0, 0
;Main 6.0V.c,220 :: 		DIRECTION -=90;
	MOVLW       90
	SUBWF       _DIRECTION+0, 1 
	MOVLW       0
	SUBWFB      _DIRECTION+1, 1 
;Main 6.0V.c,221 :: 		}
L_goThroughObstacles561:
;Main 6.0V.c,222 :: 		}
	GOTO        L_goThroughObstacles562
L_goThroughObstacles560:
;Main 6.0V.c,224 :: 		rotateByDegree(-45);
	MOVLW       211
	MOVWF       FARG_rotateByDegree_degree+0 
	MOVLW       255
	MOVWF       FARG_rotateByDegree_degree+1 
	CALL        _rotateByDegree+0, 0
;Main 6.0V.c,225 :: 		DIRECTION -=45;
	MOVLW       45
	SUBWF       _DIRECTION+0, 1 
	MOVLW       0
	SUBWFB      _DIRECTION+1, 1 
;Main 6.0V.c,226 :: 		if(getDistanceSonar2('M') < 10 ){
	MOVLW       77
	MOVWF       FARG_getDistanceSonar2_Sensor+0 
	CALL        _getDistanceSonar2+0, 0
	MOVLW       10
	SUBWF       R0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_goThroughObstacles563
;Main 6.0V.c,227 :: 		rotateByDegree(45);
	MOVLW       45
	MOVWF       FARG_rotateByDegree_degree+0 
	MOVLW       0
	MOVWF       FARG_rotateByDegree_degree+1 
	CALL        _rotateByDegree+0, 0
;Main 6.0V.c,228 :: 		rotateByDegree(45);
	MOVLW       45
	MOVWF       FARG_rotateByDegree_degree+0 
	MOVLW       0
	MOVWF       FARG_rotateByDegree_degree+1 
	CALL        _rotateByDegree+0, 0
;Main 6.0V.c,229 :: 		DIRECTION +=90;
	MOVLW       90
	ADDWF       _DIRECTION+0, 1 
	MOVLW       0
	ADDWFC      _DIRECTION+1, 1 
;Main 6.0V.c,230 :: 		}
L_goThroughObstacles563:
;Main 6.0V.c,231 :: 		}
L_goThroughObstacles562:
;Main 6.0V.c,232 :: 		}
	GOTO        L_goThroughObstacles564
L_goThroughObstacles559:
;Main 6.0V.c,234 :: 		moveStraightFast();
	CALL        _moveStraightFast+0, 0
;Main 6.0V.c,235 :: 		}
L_goThroughObstacles564:
;Main 6.0V.c,236 :: 		delay_ms(10);
	MOVLW       65
	MOVWF       R12, 0
	MOVLW       238
	MOVWF       R13, 0
L_goThroughObstacles565:
	DECFSZ      R13, 1, 0
	BRA         L_goThroughObstacles565
	DECFSZ      R12, 1, 0
	BRA         L_goThroughObstacles565
	NOP
;Main 6.0V.c,237 :: 		}
	RETURN      0
; end of _goThroughObstacles

_goThroughObstaclesJay:

;Main 6.0V.c,239 :: 		void goThroughObstaclesJay(){
;Main 6.0V.c,240 :: 		int ROTATION_ANGLE = 0;
	CLRF        goThroughObstaclesJay_ROTATION_ANGLE_L0+0 
	CLRF        goThroughObstaclesJay_ROTATION_ANGLE_L0+1 
;Main 6.0V.c,241 :: 		if(isPathClear() == 0) {
	CALL        _isPathClear+0, 0
	MOVLW       0
	XORWF       R1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__goThroughObstaclesJay759
	MOVLW       0
	XORWF       R0, 0 
L__goThroughObstaclesJay759:
	BTFSS       STATUS+0, 2 
	GOTO        L_goThroughObstaclesJay566
;Main 6.0V.c,242 :: 		rotateByDegree(30);
	MOVLW       30
	MOVWF       FARG_rotateByDegree_degree+0 
	MOVLW       0
	MOVWF       FARG_rotateByDegree_degree+1 
	CALL        _rotateByDegree+0, 0
;Main 6.0V.c,243 :: 		ROTATION_ANGLE += 30;
	MOVLW       30
	ADDWF       goThroughObstaclesJay_ROTATION_ANGLE_L0+0, 1 
	MOVLW       0
	ADDWFC      goThroughObstaclesJay_ROTATION_ANGLE_L0+1, 1 
;Main 6.0V.c,244 :: 		if(isPathClear() == 0) {
	CALL        _isPathClear+0, 0
	MOVLW       0
	XORWF       R1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__goThroughObstaclesJay760
	MOVLW       0
	XORWF       R0, 0 
L__goThroughObstaclesJay760:
	BTFSS       STATUS+0, 2 
	GOTO        L_goThroughObstaclesJay567
;Main 6.0V.c,245 :: 		rotateByDegree(-60);
	MOVLW       196
	MOVWF       FARG_rotateByDegree_degree+0 
	MOVLW       255
	MOVWF       FARG_rotateByDegree_degree+1 
	CALL        _rotateByDegree+0, 0
;Main 6.0V.c,246 :: 		ROTATION_ANGLE += -60;
	MOVLW       196
	ADDWF       goThroughObstaclesJay_ROTATION_ANGLE_L0+0, 1 
	MOVLW       255
	ADDWFC      goThroughObstaclesJay_ROTATION_ANGLE_L0+1, 1 
;Main 6.0V.c,247 :: 		if(isPathClear() == 0) {
	CALL        _isPathClear+0, 0
	MOVLW       0
	XORWF       R1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__goThroughObstaclesJay761
	MOVLW       0
	XORWF       R0, 0 
L__goThroughObstaclesJay761:
	BTFSS       STATUS+0, 2 
	GOTO        L_goThroughObstaclesJay568
;Main 6.0V.c,248 :: 		rotateByDegree(90);
	MOVLW       90
	MOVWF       FARG_rotateByDegree_degree+0 
	MOVLW       0
	MOVWF       FARG_rotateByDegree_degree+1 
	CALL        _rotateByDegree+0, 0
;Main 6.0V.c,249 :: 		ROTATION_ANGLE += 90;
	MOVLW       90
	ADDWF       goThroughObstaclesJay_ROTATION_ANGLE_L0+0, 1 
	MOVLW       0
	ADDWFC      goThroughObstaclesJay_ROTATION_ANGLE_L0+1, 1 
;Main 6.0V.c,250 :: 		if(isPathClear() == 0) {
	CALL        _isPathClear+0, 0
	MOVLW       0
	XORWF       R1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__goThroughObstaclesJay762
	MOVLW       0
	XORWF       R0, 0 
L__goThroughObstaclesJay762:
	BTFSS       STATUS+0, 2 
	GOTO        L_goThroughObstaclesJay569
;Main 6.0V.c,251 :: 		rotateByDegree(-90);
	MOVLW       166
	MOVWF       FARG_rotateByDegree_degree+0 
	MOVLW       255
	MOVWF       FARG_rotateByDegree_degree+1 
	CALL        _rotateByDegree+0, 0
;Main 6.0V.c,252 :: 		rotateByDegree(-30);
	MOVLW       226
	MOVWF       FARG_rotateByDegree_degree+0 
	MOVLW       255
	MOVWF       FARG_rotateByDegree_degree+1 
	CALL        _rotateByDegree+0, 0
;Main 6.0V.c,253 :: 		ROTATION_ANGLE += -120;
	MOVLW       136
	ADDWF       goThroughObstaclesJay_ROTATION_ANGLE_L0+0, 1 
	MOVLW       255
	ADDWFC      goThroughObstaclesJay_ROTATION_ANGLE_L0+1, 1 
;Main 6.0V.c,254 :: 		if(isPathClear() == 0) {
	CALL        _isPathClear+0, 0
	MOVLW       0
	XORWF       R1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__goThroughObstaclesJay763
	MOVLW       0
	XORWF       R0, 0 
L__goThroughObstaclesJay763:
	BTFSS       STATUS+0, 2 
	GOTO        L_goThroughObstaclesJay570
;Main 6.0V.c,255 :: 		rotateByDegree(90);
	MOVLW       90
	MOVWF       FARG_rotateByDegree_degree+0 
	MOVLW       0
	MOVWF       FARG_rotateByDegree_degree+1 
	CALL        _rotateByDegree+0, 0
;Main 6.0V.c,256 :: 		rotateByDegree(60);
	MOVLW       60
	MOVWF       FARG_rotateByDegree_degree+0 
	MOVLW       0
	MOVWF       FARG_rotateByDegree_degree+1 
	CALL        _rotateByDegree+0, 0
;Main 6.0V.c,257 :: 		ROTATION_ANGLE += 150;
	MOVLW       150
	ADDWF       goThroughObstaclesJay_ROTATION_ANGLE_L0+0, 1 
	MOVLW       0
	ADDWFC      goThroughObstaclesJay_ROTATION_ANGLE_L0+1, 1 
;Main 6.0V.c,258 :: 		if(isPathClear() == 0) {
	CALL        _isPathClear+0, 0
	MOVLW       0
	XORWF       R1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__goThroughObstaclesJay764
	MOVLW       0
	XORWF       R0, 0 
L__goThroughObstaclesJay764:
	BTFSS       STATUS+0, 2 
	GOTO        L_goThroughObstaclesJay571
;Main 6.0V.c,259 :: 		rotateByDegree(-90);
	MOVLW       166
	MOVWF       FARG_rotateByDegree_degree+0 
	MOVLW       255
	MOVWF       FARG_rotateByDegree_degree+1 
	CALL        _rotateByDegree+0, 0
;Main 6.0V.c,260 :: 		rotateByDegree(-90);
	MOVLW       166
	MOVWF       FARG_rotateByDegree_degree+0 
	MOVLW       255
	MOVWF       FARG_rotateByDegree_degree+1 
	CALL        _rotateByDegree+0, 0
;Main 6.0V.c,261 :: 		ROTATION_ANGLE += -180;
	MOVLW       76
	ADDWF       goThroughObstaclesJay_ROTATION_ANGLE_L0+0, 1 
	MOVLW       255
	ADDWFC      goThroughObstaclesJay_ROTATION_ANGLE_L0+1, 1 
;Main 6.0V.c,262 :: 		}
L_goThroughObstaclesJay571:
;Main 6.0V.c,263 :: 		}
L_goThroughObstaclesJay570:
;Main 6.0V.c,264 :: 		}
L_goThroughObstaclesJay569:
;Main 6.0V.c,265 :: 		}
L_goThroughObstaclesJay568:
;Main 6.0V.c,266 :: 		}
L_goThroughObstaclesJay567:
;Main 6.0V.c,267 :: 		}
L_goThroughObstaclesJay566:
;Main 6.0V.c,268 :: 		DIRECTION += ROTATION_ANGLE;
	MOVF        goThroughObstaclesJay_ROTATION_ANGLE_L0+0, 0 
	ADDWF       _DIRECTION+0, 1 
	MOVF        goThroughObstaclesJay_ROTATION_ANGLE_L0+1, 0 
	ADDWFC      _DIRECTION+1, 1 
;Main 6.0V.c,269 :: 		moveStraightFast();
	CALL        _moveStraightFast+0, 0
;Main 6.0V.c,270 :: 		delay_ms(10);
	MOVLW       65
	MOVWF       R12, 0
	MOVLW       238
	MOVWF       R13, 0
L_goThroughObstaclesJay572:
	DECFSZ      R13, 1, 0
	BRA         L_goThroughObstaclesJay572
	DECFSZ      R12, 1, 0
	BRA         L_goThroughObstaclesJay572
	NOP
;Main 6.0V.c,272 :: 		if(isAllWhite()) {
	CALL        _isAllWhite+0, 0
	MOVF        R0, 0 
	IORWF       R1, 0 
	BTFSC       STATUS+0, 2 
	GOTO        L_goThroughObstaclesJay573
;Main 6.0V.c,274 :: 		if(abs(DIRECTION) >= 90) {
	MOVF        _DIRECTION+0, 0 
	MOVWF       FARG_abs_a+0 
	MOVF        _DIRECTION+1, 0 
	MOVWF       FARG_abs_a+1 
	CALL        _abs+0, 0
	MOVLW       128
	XORWF       R1, 0 
	MOVWF       R2 
	MOVLW       128
	SUBWF       R2, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__goThroughObstaclesJay765
	MOVLW       90
	SUBWF       R0, 0 
L__goThroughObstaclesJay765:
	BTFSS       STATUS+0, 0 
	GOTO        L_goThroughObstaclesJay574
;Main 6.0V.c,275 :: 		sendText("Wrong Direction !!!");
	MOVLW       ?lstr40_Main_326.0V+0
	MOVWF       FARG_sendText_aText+0 
	MOVLW       hi_addr(?lstr40_Main_326.0V+0)
	MOVWF       FARG_sendText_aText+1 
	CALL        _sendText+0, 0
;Main 6.0V.c,276 :: 		rotateByDegree(90);
	MOVLW       90
	MOVWF       FARG_rotateByDegree_degree+0 
	MOVLW       0
	MOVWF       FARG_rotateByDegree_degree+1 
	CALL        _rotateByDegree+0, 0
;Main 6.0V.c,277 :: 		rotateByDegree(90);
	MOVLW       90
	MOVWF       FARG_rotateByDegree_degree+0 
	MOVLW       0
	MOVWF       FARG_rotateByDegree_degree+1 
	CALL        _rotateByDegree+0, 0
;Main 6.0V.c,279 :: 		DIRECTION = 0;
	CLRF        _DIRECTION+0 
	CLRF        _DIRECTION+1 
;Main 6.0V.c,280 :: 		level2Aligning();
	CALL        _level2Aligning+0, 0
;Main 6.0V.c,281 :: 		}
	GOTO        L_goThroughObstaclesJay575
L_goThroughObstaclesJay574:
;Main 6.0V.c,283 :: 		sendText("Corrent Direction !!!");
	MOVLW       ?lstr41_Main_326.0V+0
	MOVWF       FARG_sendText_aText+0 
	MOVLW       hi_addr(?lstr41_Main_326.0V+0)
	MOVWF       FARG_sendText_aText+1 
	CALL        _sendText+0, 0
;Main 6.0V.c,284 :: 		LEVEL2_STATE = COMPLETED;
	MOVLW       2
	MOVWF       _LEVEL2_STATE+0 
	MOVLW       0
	MOVWF       _LEVEL2_STATE+1 
;Main 6.0V.c,285 :: 		}
L_goThroughObstaclesJay575:
;Main 6.0V.c,286 :: 		}
L_goThroughObstaclesJay573:
;Main 6.0V.c,287 :: 		}
	RETURN      0
; end of _goThroughObstaclesJay

_isPathClear:

;Main 6.0V.c,291 :: 		int isPathClear() {
;Main 6.0V.c,292 :: 		if(getDistanceSonar2('L') < 7 || getDistanceSonar2('M') < 7 || getDistanceSonar2('R') < 7) {
	MOVLW       76
	MOVWF       FARG_getDistanceSonar2_Sensor+0 
	CALL        _getDistanceSonar2+0, 0
	MOVLW       7
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 0 
	GOTO        L__isPathClear694
	MOVLW       77
	MOVWF       FARG_getDistanceSonar2_Sensor+0 
	CALL        _getDistanceSonar2+0, 0
	MOVLW       7
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 0 
	GOTO        L__isPathClear694
	MOVLW       82
	MOVWF       FARG_getDistanceSonar2_Sensor+0 
	CALL        _getDistanceSonar2+0, 0
	MOVLW       7
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 0 
	GOTO        L__isPathClear694
	GOTO        L_isPathClear578
L__isPathClear694:
;Main 6.0V.c,293 :: 		return 0;     // Not Clear
	CLRF        R0 
	CLRF        R1 
	RETURN      0
;Main 6.0V.c,294 :: 		} else {
L_isPathClear578:
;Main 6.0V.c,295 :: 		return 1;
	MOVLW       1
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
;Main 6.0V.c,297 :: 		}
	RETURN      0
; end of _isPathClear

_checkSonar:

;Main 6.0V.c,299 :: 		void checkSonar(char Sensor){
;Main 6.0V.c,300 :: 		if(Sensor == 'L'){
	MOVF        FARG_checkSonar_Sensor+0, 0 
	XORLW       76
	BTFSS       STATUS+0, 2 
	GOTO        L_checkSonar580
;Main 6.0V.c,301 :: 		distanceSonar = getDistanceSonar2('L');
	MOVLW       76
	MOVWF       FARG_getDistanceSonar2_Sensor+0 
	CALL        _getDistanceSonar2+0, 0
	MOVF        R0, 0 
	MOVWF       _distanceSonar+0 
;Main 6.0V.c,302 :: 		if(distanceSonar < 10)
	MOVLW       10
	SUBWF       R0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_checkSonar581
;Main 6.0V.c,303 :: 		sendText("Obstacle" );
	MOVLW       ?lstr42_Main_326.0V+0
	MOVWF       FARG_sendText_aText+0 
	MOVLW       hi_addr(?lstr42_Main_326.0V+0)
	MOVWF       FARG_sendText_aText+1 
	CALL        _sendText+0, 0
L_checkSonar581:
;Main 6.0V.c,304 :: 		}
	GOTO        L_checkSonar582
L_checkSonar580:
;Main 6.0V.c,305 :: 		else if(Sensor == 'M'){
	MOVF        FARG_checkSonar_Sensor+0, 0 
	XORLW       77
	BTFSS       STATUS+0, 2 
	GOTO        L_checkSonar583
;Main 6.0V.c,306 :: 		distanceSonar = getDistanceSonar2('M');
	MOVLW       77
	MOVWF       FARG_getDistanceSonar2_Sensor+0 
	CALL        _getDistanceSonar2+0, 0
	MOVF        R0, 0 
	MOVWF       _distanceSonar+0 
;Main 6.0V.c,307 :: 		if(distanceSonar < 10)
	MOVLW       10
	SUBWF       R0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_checkSonar584
;Main 6.0V.c,308 :: 		sendText("Obstacle" );
	MOVLW       ?lstr43_Main_326.0V+0
	MOVWF       FARG_sendText_aText+0 
	MOVLW       hi_addr(?lstr43_Main_326.0V+0)
	MOVWF       FARG_sendText_aText+1 
	CALL        _sendText+0, 0
L_checkSonar584:
;Main 6.0V.c,309 :: 		}
	GOTO        L_checkSonar585
L_checkSonar583:
;Main 6.0V.c,310 :: 		else if(Sensor == 'R'){
	MOVF        FARG_checkSonar_Sensor+0, 0 
	XORLW       82
	BTFSS       STATUS+0, 2 
	GOTO        L_checkSonar586
;Main 6.0V.c,311 :: 		distanceSonar = getDistanceSonar2('R');
	MOVLW       82
	MOVWF       FARG_getDistanceSonar2_Sensor+0 
	CALL        _getDistanceSonar2+0, 0
	MOVF        R0, 0 
	MOVWF       _distanceSonar+0 
;Main 6.0V.c,312 :: 		if(distanceSonar < 10)
	MOVLW       10
	SUBWF       R0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_checkSonar587
;Main 6.0V.c,313 :: 		sendText("Obstacle" );
	MOVLW       ?lstr44_Main_326.0V+0
	MOVWF       FARG_sendText_aText+0 
	MOVLW       hi_addr(?lstr44_Main_326.0V+0)
	MOVWF       FARG_sendText_aText+1 
	CALL        _sendText+0, 0
L_checkSonar587:
;Main 6.0V.c,314 :: 		}
L_checkSonar586:
L_checkSonar585:
L_checkSonar582:
;Main 6.0V.c,315 :: 		delay_ms(500);
	MOVLW       13
	MOVWF       R11, 0
	MOVLW       175
	MOVWF       R12, 0
	MOVLW       182
	MOVWF       R13, 0
L_checkSonar588:
	DECFSZ      R13, 1, 0
	BRA         L_checkSonar588
	DECFSZ      R12, 1, 0
	BRA         L_checkSonar588
	DECFSZ      R11, 1, 0
	BRA         L_checkSonar588
	NOP
;Main 6.0V.c,316 :: 		}
	RETURN      0
; end of _checkSonar
