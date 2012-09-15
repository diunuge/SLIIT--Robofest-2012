
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
L__isAllBlack827:
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
L__isAllWhite828:
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
	GOTO        L__rotateByDegree982
	MOVLW       166
	XORWF       FARG_rotateByDegree_degree+0, 0 
L__rotateByDegree982:
	BTFSS       STATUS+0, 2 
	GOTO        L_rotateByDegree8
;motion.h,103 :: 		rotateAntiClockwise(255);
	MOVLW       255
	MOVWF       FARG_rotateAntiClockwise_pwm+0 
	MOVLW       0
	MOVWF       FARG_rotateAntiClockwise_pwm+1 
	CALL        _rotateAntiClockwise+0, 0
;motion.h,104 :: 		delay_ms(290);
	MOVLW       8
	MOVWF       R11, 0
	MOVLW       92
	MOVWF       R12, 0
	MOVLW       22
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
	GOTO        L__rotateByDegree983
	MOVLW       90
	XORWF       FARG_rotateByDegree_degree+0, 0 
L__rotateByDegree983:
	BTFSS       STATUS+0, 2 
	GOTO        L_rotateByDegree11
;motion.h,108 :: 		rotateClockwise(255);
	MOVLW       255
	MOVWF       FARG_rotateClockwise_pwm+0 
	MOVLW       0
	MOVWF       FARG_rotateClockwise_pwm+1 
	CALL        _rotateClockwise+0, 0
;motion.h,109 :: 		delay_ms(290);
	MOVLW       8
	MOVWF       R11, 0
	MOVLW       92
	MOVWF       R12, 0
	MOVLW       22
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
	GOTO        L__rotateByDegree984
	MOVLW       226
	XORWF       FARG_rotateByDegree_degree+0, 0 
L__rotateByDegree984:
	BTFSS       STATUS+0, 2 
	GOTO        L_rotateByDegree14
;motion.h,113 :: 		rotateAntiClockwise(255);
	MOVLW       255
	MOVWF       FARG_rotateAntiClockwise_pwm+0 
	MOVLW       0
	MOVWF       FARG_rotateAntiClockwise_pwm+1 
	CALL        _rotateAntiClockwise+0, 0
;motion.h,114 :: 		delay_ms(120);                   //100
	MOVLW       4
	MOVWF       R11, 0
	MOVLW       12
	MOVWF       R12, 0
	MOVLW       51
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
	GOTO        L__rotateByDegree985
	MOVLW       30
	XORWF       FARG_rotateByDegree_degree+0, 0 
L__rotateByDegree985:
	BTFSS       STATUS+0, 2 
	GOTO        L_rotateByDegree18
;motion.h,119 :: 		rotateClockwise(255);
	MOVLW       255
	MOVWF       FARG_rotateClockwise_pwm+0 
	MOVLW       0
	MOVWF       FARG_rotateClockwise_pwm+1 
	CALL        _rotateClockwise+0, 0
;motion.h,120 :: 		delay_ms(120);
	MOVLW       4
	MOVWF       R11, 0
	MOVLW       12
	MOVWF       R12, 0
	MOVLW       51
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
;motion.h,124 :: 		else if( degree == -60 ){             //155
	MOVLW       255
	XORWF       FARG_rotateByDegree_degree+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__rotateByDegree986
	MOVLW       196
	XORWF       FARG_rotateByDegree_degree+0, 0 
L__rotateByDegree986:
	BTFSS       STATUS+0, 2 
	GOTO        L_rotateByDegree22
;motion.h,125 :: 		rotateAntiClockwise(255);
	MOVLW       255
	MOVWF       FARG_rotateAntiClockwise_pwm+0 
	MOVLW       0
	MOVWF       FARG_rotateAntiClockwise_pwm+1 
	CALL        _rotateAntiClockwise+0, 0
;motion.h,126 :: 		delay_ms(230);
	MOVLW       6
	MOVWF       R11, 0
	MOVLW       214
	MOVWF       R12, 0
	MOVLW       123
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
	GOTO        L__rotateByDegree987
	MOVLW       60
	XORWF       FARG_rotateByDegree_degree+0, 0 
L__rotateByDegree987:
	BTFSS       STATUS+0, 2 
	GOTO        L_rotateByDegree26
;motion.h,131 :: 		rotateClockwise(255);
	MOVLW       255
	MOVWF       FARG_rotateClockwise_pwm+0 
	MOVLW       0
	MOVWF       FARG_rotateClockwise_pwm+1 
	CALL        _rotateClockwise+0, 0
;motion.h,132 :: 		delay_ms(230);
	MOVLW       6
	MOVWF       R11, 0
	MOVLW       214
	MOVWF       R12, 0
	MOVLW       123
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
;motion.h,136 :: 		else if( degree == -45 ){               //135
	MOVLW       255
	XORWF       FARG_rotateByDegree_degree+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__rotateByDegree988
	MOVLW       211
	XORWF       FARG_rotateByDegree_degree+0, 0 
L__rotateByDegree988:
	BTFSS       STATUS+0, 2 
	GOTO        L_rotateByDegree30
;motion.h,137 :: 		rotateAntiClockwise(255);
	MOVLW       255
	MOVWF       FARG_rotateAntiClockwise_pwm+0 
	MOVLW       0
	MOVWF       FARG_rotateAntiClockwise_pwm+1 
	CALL        _rotateAntiClockwise+0, 0
;motion.h,138 :: 		delay_ms(180);
	MOVLW       5
	MOVWF       R11, 0
	MOVLW       145
	MOVWF       R12, 0
	MOVLW       207
	MOVWF       R13, 0
L_rotateByDegree31:
	DECFSZ      R13, 1, 0
	BRA         L_rotateByDegree31
	DECFSZ      R12, 1, 0
	BRA         L_rotateByDegree31
	DECFSZ      R11, 1, 0
	BRA         L_rotateByDegree31
	NOP
	NOP
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
	GOTO        L__rotateByDegree989
	MOVLW       45
	XORWF       FARG_rotateByDegree_degree+0, 0 
L__rotateByDegree989:
	BTFSS       STATUS+0, 2 
	GOTO        L_rotateByDegree34
;motion.h,143 :: 		rotateClockwise(255);
	MOVLW       255
	MOVWF       FARG_rotateClockwise_pwm+0 
	MOVLW       0
	MOVWF       FARG_rotateClockwise_pwm+1 
	CALL        _rotateClockwise+0, 0
;motion.h,144 :: 		delay_ms(180);
	MOVLW       5
	MOVWF       R11, 0
	MOVLW       145
	MOVWF       R12, 0
	MOVLW       207
	MOVWF       R13, 0
L_rotateByDegree35:
	DECFSZ      R13, 1, 0
	BRA         L_rotateByDegree35
	DECFSZ      R12, 1, 0
	BRA         L_rotateByDegree35
	DECFSZ      R11, 1, 0
	BRA         L_rotateByDegree35
	NOP
	NOP
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
	GOTO        L_rotateByDegree37
L_rotateByDegree34:
;motion.h,148 :: 		else if( degree == -2 ){
	MOVLW       255
	XORWF       FARG_rotateByDegree_degree+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__rotateByDegree990
	MOVLW       254
	XORWF       FARG_rotateByDegree_degree+0, 0 
L__rotateByDegree990:
	BTFSS       STATUS+0, 2 
	GOTO        L_rotateByDegree38
;motion.h,149 :: 		rotateAntiClockwise(255);
	MOVLW       255
	MOVWF       FARG_rotateAntiClockwise_pwm+0 
	MOVLW       0
	MOVWF       FARG_rotateAntiClockwise_pwm+1 
	CALL        _rotateAntiClockwise+0, 0
;motion.h,150 :: 		delay_ms(6);
	MOVLW       39
	MOVWF       R12, 0
	MOVLW       245
	MOVWF       R13, 0
L_rotateByDegree39:
	DECFSZ      R13, 1, 0
	BRA         L_rotateByDegree39
	DECFSZ      R12, 1, 0
	BRA         L_rotateByDegree39
;motion.h,151 :: 		stop();
	CALL        _stop+0, 0
;motion.h,152 :: 		delay_ms(50);
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
;motion.h,153 :: 		}
	GOTO        L_rotateByDegree41
L_rotateByDegree38:
;motion.h,154 :: 		else if( degree == 2 ){
	MOVLW       0
	XORWF       FARG_rotateByDegree_degree+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__rotateByDegree991
	MOVLW       2
	XORWF       FARG_rotateByDegree_degree+0, 0 
L__rotateByDegree991:
	BTFSS       STATUS+0, 2 
	GOTO        L_rotateByDegree42
;motion.h,155 :: 		rotateClockwise(255);
	MOVLW       255
	MOVWF       FARG_rotateClockwise_pwm+0 
	MOVLW       0
	MOVWF       FARG_rotateClockwise_pwm+1 
	CALL        _rotateClockwise+0, 0
;motion.h,156 :: 		delay_ms(6);
	MOVLW       39
	MOVWF       R12, 0
	MOVLW       245
	MOVWF       R13, 0
L_rotateByDegree43:
	DECFSZ      R13, 1, 0
	BRA         L_rotateByDegree43
	DECFSZ      R12, 1, 0
	BRA         L_rotateByDegree43
;motion.h,157 :: 		stop();
	CALL        _stop+0, 0
;motion.h,158 :: 		delay_ms(50);
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
;motion.h,159 :: 		}
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
;motion.h,160 :: 		}
	RETURN      0
; end of _rotateByDegree

_testMotion:

;motion.h,162 :: 		void testMotion(int pwm){
;motion.h,163 :: 		rotateClockwise(pwm);
	MOVF        FARG_testMotion_pwm+0, 0 
	MOVWF       FARG_rotateClockwise_pwm+0 
	MOVF        FARG_testMotion_pwm+1, 0 
	MOVWF       FARG_rotateClockwise_pwm+1 
	CALL        _rotateClockwise+0, 0
;motion.h,164 :: 		delay_ms(1000);
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
;motion.h,165 :: 		rotateAntiClockwise(pwm);
	MOVF        FARG_testMotion_pwm+0, 0 
	MOVWF       FARG_rotateAntiClockwise_pwm+0 
	MOVF        FARG_testMotion_pwm+1, 0 
	MOVWF       FARG_rotateAntiClockwise_pwm+1 
	CALL        _rotateAntiClockwise+0, 0
;motion.h,166 :: 		delay_ms(1000);
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
;motion.h,167 :: 		moveForward(pwm,pwm);
	MOVF        FARG_testMotion_pwm+0, 0 
	MOVWF       FARG_moveForward_pwmLeft+0 
	MOVF        FARG_testMotion_pwm+1, 0 
	MOVWF       FARG_moveForward_pwmLeft+1 
	MOVF        FARG_testMotion_pwm+0, 0 
	MOVWF       FARG_moveForward_pwmRight+0 
	MOVF        FARG_testMotion_pwm+1, 0 
	MOVWF       FARG_moveForward_pwmRight+1 
	CALL        _moveForward+0, 0
;motion.h,168 :: 		delay_ms(1000);
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
;motion.h,169 :: 		}
	RETURN      0
; end of _testMotion

_sendSensorStatus:

;debug.h,14 :: 		void sendSensorStatus(){
;debug.h,15 :: 		if( Sensor1 == 1){
	BTFSS       PORTB+0, 4 
	GOTO        L_sendSensorStatus48
;debug.h,16 :: 		debugText = "1";
	MOVLW       ?lstr3_Main_327.0V+0
	MOVWF       _debugText+0 
	MOVLW       hi_addr(?lstr3_Main_327.0V+0)
	MOVWF       _debugText+1 
;debug.h,17 :: 		UART1_Write_Text(debugText);
	MOVF        _debugText+0, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVF        _debugText+1, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;debug.h,18 :: 		}
	GOTO        L_sendSensorStatus49
L_sendSensorStatus48:
;debug.h,19 :: 		else if( Sensor1 == 0){
	BTFSC       PORTB+0, 4 
	GOTO        L_sendSensorStatus50
;debug.h,20 :: 		debugText = "0";
	MOVLW       ?lstr4_Main_327.0V+0
	MOVWF       _debugText+0 
	MOVLW       hi_addr(?lstr4_Main_327.0V+0)
	MOVWF       _debugText+1 
;debug.h,21 :: 		UART1_Write_Text(debugText);
	MOVF        _debugText+0, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVF        _debugText+1, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;debug.h,22 :: 		}
L_sendSensorStatus50:
L_sendSensorStatus49:
;debug.h,24 :: 		if( Sensor2 == 1){
	BTFSS       PORTB+0, 3 
	GOTO        L_sendSensorStatus51
;debug.h,25 :: 		debugText = "1";
	MOVLW       ?lstr5_Main_327.0V+0
	MOVWF       _debugText+0 
	MOVLW       hi_addr(?lstr5_Main_327.0V+0)
	MOVWF       _debugText+1 
;debug.h,26 :: 		UART1_Write_Text(debugText);
	MOVF        _debugText+0, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVF        _debugText+1, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;debug.h,27 :: 		}
	GOTO        L_sendSensorStatus52
L_sendSensorStatus51:
;debug.h,28 :: 		else if( Sensor2 == 0){
	BTFSC       PORTB+0, 3 
	GOTO        L_sendSensorStatus53
;debug.h,29 :: 		debugText = "0";
	MOVLW       ?lstr6_Main_327.0V+0
	MOVWF       _debugText+0 
	MOVLW       hi_addr(?lstr6_Main_327.0V+0)
	MOVWF       _debugText+1 
;debug.h,30 :: 		UART1_Write_Text(debugText);
	MOVF        _debugText+0, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVF        _debugText+1, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;debug.h,31 :: 		}
L_sendSensorStatus53:
L_sendSensorStatus52:
;debug.h,33 :: 		if( Sensor3 == 1){
	BTFSS       PORTD+0, 4 
	GOTO        L_sendSensorStatus54
;debug.h,34 :: 		debugText = "1";
	MOVLW       ?lstr7_Main_327.0V+0
	MOVWF       _debugText+0 
	MOVLW       hi_addr(?lstr7_Main_327.0V+0)
	MOVWF       _debugText+1 
;debug.h,35 :: 		UART1_Write_Text(debugText);
	MOVF        _debugText+0, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVF        _debugText+1, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;debug.h,36 :: 		}
	GOTO        L_sendSensorStatus55
L_sendSensorStatus54:
;debug.h,37 :: 		else if( Sensor3 == 0){
	BTFSC       PORTD+0, 4 
	GOTO        L_sendSensorStatus56
;debug.h,38 :: 		debugText = "0";
	MOVLW       ?lstr8_Main_327.0V+0
	MOVWF       _debugText+0 
	MOVLW       hi_addr(?lstr8_Main_327.0V+0)
	MOVWF       _debugText+1 
;debug.h,39 :: 		UART1_Write_Text(debugText);
	MOVF        _debugText+0, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVF        _debugText+1, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;debug.h,40 :: 		}
L_sendSensorStatus56:
L_sendSensorStatus55:
;debug.h,42 :: 		if( Sensor4 == 1){
	BTFSS       PORTD+0, 5 
	GOTO        L_sendSensorStatus57
;debug.h,43 :: 		debugText = "1";
	MOVLW       ?lstr9_Main_327.0V+0
	MOVWF       _debugText+0 
	MOVLW       hi_addr(?lstr9_Main_327.0V+0)
	MOVWF       _debugText+1 
;debug.h,44 :: 		UART1_Write_Text(debugText);
	MOVF        _debugText+0, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVF        _debugText+1, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;debug.h,45 :: 		}
	GOTO        L_sendSensorStatus58
L_sendSensorStatus57:
;debug.h,46 :: 		else if( Sensor4 == 0){
	BTFSC       PORTD+0, 5 
	GOTO        L_sendSensorStatus59
;debug.h,47 :: 		debugText = "0";
	MOVLW       ?lstr10_Main_327.0V+0
	MOVWF       _debugText+0 
	MOVLW       hi_addr(?lstr10_Main_327.0V+0)
	MOVWF       _debugText+1 
;debug.h,48 :: 		UART1_Write_Text(debugText);
	MOVF        _debugText+0, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVF        _debugText+1, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;debug.h,49 :: 		}
L_sendSensorStatus59:
L_sendSensorStatus58:
;debug.h,51 :: 		if( Sensor5 == 1){
	BTFSS       PORTD+0, 6 
	GOTO        L_sendSensorStatus60
;debug.h,52 :: 		debugText = "1";
	MOVLW       ?lstr11_Main_327.0V+0
	MOVWF       _debugText+0 
	MOVLW       hi_addr(?lstr11_Main_327.0V+0)
	MOVWF       _debugText+1 
;debug.h,53 :: 		UART1_Write_Text(debugText);
	MOVF        _debugText+0, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVF        _debugText+1, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;debug.h,54 :: 		}
	GOTO        L_sendSensorStatus61
L_sendSensorStatus60:
;debug.h,55 :: 		else if( Sensor5 == 0){
	BTFSC       PORTD+0, 6 
	GOTO        L_sendSensorStatus62
;debug.h,56 :: 		debugText = "0";
	MOVLW       ?lstr12_Main_327.0V+0
	MOVWF       _debugText+0 
	MOVLW       hi_addr(?lstr12_Main_327.0V+0)
	MOVWF       _debugText+1 
;debug.h,57 :: 		UART1_Write_Text(debugText);
	MOVF        _debugText+0, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVF        _debugText+1, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;debug.h,58 :: 		}
L_sendSensorStatus62:
L_sendSensorStatus61:
;debug.h,60 :: 		if( Sensor6 == 1){
	BTFSS       PORTD+0, 7 
	GOTO        L_sendSensorStatus63
;debug.h,61 :: 		debugText = "1";
	MOVLW       ?lstr13_Main_327.0V+0
	MOVWF       _debugText+0 
	MOVLW       hi_addr(?lstr13_Main_327.0V+0)
	MOVWF       _debugText+1 
;debug.h,62 :: 		UART1_Write_Text(debugText);
	MOVF        _debugText+0, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVF        _debugText+1, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;debug.h,63 :: 		}
	GOTO        L_sendSensorStatus64
L_sendSensorStatus63:
;debug.h,64 :: 		else if( Sensor6 == 0){
	BTFSC       PORTD+0, 7 
	GOTO        L_sendSensorStatus65
;debug.h,65 :: 		debugText = "0";
	MOVLW       ?lstr14_Main_327.0V+0
	MOVWF       _debugText+0 
	MOVLW       hi_addr(?lstr14_Main_327.0V+0)
	MOVWF       _debugText+1 
;debug.h,66 :: 		UART1_Write_Text(debugText);
	MOVF        _debugText+0, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVF        _debugText+1, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;debug.h,67 :: 		}
L_sendSensorStatus65:
L_sendSensorStatus64:
;debug.h,69 :: 		if( Sensor7 == 1){
	BTFSS       PORTB+0, 2 
	GOTO        L_sendSensorStatus66
;debug.h,70 :: 		debugText = "1";
	MOVLW       ?lstr15_Main_327.0V+0
	MOVWF       _debugText+0 
	MOVLW       hi_addr(?lstr15_Main_327.0V+0)
	MOVWF       _debugText+1 
;debug.h,71 :: 		UART1_Write_Text(debugText);
	MOVF        _debugText+0, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVF        _debugText+1, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;debug.h,72 :: 		}
	GOTO        L_sendSensorStatus67
L_sendSensorStatus66:
;debug.h,73 :: 		else if( Sensor7 == 0){
	BTFSC       PORTB+0, 2 
	GOTO        L_sendSensorStatus68
;debug.h,74 :: 		debugText = "0";
	MOVLW       ?lstr16_Main_327.0V+0
	MOVWF       _debugText+0 
	MOVLW       hi_addr(?lstr16_Main_327.0V+0)
	MOVWF       _debugText+1 
;debug.h,75 :: 		UART1_Write_Text(debugText);
	MOVF        _debugText+0, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVF        _debugText+1, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;debug.h,76 :: 		}
L_sendSensorStatus68:
L_sendSensorStatus67:
;debug.h,78 :: 		if( Sensor8 == 1){
	BTFSS       PORTB+0, 6 
	GOTO        L_sendSensorStatus69
;debug.h,79 :: 		debugText = "1";
	MOVLW       ?lstr17_Main_327.0V+0
	MOVWF       _debugText+0 
	MOVLW       hi_addr(?lstr17_Main_327.0V+0)
	MOVWF       _debugText+1 
;debug.h,80 :: 		UART1_Write_Text(debugText);
	MOVF        _debugText+0, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVF        _debugText+1, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;debug.h,81 :: 		}
	GOTO        L_sendSensorStatus70
L_sendSensorStatus69:
;debug.h,82 :: 		else if( Sensor8 == 0){
	BTFSC       PORTB+0, 6 
	GOTO        L_sendSensorStatus71
;debug.h,83 :: 		debugText = "0";
	MOVLW       ?lstr18_Main_327.0V+0
	MOVWF       _debugText+0 
	MOVLW       hi_addr(?lstr18_Main_327.0V+0)
	MOVWF       _debugText+1 
;debug.h,84 :: 		UART1_Write_Text(debugText);
	MOVF        _debugText+0, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVF        _debugText+1, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;debug.h,85 :: 		}
L_sendSensorStatus71:
L_sendSensorStatus70:
;debug.h,87 :: 		if( Sensor9 == 1){
	BTFSS       PORTB+0, 7 
	GOTO        L_sendSensorStatus72
;debug.h,88 :: 		debugText = "1";
	MOVLW       ?lstr19_Main_327.0V+0
	MOVWF       _debugText+0 
	MOVLW       hi_addr(?lstr19_Main_327.0V+0)
	MOVWF       _debugText+1 
;debug.h,89 :: 		UART1_Write_Text(debugText);
	MOVF        _debugText+0, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVF        _debugText+1, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;debug.h,90 :: 		}
	GOTO        L_sendSensorStatus73
L_sendSensorStatus72:
;debug.h,91 :: 		else if( Sensor9 == 0){
	BTFSC       PORTB+0, 7 
	GOTO        L_sendSensorStatus74
;debug.h,92 :: 		debugText = "0";
	MOVLW       ?lstr20_Main_327.0V+0
	MOVWF       _debugText+0 
	MOVLW       hi_addr(?lstr20_Main_327.0V+0)
	MOVWF       _debugText+1 
;debug.h,93 :: 		UART1_Write_Text(debugText);
	MOVF        _debugText+0, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVF        _debugText+1, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;debug.h,94 :: 		}
L_sendSensorStatus74:
L_sendSensorStatus73:
;debug.h,96 :: 		if( Scout == 1){
	BTFSS       PORTB+0, 5 
	GOTO        L_sendSensorStatus75
;debug.h,97 :: 		debugText = " 1; ";
	MOVLW       ?lstr21_Main_327.0V+0
	MOVWF       _debugText+0 
	MOVLW       hi_addr(?lstr21_Main_327.0V+0)
	MOVWF       _debugText+1 
;debug.h,98 :: 		UART1_Write_Text(debugText);
	MOVF        _debugText+0, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVF        _debugText+1, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;debug.h,99 :: 		}
	GOTO        L_sendSensorStatus76
L_sendSensorStatus75:
;debug.h,100 :: 		else if( Scout == 0){
	BTFSC       PORTB+0, 5 
	GOTO        L_sendSensorStatus77
;debug.h,101 :: 		debugText = " 0; ";
	MOVLW       ?lstr22_Main_327.0V+0
	MOVWF       _debugText+0 
	MOVLW       hi_addr(?lstr22_Main_327.0V+0)
	MOVWF       _debugText+1 
;debug.h,102 :: 		UART1_Write_Text(debugText);
	MOVF        _debugText+0, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVF        _debugText+1, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;debug.h,103 :: 		}
L_sendSensorStatus77:
L_sendSensorStatus76:
;debug.h,104 :: 		}
	RETURN      0
; end of _sendSensorStatus

_sendText:

;debug.h,106 :: 		void sendText(char* aText){
;debug.h,107 :: 		UART1_Write_Text(aText);
	MOVF        FARG_sendText_aText+0, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVF        FARG_sendText_aText+1, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;debug.h,108 :: 		}
	RETURN      0
; end of _sendText

_testPIC:

;debug.h,110 :: 		void testPIC(){
;debug.h,111 :: 		moveForward(200,200);
	MOVLW       200
	MOVWF       FARG_moveForward_pwmLeft+0 
	MOVLW       0
	MOVWF       FARG_moveForward_pwmLeft+1 
	MOVLW       200
	MOVWF       FARG_moveForward_pwmRight+0 
	MOVLW       0
	MOVWF       FARG_moveForward_pwmRight+1 
	CALL        _moveForward+0, 0
;debug.h,112 :: 		debugText = "move Forward  ";
	MOVLW       ?lstr23_Main_327.0V+0
	MOVWF       _debugText+0 
	MOVLW       hi_addr(?lstr23_Main_327.0V+0)
	MOVWF       _debugText+1 
;debug.h,113 :: 		UART1_Write_Text(debugText);
	MOVF        _debugText+0, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVF        _debugText+1, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;debug.h,114 :: 		delay_ms(5000);
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
;debug.h,116 :: 		motorRight_foward(255);
	MOVLW       255
	MOVWF       FARG_motorRight_foward_pwm+0 
	MOVLW       0
	MOVWF       FARG_motorRight_foward_pwm+1 
	CALL        _motorRight_foward+0, 0
;debug.h,117 :: 		debugText = "turn Left";
	MOVLW       ?lstr24_Main_327.0V+0
	MOVWF       _debugText+0 
	MOVLW       hi_addr(?lstr24_Main_327.0V+0)
	MOVWF       _debugText+1 
;debug.h,118 :: 		UART1_Write_Text(debugText);
	MOVF        _debugText+0, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVF        _debugText+1, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;debug.h,119 :: 		motorLeft_stop();
	CALL        _motorLeft_stop+0, 0
;debug.h,120 :: 		delay_ms(5000);
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
;debug.h,122 :: 		motorLeft_foward(255);
	MOVLW       255
	MOVWF       FARG_motorLeft_foward_pwm+0 
	MOVLW       0
	MOVWF       FARG_motorLeft_foward_pwm+1 
	CALL        _motorLeft_foward+0, 0
;debug.h,123 :: 		debugText = "turn Right";
	MOVLW       ?lstr25_Main_327.0V+0
	MOVWF       _debugText+0 
	MOVLW       hi_addr(?lstr25_Main_327.0V+0)
	MOVWF       _debugText+1 
;debug.h,124 :: 		UART1_Write_Text(debugText);
	MOVF        _debugText+0, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVF        _debugText+1, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;debug.h,125 :: 		motorRight_stop();
	CALL        _motorRight_stop+0, 0
;debug.h,126 :: 		delay_ms(5000);
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
;debug.h,128 :: 		stop();
	CALL        _stop+0, 0
;debug.h,129 :: 		debugText = "Stopping..   ";
	MOVLW       ?lstr26_Main_327.0V+0
	MOVWF       _debugText+0 
	MOVLW       hi_addr(?lstr26_Main_327.0V+0)
	MOVWF       _debugText+1 
;debug.h,130 :: 		UART1_Write_Text(debugText);
	MOVF        _debugText+0, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVF        _debugText+1, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;debug.h,132 :: 		debugText = "Decrease PWM..   ";
	MOVLW       ?lstr27_Main_327.0V+0
	MOVWF       _debugText+0 
	MOVLW       hi_addr(?lstr27_Main_327.0V+0)
	MOVWF       _debugText+1 
;debug.h,133 :: 		UART1_Write_Text(debugText);
	MOVF        _debugText+0, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVF        _debugText+1, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;debug.h,135 :: 		for( count=255; count>0; count--){
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
	GOTO        L__testPIC992
	MOVF        _count+0, 0 
	SUBLW       0
L__testPIC992:
	BTFSC       STATUS+0, 0 
	GOTO        L_testPIC82
;debug.h,136 :: 		moveForward(count,count);
	MOVF        _count+0, 0 
	MOVWF       FARG_moveForward_pwmLeft+0 
	MOVF        _count+1, 0 
	MOVWF       FARG_moveForward_pwmLeft+1 
	MOVF        _count+0, 0 
	MOVWF       FARG_moveForward_pwmRight+0 
	MOVF        _count+1, 0 
	MOVWF       FARG_moveForward_pwmRight+1 
	CALL        _moveForward+0, 0
;debug.h,137 :: 		delay_ms(100);
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
;debug.h,135 :: 		for( count=255; count>0; count--){
	MOVLW       1
	SUBWF       _count+0, 1 
	MOVLW       0
	SUBWFB      _count+1, 1 
;debug.h,140 :: 		}
	GOTO        L_testPIC81
L_testPIC82:
;debug.h,141 :: 		}
	RETURN      0
; end of _testPIC

_setPID:

;linefollow.h,19 :: 		void setPID(){
;linefollow.h,20 :: 		MIN_RPM = 215;       //155
	MOVLW       215
	MOVWF       _MIN_RPM+0 
	MOVLW       0
	MOVWF       _MIN_RPM+1 
;linefollow.h,21 :: 		MID_RPM = 235;
	MOVLW       235
	MOVWF       _MID_RPM+0 
	MOVLW       0
	MOVWF       _MID_RPM+1 
;linefollow.h,22 :: 		MAX_RPM = 255;
	MOVLW       255
	MOVWF       _MAX_RPM+0 
	MOVLW       0
	MOVWF       _MAX_RPM+1 
;linefollow.h,23 :: 		TEST_RPM = 200;
	MOVLW       200
	MOVWF       _TEST_RPM+0 
	MOVLW       0
	MOVWF       _TEST_RPM+1 
;linefollow.h,26 :: 		SLOW_PWM = 255;
	MOVLW       255
	MOVWF       _SLOW_PWM+0 
	MOVLW       0
	MOVWF       _SLOW_PWM+1 
;linefollow.h,27 :: 		MID_PWM = 200;
	MOVLW       200
	MOVWF       _MID_PWM+0 
	MOVLW       0
	MOVWF       _MID_PWM+1 
;linefollow.h,28 :: 		FAST_PWM = 255;
	MOVLW       255
	MOVWF       _FAST_PWM+0 
	MOVLW       0
	MOVWF       _FAST_PWM+1 
;linefollow.h,30 :: 		Kp = 2;
	MOVLW       0
	MOVWF       _Kp+0 
	MOVLW       0
	MOVWF       _Kp+1 
	MOVLW       0
	MOVWF       _Kp+2 
	MOVLW       128
	MOVWF       _Kp+3 
;linefollow.h,31 :: 		Ki = 0;
	CLRF        _Ki+0 
	CLRF        _Ki+1 
	CLRF        _Ki+2 
	CLRF        _Ki+3 
;linefollow.h,32 :: 		Kd = 0;
	CLRF        _Kd+0 
	CLRF        _Kd+1 
	CLRF        _Kd+2 
	CLRF        _Kd+3 
;linefollow.h,34 :: 		totalError = 0;
	CLRF        _totalError+0 
	CLRF        _totalError+1 
	CLRF        _totalError+2 
	CLRF        _totalError+3 
;linefollow.h,35 :: 		previousDeviation = 0;
	CLRF        _previousDeviation+0 
	CLRF        _previousDeviation+1 
;linefollow.h,36 :: 		PID_LeftRPM = 0;
	CLRF        _PID_LeftRPM+0 
	CLRF        _PID_LeftRPM+1 
;linefollow.h,37 :: 		PID_RightRPM = 0;
	CLRF        _PID_RightRPM+0 
	CLRF        _PID_RightRPM+1 
;linefollow.h,39 :: 		Pwm1_Set_Duty(MID_RPM);
	MOVLW       235
	MOVWF       FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;linefollow.h,40 :: 		Pwm2_Set_Duty(MID_RPM);
	MOVF        _MID_RPM+0, 0 
	MOVWF       FARG_PWM2_Set_Duty_new_duty+0 
	CALL        _PWM2_Set_Duty+0, 0
;linefollow.h,41 :: 		}
	RETURN      0
; end of _setPID

_lineFollowPID:

;linefollow.h,43 :: 		void lineFollowPID(){
;linefollow.h,66 :: 		if( Sensor3==1 && Sensor4==0 && Sensor5==0 && Sensor6==0 && Sensor7==0)
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
L__lineFollowPID840:
;linefollow.h,67 :: 		deviation = 15;
	MOVLW       15
	MOVWF       _deviation+0 
	MOVLW       0
	MOVWF       _deviation+1 
L_lineFollowPID87:
;linefollow.h,68 :: 		if( Sensor3==1 && Sensor4==1 && Sensor5==0 && Sensor6==0 && Sensor7==0)
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
L__lineFollowPID839:
;linefollow.h,69 :: 		deviation = 10;
	MOVLW       10
	MOVWF       _deviation+0 
	MOVLW       0
	MOVWF       _deviation+1 
L_lineFollowPID90:
;linefollow.h,70 :: 		if( Sensor3==1 && Sensor4==1 && Sensor5==1 && Sensor6==0 && Sensor7==0)
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
L__lineFollowPID838:
;linefollow.h,71 :: 		deviation = 4;
	MOVLW       4
	MOVWF       _deviation+0 
	MOVLW       0
	MOVWF       _deviation+1 
L_lineFollowPID93:
;linefollow.h,72 :: 		if( Sensor3==0 && Sensor4==1 && Sensor5==0 && Sensor6==0 && Sensor7==0)
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
L__lineFollowPID837:
;linefollow.h,73 :: 		deviation = 1;
	MOVLW       1
	MOVWF       _deviation+0 
	MOVLW       0
	MOVWF       _deviation+1 
L_lineFollowPID96:
;linefollow.h,75 :: 		if( Sensor3==0 && Sensor4==1 && Sensor5==1 && Sensor6==0 && Sensor7==0)
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
L__lineFollowPID836:
;linefollow.h,76 :: 		deviation = 0;
	CLRF        _deviation+0 
	CLRF        _deviation+1 
L_lineFollowPID99:
;linefollow.h,77 :: 		if( Sensor3==0 && Sensor4==1 && Sensor5==1 && Sensor6==1 && Sensor7==0)
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
L__lineFollowPID835:
;linefollow.h,78 :: 		deviation = 0;
	CLRF        _deviation+0 
	CLRF        _deviation+1 
L_lineFollowPID102:
;linefollow.h,79 :: 		if( Sensor3==0 && Sensor4==0 && Sensor5==1 && Sensor6==0 && Sensor7==0)
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
L__lineFollowPID834:
;linefollow.h,80 :: 		deviation = 0;
	CLRF        _deviation+0 
	CLRF        _deviation+1 
L_lineFollowPID105:
;linefollow.h,81 :: 		if( Sensor3==0 && Sensor4==0 && Sensor5==1 && Sensor6==1 && Sensor7==0)
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
L__lineFollowPID833:
;linefollow.h,82 :: 		deviation = 0;
	CLRF        _deviation+0 
	CLRF        _deviation+1 
L_lineFollowPID108:
;linefollow.h,84 :: 		if( Sensor3==0 && Sensor4==0 && Sensor5==0 && Sensor6==1 && Sensor7==0)
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
L__lineFollowPID832:
;linefollow.h,85 :: 		deviation = -1;
	MOVLW       255
	MOVWF       _deviation+0 
	MOVLW       255
	MOVWF       _deviation+1 
L_lineFollowPID111:
;linefollow.h,86 :: 		if( Sensor3==0 && Sensor4==0 && Sensor5==1 && Sensor6==1 && Sensor7==1)
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
L__lineFollowPID831:
;linefollow.h,87 :: 		deviation = -4;
	MOVLW       252
	MOVWF       _deviation+0 
	MOVLW       255
	MOVWF       _deviation+1 
L_lineFollowPID114:
;linefollow.h,88 :: 		if( Sensor3==0 && Sensor4==0 && Sensor5==0 && Sensor6==1 && Sensor7==1)
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
L__lineFollowPID830:
;linefollow.h,89 :: 		deviation = -10;
	MOVLW       246
	MOVWF       _deviation+0 
	MOVLW       255
	MOVWF       _deviation+1 
L_lineFollowPID117:
;linefollow.h,90 :: 		if( Sensor3==0 && Sensor4==0 && Sensor5==0 && Sensor6==0 && Sensor7==1)
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
L__lineFollowPID829:
;linefollow.h,91 :: 		deviation = -15;
	MOVLW       241
	MOVWF       _deviation+0 
	MOVLW       255
	MOVWF       _deviation+1 
L_lineFollowPID120:
;linefollow.h,93 :: 		correction =  Kp*deviation + Ki*totalError + Kd*(deviation-previousDeviation);
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
;linefollow.h,94 :: 		totalError += correction;
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
;linefollow.h,95 :: 		previousDeviation = deviation;
	MOVF        _deviation+0, 0 
	MOVWF       _previousDeviation+0 
	MOVF        _deviation+1, 0 
	MOVWF       _previousDeviation+1 
;linefollow.h,97 :: 		PID_LeftRPM = MID_RPM + correction;
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
;linefollow.h,98 :: 		PID_RightRPM = MID_RPM - correction;
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
;linefollow.h,100 :: 		moveForward(PID_LeftRPM, PID_RightRPM);
	MOVF        FLOC__lineFollowPID+0, 0 
	MOVWF       FARG_moveForward_pwmLeft+0 
	MOVF        FLOC__lineFollowPID+1, 0 
	MOVWF       FARG_moveForward_pwmLeft+1 
	MOVF        R0, 0 
	MOVWF       FARG_moveForward_pwmRight+0 
	MOVF        R1, 0 
	MOVWF       FARG_moveForward_pwmRight+1 
	CALL        _moveForward+0, 0
;linefollow.h,106 :: 		}
	RETURN      0
; end of _lineFollowPID

_lineFollowNormalWorked:

;linefollow.h,108 :: 		void lineFollowNormalWorked(){
;linefollow.h,109 :: 		if(Scout == 1){
	BTFSS       PORTB+0, 5 
	GOTO        L_lineFollowNormalWorked121
;linefollow.h,111 :: 		if( Sensor3==0 && Sensor4==1 && Sensor5==1 && Sensor6==0 && Sensor7==0)
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
L__lineFollowNormalWorked878:
;linefollow.h,112 :: 		moveForward(SLOW_PWM,FAST_PWM);
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
;linefollow.h,113 :: 		else if( Sensor3==0 && Sensor4==1 && Sensor5==1 && Sensor6==1 && Sensor7==0)
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
L__lineFollowNormalWorked877:
;linefollow.h,114 :: 		moveForward(FAST_PWM,FAST_PWM);
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
;linefollow.h,115 :: 		else if( Sensor3==0 && Sensor4==0 && Sensor5==1 && Sensor6==0 && Sensor7==0)
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
L__lineFollowNormalWorked876:
;linefollow.h,116 :: 		moveForward(FAST_PWM,FAST_PWM);
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
;linefollow.h,117 :: 		else if( Sensor3==0 && Sensor4==0 && Sensor5==1 && Sensor6==1 && Sensor7==0)
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
L__lineFollowNormalWorked875:
;linefollow.h,118 :: 		moveForward(FAST_PWM,SLOW_PWM);
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
;linefollow.h,123 :: 		else if( Sensor3==1 && Sensor4==0 && Sensor5==0 && Sensor6==0 && Sensor7==0)
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
L__lineFollowNormalWorked874:
;linefollow.h,125 :: 		turnLeft(FAST_PWM);
	MOVF        _FAST_PWM+0, 0 
	MOVWF       FARG_turnLeft_pwmRight+0 
	MOVF        _FAST_PWM+1, 0 
	MOVWF       FARG_turnLeft_pwmRight+1 
	CALL        _turnLeft+0, 0
	GOTO        L_lineFollowNormalWorked141
L_lineFollowNormalWorked140:
;linefollow.h,126 :: 		else if( Sensor3==1 && Sensor4==1 && Sensor5==0 && Sensor6==0 && Sensor7==0)
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
L__lineFollowNormalWorked873:
;linefollow.h,128 :: 		turnLeft(FAST_PWM);
	MOVF        _FAST_PWM+0, 0 
	MOVWF       FARG_turnLeft_pwmRight+0 
	MOVF        _FAST_PWM+1, 0 
	MOVWF       FARG_turnLeft_pwmRight+1 
	CALL        _turnLeft+0, 0
	GOTO        L_lineFollowNormalWorked145
L_lineFollowNormalWorked144:
;linefollow.h,129 :: 		else if( Sensor3==1 && Sensor4==1 && Sensor5==1 && Sensor6==0 && Sensor7==0)
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
L__lineFollowNormalWorked872:
;linefollow.h,131 :: 		turnLeft(FAST_PWM);
	MOVF        _FAST_PWM+0, 0 
	MOVWF       FARG_turnLeft_pwmRight+0 
	MOVF        _FAST_PWM+1, 0 
	MOVWF       FARG_turnLeft_pwmRight+1 
	CALL        _turnLeft+0, 0
	GOTO        L_lineFollowNormalWorked149
L_lineFollowNormalWorked148:
;linefollow.h,132 :: 		else if( Sensor3==0 && Sensor4==1 && Sensor5==0 && Sensor6==0 && Sensor7==0)
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
L__lineFollowNormalWorked871:
;linefollow.h,134 :: 		turnLeft(FAST_PWM);
	MOVF        _FAST_PWM+0, 0 
	MOVWF       FARG_turnLeft_pwmRight+0 
	MOVF        _FAST_PWM+1, 0 
	MOVWF       FARG_turnLeft_pwmRight+1 
	CALL        _turnLeft+0, 0
	GOTO        L_lineFollowNormalWorked153
L_lineFollowNormalWorked152:
;linefollow.h,137 :: 		else if( Sensor3==0 && Sensor4==0 && Sensor5==0 && Sensor6==1 && Sensor7==0)
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
L__lineFollowNormalWorked870:
;linefollow.h,139 :: 		turnRight(FAST_PWM);
	MOVF        _FAST_PWM+0, 0 
	MOVWF       FARG_turnRight_pwmLeft+0 
	MOVF        _FAST_PWM+1, 0 
	MOVWF       FARG_turnRight_pwmLeft+1 
	CALL        _turnRight+0, 0
	GOTO        L_lineFollowNormalWorked157
L_lineFollowNormalWorked156:
;linefollow.h,140 :: 		else if( Sensor3==0 && Sensor4==0 && Sensor5==1 && Sensor6==1 && Sensor7==1)
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
L__lineFollowNormalWorked869:
;linefollow.h,142 :: 		turnRight(FAST_PWM);
	MOVF        _FAST_PWM+0, 0 
	MOVWF       FARG_turnRight_pwmLeft+0 
	MOVF        _FAST_PWM+1, 0 
	MOVWF       FARG_turnRight_pwmLeft+1 
	CALL        _turnRight+0, 0
	GOTO        L_lineFollowNormalWorked161
L_lineFollowNormalWorked160:
;linefollow.h,143 :: 		else if( Sensor3==0 && Sensor4==0 && Sensor5==0 && Sensor6==1 && Sensor7==1)
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
L__lineFollowNormalWorked868:
;linefollow.h,145 :: 		turnRight(FAST_PWM);
	MOVF        _FAST_PWM+0, 0 
	MOVWF       FARG_turnRight_pwmLeft+0 
	MOVF        _FAST_PWM+1, 0 
	MOVWF       FARG_turnRight_pwmLeft+1 
	CALL        _turnRight+0, 0
	GOTO        L_lineFollowNormalWorked165
L_lineFollowNormalWorked164:
;linefollow.h,146 :: 		else if( Sensor3==0 && Sensor4==0 && Sensor5==0 && Sensor6==0 && Sensor7==1)
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
L__lineFollowNormalWorked867:
;linefollow.h,148 :: 		turnRight(FAST_PWM);
	MOVF        _FAST_PWM+0, 0 
	MOVWF       FARG_turnRight_pwmLeft+0 
	MOVF        _FAST_PWM+1, 0 
	MOVWF       FARG_turnRight_pwmLeft+1 
	CALL        _turnRight+0, 0
	GOTO        L_lineFollowNormalWorked169
L_lineFollowNormalWorked168:
;linefollow.h,151 :: 		else if( Sensor3==1 && Sensor4==1 && Sensor5==1 && Sensor6==1 && Sensor7==0)
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
L__lineFollowNormalWorked866:
;linefollow.h,152 :: 		moveForward(FAST_PWM,FAST_PWM);
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
;linefollow.h,153 :: 		else if( Sensor3==0 && Sensor4==1 && Sensor5==1 && Sensor6==1 && Sensor7==1)
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
L__lineFollowNormalWorked865:
;linefollow.h,154 :: 		moveForward(FAST_PWM,FAST_PWM);
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
;linefollow.h,155 :: 		else if( Sensor1==0 && Sensor2==0 && Sensor3==0 && Sensor4==0 && Sensor5==0 && Sensor6==0 && Sensor7==0 && Sensor8==0 && Sensor9==0)
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
L__lineFollowNormalWorked864:
;linefollow.h,156 :: 		moveForward(255,255);
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
;linefollow.h,158 :: 		else if(isAllBlack()){
	CALL        _isAllBlack+0, 0
	MOVF        R0, 0 
	IORWF       R1, 0 
	BTFSC       STATUS+0, 2 
	GOTO        L_lineFollowNormalWorked182
;linefollow.h,161 :: 		sendSensorStatus();
	CALL        _sendSensorStatus+0, 0
;linefollow.h,162 :: 		}
	GOTO        L_lineFollowNormalWorked183
L_lineFollowNormalWorked182:
;linefollow.h,165 :: 		reverse(220,220);
	MOVLW       220
	MOVWF       FARG_reverse_pwmLeft+0 
	MOVLW       0
	MOVWF       FARG_reverse_pwmLeft+1 
	MOVLW       220
	MOVWF       FARG_reverse_pwmRight+0 
	MOVLW       0
	MOVWF       FARG_reverse_pwmRight+1 
	CALL        _reverse+0, 0
;linefollow.h,166 :: 		sendSensorStatus();
	CALL        _sendSensorStatus+0, 0
;linefollow.h,168 :: 		}
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
;linefollow.h,169 :: 		}
	GOTO        L_lineFollowNormalWorked184
L_lineFollowNormalWorked121:
;linefollow.h,176 :: 		if( Sensor1==1 && Sensor2==1 && Sensor3==1 && Sensor4==1 && Sensor5==1 && Sensor6==0 && Sensor7==0 && Sensor8==0 && Sensor9==0)
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
L__lineFollowNormalWorked863:
;linefollow.h,177 :: 		rotateByDegree(-90);
	MOVLW       166
	MOVWF       FARG_rotateByDegree_degree+0 
	MOVLW       255
	MOVWF       FARG_rotateByDegree_degree+1 
	CALL        _rotateByDegree+0, 0
	GOTO        L_lineFollowNormalWorked188
L_lineFollowNormalWorked187:
;linefollow.h,178 :: 		else if( Sensor1==1 && Sensor2==1 && Sensor3==1 && Sensor4==1 && Sensor5==1 && Sensor6==1 && Sensor7==0 && Sensor8==0 && Sensor9==0)
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
L__lineFollowNormalWorked862:
;linefollow.h,179 :: 		rotateByDegree(-90);
	MOVLW       166
	MOVWF       FARG_rotateByDegree_degree+0 
	MOVLW       255
	MOVWF       FARG_rotateByDegree_degree+1 
	CALL        _rotateByDegree+0, 0
	GOTO        L_lineFollowNormalWorked192
L_lineFollowNormalWorked191:
;linefollow.h,180 :: 		else if( Sensor1==1 && Sensor2==1 && Sensor3==1 && Sensor4==1 && Sensor5==1 && Sensor6==1 && Sensor7==1 && Sensor8==0 && Sensor9==0)
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
L__lineFollowNormalWorked861:
;linefollow.h,181 :: 		rotateByDegree(-90);
	MOVLW       166
	MOVWF       FARG_rotateByDegree_degree+0 
	MOVLW       255
	MOVWF       FARG_rotateByDegree_degree+1 
	CALL        _rotateByDegree+0, 0
	GOTO        L_lineFollowNormalWorked196
L_lineFollowNormalWorked195:
;linefollow.h,184 :: 		else if( Sensor1==0 && Sensor2==0 && Sensor3==1 && Sensor4==1 && Sensor5==1 && Sensor6==1 && Sensor7==1 && Sensor8==1 && Sensor9==1)
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
L__lineFollowNormalWorked860:
;linefollow.h,185 :: 		rotateByDegree(90);
	MOVLW       90
	MOVWF       FARG_rotateByDegree_degree+0 
	MOVLW       0
	MOVWF       FARG_rotateByDegree_degree+1 
	CALL        _rotateByDegree+0, 0
	GOTO        L_lineFollowNormalWorked200
L_lineFollowNormalWorked199:
;linefollow.h,186 :: 		else if( Sensor1==0 && Sensor2==0 && Sensor3==0 && Sensor4==1 && Sensor5==1 && Sensor6==1 && Sensor7==1 && Sensor8==1 && Sensor9==1)
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
L__lineFollowNormalWorked859:
;linefollow.h,187 :: 		rotateByDegree(90);
	MOVLW       90
	MOVWF       FARG_rotateByDegree_degree+0 
	MOVLW       0
	MOVWF       FARG_rotateByDegree_degree+1 
	CALL        _rotateByDegree+0, 0
	GOTO        L_lineFollowNormalWorked204
L_lineFollowNormalWorked203:
;linefollow.h,188 :: 		else if( Sensor1==0 && Sensor2==0 && Sensor3==0 && Sensor4==0 && Sensor5==1 && Sensor6==1 && Sensor7==1 && Sensor8==1 && Sensor9==1)
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
L__lineFollowNormalWorked858:
;linefollow.h,189 :: 		rotateByDegree(90);
	MOVLW       90
	MOVWF       FARG_rotateByDegree_degree+0 
	MOVLW       0
	MOVWF       FARG_rotateByDegree_degree+1 
	CALL        _rotateByDegree+0, 0
	GOTO        L_lineFollowNormalWorked208
L_lineFollowNormalWorked207:
;linefollow.h,194 :: 		else if( Sensor3==1 && Sensor4==0 && Sensor5==0 && Sensor6==0 && Sensor7==0)
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
L__lineFollowNormalWorked857:
;linefollow.h,196 :: 		turnLeft(FAST_PWM);
	MOVF        _FAST_PWM+0, 0 
	MOVWF       FARG_turnLeft_pwmRight+0 
	MOVF        _FAST_PWM+1, 0 
	MOVWF       FARG_turnLeft_pwmRight+1 
	CALL        _turnLeft+0, 0
	GOTO        L_lineFollowNormalWorked212
L_lineFollowNormalWorked211:
;linefollow.h,197 :: 		else if( Sensor3==1 && Sensor4==1 && Sensor5==0 && Sensor6==0 && Sensor7==0)
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
L__lineFollowNormalWorked856:
;linefollow.h,199 :: 		turnLeft(FAST_PWM);
	MOVF        _FAST_PWM+0, 0 
	MOVWF       FARG_turnLeft_pwmRight+0 
	MOVF        _FAST_PWM+1, 0 
	MOVWF       FARG_turnLeft_pwmRight+1 
	CALL        _turnLeft+0, 0
	GOTO        L_lineFollowNormalWorked216
L_lineFollowNormalWorked215:
;linefollow.h,200 :: 		else if( Sensor3==1 && Sensor4==1 && Sensor5==1 && Sensor6==0 && Sensor7==0)
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
L__lineFollowNormalWorked855:
;linefollow.h,202 :: 		turnLeft(FAST_PWM);
	MOVF        _FAST_PWM+0, 0 
	MOVWF       FARG_turnLeft_pwmRight+0 
	MOVF        _FAST_PWM+1, 0 
	MOVWF       FARG_turnLeft_pwmRight+1 
	CALL        _turnLeft+0, 0
	GOTO        L_lineFollowNormalWorked220
L_lineFollowNormalWorked219:
;linefollow.h,203 :: 		else if( Sensor3==0 && Sensor4==1 && Sensor5==0 && Sensor6==0 && Sensor7==0)
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
L__lineFollowNormalWorked854:
;linefollow.h,205 :: 		turnLeft(FAST_PWM);
	MOVF        _FAST_PWM+0, 0 
	MOVWF       FARG_turnLeft_pwmRight+0 
	MOVF        _FAST_PWM+1, 0 
	MOVWF       FARG_turnLeft_pwmRight+1 
	CALL        _turnLeft+0, 0
	GOTO        L_lineFollowNormalWorked224
L_lineFollowNormalWorked223:
;linefollow.h,208 :: 		else if( Sensor3==0 && Sensor4==0 && Sensor5==0 && Sensor6==1 && Sensor7==0)
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
L__lineFollowNormalWorked853:
;linefollow.h,210 :: 		turnRight(FAST_PWM);
	MOVF        _FAST_PWM+0, 0 
	MOVWF       FARG_turnRight_pwmLeft+0 
	MOVF        _FAST_PWM+1, 0 
	MOVWF       FARG_turnRight_pwmLeft+1 
	CALL        _turnRight+0, 0
	GOTO        L_lineFollowNormalWorked228
L_lineFollowNormalWorked227:
;linefollow.h,211 :: 		else if( Sensor3==0 && Sensor4==0 && Sensor5==1 && Sensor6==1 && Sensor7==1)
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
L__lineFollowNormalWorked852:
;linefollow.h,213 :: 		turnRight(FAST_PWM);
	MOVF        _FAST_PWM+0, 0 
	MOVWF       FARG_turnRight_pwmLeft+0 
	MOVF        _FAST_PWM+1, 0 
	MOVWF       FARG_turnRight_pwmLeft+1 
	CALL        _turnRight+0, 0
	GOTO        L_lineFollowNormalWorked232
L_lineFollowNormalWorked231:
;linefollow.h,214 :: 		else if( Sensor3==0 && Sensor4==0 && Sensor5==0 && Sensor6==1 && Sensor7==1)
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
L__lineFollowNormalWorked851:
;linefollow.h,216 :: 		turnRight(FAST_PWM);
	MOVF        _FAST_PWM+0, 0 
	MOVWF       FARG_turnRight_pwmLeft+0 
	MOVF        _FAST_PWM+1, 0 
	MOVWF       FARG_turnRight_pwmLeft+1 
	CALL        _turnRight+0, 0
	GOTO        L_lineFollowNormalWorked236
L_lineFollowNormalWorked235:
;linefollow.h,217 :: 		else if( Sensor3==0 && Sensor4==0 && Sensor5==0 && Sensor6==0 && Sensor7==1)
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
L__lineFollowNormalWorked850:
;linefollow.h,219 :: 		turnRight(FAST_PWM);
	MOVF        _FAST_PWM+0, 0 
	MOVWF       FARG_turnRight_pwmLeft+0 
	MOVF        _FAST_PWM+1, 0 
	MOVWF       FARG_turnRight_pwmLeft+1 
	CALL        _turnRight+0, 0
	GOTO        L_lineFollowNormalWorked240
L_lineFollowNormalWorked239:
;linefollow.h,222 :: 		else if( Sensor3==1 && Sensor4==1 && Sensor5==1 && Sensor6==1 && Sensor7==0)
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
L__lineFollowNormalWorked849:
;linefollow.h,223 :: 		moveForward(SLOW_PWM,FAST_PWM);
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
;linefollow.h,224 :: 		else if( Sensor3==0 && Sensor4==1 && Sensor5==1 && Sensor6==1 && Sensor7==1)
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
L__lineFollowNormalWorked848:
;linefollow.h,225 :: 		moveForward(FAST_PWM,SLOW_PWM);
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
;linefollow.h,226 :: 		else if( Sensor2==1 && Sensor3==1 && Sensor4==1 && Sensor5==0 && Sensor6==1 && Sensor7==1 && Sensor8==1)
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
L__lineFollowNormalWorked847:
;linefollow.h,227 :: 		while(Scout==0)
L_lineFollowNormalWorked252:
	BTFSC       PORTB+0, 5 
	GOTO        L_lineFollowNormalWorked253
;linefollow.h,228 :: 		rotateAntiClockwise(255);
	MOVLW       255
	MOVWF       FARG_rotateAntiClockwise_pwm+0 
	MOVLW       0
	MOVWF       FARG_rotateAntiClockwise_pwm+1 
	CALL        _rotateAntiClockwise+0, 0
	GOTO        L_lineFollowNormalWorked252
L_lineFollowNormalWorked253:
	GOTO        L_lineFollowNormalWorked254
L_lineFollowNormalWorked251:
;linefollow.h,229 :: 		else if( Sensor1==0 && Sensor2==0 && Sensor3==0 && Sensor4==0 && Sensor5==0 && Sensor6==0 && Sensor7==0 && Sensor8==1 && Sensor9==1)
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
L__lineFollowNormalWorked846:
;linefollow.h,230 :: 		while(Scout==0)
L_lineFollowNormalWorked258:
	BTFSC       PORTB+0, 5 
	GOTO        L_lineFollowNormalWorked259
;linefollow.h,231 :: 		rotateClockwise(255);
	MOVLW       255
	MOVWF       FARG_rotateClockwise_pwm+0 
	MOVLW       0
	MOVWF       FARG_rotateClockwise_pwm+1 
	CALL        _rotateClockwise+0, 0
	GOTO        L_lineFollowNormalWorked258
L_lineFollowNormalWorked259:
	GOTO        L_lineFollowNormalWorked260
L_lineFollowNormalWorked257:
;linefollow.h,232 :: 		else if( Sensor1==1 && Sensor2==1 && Sensor3==0 && Sensor4==0 && Sensor5==0 && Sensor6==0 && Sensor7==0 && Sensor8==0 && Sensor9==0)
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
L__lineFollowNormalWorked845:
;linefollow.h,233 :: 		while(Scout==0)
L_lineFollowNormalWorked264:
	BTFSC       PORTB+0, 5 
	GOTO        L_lineFollowNormalWorked265
;linefollow.h,234 :: 		rotateAntiClockwise(255);
	MOVLW       255
	MOVWF       FARG_rotateAntiClockwise_pwm+0 
	MOVLW       0
	MOVWF       FARG_rotateAntiClockwise_pwm+1 
	CALL        _rotateAntiClockwise+0, 0
	GOTO        L_lineFollowNormalWorked264
L_lineFollowNormalWorked265:
	GOTO        L_lineFollowNormalWorked266
L_lineFollowNormalWorked263:
;linefollow.h,237 :: 		else if( Sensor3==0 && Sensor4==1 && Sensor5==1 && Sensor6==0 && Sensor7==0)
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
L__lineFollowNormalWorked844:
;linefollow.h,238 :: 		moveForward(SLOW_PWM,FAST_PWM);
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
;linefollow.h,239 :: 		else if( Sensor3==0 && Sensor4==1 && Sensor5==1 && Sensor6==1 && Sensor7==0)
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
L__lineFollowNormalWorked843:
;linefollow.h,240 :: 		moveForward(FAST_PWM,FAST_PWM);
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
;linefollow.h,241 :: 		else if( Sensor3==0 && Sensor4==0 && Sensor5==1 && Sensor6==0 && Sensor7==0)
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
L__lineFollowNormalWorked842:
;linefollow.h,242 :: 		moveForward(FAST_PWM,FAST_PWM);
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
;linefollow.h,243 :: 		else if( Sensor3==0 && Sensor4==0 && Sensor5==1 && Sensor6==1 && Sensor7==0)
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
L__lineFollowNormalWorked841:
;linefollow.h,244 :: 		moveForward(FAST_PWM,SLOW_PWM);
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
;linefollow.h,247 :: 		else if(isAllWhite()){
	CALL        _isAllWhite+0, 0
	MOVF        R0, 0 
	IORWF       R1, 0 
	BTFSC       STATUS+0, 2 
	GOTO        L_lineFollowNormalWorked283
;linefollow.h,250 :: 		sendSensorStatus();
	CALL        _sendSensorStatus+0, 0
;linefollow.h,251 :: 		}
	GOTO        L_lineFollowNormalWorked284
L_lineFollowNormalWorked283:
;linefollow.h,254 :: 		reverse(220,220);
	MOVLW       220
	MOVWF       FARG_reverse_pwmLeft+0 
	MOVLW       0
	MOVWF       FARG_reverse_pwmLeft+1 
	MOVLW       220
	MOVWF       FARG_reverse_pwmRight+0 
	MOVLW       0
	MOVWF       FARG_reverse_pwmRight+1 
	CALL        _reverse+0, 0
;linefollow.h,255 :: 		sendSensorStatus();
	CALL        _sendSensorStatus+0, 0
;linefollow.h,257 :: 		}
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
;linefollow.h,258 :: 		}
L_lineFollowNormalWorked184:
;linefollow.h,259 :: 		}
	RETURN      0
; end of _lineFollowNormalWorked

_lineFollowNormalWorkedForLast:

;linefollow.h,261 :: 		void lineFollowNormalWorkedForLast(){
;linefollow.h,262 :: 		if(Scout == 1){
	BTFSS       PORTB+0, 5 
	GOTO        L_lineFollowNormalWorkedForLast285
;linefollow.h,264 :: 		if( Sensor3==0 && Sensor4==1 && Sensor5==1 && Sensor6==0 && Sensor7==0)
	BTFSC       PORTD+0, 4 
	GOTO        L_lineFollowNormalWorkedForLast288
	BTFSS       PORTD+0, 5 
	GOTO        L_lineFollowNormalWorkedForLast288
	BTFSS       PORTD+0, 6 
	GOTO        L_lineFollowNormalWorkedForLast288
	BTFSC       PORTD+0, 7 
	GOTO        L_lineFollowNormalWorkedForLast288
	BTFSC       PORTB+0, 2 
	GOTO        L_lineFollowNormalWorkedForLast288
L__lineFollowNormalWorkedForLast916:
;linefollow.h,265 :: 		moveForward(SLOW_PWM,FAST_PWM);
	MOVF        _SLOW_PWM+0, 0 
	MOVWF       FARG_moveForward_pwmLeft+0 
	MOVF        _SLOW_PWM+1, 0 
	MOVWF       FARG_moveForward_pwmLeft+1 
	MOVF        _FAST_PWM+0, 0 
	MOVWF       FARG_moveForward_pwmRight+0 
	MOVF        _FAST_PWM+1, 0 
	MOVWF       FARG_moveForward_pwmRight+1 
	CALL        _moveForward+0, 0
	GOTO        L_lineFollowNormalWorkedForLast289
L_lineFollowNormalWorkedForLast288:
;linefollow.h,266 :: 		else if( Sensor3==0 && Sensor4==1 && Sensor5==1 && Sensor6==1 && Sensor7==0)
	BTFSC       PORTD+0, 4 
	GOTO        L_lineFollowNormalWorkedForLast292
	BTFSS       PORTD+0, 5 
	GOTO        L_lineFollowNormalWorkedForLast292
	BTFSS       PORTD+0, 6 
	GOTO        L_lineFollowNormalWorkedForLast292
	BTFSS       PORTD+0, 7 
	GOTO        L_lineFollowNormalWorkedForLast292
	BTFSC       PORTB+0, 2 
	GOTO        L_lineFollowNormalWorkedForLast292
L__lineFollowNormalWorkedForLast915:
;linefollow.h,267 :: 		moveForward(FAST_PWM,FAST_PWM);
	MOVF        _FAST_PWM+0, 0 
	MOVWF       FARG_moveForward_pwmLeft+0 
	MOVF        _FAST_PWM+1, 0 
	MOVWF       FARG_moveForward_pwmLeft+1 
	MOVF        _FAST_PWM+0, 0 
	MOVWF       FARG_moveForward_pwmRight+0 
	MOVF        _FAST_PWM+1, 0 
	MOVWF       FARG_moveForward_pwmRight+1 
	CALL        _moveForward+0, 0
	GOTO        L_lineFollowNormalWorkedForLast293
L_lineFollowNormalWorkedForLast292:
;linefollow.h,268 :: 		else if( Sensor3==0 && Sensor4==0 && Sensor5==1 && Sensor6==0 && Sensor7==0)
	BTFSC       PORTD+0, 4 
	GOTO        L_lineFollowNormalWorkedForLast296
	BTFSC       PORTD+0, 5 
	GOTO        L_lineFollowNormalWorkedForLast296
	BTFSS       PORTD+0, 6 
	GOTO        L_lineFollowNormalWorkedForLast296
	BTFSC       PORTD+0, 7 
	GOTO        L_lineFollowNormalWorkedForLast296
	BTFSC       PORTB+0, 2 
	GOTO        L_lineFollowNormalWorkedForLast296
L__lineFollowNormalWorkedForLast914:
;linefollow.h,269 :: 		moveForward(FAST_PWM,FAST_PWM);
	MOVF        _FAST_PWM+0, 0 
	MOVWF       FARG_moveForward_pwmLeft+0 
	MOVF        _FAST_PWM+1, 0 
	MOVWF       FARG_moveForward_pwmLeft+1 
	MOVF        _FAST_PWM+0, 0 
	MOVWF       FARG_moveForward_pwmRight+0 
	MOVF        _FAST_PWM+1, 0 
	MOVWF       FARG_moveForward_pwmRight+1 
	CALL        _moveForward+0, 0
	GOTO        L_lineFollowNormalWorkedForLast297
L_lineFollowNormalWorkedForLast296:
;linefollow.h,270 :: 		else if( Sensor3==0 && Sensor4==0 && Sensor5==1 && Sensor6==1 && Sensor7==0)
	BTFSC       PORTD+0, 4 
	GOTO        L_lineFollowNormalWorkedForLast300
	BTFSC       PORTD+0, 5 
	GOTO        L_lineFollowNormalWorkedForLast300
	BTFSS       PORTD+0, 6 
	GOTO        L_lineFollowNormalWorkedForLast300
	BTFSS       PORTD+0, 7 
	GOTO        L_lineFollowNormalWorkedForLast300
	BTFSC       PORTB+0, 2 
	GOTO        L_lineFollowNormalWorkedForLast300
L__lineFollowNormalWorkedForLast913:
;linefollow.h,271 :: 		moveForward(FAST_PWM,SLOW_PWM);
	MOVF        _FAST_PWM+0, 0 
	MOVWF       FARG_moveForward_pwmLeft+0 
	MOVF        _FAST_PWM+1, 0 
	MOVWF       FARG_moveForward_pwmLeft+1 
	MOVF        _SLOW_PWM+0, 0 
	MOVWF       FARG_moveForward_pwmRight+0 
	MOVF        _SLOW_PWM+1, 0 
	MOVWF       FARG_moveForward_pwmRight+1 
	CALL        _moveForward+0, 0
	GOTO        L_lineFollowNormalWorkedForLast301
L_lineFollowNormalWorkedForLast300:
;linefollow.h,276 :: 		else if( Sensor3==1 && Sensor4==0 && Sensor5==0 && Sensor6==0 && Sensor7==0)
	BTFSS       PORTD+0, 4 
	GOTO        L_lineFollowNormalWorkedForLast304
	BTFSC       PORTD+0, 5 
	GOTO        L_lineFollowNormalWorkedForLast304
	BTFSC       PORTD+0, 6 
	GOTO        L_lineFollowNormalWorkedForLast304
	BTFSC       PORTD+0, 7 
	GOTO        L_lineFollowNormalWorkedForLast304
	BTFSC       PORTB+0, 2 
	GOTO        L_lineFollowNormalWorkedForLast304
L__lineFollowNormalWorkedForLast912:
;linefollow.h,278 :: 		turnLeft(FAST_PWM);
	MOVF        _FAST_PWM+0, 0 
	MOVWF       FARG_turnLeft_pwmRight+0 
	MOVF        _FAST_PWM+1, 0 
	MOVWF       FARG_turnLeft_pwmRight+1 
	CALL        _turnLeft+0, 0
	GOTO        L_lineFollowNormalWorkedForLast305
L_lineFollowNormalWorkedForLast304:
;linefollow.h,279 :: 		else if( Sensor3==1 && Sensor4==1 && Sensor5==0 && Sensor6==0 && Sensor7==0)
	BTFSS       PORTD+0, 4 
	GOTO        L_lineFollowNormalWorkedForLast308
	BTFSS       PORTD+0, 5 
	GOTO        L_lineFollowNormalWorkedForLast308
	BTFSC       PORTD+0, 6 
	GOTO        L_lineFollowNormalWorkedForLast308
	BTFSC       PORTD+0, 7 
	GOTO        L_lineFollowNormalWorkedForLast308
	BTFSC       PORTB+0, 2 
	GOTO        L_lineFollowNormalWorkedForLast308
L__lineFollowNormalWorkedForLast911:
;linefollow.h,281 :: 		turnLeft(FAST_PWM);
	MOVF        _FAST_PWM+0, 0 
	MOVWF       FARG_turnLeft_pwmRight+0 
	MOVF        _FAST_PWM+1, 0 
	MOVWF       FARG_turnLeft_pwmRight+1 
	CALL        _turnLeft+0, 0
	GOTO        L_lineFollowNormalWorkedForLast309
L_lineFollowNormalWorkedForLast308:
;linefollow.h,282 :: 		else if( Sensor3==1 && Sensor4==1 && Sensor5==1 && Sensor6==0 && Sensor7==0)
	BTFSS       PORTD+0, 4 
	GOTO        L_lineFollowNormalWorkedForLast312
	BTFSS       PORTD+0, 5 
	GOTO        L_lineFollowNormalWorkedForLast312
	BTFSS       PORTD+0, 6 
	GOTO        L_lineFollowNormalWorkedForLast312
	BTFSC       PORTD+0, 7 
	GOTO        L_lineFollowNormalWorkedForLast312
	BTFSC       PORTB+0, 2 
	GOTO        L_lineFollowNormalWorkedForLast312
L__lineFollowNormalWorkedForLast910:
;linefollow.h,284 :: 		turnLeft(FAST_PWM);
	MOVF        _FAST_PWM+0, 0 
	MOVWF       FARG_turnLeft_pwmRight+0 
	MOVF        _FAST_PWM+1, 0 
	MOVWF       FARG_turnLeft_pwmRight+1 
	CALL        _turnLeft+0, 0
	GOTO        L_lineFollowNormalWorkedForLast313
L_lineFollowNormalWorkedForLast312:
;linefollow.h,285 :: 		else if( Sensor3==0 && Sensor4==1 && Sensor5==0 && Sensor6==0 && Sensor7==0)
	BTFSC       PORTD+0, 4 
	GOTO        L_lineFollowNormalWorkedForLast316
	BTFSS       PORTD+0, 5 
	GOTO        L_lineFollowNormalWorkedForLast316
	BTFSC       PORTD+0, 6 
	GOTO        L_lineFollowNormalWorkedForLast316
	BTFSC       PORTD+0, 7 
	GOTO        L_lineFollowNormalWorkedForLast316
	BTFSC       PORTB+0, 2 
	GOTO        L_lineFollowNormalWorkedForLast316
L__lineFollowNormalWorkedForLast909:
;linefollow.h,287 :: 		turnLeft(FAST_PWM);
	MOVF        _FAST_PWM+0, 0 
	MOVWF       FARG_turnLeft_pwmRight+0 
	MOVF        _FAST_PWM+1, 0 
	MOVWF       FARG_turnLeft_pwmRight+1 
	CALL        _turnLeft+0, 0
	GOTO        L_lineFollowNormalWorkedForLast317
L_lineFollowNormalWorkedForLast316:
;linefollow.h,290 :: 		else if( Sensor3==0 && Sensor4==0 && Sensor5==0 && Sensor6==1 && Sensor7==0)
	BTFSC       PORTD+0, 4 
	GOTO        L_lineFollowNormalWorkedForLast320
	BTFSC       PORTD+0, 5 
	GOTO        L_lineFollowNormalWorkedForLast320
	BTFSC       PORTD+0, 6 
	GOTO        L_lineFollowNormalWorkedForLast320
	BTFSS       PORTD+0, 7 
	GOTO        L_lineFollowNormalWorkedForLast320
	BTFSC       PORTB+0, 2 
	GOTO        L_lineFollowNormalWorkedForLast320
L__lineFollowNormalWorkedForLast908:
;linefollow.h,292 :: 		turnRight(FAST_PWM);
	MOVF        _FAST_PWM+0, 0 
	MOVWF       FARG_turnRight_pwmLeft+0 
	MOVF        _FAST_PWM+1, 0 
	MOVWF       FARG_turnRight_pwmLeft+1 
	CALL        _turnRight+0, 0
	GOTO        L_lineFollowNormalWorkedForLast321
L_lineFollowNormalWorkedForLast320:
;linefollow.h,293 :: 		else if( Sensor3==0 && Sensor4==0 && Sensor5==1 && Sensor6==1 && Sensor7==1)
	BTFSC       PORTD+0, 4 
	GOTO        L_lineFollowNormalWorkedForLast324
	BTFSC       PORTD+0, 5 
	GOTO        L_lineFollowNormalWorkedForLast324
	BTFSS       PORTD+0, 6 
	GOTO        L_lineFollowNormalWorkedForLast324
	BTFSS       PORTD+0, 7 
	GOTO        L_lineFollowNormalWorkedForLast324
	BTFSS       PORTB+0, 2 
	GOTO        L_lineFollowNormalWorkedForLast324
L__lineFollowNormalWorkedForLast907:
;linefollow.h,295 :: 		turnRight(FAST_PWM);
	MOVF        _FAST_PWM+0, 0 
	MOVWF       FARG_turnRight_pwmLeft+0 
	MOVF        _FAST_PWM+1, 0 
	MOVWF       FARG_turnRight_pwmLeft+1 
	CALL        _turnRight+0, 0
	GOTO        L_lineFollowNormalWorkedForLast325
L_lineFollowNormalWorkedForLast324:
;linefollow.h,296 :: 		else if( Sensor3==0 && Sensor4==0 && Sensor5==0 && Sensor6==1 && Sensor7==1)
	BTFSC       PORTD+0, 4 
	GOTO        L_lineFollowNormalWorkedForLast328
	BTFSC       PORTD+0, 5 
	GOTO        L_lineFollowNormalWorkedForLast328
	BTFSC       PORTD+0, 6 
	GOTO        L_lineFollowNormalWorkedForLast328
	BTFSS       PORTD+0, 7 
	GOTO        L_lineFollowNormalWorkedForLast328
	BTFSS       PORTB+0, 2 
	GOTO        L_lineFollowNormalWorkedForLast328
L__lineFollowNormalWorkedForLast906:
;linefollow.h,298 :: 		turnRight(FAST_PWM);
	MOVF        _FAST_PWM+0, 0 
	MOVWF       FARG_turnRight_pwmLeft+0 
	MOVF        _FAST_PWM+1, 0 
	MOVWF       FARG_turnRight_pwmLeft+1 
	CALL        _turnRight+0, 0
	GOTO        L_lineFollowNormalWorkedForLast329
L_lineFollowNormalWorkedForLast328:
;linefollow.h,299 :: 		else if( Sensor3==0 && Sensor4==0 && Sensor5==0 && Sensor6==0 && Sensor7==1)
	BTFSC       PORTD+0, 4 
	GOTO        L_lineFollowNormalWorkedForLast332
	BTFSC       PORTD+0, 5 
	GOTO        L_lineFollowNormalWorkedForLast332
	BTFSC       PORTD+0, 6 
	GOTO        L_lineFollowNormalWorkedForLast332
	BTFSC       PORTD+0, 7 
	GOTO        L_lineFollowNormalWorkedForLast332
	BTFSS       PORTB+0, 2 
	GOTO        L_lineFollowNormalWorkedForLast332
L__lineFollowNormalWorkedForLast905:
;linefollow.h,301 :: 		turnRight(FAST_PWM);
	MOVF        _FAST_PWM+0, 0 
	MOVWF       FARG_turnRight_pwmLeft+0 
	MOVF        _FAST_PWM+1, 0 
	MOVWF       FARG_turnRight_pwmLeft+1 
	CALL        _turnRight+0, 0
	GOTO        L_lineFollowNormalWorkedForLast333
L_lineFollowNormalWorkedForLast332:
;linefollow.h,304 :: 		else if( Sensor3==1 && Sensor4==1 && Sensor5==1 && Sensor6==1 && Sensor7==0)
	BTFSS       PORTD+0, 4 
	GOTO        L_lineFollowNormalWorkedForLast336
	BTFSS       PORTD+0, 5 
	GOTO        L_lineFollowNormalWorkedForLast336
	BTFSS       PORTD+0, 6 
	GOTO        L_lineFollowNormalWorkedForLast336
	BTFSS       PORTD+0, 7 
	GOTO        L_lineFollowNormalWorkedForLast336
	BTFSC       PORTB+0, 2 
	GOTO        L_lineFollowNormalWorkedForLast336
L__lineFollowNormalWorkedForLast904:
;linefollow.h,305 :: 		moveForward(FAST_PWM,FAST_PWM);
	MOVF        _FAST_PWM+0, 0 
	MOVWF       FARG_moveForward_pwmLeft+0 
	MOVF        _FAST_PWM+1, 0 
	MOVWF       FARG_moveForward_pwmLeft+1 
	MOVF        _FAST_PWM+0, 0 
	MOVWF       FARG_moveForward_pwmRight+0 
	MOVF        _FAST_PWM+1, 0 
	MOVWF       FARG_moveForward_pwmRight+1 
	CALL        _moveForward+0, 0
	GOTO        L_lineFollowNormalWorkedForLast337
L_lineFollowNormalWorkedForLast336:
;linefollow.h,306 :: 		else if( Sensor3==0 && Sensor4==1 && Sensor5==1 && Sensor6==1 && Sensor7==1)
	BTFSC       PORTD+0, 4 
	GOTO        L_lineFollowNormalWorkedForLast340
	BTFSS       PORTD+0, 5 
	GOTO        L_lineFollowNormalWorkedForLast340
	BTFSS       PORTD+0, 6 
	GOTO        L_lineFollowNormalWorkedForLast340
	BTFSS       PORTD+0, 7 
	GOTO        L_lineFollowNormalWorkedForLast340
	BTFSS       PORTB+0, 2 
	GOTO        L_lineFollowNormalWorkedForLast340
L__lineFollowNormalWorkedForLast903:
;linefollow.h,307 :: 		moveForward(FAST_PWM,FAST_PWM);
	MOVF        _FAST_PWM+0, 0 
	MOVWF       FARG_moveForward_pwmLeft+0 
	MOVF        _FAST_PWM+1, 0 
	MOVWF       FARG_moveForward_pwmLeft+1 
	MOVF        _FAST_PWM+0, 0 
	MOVWF       FARG_moveForward_pwmRight+0 
	MOVF        _FAST_PWM+1, 0 
	MOVWF       FARG_moveForward_pwmRight+1 
	CALL        _moveForward+0, 0
	GOTO        L_lineFollowNormalWorkedForLast341
L_lineFollowNormalWorkedForLast340:
;linefollow.h,308 :: 		else if( Sensor1==0 && Sensor2==0 && Sensor3==0 && Sensor4==0 && Sensor5==0 && Sensor6==0 && Sensor7==0 && Sensor8==0 && Sensor9==0)
	BTFSC       PORTB+0, 4 
	GOTO        L_lineFollowNormalWorkedForLast344
	BTFSC       PORTB+0, 3 
	GOTO        L_lineFollowNormalWorkedForLast344
	BTFSC       PORTD+0, 4 
	GOTO        L_lineFollowNormalWorkedForLast344
	BTFSC       PORTD+0, 5 
	GOTO        L_lineFollowNormalWorkedForLast344
	BTFSC       PORTD+0, 6 
	GOTO        L_lineFollowNormalWorkedForLast344
	BTFSC       PORTD+0, 7 
	GOTO        L_lineFollowNormalWorkedForLast344
	BTFSC       PORTB+0, 2 
	GOTO        L_lineFollowNormalWorkedForLast344
	BTFSC       PORTB+0, 6 
	GOTO        L_lineFollowNormalWorkedForLast344
	BTFSC       PORTB+0, 7 
	GOTO        L_lineFollowNormalWorkedForLast344
L__lineFollowNormalWorkedForLast902:
;linefollow.h,309 :: 		moveForward(255,255);
	MOVLW       255
	MOVWF       FARG_moveForward_pwmLeft+0 
	MOVLW       0
	MOVWF       FARG_moveForward_pwmLeft+1 
	MOVLW       255
	MOVWF       FARG_moveForward_pwmRight+0 
	MOVLW       0
	MOVWF       FARG_moveForward_pwmRight+1 
	CALL        _moveForward+0, 0
	GOTO        L_lineFollowNormalWorkedForLast345
L_lineFollowNormalWorkedForLast344:
;linefollow.h,311 :: 		else if(isAllBlack()){
	CALL        _isAllBlack+0, 0
	MOVF        R0, 0 
	IORWF       R1, 0 
	BTFSC       STATUS+0, 2 
	GOTO        L_lineFollowNormalWorkedForLast346
;linefollow.h,314 :: 		sendSensorStatus();
	CALL        _sendSensorStatus+0, 0
;linefollow.h,315 :: 		}
	GOTO        L_lineFollowNormalWorkedForLast347
L_lineFollowNormalWorkedForLast346:
;linefollow.h,318 :: 		moveForward(205,200);
	MOVLW       205
	MOVWF       FARG_moveForward_pwmLeft+0 
	MOVLW       0
	MOVWF       FARG_moveForward_pwmLeft+1 
	MOVLW       200
	MOVWF       FARG_moveForward_pwmRight+0 
	MOVLW       0
	MOVWF       FARG_moveForward_pwmRight+1 
	CALL        _moveForward+0, 0
;linefollow.h,319 :: 		sendSensorStatus();
	CALL        _sendSensorStatus+0, 0
;linefollow.h,321 :: 		}
L_lineFollowNormalWorkedForLast347:
L_lineFollowNormalWorkedForLast345:
L_lineFollowNormalWorkedForLast341:
L_lineFollowNormalWorkedForLast337:
L_lineFollowNormalWorkedForLast333:
L_lineFollowNormalWorkedForLast329:
L_lineFollowNormalWorkedForLast325:
L_lineFollowNormalWorkedForLast321:
L_lineFollowNormalWorkedForLast317:
L_lineFollowNormalWorkedForLast313:
L_lineFollowNormalWorkedForLast309:
L_lineFollowNormalWorkedForLast305:
L_lineFollowNormalWorkedForLast301:
L_lineFollowNormalWorkedForLast297:
L_lineFollowNormalWorkedForLast293:
L_lineFollowNormalWorkedForLast289:
;linefollow.h,322 :: 		}
	GOTO        L_lineFollowNormalWorkedForLast348
L_lineFollowNormalWorkedForLast285:
;linefollow.h,329 :: 		if( Sensor1==1 && Sensor2==1 && Sensor3==1 && Sensor4==1 && Sensor5==1 && Sensor6==0 && Sensor7==0 && Sensor8==0 && Sensor9==0)
	BTFSS       PORTB+0, 4 
	GOTO        L_lineFollowNormalWorkedForLast351
	BTFSS       PORTB+0, 3 
	GOTO        L_lineFollowNormalWorkedForLast351
	BTFSS       PORTD+0, 4 
	GOTO        L_lineFollowNormalWorkedForLast351
	BTFSS       PORTD+0, 5 
	GOTO        L_lineFollowNormalWorkedForLast351
	BTFSS       PORTD+0, 6 
	GOTO        L_lineFollowNormalWorkedForLast351
	BTFSC       PORTD+0, 7 
	GOTO        L_lineFollowNormalWorkedForLast351
	BTFSC       PORTB+0, 2 
	GOTO        L_lineFollowNormalWorkedForLast351
	BTFSC       PORTB+0, 6 
	GOTO        L_lineFollowNormalWorkedForLast351
	BTFSC       PORTB+0, 7 
	GOTO        L_lineFollowNormalWorkedForLast351
L__lineFollowNormalWorkedForLast901:
;linefollow.h,330 :: 		rotateByDegree(-90);
	MOVLW       166
	MOVWF       FARG_rotateByDegree_degree+0 
	MOVLW       255
	MOVWF       FARG_rotateByDegree_degree+1 
	CALL        _rotateByDegree+0, 0
	GOTO        L_lineFollowNormalWorkedForLast352
L_lineFollowNormalWorkedForLast351:
;linefollow.h,331 :: 		else if( Sensor1==1 && Sensor2==1 && Sensor3==1 && Sensor4==1 && Sensor5==1 && Sensor6==1 && Sensor7==0 && Sensor8==0 && Sensor9==0)
	BTFSS       PORTB+0, 4 
	GOTO        L_lineFollowNormalWorkedForLast355
	BTFSS       PORTB+0, 3 
	GOTO        L_lineFollowNormalWorkedForLast355
	BTFSS       PORTD+0, 4 
	GOTO        L_lineFollowNormalWorkedForLast355
	BTFSS       PORTD+0, 5 
	GOTO        L_lineFollowNormalWorkedForLast355
	BTFSS       PORTD+0, 6 
	GOTO        L_lineFollowNormalWorkedForLast355
	BTFSS       PORTD+0, 7 
	GOTO        L_lineFollowNormalWorkedForLast355
	BTFSC       PORTB+0, 2 
	GOTO        L_lineFollowNormalWorkedForLast355
	BTFSC       PORTB+0, 6 
	GOTO        L_lineFollowNormalWorkedForLast355
	BTFSC       PORTB+0, 7 
	GOTO        L_lineFollowNormalWorkedForLast355
L__lineFollowNormalWorkedForLast900:
;linefollow.h,332 :: 		rotateByDegree(-90);
	MOVLW       166
	MOVWF       FARG_rotateByDegree_degree+0 
	MOVLW       255
	MOVWF       FARG_rotateByDegree_degree+1 
	CALL        _rotateByDegree+0, 0
	GOTO        L_lineFollowNormalWorkedForLast356
L_lineFollowNormalWorkedForLast355:
;linefollow.h,333 :: 		else if( Sensor1==1 && Sensor2==1 && Sensor3==1 && Sensor4==1 && Sensor5==1 && Sensor6==1 && Sensor7==1 && Sensor8==0 && Sensor9==0)
	BTFSS       PORTB+0, 4 
	GOTO        L_lineFollowNormalWorkedForLast359
	BTFSS       PORTB+0, 3 
	GOTO        L_lineFollowNormalWorkedForLast359
	BTFSS       PORTD+0, 4 
	GOTO        L_lineFollowNormalWorkedForLast359
	BTFSS       PORTD+0, 5 
	GOTO        L_lineFollowNormalWorkedForLast359
	BTFSS       PORTD+0, 6 
	GOTO        L_lineFollowNormalWorkedForLast359
	BTFSS       PORTD+0, 7 
	GOTO        L_lineFollowNormalWorkedForLast359
	BTFSS       PORTB+0, 2 
	GOTO        L_lineFollowNormalWorkedForLast359
	BTFSC       PORTB+0, 6 
	GOTO        L_lineFollowNormalWorkedForLast359
	BTFSC       PORTB+0, 7 
	GOTO        L_lineFollowNormalWorkedForLast359
L__lineFollowNormalWorkedForLast899:
;linefollow.h,334 :: 		rotateByDegree(-90);
	MOVLW       166
	MOVWF       FARG_rotateByDegree_degree+0 
	MOVLW       255
	MOVWF       FARG_rotateByDegree_degree+1 
	CALL        _rotateByDegree+0, 0
	GOTO        L_lineFollowNormalWorkedForLast360
L_lineFollowNormalWorkedForLast359:
;linefollow.h,337 :: 		else if( Sensor1==0 && Sensor2==0 && Sensor3==1 && Sensor4==1 && Sensor5==1 && Sensor6==1 && Sensor7==1 && Sensor8==1 && Sensor9==1)
	BTFSC       PORTB+0, 4 
	GOTO        L_lineFollowNormalWorkedForLast363
	BTFSC       PORTB+0, 3 
	GOTO        L_lineFollowNormalWorkedForLast363
	BTFSS       PORTD+0, 4 
	GOTO        L_lineFollowNormalWorkedForLast363
	BTFSS       PORTD+0, 5 
	GOTO        L_lineFollowNormalWorkedForLast363
	BTFSS       PORTD+0, 6 
	GOTO        L_lineFollowNormalWorkedForLast363
	BTFSS       PORTD+0, 7 
	GOTO        L_lineFollowNormalWorkedForLast363
	BTFSS       PORTB+0, 2 
	GOTO        L_lineFollowNormalWorkedForLast363
	BTFSS       PORTB+0, 6 
	GOTO        L_lineFollowNormalWorkedForLast363
	BTFSS       PORTB+0, 7 
	GOTO        L_lineFollowNormalWorkedForLast363
L__lineFollowNormalWorkedForLast898:
;linefollow.h,338 :: 		rotateByDegree(90);
	MOVLW       90
	MOVWF       FARG_rotateByDegree_degree+0 
	MOVLW       0
	MOVWF       FARG_rotateByDegree_degree+1 
	CALL        _rotateByDegree+0, 0
	GOTO        L_lineFollowNormalWorkedForLast364
L_lineFollowNormalWorkedForLast363:
;linefollow.h,339 :: 		else if( Sensor1==0 && Sensor2==0 && Sensor3==0 && Sensor4==1 && Sensor5==1 && Sensor6==1 && Sensor7==1 && Sensor8==1 && Sensor9==1)
	BTFSC       PORTB+0, 4 
	GOTO        L_lineFollowNormalWorkedForLast367
	BTFSC       PORTB+0, 3 
	GOTO        L_lineFollowNormalWorkedForLast367
	BTFSC       PORTD+0, 4 
	GOTO        L_lineFollowNormalWorkedForLast367
	BTFSS       PORTD+0, 5 
	GOTO        L_lineFollowNormalWorkedForLast367
	BTFSS       PORTD+0, 6 
	GOTO        L_lineFollowNormalWorkedForLast367
	BTFSS       PORTD+0, 7 
	GOTO        L_lineFollowNormalWorkedForLast367
	BTFSS       PORTB+0, 2 
	GOTO        L_lineFollowNormalWorkedForLast367
	BTFSS       PORTB+0, 6 
	GOTO        L_lineFollowNormalWorkedForLast367
	BTFSS       PORTB+0, 7 
	GOTO        L_lineFollowNormalWorkedForLast367
L__lineFollowNormalWorkedForLast897:
;linefollow.h,340 :: 		rotateByDegree(90);
	MOVLW       90
	MOVWF       FARG_rotateByDegree_degree+0 
	MOVLW       0
	MOVWF       FARG_rotateByDegree_degree+1 
	CALL        _rotateByDegree+0, 0
	GOTO        L_lineFollowNormalWorkedForLast368
L_lineFollowNormalWorkedForLast367:
;linefollow.h,341 :: 		else if( Sensor1==0 && Sensor2==0 && Sensor3==0 && Sensor4==0 && Sensor5==1 && Sensor6==1 && Sensor7==1 && Sensor8==1 && Sensor9==1)
	BTFSC       PORTB+0, 4 
	GOTO        L_lineFollowNormalWorkedForLast371
	BTFSC       PORTB+0, 3 
	GOTO        L_lineFollowNormalWorkedForLast371
	BTFSC       PORTD+0, 4 
	GOTO        L_lineFollowNormalWorkedForLast371
	BTFSC       PORTD+0, 5 
	GOTO        L_lineFollowNormalWorkedForLast371
	BTFSS       PORTD+0, 6 
	GOTO        L_lineFollowNormalWorkedForLast371
	BTFSS       PORTD+0, 7 
	GOTO        L_lineFollowNormalWorkedForLast371
	BTFSS       PORTB+0, 2 
	GOTO        L_lineFollowNormalWorkedForLast371
	BTFSS       PORTB+0, 6 
	GOTO        L_lineFollowNormalWorkedForLast371
	BTFSS       PORTB+0, 7 
	GOTO        L_lineFollowNormalWorkedForLast371
L__lineFollowNormalWorkedForLast896:
;linefollow.h,342 :: 		rotateByDegree(90);
	MOVLW       90
	MOVWF       FARG_rotateByDegree_degree+0 
	MOVLW       0
	MOVWF       FARG_rotateByDegree_degree+1 
	CALL        _rotateByDegree+0, 0
	GOTO        L_lineFollowNormalWorkedForLast372
L_lineFollowNormalWorkedForLast371:
;linefollow.h,347 :: 		else if( Sensor3==1 && Sensor4==0 && Sensor5==0 && Sensor6==0 && Sensor7==0)
	BTFSS       PORTD+0, 4 
	GOTO        L_lineFollowNormalWorkedForLast375
	BTFSC       PORTD+0, 5 
	GOTO        L_lineFollowNormalWorkedForLast375
	BTFSC       PORTD+0, 6 
	GOTO        L_lineFollowNormalWorkedForLast375
	BTFSC       PORTD+0, 7 
	GOTO        L_lineFollowNormalWorkedForLast375
	BTFSC       PORTB+0, 2 
	GOTO        L_lineFollowNormalWorkedForLast375
L__lineFollowNormalWorkedForLast895:
;linefollow.h,349 :: 		turnLeft(FAST_PWM);
	MOVF        _FAST_PWM+0, 0 
	MOVWF       FARG_turnLeft_pwmRight+0 
	MOVF        _FAST_PWM+1, 0 
	MOVWF       FARG_turnLeft_pwmRight+1 
	CALL        _turnLeft+0, 0
	GOTO        L_lineFollowNormalWorkedForLast376
L_lineFollowNormalWorkedForLast375:
;linefollow.h,350 :: 		else if( Sensor3==1 && Sensor4==1 && Sensor5==0 && Sensor6==0 && Sensor7==0)
	BTFSS       PORTD+0, 4 
	GOTO        L_lineFollowNormalWorkedForLast379
	BTFSS       PORTD+0, 5 
	GOTO        L_lineFollowNormalWorkedForLast379
	BTFSC       PORTD+0, 6 
	GOTO        L_lineFollowNormalWorkedForLast379
	BTFSC       PORTD+0, 7 
	GOTO        L_lineFollowNormalWorkedForLast379
	BTFSC       PORTB+0, 2 
	GOTO        L_lineFollowNormalWorkedForLast379
L__lineFollowNormalWorkedForLast894:
;linefollow.h,352 :: 		turnLeft(FAST_PWM);
	MOVF        _FAST_PWM+0, 0 
	MOVWF       FARG_turnLeft_pwmRight+0 
	MOVF        _FAST_PWM+1, 0 
	MOVWF       FARG_turnLeft_pwmRight+1 
	CALL        _turnLeft+0, 0
	GOTO        L_lineFollowNormalWorkedForLast380
L_lineFollowNormalWorkedForLast379:
;linefollow.h,353 :: 		else if( Sensor3==1 && Sensor4==1 && Sensor5==1 && Sensor6==0 && Sensor7==0)
	BTFSS       PORTD+0, 4 
	GOTO        L_lineFollowNormalWorkedForLast383
	BTFSS       PORTD+0, 5 
	GOTO        L_lineFollowNormalWorkedForLast383
	BTFSS       PORTD+0, 6 
	GOTO        L_lineFollowNormalWorkedForLast383
	BTFSC       PORTD+0, 7 
	GOTO        L_lineFollowNormalWorkedForLast383
	BTFSC       PORTB+0, 2 
	GOTO        L_lineFollowNormalWorkedForLast383
L__lineFollowNormalWorkedForLast893:
;linefollow.h,355 :: 		turnLeft(FAST_PWM);
	MOVF        _FAST_PWM+0, 0 
	MOVWF       FARG_turnLeft_pwmRight+0 
	MOVF        _FAST_PWM+1, 0 
	MOVWF       FARG_turnLeft_pwmRight+1 
	CALL        _turnLeft+0, 0
	GOTO        L_lineFollowNormalWorkedForLast384
L_lineFollowNormalWorkedForLast383:
;linefollow.h,356 :: 		else if( Sensor3==0 && Sensor4==1 && Sensor5==0 && Sensor6==0 && Sensor7==0)
	BTFSC       PORTD+0, 4 
	GOTO        L_lineFollowNormalWorkedForLast387
	BTFSS       PORTD+0, 5 
	GOTO        L_lineFollowNormalWorkedForLast387
	BTFSC       PORTD+0, 6 
	GOTO        L_lineFollowNormalWorkedForLast387
	BTFSC       PORTD+0, 7 
	GOTO        L_lineFollowNormalWorkedForLast387
	BTFSC       PORTB+0, 2 
	GOTO        L_lineFollowNormalWorkedForLast387
L__lineFollowNormalWorkedForLast892:
;linefollow.h,358 :: 		turnLeft(FAST_PWM);
	MOVF        _FAST_PWM+0, 0 
	MOVWF       FARG_turnLeft_pwmRight+0 
	MOVF        _FAST_PWM+1, 0 
	MOVWF       FARG_turnLeft_pwmRight+1 
	CALL        _turnLeft+0, 0
	GOTO        L_lineFollowNormalWorkedForLast388
L_lineFollowNormalWorkedForLast387:
;linefollow.h,361 :: 		else if( Sensor3==0 && Sensor4==0 && Sensor5==0 && Sensor6==1 && Sensor7==0)
	BTFSC       PORTD+0, 4 
	GOTO        L_lineFollowNormalWorkedForLast391
	BTFSC       PORTD+0, 5 
	GOTO        L_lineFollowNormalWorkedForLast391
	BTFSC       PORTD+0, 6 
	GOTO        L_lineFollowNormalWorkedForLast391
	BTFSS       PORTD+0, 7 
	GOTO        L_lineFollowNormalWorkedForLast391
	BTFSC       PORTB+0, 2 
	GOTO        L_lineFollowNormalWorkedForLast391
L__lineFollowNormalWorkedForLast891:
;linefollow.h,363 :: 		turnRight(FAST_PWM);
	MOVF        _FAST_PWM+0, 0 
	MOVWF       FARG_turnRight_pwmLeft+0 
	MOVF        _FAST_PWM+1, 0 
	MOVWF       FARG_turnRight_pwmLeft+1 
	CALL        _turnRight+0, 0
	GOTO        L_lineFollowNormalWorkedForLast392
L_lineFollowNormalWorkedForLast391:
;linefollow.h,364 :: 		else if( Sensor3==0 && Sensor4==0 && Sensor5==1 && Sensor6==1 && Sensor7==1)
	BTFSC       PORTD+0, 4 
	GOTO        L_lineFollowNormalWorkedForLast395
	BTFSC       PORTD+0, 5 
	GOTO        L_lineFollowNormalWorkedForLast395
	BTFSS       PORTD+0, 6 
	GOTO        L_lineFollowNormalWorkedForLast395
	BTFSS       PORTD+0, 7 
	GOTO        L_lineFollowNormalWorkedForLast395
	BTFSS       PORTB+0, 2 
	GOTO        L_lineFollowNormalWorkedForLast395
L__lineFollowNormalWorkedForLast890:
;linefollow.h,366 :: 		turnRight(FAST_PWM);
	MOVF        _FAST_PWM+0, 0 
	MOVWF       FARG_turnRight_pwmLeft+0 
	MOVF        _FAST_PWM+1, 0 
	MOVWF       FARG_turnRight_pwmLeft+1 
	CALL        _turnRight+0, 0
	GOTO        L_lineFollowNormalWorkedForLast396
L_lineFollowNormalWorkedForLast395:
;linefollow.h,367 :: 		else if( Sensor3==0 && Sensor4==0 && Sensor5==0 && Sensor6==1 && Sensor7==1)
	BTFSC       PORTD+0, 4 
	GOTO        L_lineFollowNormalWorkedForLast399
	BTFSC       PORTD+0, 5 
	GOTO        L_lineFollowNormalWorkedForLast399
	BTFSC       PORTD+0, 6 
	GOTO        L_lineFollowNormalWorkedForLast399
	BTFSS       PORTD+0, 7 
	GOTO        L_lineFollowNormalWorkedForLast399
	BTFSS       PORTB+0, 2 
	GOTO        L_lineFollowNormalWorkedForLast399
L__lineFollowNormalWorkedForLast889:
;linefollow.h,369 :: 		turnRight(FAST_PWM);
	MOVF        _FAST_PWM+0, 0 
	MOVWF       FARG_turnRight_pwmLeft+0 
	MOVF        _FAST_PWM+1, 0 
	MOVWF       FARG_turnRight_pwmLeft+1 
	CALL        _turnRight+0, 0
	GOTO        L_lineFollowNormalWorkedForLast400
L_lineFollowNormalWorkedForLast399:
;linefollow.h,370 :: 		else if( Sensor3==0 && Sensor4==0 && Sensor5==0 && Sensor6==0 && Sensor7==1)
	BTFSC       PORTD+0, 4 
	GOTO        L_lineFollowNormalWorkedForLast403
	BTFSC       PORTD+0, 5 
	GOTO        L_lineFollowNormalWorkedForLast403
	BTFSC       PORTD+0, 6 
	GOTO        L_lineFollowNormalWorkedForLast403
	BTFSC       PORTD+0, 7 
	GOTO        L_lineFollowNormalWorkedForLast403
	BTFSS       PORTB+0, 2 
	GOTO        L_lineFollowNormalWorkedForLast403
L__lineFollowNormalWorkedForLast888:
;linefollow.h,372 :: 		turnRight(FAST_PWM);
	MOVF        _FAST_PWM+0, 0 
	MOVWF       FARG_turnRight_pwmLeft+0 
	MOVF        _FAST_PWM+1, 0 
	MOVWF       FARG_turnRight_pwmLeft+1 
	CALL        _turnRight+0, 0
	GOTO        L_lineFollowNormalWorkedForLast404
L_lineFollowNormalWorkedForLast403:
;linefollow.h,375 :: 		else if( Sensor3==1 && Sensor4==1 && Sensor5==1 && Sensor6==1 && Sensor7==0)
	BTFSS       PORTD+0, 4 
	GOTO        L_lineFollowNormalWorkedForLast407
	BTFSS       PORTD+0, 5 
	GOTO        L_lineFollowNormalWorkedForLast407
	BTFSS       PORTD+0, 6 
	GOTO        L_lineFollowNormalWorkedForLast407
	BTFSS       PORTD+0, 7 
	GOTO        L_lineFollowNormalWorkedForLast407
	BTFSC       PORTB+0, 2 
	GOTO        L_lineFollowNormalWorkedForLast407
L__lineFollowNormalWorkedForLast887:
;linefollow.h,376 :: 		moveForward(SLOW_PWM,FAST_PWM);
	MOVF        _SLOW_PWM+0, 0 
	MOVWF       FARG_moveForward_pwmLeft+0 
	MOVF        _SLOW_PWM+1, 0 
	MOVWF       FARG_moveForward_pwmLeft+1 
	MOVF        _FAST_PWM+0, 0 
	MOVWF       FARG_moveForward_pwmRight+0 
	MOVF        _FAST_PWM+1, 0 
	MOVWF       FARG_moveForward_pwmRight+1 
	CALL        _moveForward+0, 0
	GOTO        L_lineFollowNormalWorkedForLast408
L_lineFollowNormalWorkedForLast407:
;linefollow.h,377 :: 		else if( Sensor3==0 && Sensor4==1 && Sensor5==1 && Sensor6==1 && Sensor7==1)
	BTFSC       PORTD+0, 4 
	GOTO        L_lineFollowNormalWorkedForLast411
	BTFSS       PORTD+0, 5 
	GOTO        L_lineFollowNormalWorkedForLast411
	BTFSS       PORTD+0, 6 
	GOTO        L_lineFollowNormalWorkedForLast411
	BTFSS       PORTD+0, 7 
	GOTO        L_lineFollowNormalWorkedForLast411
	BTFSS       PORTB+0, 2 
	GOTO        L_lineFollowNormalWorkedForLast411
L__lineFollowNormalWorkedForLast886:
;linefollow.h,378 :: 		moveForward(FAST_PWM,SLOW_PWM);
	MOVF        _FAST_PWM+0, 0 
	MOVWF       FARG_moveForward_pwmLeft+0 
	MOVF        _FAST_PWM+1, 0 
	MOVWF       FARG_moveForward_pwmLeft+1 
	MOVF        _SLOW_PWM+0, 0 
	MOVWF       FARG_moveForward_pwmRight+0 
	MOVF        _SLOW_PWM+1, 0 
	MOVWF       FARG_moveForward_pwmRight+1 
	CALL        _moveForward+0, 0
	GOTO        L_lineFollowNormalWorkedForLast412
L_lineFollowNormalWorkedForLast411:
;linefollow.h,379 :: 		else if( Sensor2==1 && Sensor3==1 && Sensor4==1 && Sensor5==0 && Sensor6==1 && Sensor7==1 && Sensor8==1)
	BTFSS       PORTB+0, 3 
	GOTO        L_lineFollowNormalWorkedForLast415
	BTFSS       PORTD+0, 4 
	GOTO        L_lineFollowNormalWorkedForLast415
	BTFSS       PORTD+0, 5 
	GOTO        L_lineFollowNormalWorkedForLast415
	BTFSC       PORTD+0, 6 
	GOTO        L_lineFollowNormalWorkedForLast415
	BTFSS       PORTD+0, 7 
	GOTO        L_lineFollowNormalWorkedForLast415
	BTFSS       PORTB+0, 2 
	GOTO        L_lineFollowNormalWorkedForLast415
	BTFSS       PORTB+0, 6 
	GOTO        L_lineFollowNormalWorkedForLast415
L__lineFollowNormalWorkedForLast885:
;linefollow.h,380 :: 		while(Scout==0)
L_lineFollowNormalWorkedForLast416:
	BTFSC       PORTB+0, 5 
	GOTO        L_lineFollowNormalWorkedForLast417
;linefollow.h,381 :: 		rotateAntiClockwise(255);
	MOVLW       255
	MOVWF       FARG_rotateAntiClockwise_pwm+0 
	MOVLW       0
	MOVWF       FARG_rotateAntiClockwise_pwm+1 
	CALL        _rotateAntiClockwise+0, 0
	GOTO        L_lineFollowNormalWorkedForLast416
L_lineFollowNormalWorkedForLast417:
	GOTO        L_lineFollowNormalWorkedForLast418
L_lineFollowNormalWorkedForLast415:
;linefollow.h,382 :: 		else if( Sensor1==0 && Sensor2==0 && Sensor3==0 && Sensor4==0 && Sensor5==0 && Sensor6==0 && Sensor7==0 && Sensor8==1 && Sensor9==1)
	BTFSC       PORTB+0, 4 
	GOTO        L_lineFollowNormalWorkedForLast421
	BTFSC       PORTB+0, 3 
	GOTO        L_lineFollowNormalWorkedForLast421
	BTFSC       PORTD+0, 4 
	GOTO        L_lineFollowNormalWorkedForLast421
	BTFSC       PORTD+0, 5 
	GOTO        L_lineFollowNormalWorkedForLast421
	BTFSC       PORTD+0, 6 
	GOTO        L_lineFollowNormalWorkedForLast421
	BTFSC       PORTD+0, 7 
	GOTO        L_lineFollowNormalWorkedForLast421
	BTFSC       PORTB+0, 2 
	GOTO        L_lineFollowNormalWorkedForLast421
	BTFSS       PORTB+0, 6 
	GOTO        L_lineFollowNormalWorkedForLast421
	BTFSS       PORTB+0, 7 
	GOTO        L_lineFollowNormalWorkedForLast421
L__lineFollowNormalWorkedForLast884:
;linefollow.h,383 :: 		while(Scout==0)
L_lineFollowNormalWorkedForLast422:
	BTFSC       PORTB+0, 5 
	GOTO        L_lineFollowNormalWorkedForLast423
;linefollow.h,384 :: 		rotateClockwise(255);
	MOVLW       255
	MOVWF       FARG_rotateClockwise_pwm+0 
	MOVLW       0
	MOVWF       FARG_rotateClockwise_pwm+1 
	CALL        _rotateClockwise+0, 0
	GOTO        L_lineFollowNormalWorkedForLast422
L_lineFollowNormalWorkedForLast423:
	GOTO        L_lineFollowNormalWorkedForLast424
L_lineFollowNormalWorkedForLast421:
;linefollow.h,385 :: 		else if( Sensor1==1 && Sensor2==1 && Sensor3==0 && Sensor4==0 && Sensor5==0 && Sensor6==0 && Sensor7==0 && Sensor8==0 && Sensor9==0)
	BTFSS       PORTB+0, 4 
	GOTO        L_lineFollowNormalWorkedForLast427
	BTFSS       PORTB+0, 3 
	GOTO        L_lineFollowNormalWorkedForLast427
	BTFSC       PORTD+0, 4 
	GOTO        L_lineFollowNormalWorkedForLast427
	BTFSC       PORTD+0, 5 
	GOTO        L_lineFollowNormalWorkedForLast427
	BTFSC       PORTD+0, 6 
	GOTO        L_lineFollowNormalWorkedForLast427
	BTFSC       PORTD+0, 7 
	GOTO        L_lineFollowNormalWorkedForLast427
	BTFSC       PORTB+0, 2 
	GOTO        L_lineFollowNormalWorkedForLast427
	BTFSC       PORTB+0, 6 
	GOTO        L_lineFollowNormalWorkedForLast427
	BTFSC       PORTB+0, 7 
	GOTO        L_lineFollowNormalWorkedForLast427
L__lineFollowNormalWorkedForLast883:
;linefollow.h,386 :: 		while(Scout==0)
L_lineFollowNormalWorkedForLast428:
	BTFSC       PORTB+0, 5 
	GOTO        L_lineFollowNormalWorkedForLast429
;linefollow.h,387 :: 		rotateAntiClockwise(255);
	MOVLW       255
	MOVWF       FARG_rotateAntiClockwise_pwm+0 
	MOVLW       0
	MOVWF       FARG_rotateAntiClockwise_pwm+1 
	CALL        _rotateAntiClockwise+0, 0
	GOTO        L_lineFollowNormalWorkedForLast428
L_lineFollowNormalWorkedForLast429:
	GOTO        L_lineFollowNormalWorkedForLast430
L_lineFollowNormalWorkedForLast427:
;linefollow.h,390 :: 		else if( Sensor3==0 && Sensor4==1 && Sensor5==1 && Sensor6==0 && Sensor7==0)
	BTFSC       PORTD+0, 4 
	GOTO        L_lineFollowNormalWorkedForLast433
	BTFSS       PORTD+0, 5 
	GOTO        L_lineFollowNormalWorkedForLast433
	BTFSS       PORTD+0, 6 
	GOTO        L_lineFollowNormalWorkedForLast433
	BTFSC       PORTD+0, 7 
	GOTO        L_lineFollowNormalWorkedForLast433
	BTFSC       PORTB+0, 2 
	GOTO        L_lineFollowNormalWorkedForLast433
L__lineFollowNormalWorkedForLast882:
;linefollow.h,391 :: 		moveForward(SLOW_PWM,FAST_PWM);
	MOVF        _SLOW_PWM+0, 0 
	MOVWF       FARG_moveForward_pwmLeft+0 
	MOVF        _SLOW_PWM+1, 0 
	MOVWF       FARG_moveForward_pwmLeft+1 
	MOVF        _FAST_PWM+0, 0 
	MOVWF       FARG_moveForward_pwmRight+0 
	MOVF        _FAST_PWM+1, 0 
	MOVWF       FARG_moveForward_pwmRight+1 
	CALL        _moveForward+0, 0
	GOTO        L_lineFollowNormalWorkedForLast434
L_lineFollowNormalWorkedForLast433:
;linefollow.h,392 :: 		else if( Sensor3==0 && Sensor4==1 && Sensor5==1 && Sensor6==1 && Sensor7==0)
	BTFSC       PORTD+0, 4 
	GOTO        L_lineFollowNormalWorkedForLast437
	BTFSS       PORTD+0, 5 
	GOTO        L_lineFollowNormalWorkedForLast437
	BTFSS       PORTD+0, 6 
	GOTO        L_lineFollowNormalWorkedForLast437
	BTFSS       PORTD+0, 7 
	GOTO        L_lineFollowNormalWorkedForLast437
	BTFSC       PORTB+0, 2 
	GOTO        L_lineFollowNormalWorkedForLast437
L__lineFollowNormalWorkedForLast881:
;linefollow.h,393 :: 		moveForward(FAST_PWM,FAST_PWM);
	MOVF        _FAST_PWM+0, 0 
	MOVWF       FARG_moveForward_pwmLeft+0 
	MOVF        _FAST_PWM+1, 0 
	MOVWF       FARG_moveForward_pwmLeft+1 
	MOVF        _FAST_PWM+0, 0 
	MOVWF       FARG_moveForward_pwmRight+0 
	MOVF        _FAST_PWM+1, 0 
	MOVWF       FARG_moveForward_pwmRight+1 
	CALL        _moveForward+0, 0
	GOTO        L_lineFollowNormalWorkedForLast438
L_lineFollowNormalWorkedForLast437:
;linefollow.h,394 :: 		else if( Sensor3==0 && Sensor4==0 && Sensor5==1 && Sensor6==0 && Sensor7==0)
	BTFSC       PORTD+0, 4 
	GOTO        L_lineFollowNormalWorkedForLast441
	BTFSC       PORTD+0, 5 
	GOTO        L_lineFollowNormalWorkedForLast441
	BTFSS       PORTD+0, 6 
	GOTO        L_lineFollowNormalWorkedForLast441
	BTFSC       PORTD+0, 7 
	GOTO        L_lineFollowNormalWorkedForLast441
	BTFSC       PORTB+0, 2 
	GOTO        L_lineFollowNormalWorkedForLast441
L__lineFollowNormalWorkedForLast880:
;linefollow.h,395 :: 		moveForward(FAST_PWM,FAST_PWM);
	MOVF        _FAST_PWM+0, 0 
	MOVWF       FARG_moveForward_pwmLeft+0 
	MOVF        _FAST_PWM+1, 0 
	MOVWF       FARG_moveForward_pwmLeft+1 
	MOVF        _FAST_PWM+0, 0 
	MOVWF       FARG_moveForward_pwmRight+0 
	MOVF        _FAST_PWM+1, 0 
	MOVWF       FARG_moveForward_pwmRight+1 
	CALL        _moveForward+0, 0
	GOTO        L_lineFollowNormalWorkedForLast442
L_lineFollowNormalWorkedForLast441:
;linefollow.h,396 :: 		else if( Sensor3==0 && Sensor4==0 && Sensor5==1 && Sensor6==1 && Sensor7==0)
	BTFSC       PORTD+0, 4 
	GOTO        L_lineFollowNormalWorkedForLast445
	BTFSC       PORTD+0, 5 
	GOTO        L_lineFollowNormalWorkedForLast445
	BTFSS       PORTD+0, 6 
	GOTO        L_lineFollowNormalWorkedForLast445
	BTFSS       PORTD+0, 7 
	GOTO        L_lineFollowNormalWorkedForLast445
	BTFSC       PORTB+0, 2 
	GOTO        L_lineFollowNormalWorkedForLast445
L__lineFollowNormalWorkedForLast879:
;linefollow.h,397 :: 		moveForward(FAST_PWM,SLOW_PWM);
	MOVF        _FAST_PWM+0, 0 
	MOVWF       FARG_moveForward_pwmLeft+0 
	MOVF        _FAST_PWM+1, 0 
	MOVWF       FARG_moveForward_pwmLeft+1 
	MOVF        _SLOW_PWM+0, 0 
	MOVWF       FARG_moveForward_pwmRight+0 
	MOVF        _SLOW_PWM+1, 0 
	MOVWF       FARG_moveForward_pwmRight+1 
	CALL        _moveForward+0, 0
	GOTO        L_lineFollowNormalWorkedForLast446
L_lineFollowNormalWorkedForLast445:
;linefollow.h,400 :: 		else if(isAllWhite()){
	CALL        _isAllWhite+0, 0
	MOVF        R0, 0 
	IORWF       R1, 0 
	BTFSC       STATUS+0, 2 
	GOTO        L_lineFollowNormalWorkedForLast447
;linefollow.h,403 :: 		sendSensorStatus();
	CALL        _sendSensorStatus+0, 0
;linefollow.h,404 :: 		}
	GOTO        L_lineFollowNormalWorkedForLast448
L_lineFollowNormalWorkedForLast447:
;linefollow.h,407 :: 		moveForward(205,200);
	MOVLW       205
	MOVWF       FARG_moveForward_pwmLeft+0 
	MOVLW       0
	MOVWF       FARG_moveForward_pwmLeft+1 
	MOVLW       200
	MOVWF       FARG_moveForward_pwmRight+0 
	MOVLW       0
	MOVWF       FARG_moveForward_pwmRight+1 
	CALL        _moveForward+0, 0
;linefollow.h,408 :: 		sendSensorStatus();
	CALL        _sendSensorStatus+0, 0
;linefollow.h,410 :: 		}
L_lineFollowNormalWorkedForLast448:
L_lineFollowNormalWorkedForLast446:
L_lineFollowNormalWorkedForLast442:
L_lineFollowNormalWorkedForLast438:
L_lineFollowNormalWorkedForLast434:
L_lineFollowNormalWorkedForLast430:
L_lineFollowNormalWorkedForLast424:
L_lineFollowNormalWorkedForLast418:
L_lineFollowNormalWorkedForLast412:
L_lineFollowNormalWorkedForLast408:
L_lineFollowNormalWorkedForLast404:
L_lineFollowNormalWorkedForLast400:
L_lineFollowNormalWorkedForLast396:
L_lineFollowNormalWorkedForLast392:
L_lineFollowNormalWorkedForLast388:
L_lineFollowNormalWorkedForLast384:
L_lineFollowNormalWorkedForLast380:
L_lineFollowNormalWorkedForLast376:
L_lineFollowNormalWorkedForLast372:
L_lineFollowNormalWorkedForLast368:
L_lineFollowNormalWorkedForLast364:
L_lineFollowNormalWorkedForLast360:
L_lineFollowNormalWorkedForLast356:
L_lineFollowNormalWorkedForLast352:
;linefollow.h,411 :: 		}
L_lineFollowNormalWorkedForLast348:
;linefollow.h,412 :: 		}
	RETURN      0
; end of _lineFollowNormalWorkedForLast

_isOnThePath:

;linefollow.h,414 :: 		int isOnThePath(){
;linefollow.h,415 :: 		if(((Sensor3==0 && Sensor4==1 && Sensor5==1 && Sensor6==0 && Sensor7==0) || ( Sensor3==0 && Sensor4==1 && Sensor5==1 && Sensor6==1 && Sensor7==0) || ( Sensor3==0 && Sensor4==0 && Sensor5==1 && Sensor6==0 && Sensor7==0) || ( Sensor3==0 && Sensor4==0 && Sensor5==1 && Sensor6==1 && Sensor7==0)) && Sensor1==0 && Sensor2==0 && Sensor8==0 && Sensor9==0)
	BTFSC       PORTD+0, 4 
	GOTO        L__isOnThePath922
	BTFSS       PORTD+0, 5 
	GOTO        L__isOnThePath922
	BTFSS       PORTD+0, 6 
	GOTO        L__isOnThePath922
	BTFSC       PORTD+0, 7 
	GOTO        L__isOnThePath922
	BTFSC       PORTB+0, 2 
	GOTO        L__isOnThePath922
	GOTO        L__isOnThePath918
L__isOnThePath922:
	BTFSC       PORTD+0, 4 
	GOTO        L__isOnThePath921
	BTFSS       PORTD+0, 5 
	GOTO        L__isOnThePath921
	BTFSS       PORTD+0, 6 
	GOTO        L__isOnThePath921
	BTFSS       PORTD+0, 7 
	GOTO        L__isOnThePath921
	BTFSC       PORTB+0, 2 
	GOTO        L__isOnThePath921
	GOTO        L__isOnThePath918
L__isOnThePath921:
	BTFSC       PORTD+0, 4 
	GOTO        L__isOnThePath920
	BTFSC       PORTD+0, 5 
	GOTO        L__isOnThePath920
	BTFSS       PORTD+0, 6 
	GOTO        L__isOnThePath920
	BTFSC       PORTD+0, 7 
	GOTO        L__isOnThePath920
	BTFSC       PORTB+0, 2 
	GOTO        L__isOnThePath920
	GOTO        L__isOnThePath918
L__isOnThePath920:
	BTFSC       PORTD+0, 4 
	GOTO        L__isOnThePath919
	BTFSC       PORTD+0, 5 
	GOTO        L__isOnThePath919
	BTFSS       PORTD+0, 6 
	GOTO        L__isOnThePath919
	BTFSS       PORTD+0, 7 
	GOTO        L__isOnThePath919
	BTFSC       PORTB+0, 2 
	GOTO        L__isOnThePath919
	GOTO        L__isOnThePath918
L__isOnThePath919:
	GOTO        L_isOnThePath461
L__isOnThePath918:
	BTFSC       PORTB+0, 4 
	GOTO        L_isOnThePath461
	BTFSC       PORTB+0, 3 
	GOTO        L_isOnThePath461
	BTFSC       PORTB+0, 6 
	GOTO        L_isOnThePath461
	BTFSC       PORTB+0, 7 
	GOTO        L_isOnThePath461
L__isOnThePath917:
;linefollow.h,416 :: 		return 1;
	MOVLW       1
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	RETURN      0
L_isOnThePath461:
;linefollow.h,418 :: 		return 0;
	CLRF        R0 
	CLRF        R1 
;linefollow.h,419 :: 		}
	RETURN      0
; end of _isOnThePath

_lineFollow:

;linefollow.h,421 :: 		void lineFollow(){
;linefollow.h,423 :: 		while(1){
L_lineFollow463:
;linefollow.h,424 :: 		if( (Sensor3==1 || Sensor4==1 || Sensor5==1 || Sensor6==1 || Sensor7==1) && Sensor1==0 && Sensor2==0 && Sensor8==0 && Sensor9==0 ){
	BTFSC       PORTD+0, 4 
	GOTO        L__lineFollow927
	BTFSC       PORTD+0, 5 
	GOTO        L__lineFollow927
	BTFSC       PORTD+0, 6 
	GOTO        L__lineFollow927
	BTFSC       PORTD+0, 7 
	GOTO        L__lineFollow927
	BTFSC       PORTB+0, 2 
	GOTO        L__lineFollow927
	GOTO        L_lineFollow469
L__lineFollow927:
	BTFSC       PORTB+0, 4 
	GOTO        L_lineFollow469
	BTFSC       PORTB+0, 3 
	GOTO        L_lineFollow469
	BTFSC       PORTB+0, 6 
	GOTO        L_lineFollow469
	BTFSC       PORTB+0, 7 
	GOTO        L_lineFollow469
L__lineFollow926:
;linefollow.h,426 :: 		debugText = "Line follow PID..   ";
	MOVLW       ?lstr28_Main_327.0V+0
	MOVWF       _debugText+0 
	MOVLW       hi_addr(?lstr28_Main_327.0V+0)
	MOVWF       _debugText+1 
;linefollow.h,427 :: 		UART1_Write_Text(debugText);
	MOVF        _debugText+0, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVF        _debugText+1, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;linefollow.h,428 :: 		sendSensorStatus();
	CALL        _sendSensorStatus+0, 0
;linefollow.h,429 :: 		lineFollowPID();
	CALL        _lineFollowPID+0, 0
;linefollow.h,430 :: 		}
	GOTO        L_lineFollow470
L_lineFollow469:
;linefollow.h,431 :: 		else if( !( Scout==1 && Sensor1==1 && Sensor2==1 && Sensor3==1 && Sensor4==1 && Sensor5==1 && Sensor6==1 && Sensor7==1 && Sensor8==1 && Sensor9==1) || !( Scout==0 && Sensor1==0 && Sensor2==0 && Sensor3==0 && Sensor4==0 && Sensor5==0 && Sensor6==0 && Sensor7==0 && Sensor8==0 && Sensor9==0)){
	BTFSS       PORTB+0, 5 
	GOTO        L_lineFollow472
	BTFSS       PORTB+0, 4 
	GOTO        L_lineFollow472
	BTFSS       PORTB+0, 3 
	GOTO        L_lineFollow472
	BTFSS       PORTD+0, 4 
	GOTO        L_lineFollow472
	BTFSS       PORTD+0, 5 
	GOTO        L_lineFollow472
	BTFSS       PORTD+0, 6 
	GOTO        L_lineFollow472
	BTFSS       PORTD+0, 7 
	GOTO        L_lineFollow472
	BTFSS       PORTB+0, 2 
	GOTO        L_lineFollow472
	BTFSS       PORTB+0, 6 
	GOTO        L_lineFollow472
	BTFSS       PORTB+0, 7 
	GOTO        L_lineFollow472
	MOVLW       1
	MOVWF       R0 
	GOTO        L_lineFollow471
L_lineFollow472:
	CLRF        R0 
L_lineFollow471:
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L__lineFollow925
	BTFSC       PORTB+0, 5 
	GOTO        L_lineFollow474
	BTFSC       PORTB+0, 4 
	GOTO        L_lineFollow474
	BTFSC       PORTB+0, 3 
	GOTO        L_lineFollow474
	BTFSC       PORTD+0, 4 
	GOTO        L_lineFollow474
	BTFSC       PORTD+0, 5 
	GOTO        L_lineFollow474
	BTFSC       PORTD+0, 6 
	GOTO        L_lineFollow474
	BTFSC       PORTD+0, 7 
	GOTO        L_lineFollow474
	BTFSC       PORTB+0, 2 
	GOTO        L_lineFollow474
	BTFSC       PORTB+0, 6 
	GOTO        L_lineFollow474
	BTFSC       PORTB+0, 7 
	GOTO        L_lineFollow474
	MOVLW       1
	MOVWF       R0 
	GOTO        L_lineFollow473
L_lineFollow474:
	CLRF        R0 
L_lineFollow473:
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L__lineFollow925
	GOTO        L_lineFollow477
L__lineFollow925:
;linefollow.h,433 :: 		debugText = "Line follow Normal..   ";
	MOVLW       ?lstr29_Main_327.0V+0
	MOVWF       _debugText+0 
	MOVLW       hi_addr(?lstr29_Main_327.0V+0)
	MOVWF       _debugText+1 
;linefollow.h,434 :: 		UART1_Write_Text(debugText);
	MOVF        _debugText+0, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVF        _debugText+1, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;linefollow.h,435 :: 		sendSensorStatus();
	CALL        _sendSensorStatus+0, 0
;linefollow.h,436 :: 		lineFollowNormal();
	CALL        _lineFollowNormal+0, 0
;linefollow.h,437 :: 		}
	GOTO        L_lineFollow478
L_lineFollow477:
;linefollow.h,438 :: 		else if(( Scout==1 && Sensor1==1 && Sensor2==1 && Sensor3==1 && Sensor4==1 && Sensor5==1 && Sensor6==1 && Sensor7==1 && Sensor8==1 && Sensor9==1) || !( Scout==0 && Sensor1==0 && Sensor2==0 && Sensor3==0 && Sensor4==0 && Sensor5==0 && Sensor6==0 && Sensor7==0 && Sensor8==0 && Sensor9==0)){
	BTFSS       PORTB+0, 5 
	GOTO        L__lineFollow924
	BTFSS       PORTB+0, 4 
	GOTO        L__lineFollow924
	BTFSS       PORTB+0, 3 
	GOTO        L__lineFollow924
	BTFSS       PORTD+0, 4 
	GOTO        L__lineFollow924
	BTFSS       PORTD+0, 5 
	GOTO        L__lineFollow924
	BTFSS       PORTD+0, 6 
	GOTO        L__lineFollow924
	BTFSS       PORTD+0, 7 
	GOTO        L__lineFollow924
	BTFSS       PORTB+0, 2 
	GOTO        L__lineFollow924
	BTFSS       PORTB+0, 6 
	GOTO        L__lineFollow924
	BTFSS       PORTB+0, 7 
	GOTO        L__lineFollow924
	GOTO        L__lineFollow923
L__lineFollow924:
	BTFSC       PORTB+0, 5 
	GOTO        L_lineFollow482
	BTFSC       PORTB+0, 4 
	GOTO        L_lineFollow482
	BTFSC       PORTB+0, 3 
	GOTO        L_lineFollow482
	BTFSC       PORTD+0, 4 
	GOTO        L_lineFollow482
	BTFSC       PORTD+0, 5 
	GOTO        L_lineFollow482
	BTFSC       PORTD+0, 6 
	GOTO        L_lineFollow482
	BTFSC       PORTD+0, 7 
	GOTO        L_lineFollow482
	BTFSC       PORTB+0, 2 
	GOTO        L_lineFollow482
	BTFSC       PORTB+0, 6 
	GOTO        L_lineFollow482
	BTFSC       PORTB+0, 7 
	GOTO        L_lineFollow482
	MOVLW       1
	MOVWF       R0 
	GOTO        L_lineFollow481
L_lineFollow482:
	CLRF        R0 
L_lineFollow481:
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L__lineFollow923
	GOTO        L_lineFollow485
L__lineFollow923:
;linefollow.h,440 :: 		stop();
	CALL        _stop+0, 0
;linefollow.h,441 :: 		sendSensorStatus();
	CALL        _sendSensorStatus+0, 0
;linefollow.h,443 :: 		}
L_lineFollow485:
L_lineFollow478:
L_lineFollow470:
;linefollow.h,444 :: 		}
	GOTO        L_lineFollow463
;linefollow.h,445 :: 		}
	RETURN      0
; end of _lineFollow

_lineFollowNormal:

;linefollow.h,447 :: 		void lineFollowNormal(){
;linefollow.h,448 :: 		while(1){              //!((Sensor3==1 || Sensor4==1 || Sensor5==1 || Sensor6==1 || Sensor7==1) && Sensor1==0 && Sensor2==0 && Sensor8==0 && Sensor9==0)
L_lineFollowNormal486:
;linefollow.h,449 :: 		if( Scout==1 && Sensor1==1 && Sensor2==1 && Sensor3==1 && Sensor4==1 && Sensor5==1 && Sensor6==1 && Sensor7==1 && Sensor8==1 && Sensor9==1){
	BTFSS       PORTB+0, 5 
	GOTO        L_lineFollowNormal490
	BTFSS       PORTB+0, 4 
	GOTO        L_lineFollowNormal490
	BTFSS       PORTB+0, 3 
	GOTO        L_lineFollowNormal490
	BTFSS       PORTD+0, 4 
	GOTO        L_lineFollowNormal490
	BTFSS       PORTD+0, 5 
	GOTO        L_lineFollowNormal490
	BTFSS       PORTD+0, 6 
	GOTO        L_lineFollowNormal490
	BTFSS       PORTD+0, 7 
	GOTO        L_lineFollowNormal490
	BTFSS       PORTB+0, 2 
	GOTO        L_lineFollowNormal490
	BTFSS       PORTB+0, 6 
	GOTO        L_lineFollowNormal490
	BTFSS       PORTB+0, 7 
	GOTO        L_lineFollowNormal490
L__lineFollowNormal940:
;linefollow.h,450 :: 		stop();
	CALL        _stop+0, 0
;linefollow.h,451 :: 		}
	GOTO        L_lineFollowNormal491
L_lineFollowNormal490:
;linefollow.h,452 :: 		else if( (Scout==0 && Sensor1==0 && Sensor2==0 && Sensor3==0 && Sensor4==1 && Sensor5==1 && Sensor6==1 && Sensor7==1 && Sensor8==1 && Sensor9==1) || (Scout==0 && Sensor1==0 && Sensor2==0 && Sensor3==0 && Sensor4==0 && Sensor5==1 && Sensor6==1 && Sensor7==1 && Sensor8==1 && Sensor9==1)){
	BTFSC       PORTB+0, 5 
	GOTO        L__lineFollowNormal939
	BTFSC       PORTB+0, 4 
	GOTO        L__lineFollowNormal939
	BTFSC       PORTB+0, 3 
	GOTO        L__lineFollowNormal939
	BTFSC       PORTD+0, 4 
	GOTO        L__lineFollowNormal939
	BTFSS       PORTD+0, 5 
	GOTO        L__lineFollowNormal939
	BTFSS       PORTD+0, 6 
	GOTO        L__lineFollowNormal939
	BTFSS       PORTD+0, 7 
	GOTO        L__lineFollowNormal939
	BTFSS       PORTB+0, 2 
	GOTO        L__lineFollowNormal939
	BTFSS       PORTB+0, 6 
	GOTO        L__lineFollowNormal939
	BTFSS       PORTB+0, 7 
	GOTO        L__lineFollowNormal939
	GOTO        L__lineFollowNormal937
L__lineFollowNormal939:
	BTFSC       PORTB+0, 5 
	GOTO        L__lineFollowNormal938
	BTFSC       PORTB+0, 4 
	GOTO        L__lineFollowNormal938
	BTFSC       PORTB+0, 3 
	GOTO        L__lineFollowNormal938
	BTFSC       PORTD+0, 4 
	GOTO        L__lineFollowNormal938
	BTFSC       PORTD+0, 5 
	GOTO        L__lineFollowNormal938
	BTFSS       PORTD+0, 6 
	GOTO        L__lineFollowNormal938
	BTFSS       PORTD+0, 7 
	GOTO        L__lineFollowNormal938
	BTFSS       PORTB+0, 2 
	GOTO        L__lineFollowNormal938
	BTFSS       PORTB+0, 6 
	GOTO        L__lineFollowNormal938
	BTFSS       PORTB+0, 7 
	GOTO        L__lineFollowNormal938
	GOTO        L__lineFollowNormal937
L__lineFollowNormal938:
	GOTO        L_lineFollowNormal498
L__lineFollowNormal937:
;linefollow.h,454 :: 		debugText = "90 to right..   ";
	MOVLW       ?lstr30_Main_327.0V+0
	MOVWF       _debugText+0 
	MOVLW       hi_addr(?lstr30_Main_327.0V+0)
	MOVWF       _debugText+1 
;linefollow.h,455 :: 		UART1_Write_Text(debugText);
	MOVF        _debugText+0, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVF        _debugText+1, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;linefollow.h,456 :: 		sendSensorStatus();
	CALL        _sendSensorStatus+0, 0
;linefollow.h,457 :: 		while(Scout==0){
L_lineFollowNormal499:
	BTFSC       PORTB+0, 5 
	GOTO        L_lineFollowNormal500
;linefollow.h,458 :: 		rotateClockwise(TEST_RPM);
	MOVF        _TEST_RPM+0, 0 
	MOVWF       FARG_rotateClockwise_pwm+0 
	MOVF        _TEST_RPM+1, 0 
	MOVWF       FARG_rotateClockwise_pwm+1 
	CALL        _rotateClockwise+0, 0
;linefollow.h,459 :: 		}
	GOTO        L_lineFollowNormal499
L_lineFollowNormal500:
;linefollow.h,460 :: 		}
	GOTO        L_lineFollowNormal501
L_lineFollowNormal498:
;linefollow.h,461 :: 		else if( (Scout==0 && Sensor1==1 && Sensor2==1 && Sensor3==1 && Sensor4==1 && Sensor5==1 && Sensor6==0 && Sensor7==0 && Sensor8==0 && Sensor9==0) && (Scout==0 && Sensor1==1 && Sensor2==1 && Sensor3==1 && Sensor4==1 && Sensor5==0 && Sensor6==0 && Sensor7==0 && Sensor8==0 && Sensor9==0)){
	BTFSC       PORTB+0, 5 
	GOTO        L_lineFollowNormal508
	BTFSS       PORTB+0, 4 
	GOTO        L_lineFollowNormal508
	BTFSS       PORTB+0, 3 
	GOTO        L_lineFollowNormal508
	BTFSS       PORTD+0, 4 
	GOTO        L_lineFollowNormal508
	BTFSS       PORTD+0, 5 
	GOTO        L_lineFollowNormal508
	BTFSS       PORTD+0, 6 
	GOTO        L_lineFollowNormal508
	BTFSC       PORTD+0, 7 
	GOTO        L_lineFollowNormal508
	BTFSC       PORTB+0, 2 
	GOTO        L_lineFollowNormal508
	BTFSC       PORTB+0, 6 
	GOTO        L_lineFollowNormal508
	BTFSC       PORTB+0, 7 
	GOTO        L_lineFollowNormal508
L__lineFollowNormal936:
	BTFSC       PORTB+0, 5 
	GOTO        L_lineFollowNormal508
	BTFSS       PORTB+0, 4 
	GOTO        L_lineFollowNormal508
	BTFSS       PORTB+0, 3 
	GOTO        L_lineFollowNormal508
	BTFSS       PORTD+0, 4 
	GOTO        L_lineFollowNormal508
	BTFSS       PORTD+0, 5 
	GOTO        L_lineFollowNormal508
	BTFSC       PORTD+0, 6 
	GOTO        L_lineFollowNormal508
	BTFSC       PORTD+0, 7 
	GOTO        L_lineFollowNormal508
	BTFSC       PORTB+0, 2 
	GOTO        L_lineFollowNormal508
	BTFSC       PORTB+0, 6 
	GOTO        L_lineFollowNormal508
	BTFSC       PORTB+0, 7 
	GOTO        L_lineFollowNormal508
L__lineFollowNormal935:
L__lineFollowNormal934:
;linefollow.h,463 :: 		debugText = "90 to left..   ";
	MOVLW       ?lstr31_Main_327.0V+0
	MOVWF       _debugText+0 
	MOVLW       hi_addr(?lstr31_Main_327.0V+0)
	MOVWF       _debugText+1 
;linefollow.h,464 :: 		UART1_Write_Text(debugText);
	MOVF        _debugText+0, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVF        _debugText+1, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;linefollow.h,465 :: 		sendSensorStatus();
	CALL        _sendSensorStatus+0, 0
;linefollow.h,466 :: 		while(Scout==0){
L_lineFollowNormal509:
	BTFSC       PORTB+0, 5 
	GOTO        L_lineFollowNormal510
;linefollow.h,467 :: 		rotateAntiClockwise(TEST_RPM);
	MOVF        _TEST_RPM+0, 0 
	MOVWF       FARG_rotateAntiClockwise_pwm+0 
	MOVF        _TEST_RPM+1, 0 
	MOVWF       FARG_rotateAntiClockwise_pwm+1 
	CALL        _rotateAntiClockwise+0, 0
;linefollow.h,468 :: 		}
	GOTO        L_lineFollowNormal509
L_lineFollowNormal510:
;linefollow.h,469 :: 		}
	GOTO        L_lineFollowNormal511
L_lineFollowNormal508:
;linefollow.h,470 :: 		else if( Sensor4==1 && Sensor5==1){
	BTFSS       PORTD+0, 5 
	GOTO        L_lineFollowNormal514
	BTFSS       PORTD+0, 6 
	GOTO        L_lineFollowNormal514
L__lineFollowNormal933:
;linefollow.h,472 :: 		moveForward(TEST_RPM,TEST_RPM);
	MOVF        _TEST_RPM+0, 0 
	MOVWF       FARG_moveForward_pwmLeft+0 
	MOVF        _TEST_RPM+1, 0 
	MOVWF       FARG_moveForward_pwmLeft+1 
	MOVF        _TEST_RPM+0, 0 
	MOVWF       FARG_moveForward_pwmRight+0 
	MOVF        _TEST_RPM+1, 0 
	MOVWF       FARG_moveForward_pwmRight+1 
	CALL        _moveForward+0, 0
;linefollow.h,473 :: 		}
	GOTO        L_lineFollowNormal515
L_lineFollowNormal514:
;linefollow.h,474 :: 		else if( Sensor4==1 && Sensor5==0 && Scout==1){
	BTFSS       PORTD+0, 5 
	GOTO        L_lineFollowNormal518
	BTFSC       PORTD+0, 6 
	GOTO        L_lineFollowNormal518
	BTFSS       PORTB+0, 5 
	GOTO        L_lineFollowNormal518
L__lineFollowNormal932:
;linefollow.h,476 :: 		turnLeft(TEST_RPM);
	MOVF        _TEST_RPM+0, 0 
	MOVWF       FARG_turnLeft_pwmRight+0 
	MOVF        _TEST_RPM+1, 0 
	MOVWF       FARG_turnLeft_pwmRight+1 
	CALL        _turnLeft+0, 0
;linefollow.h,477 :: 		}
	GOTO        L_lineFollowNormal519
L_lineFollowNormal518:
;linefollow.h,478 :: 		else if( Sensor4==0 && Sensor5==1 && Scout==1){
	BTFSC       PORTD+0, 5 
	GOTO        L_lineFollowNormal522
	BTFSS       PORTD+0, 6 
	GOTO        L_lineFollowNormal522
	BTFSS       PORTB+0, 5 
	GOTO        L_lineFollowNormal522
L__lineFollowNormal931:
;linefollow.h,480 :: 		turnRight(TEST_RPM);
	MOVF        _TEST_RPM+0, 0 
	MOVWF       FARG_turnRight_pwmLeft+0 
	MOVF        _TEST_RPM+1, 0 
	MOVWF       FARG_turnRight_pwmLeft+1 
	CALL        _turnRight+0, 0
;linefollow.h,481 :: 		}
	GOTO        L_lineFollowNormal523
L_lineFollowNormal522:
;linefollow.h,482 :: 		else if( Sensor4==1 && Sensor5==0 && Scout==0){
	BTFSS       PORTD+0, 5 
	GOTO        L_lineFollowNormal526
	BTFSC       PORTD+0, 6 
	GOTO        L_lineFollowNormal526
	BTFSC       PORTB+0, 5 
	GOTO        L_lineFollowNormal526
L__lineFollowNormal930:
;linefollow.h,484 :: 		stop();
	CALL        _stop+0, 0
;linefollow.h,486 :: 		rotateAntiClockwise(TEST_RPM);
	MOVF        _TEST_RPM+0, 0 
	MOVWF       FARG_rotateAntiClockwise_pwm+0 
	MOVF        _TEST_RPM+1, 0 
	MOVWF       FARG_rotateAntiClockwise_pwm+1 
	CALL        _rotateAntiClockwise+0, 0
;linefollow.h,487 :: 		}
	GOTO        L_lineFollowNormal527
L_lineFollowNormal526:
;linefollow.h,488 :: 		else if( Sensor4==0 && Sensor5==1 && Scout==0){
	BTFSC       PORTD+0, 5 
	GOTO        L_lineFollowNormal530
	BTFSS       PORTD+0, 6 
	GOTO        L_lineFollowNormal530
	BTFSC       PORTB+0, 5 
	GOTO        L_lineFollowNormal530
L__lineFollowNormal929:
;linefollow.h,490 :: 		stop();
	CALL        _stop+0, 0
;linefollow.h,492 :: 		rotateClockwise(TEST_RPM);
	MOVF        _TEST_RPM+0, 0 
	MOVWF       FARG_rotateClockwise_pwm+0 
	MOVF        _TEST_RPM+1, 0 
	MOVWF       FARG_rotateClockwise_pwm+1 
	CALL        _rotateClockwise+0, 0
;linefollow.h,493 :: 		}
	GOTO        L_lineFollowNormal531
L_lineFollowNormal530:
;linefollow.h,494 :: 		else if( Sensor4==0 && Sensor5==0 ){
	BTFSC       PORTD+0, 5 
	GOTO        L_lineFollowNormal534
	BTFSC       PORTD+0, 6 
	GOTO        L_lineFollowNormal534
L__lineFollowNormal928:
;linefollow.h,495 :: 		if(Sensor3 ==1){
	BTFSS       PORTD+0, 4 
	GOTO        L_lineFollowNormal535
;linefollow.h,496 :: 		rotateAntiClockwise(TEST_RPM);
	MOVF        _TEST_RPM+0, 0 
	MOVWF       FARG_rotateAntiClockwise_pwm+0 
	MOVF        _TEST_RPM+1, 0 
	MOVWF       FARG_rotateAntiClockwise_pwm+1 
	CALL        _rotateAntiClockwise+0, 0
;linefollow.h,497 :: 		}
	GOTO        L_lineFollowNormal536
L_lineFollowNormal535:
;linefollow.h,498 :: 		else if(Sensor6 ==1){
	BTFSS       PORTD+0, 7 
	GOTO        L_lineFollowNormal537
;linefollow.h,499 :: 		rotateClockwise(TEST_RPM);
	MOVF        _TEST_RPM+0, 0 
	MOVWF       FARG_rotateClockwise_pwm+0 
	MOVF        _TEST_RPM+1, 0 
	MOVWF       FARG_rotateClockwise_pwm+1 
	CALL        _rotateClockwise+0, 0
;linefollow.h,500 :: 		}
	GOTO        L_lineFollowNormal538
L_lineFollowNormal537:
;linefollow.h,501 :: 		else if(Sensor2 ==1){
	BTFSS       PORTB+0, 3 
	GOTO        L_lineFollowNormal539
;linefollow.h,502 :: 		rotateAntiClockwise(TEST_RPM);
	MOVF        _TEST_RPM+0, 0 
	MOVWF       FARG_rotateAntiClockwise_pwm+0 
	MOVF        _TEST_RPM+1, 0 
	MOVWF       FARG_rotateAntiClockwise_pwm+1 
	CALL        _rotateAntiClockwise+0, 0
;linefollow.h,503 :: 		}
	GOTO        L_lineFollowNormal540
L_lineFollowNormal539:
;linefollow.h,504 :: 		else if(Sensor7 ==1){
	BTFSS       PORTB+0, 2 
	GOTO        L_lineFollowNormal541
;linefollow.h,505 :: 		rotateClockwise(TEST_RPM);
	MOVF        _TEST_RPM+0, 0 
	MOVWF       FARG_rotateClockwise_pwm+0 
	MOVF        _TEST_RPM+1, 0 
	MOVWF       FARG_rotateClockwise_pwm+1 
	CALL        _rotateClockwise+0, 0
;linefollow.h,506 :: 		}
	GOTO        L_lineFollowNormal542
L_lineFollowNormal541:
;linefollow.h,509 :: 		stop();
	CALL        _stop+0, 0
;linefollow.h,512 :: 		}
L_lineFollowNormal542:
L_lineFollowNormal540:
L_lineFollowNormal538:
L_lineFollowNormal536:
;linefollow.h,513 :: 		}
L_lineFollowNormal534:
L_lineFollowNormal531:
L_lineFollowNormal527:
L_lineFollowNormal523:
L_lineFollowNormal519:
L_lineFollowNormal515:
L_lineFollowNormal511:
L_lineFollowNormal501:
L_lineFollowNormal491:
;linefollow.h,515 :: 		}
	GOTO        L_lineFollowNormal486
;linefollow.h,517 :: 		}
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
;configuration.h,14 :: 		TRISC = 0b10001000;
	MOVLW       136
	MOVWF       TRISC+0 
;configuration.h,15 :: 		TRISD = 0b11110011;
	MOVLW       243
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

;ir.h,13 :: 		float getDistanceIR_GP2D120(char sensor){           //10-bit results
;ir.h,14 :: 		if (sensor == 'M'){
	MOVF        FARG_getDistanceIR_GP2D120_sensor+0, 0 
	XORLW       77
	BTFSS       STATUS+0, 2 
	GOTO        L_getDistanceIR_GP2D120543
;ir.h,15 :: 		ir_value = ADC_Read(IRSensorCenter);
	MOVLW       0
	BTFSC       PORTA+0, 0 
	MOVLW       1
	MOVWF       FARG_ADC_Read_channel+0 
	CALL        _ADC_Read+0, 0
	MOVF        R0, 0 
	MOVWF       _ir_value+0 
	MOVF        R1, 0 
	MOVWF       _ir_value+1 
;ir.h,16 :: 		}
	GOTO        L_getDistanceIR_GP2D120544
L_getDistanceIR_GP2D120543:
;ir.h,17 :: 		else if(sensor == 'R'){
	MOVF        FARG_getDistanceIR_GP2D120_sensor+0, 0 
	XORLW       82
	BTFSS       STATUS+0, 2 
	GOTO        L_getDistanceIR_GP2D120545
;ir.h,18 :: 		ir_value = ADC_Read(IRSensorRight);
	MOVLW       0
	BTFSC       PORTA+0, 1 
	MOVLW       1
	MOVWF       FARG_ADC_Read_channel+0 
	CALL        _ADC_Read+0, 0
	MOVF        R0, 0 
	MOVWF       _ir_value+0 
	MOVF        R1, 0 
	MOVWF       _ir_value+1 
;ir.h,19 :: 		}
	GOTO        L_getDistanceIR_GP2D120546
L_getDistanceIR_GP2D120545:
;ir.h,20 :: 		else if(sensor == 'L'){
	MOVF        FARG_getDistanceIR_GP2D120_sensor+0, 0 
	XORLW       76
	BTFSS       STATUS+0, 2 
	GOTO        L_getDistanceIR_GP2D120547
;ir.h,21 :: 		ir_value = ADC_Read(IRSensorLeft);
	MOVLW       0
	BTFSC       PORTA+0, 2 
	MOVLW       1
	MOVWF       FARG_ADC_Read_channel+0 
	CALL        _ADC_Read+0, 0
	MOVF        R0, 0 
	MOVWF       _ir_value+0 
	MOVF        R1, 0 
	MOVWF       _ir_value+1 
;ir.h,22 :: 		}
	GOTO        L_getDistanceIR_GP2D120548
L_getDistanceIR_GP2D120547:
;ir.h,24 :: 		ir_value = 0;
	CLRF        _ir_value+0 
	CLRF        _ir_value+1 
L_getDistanceIR_GP2D120548:
L_getDistanceIR_GP2D120546:
L_getDistanceIR_GP2D120544:
;ir.h,26 :: 		voltage = (float)ir_value/1024*5;
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
;ir.h,27 :: 		if( 610<=ir_value && ir_value<623)         //3cm - 3.75cm
	MOVLW       2
	SUBWF       _ir_value+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__getDistanceIR_GP2D120993
	MOVLW       98
	SUBWF       _ir_value+0, 0 
L__getDistanceIR_GP2D120993:
	BTFSS       STATUS+0, 0 
	GOTO        L_getDistanceIR_GP2D120551
	MOVLW       2
	SUBWF       _ir_value+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__getDistanceIR_GP2D120994
	MOVLW       111
	SUBWF       _ir_value+0, 0 
L__getDistanceIR_GP2D120994:
	BTFSC       STATUS+0, 0 
	GOTO        L_getDistanceIR_GP2D120551
L__getDistanceIR_GP2D120957:
;ir.h,28 :: 		return 3.0 - 12.5*(voltage - 3.04);
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
L_getDistanceIR_GP2D120551:
;ir.h,30 :: 		else if( 557<=ir_value && ir_value<610 )
	MOVLW       2
	SUBWF       _ir_value+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__getDistanceIR_GP2D120995
	MOVLW       45
	SUBWF       _ir_value+0, 0 
L__getDistanceIR_GP2D120995:
	BTFSS       STATUS+0, 0 
	GOTO        L_getDistanceIR_GP2D120555
	MOVLW       2
	SUBWF       _ir_value+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__getDistanceIR_GP2D120996
	MOVLW       98
	SUBWF       _ir_value+0, 0 
L__getDistanceIR_GP2D120996:
	BTFSC       STATUS+0, 0 
	GOTO        L_getDistanceIR_GP2D120555
L__getDistanceIR_GP2D120956:
;ir.h,31 :: 		return 3.75 - 1.04*(voltage - 2.98);  //3.75 - 4cm
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
L_getDistanceIR_GP2D120555:
;ir.h,33 :: 		else if( 481<=ir_value && ir_value<557 )
	MOVLW       1
	SUBWF       _ir_value+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__getDistanceIR_GP2D120997
	MOVLW       225
	SUBWF       _ir_value+0, 0 
L__getDistanceIR_GP2D120997:
	BTFSS       STATUS+0, 0 
	GOTO        L_getDistanceIR_GP2D120559
	MOVLW       2
	SUBWF       _ir_value+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__getDistanceIR_GP2D120998
	MOVLW       45
	SUBWF       _ir_value+0, 0 
L__getDistanceIR_GP2D120998:
	BTFSC       STATUS+0, 0 
	GOTO        L_getDistanceIR_GP2D120559
L__getDistanceIR_GP2D120955:
;ir.h,34 :: 		return 5 - 2.5*(voltage - 2.75);       //4cm - 5cm
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
L_getDistanceIR_GP2D120559:
;ir.h,36 :: 		else if( 409<=ir_value && ir_value<481 )
	MOVLW       1
	SUBWF       _ir_value+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__getDistanceIR_GP2D120999
	MOVLW       153
	SUBWF       _ir_value+0, 0 
L__getDistanceIR_GP2D120999:
	BTFSS       STATUS+0, 0 
	GOTO        L_getDistanceIR_GP2D120563
	MOVLW       1
	SUBWF       _ir_value+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__getDistanceIR_GP2D1201000
	MOVLW       225
	SUBWF       _ir_value+0, 0 
L__getDistanceIR_GP2D1201000:
	BTFSC       STATUS+0, 0 
	GOTO        L_getDistanceIR_GP2D120563
L__getDistanceIR_GP2D120954:
;ir.h,37 :: 		return 6 - 2.85*(voltage - 2.35);       //5cm - 6cm
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
L_getDistanceIR_GP2D120563:
;ir.h,39 :: 		else if( 364<=ir_value && ir_value<409 )
	MOVLW       1
	SUBWF       _ir_value+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__getDistanceIR_GP2D1201001
	MOVLW       108
	SUBWF       _ir_value+0, 0 
L__getDistanceIR_GP2D1201001:
	BTFSS       STATUS+0, 0 
	GOTO        L_getDistanceIR_GP2D120567
	MOVLW       1
	SUBWF       _ir_value+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__getDistanceIR_GP2D1201002
	MOVLW       153
	SUBWF       _ir_value+0, 0 
L__getDistanceIR_GP2D1201002:
	BTFSC       STATUS+0, 0 
	GOTO        L_getDistanceIR_GP2D120567
L__getDistanceIR_GP2D120953:
;ir.h,40 :: 		return 7 - 4*(voltage - 2);             //6cm - 7cm
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
L_getDistanceIR_GP2D120567:
;ir.h,42 :: 		else if( 317<=ir_value && ir_value<364 )
	MOVLW       1
	SUBWF       _ir_value+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__getDistanceIR_GP2D1201003
	MOVLW       61
	SUBWF       _ir_value+0, 0 
L__getDistanceIR_GP2D1201003:
	BTFSS       STATUS+0, 0 
	GOTO        L_getDistanceIR_GP2D120571
	MOVLW       1
	SUBWF       _ir_value+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__getDistanceIR_GP2D1201004
	MOVLW       108
	SUBWF       _ir_value+0, 0 
L__getDistanceIR_GP2D1201004:
	BTFSC       STATUS+0, 0 
	GOTO        L_getDistanceIR_GP2D120571
L__getDistanceIR_GP2D120952:
;ir.h,43 :: 		return 8 - 5*(voltage - 1.75);          //7cm - 8cm
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
L_getDistanceIR_GP2D120571:
;ir.h,45 :: 		else if( 286<=ir_value && ir_value<317 )
	MOVLW       1
	SUBWF       _ir_value+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__getDistanceIR_GP2D1201005
	MOVLW       30
	SUBWF       _ir_value+0, 0 
L__getDistanceIR_GP2D1201005:
	BTFSS       STATUS+0, 0 
	GOTO        L_getDistanceIR_GP2D120575
	MOVLW       1
	SUBWF       _ir_value+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__getDistanceIR_GP2D1201006
	MOVLW       61
	SUBWF       _ir_value+0, 0 
L__getDistanceIR_GP2D1201006:
	BTFSC       STATUS+0, 0 
	GOTO        L_getDistanceIR_GP2D120575
L__getDistanceIR_GP2D120951:
;ir.h,46 :: 		return 9 - 6.667*(voltage - 1.55);      //8cm - 9cm
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
L_getDistanceIR_GP2D120575:
;ir.h,48 :: 		else if( 256<=ir_value && ir_value<286 )
	MOVLW       1
	SUBWF       _ir_value+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__getDistanceIR_GP2D1201007
	MOVLW       0
	SUBWF       _ir_value+0, 0 
L__getDistanceIR_GP2D1201007:
	BTFSS       STATUS+0, 0 
	GOTO        L_getDistanceIR_GP2D120579
	MOVLW       1
	SUBWF       _ir_value+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__getDistanceIR_GP2D1201008
	MOVLW       30
	SUBWF       _ir_value+0, 0 
L__getDistanceIR_GP2D1201008:
	BTFSC       STATUS+0, 0 
	GOTO        L_getDistanceIR_GP2D120579
L__getDistanceIR_GP2D120950:
;ir.h,49 :: 		return 10 - 6.667*(voltage - 1.4);       //9cm - 10cm
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
L_getDistanceIR_GP2D120579:
;ir.h,51 :: 		else if( 215<=ir_value && ir_value<256 )
	MOVLW       0
	SUBWF       _ir_value+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__getDistanceIR_GP2D1201009
	MOVLW       215
	SUBWF       _ir_value+0, 0 
L__getDistanceIR_GP2D1201009:
	BTFSS       STATUS+0, 0 
	GOTO        L_getDistanceIR_GP2D120583
	MOVLW       1
	SUBWF       _ir_value+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__getDistanceIR_GP2D1201010
	MOVLW       0
	SUBWF       _ir_value+0, 0 
L__getDistanceIR_GP2D1201010:
	BTFSC       STATUS+0, 0 
	GOTO        L_getDistanceIR_GP2D120583
L__getDistanceIR_GP2D120949:
;ir.h,52 :: 		return 12 - 10*(voltage - 1.25);         //10cm - 12cm
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
L_getDistanceIR_GP2D120583:
;ir.h,54 :: 		else if( 186<=ir_value && ir_value<215 )
	MOVLW       0
	SUBWF       _ir_value+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__getDistanceIR_GP2D1201011
	MOVLW       186
	SUBWF       _ir_value+0, 0 
L__getDistanceIR_GP2D1201011:
	BTFSS       STATUS+0, 0 
	GOTO        L_getDistanceIR_GP2D120587
	MOVLW       0
	SUBWF       _ir_value+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__getDistanceIR_GP2D1201012
	MOVLW       215
	SUBWF       _ir_value+0, 0 
L__getDistanceIR_GP2D1201012:
	BTFSC       STATUS+0, 0 
	GOTO        L_getDistanceIR_GP2D120587
L__getDistanceIR_GP2D120948:
;ir.h,55 :: 		return 14 - 15.38*(voltage - 1.05);      //12cm - 14cm
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
L_getDistanceIR_GP2D120587:
;ir.h,57 :: 		else if( 166<=ir_value && ir_value<186 )
	MOVLW       0
	SUBWF       _ir_value+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__getDistanceIR_GP2D1201013
	MOVLW       166
	SUBWF       _ir_value+0, 0 
L__getDistanceIR_GP2D1201013:
	BTFSS       STATUS+0, 0 
	GOTO        L_getDistanceIR_GP2D120591
	MOVLW       0
	SUBWF       _ir_value+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__getDistanceIR_GP2D1201014
	MOVLW       186
	SUBWF       _ir_value+0, 0 
L__getDistanceIR_GP2D1201014:
	BTFSC       STATUS+0, 0 
	GOTO        L_getDistanceIR_GP2D120591
L__getDistanceIR_GP2D120947:
;ir.h,58 :: 		return 16 - 20*(voltage - 0.94);         //14cm - 16cm
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
L_getDistanceIR_GP2D120591:
;ir.h,60 :: 		else if( 147<=ir_value && ir_value<166 )
	MOVLW       0
	SUBWF       _ir_value+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__getDistanceIR_GP2D1201015
	MOVLW       147
	SUBWF       _ir_value+0, 0 
L__getDistanceIR_GP2D1201015:
	BTFSS       STATUS+0, 0 
	GOTO        L_getDistanceIR_GP2D120595
	MOVLW       0
	SUBWF       _ir_value+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__getDistanceIR_GP2D1201016
	MOVLW       166
	SUBWF       _ir_value+0, 0 
L__getDistanceIR_GP2D1201016:
	BTFSC       STATUS+0, 0 
	GOTO        L_getDistanceIR_GP2D120595
L__getDistanceIR_GP2D120946:
;ir.h,61 :: 		return 18 - 22.23*(voltage - 0.81);      //16cm - 18cm
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
L_getDistanceIR_GP2D120595:
;ir.h,63 :: 		else if( 133<=ir_value && ir_value<147 )
	MOVLW       0
	SUBWF       _ir_value+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__getDistanceIR_GP2D1201017
	MOVLW       133
	SUBWF       _ir_value+0, 0 
L__getDistanceIR_GP2D1201017:
	BTFSS       STATUS+0, 0 
	GOTO        L_getDistanceIR_GP2D120599
	MOVLW       0
	SUBWF       _ir_value+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__getDistanceIR_GP2D1201018
	MOVLW       147
	SUBWF       _ir_value+0, 0 
L__getDistanceIR_GP2D1201018:
	BTFSC       STATUS+0, 0 
	GOTO        L_getDistanceIR_GP2D120599
L__getDistanceIR_GP2D120945:
;ir.h,64 :: 		return 20 - 28.57*(voltage - 0.65);       //18cm - 20cm
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
L_getDistanceIR_GP2D120599:
;ir.h,66 :: 		else if( 106<=ir_value && ir_value<133 )
	MOVLW       0
	SUBWF       _ir_value+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__getDistanceIR_GP2D1201019
	MOVLW       106
	SUBWF       _ir_value+0, 0 
L__getDistanceIR_GP2D1201019:
	BTFSS       STATUS+0, 0 
	GOTO        L_getDistanceIR_GP2D120603
	MOVLW       0
	SUBWF       _ir_value+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__getDistanceIR_GP2D1201020
	MOVLW       133
	SUBWF       _ir_value+0, 0 
L__getDistanceIR_GP2D1201020:
	BTFSC       STATUS+0, 0 
	GOTO        L_getDistanceIR_GP2D120603
L__getDistanceIR_GP2D120944:
;ir.h,67 :: 		return 25 - 45.45*(voltage - 0.52);       //20cm - 25cm
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
L_getDistanceIR_GP2D120603:
;ir.h,69 :: 		else if( 88<=ir_value && ir_value<106 )
	MOVLW       0
	SUBWF       _ir_value+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__getDistanceIR_GP2D1201021
	MOVLW       88
	SUBWF       _ir_value+0, 0 
L__getDistanceIR_GP2D1201021:
	BTFSS       STATUS+0, 0 
	GOTO        L_getDistanceIR_GP2D120607
	MOVLW       0
	SUBWF       _ir_value+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__getDistanceIR_GP2D1201022
	MOVLW       106
	SUBWF       _ir_value+0, 0 
L__getDistanceIR_GP2D1201022:
	BTFSC       STATUS+0, 0 
	GOTO        L_getDistanceIR_GP2D120607
L__getDistanceIR_GP2D120943:
;ir.h,70 :: 		return 30 - 55*(voltage - 0.43);           //25cm - 30cm
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
L_getDistanceIR_GP2D120607:
;ir.h,72 :: 		else if( 78<=ir_value && ir_value<88 )
	MOVLW       0
	SUBWF       _ir_value+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__getDistanceIR_GP2D1201023
	MOVLW       78
	SUBWF       _ir_value+0, 0 
L__getDistanceIR_GP2D1201023:
	BTFSS       STATUS+0, 0 
	GOTO        L_getDistanceIR_GP2D120611
	MOVLW       0
	SUBWF       _ir_value+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__getDistanceIR_GP2D1201024
	MOVLW       88
	SUBWF       _ir_value+0, 0 
L__getDistanceIR_GP2D1201024:
	BTFSC       STATUS+0, 0 
	GOTO        L_getDistanceIR_GP2D120611
L__getDistanceIR_GP2D120942:
;ir.h,73 :: 		return 35 - 100*(voltage - 0.38);         //30cm - 35cm
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
L_getDistanceIR_GP2D120611:
;ir.h,75 :: 		else if( 65<=ir_value && ir_value<78 )
	MOVLW       0
	SUBWF       _ir_value+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__getDistanceIR_GP2D1201025
	MOVLW       65
	SUBWF       _ir_value+0, 0 
L__getDistanceIR_GP2D1201025:
	BTFSS       STATUS+0, 0 
	GOTO        L_getDistanceIR_GP2D120615
	MOVLW       0
	SUBWF       _ir_value+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__getDistanceIR_GP2D1201026
	MOVLW       78
	SUBWF       _ir_value+0, 0 
L__getDistanceIR_GP2D1201026:
	BTFSC       STATUS+0, 0 
	GOTO        L_getDistanceIR_GP2D120615
L__getDistanceIR_GP2D120941:
;ir.h,76 :: 		return 40 - 83.33*(voltage - 0.32);       //35cm - 40cm
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
L_getDistanceIR_GP2D120615:
;ir.h,78 :: 		return 50;
	MOVLW       0
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	MOVLW       72
	MOVWF       R2 
	MOVLW       132
	MOVWF       R3 
;ir.h,79 :: 		}
	RETURN      0
; end of _getDistanceIR_GP2D120

_isRightSafe:

;ir.h,111 :: 		int isRightSafe(){
;ir.h,112 :: 		ir_value = ADC_Read(IRSensorRight);
	MOVLW       0
	BTFSC       PORTA+0, 1 
	MOVLW       1
	MOVWF       FARG_ADC_Read_channel+0 
	CALL        _ADC_Read+0, 0
	MOVF        R0, 0 
	MOVWF       _ir_value+0 
	MOVF        R1, 0 
	MOVWF       _ir_value+1 
;ir.h,113 :: 		if(250<=ir_value && ir_value<800){                         // ~5cm
	MOVLW       0
	SUBWF       R1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__isRightSafe1027
	MOVLW       250
	SUBWF       R0, 0 
L__isRightSafe1027:
	BTFSS       STATUS+0, 0 
	GOTO        L_isRightSafe619
	MOVLW       3
	SUBWF       _ir_value+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__isRightSafe1028
	MOVLW       32
	SUBWF       _ir_value+0, 0 
L__isRightSafe1028:
	BTFSC       STATUS+0, 0 
	GOTO        L_isRightSafe619
L__isRightSafe958:
;ir.h,114 :: 		return FALSE;
	CLRF        R0 
	CLRF        R1 
	RETURN      0
;ir.h,115 :: 		}
L_isRightSafe619:
;ir.h,116 :: 		return TRUE;
	MOVLW       1
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
;ir.h,117 :: 		}
	RETURN      0
; end of _isRightSafe

_isMiddleSafe:

;ir.h,119 :: 		int isMiddleSafe(){
;ir.h,120 :: 		ir_value = ADC_Read(IRSensorCenter);
	MOVLW       0
	BTFSC       PORTA+0, 0 
	MOVLW       1
	MOVWF       FARG_ADC_Read_channel+0 
	CALL        _ADC_Read+0, 0
	MOVF        R0, 0 
	MOVWF       _ir_value+0 
	MOVF        R1, 0 
	MOVWF       _ir_value+1 
;ir.h,121 :: 		if(250<=ir_value && ir_value<800){                         // ~5cm
	MOVLW       0
	SUBWF       R1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__isMiddleSafe1029
	MOVLW       250
	SUBWF       R0, 0 
L__isMiddleSafe1029:
	BTFSS       STATUS+0, 0 
	GOTO        L_isMiddleSafe622
	MOVLW       3
	SUBWF       _ir_value+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__isMiddleSafe1030
	MOVLW       32
	SUBWF       _ir_value+0, 0 
L__isMiddleSafe1030:
	BTFSC       STATUS+0, 0 
	GOTO        L_isMiddleSafe622
L__isMiddleSafe959:
;ir.h,122 :: 		return FALSE;
	CLRF        R0 
	CLRF        R1 
	RETURN      0
;ir.h,123 :: 		}
L_isMiddleSafe622:
;ir.h,124 :: 		return TRUE;
	MOVLW       1
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
;ir.h,125 :: 		}
	RETURN      0
; end of _isMiddleSafe

_isLeftSafe:

;ir.h,127 :: 		int isLeftSafe(){
;ir.h,128 :: 		ir_value = ADC_Read(IRSensorLeft);
	MOVLW       0
	BTFSC       PORTA+0, 2 
	MOVLW       1
	MOVWF       FARG_ADC_Read_channel+0 
	CALL        _ADC_Read+0, 0
	MOVF        R0, 0 
	MOVWF       _ir_value+0 
	MOVF        R1, 0 
	MOVWF       _ir_value+1 
;ir.h,129 :: 		if(250<=ir_value && ir_value<800){                         // ~5cm
	MOVLW       0
	SUBWF       R1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__isLeftSafe1031
	MOVLW       250
	SUBWF       R0, 0 
L__isLeftSafe1031:
	BTFSS       STATUS+0, 0 
	GOTO        L_isLeftSafe625
	MOVLW       3
	SUBWF       _ir_value+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__isLeftSafe1032
	MOVLW       32
	SUBWF       _ir_value+0, 0 
L__isLeftSafe1032:
	BTFSC       STATUS+0, 0 
	GOTO        L_isLeftSafe625
L__isLeftSafe960:
;ir.h,130 :: 		return FALSE;
	CLRF        R0 
	CLRF        R1 
	RETURN      0
;ir.h,131 :: 		}
L_isLeftSafe625:
;ir.h,132 :: 		return TRUE;
	MOVLW       1
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
;ir.h,133 :: 		}
	RETURN      0
; end of _isLeftSafe

_getSonarDistance:

;sonar.h,14 :: 		float getSonarDistance(){
;sonar.h,15 :: 		TRIG_MIDDLE = 0;
	BCF         PORTA+0, 5 
;sonar.h,16 :: 		delay_us(10);
	MOVLW       16
	MOVWF       R13, 0
L_getSonarDistance626:
	DECFSZ      R13, 1, 0
	BRA         L_getSonarDistance626
	NOP
;sonar.h,17 :: 		TRIG_MIDDLE = 1;
	BSF         PORTA+0, 5 
;sonar.h,18 :: 		delay_us(10);
	MOVLW       16
	MOVWF       R13, 0
L_getSonarDistance627:
	DECFSZ      R13, 1, 0
	BRA         L_getSonarDistance627
	NOP
;sonar.h,19 :: 		TRIG_MIDDLE = 0;
	BCF         PORTA+0, 5 
;sonar.h,21 :: 		while(ECHO_MIDDLE==0);
L_getSonarDistance628:
	BTFSC       PORTE+0, 0 
	GOTO        L_getSonarDistance629
	GOTO        L_getSonarDistance628
L_getSonarDistance629:
;sonar.h,22 :: 		_counter = 0;
	CLRF        __counter+0 
	CLRF        __counter+1 
;sonar.h,24 :: 		while(ECHO_MIDDLE==1){
L_getSonarDistance630:
	BTFSS       PORTE+0, 0 
	GOTO        L_getSonarDistance631
;sonar.h,25 :: 		_counter++;
	INFSNZ      __counter+0, 1 
	INCF        __counter+1, 1 
;sonar.h,26 :: 		}
	GOTO        L_getSonarDistance630
L_getSonarDistance631:
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
	GOTO        L_getDistanceSonar2632
;sonar.h,40 :: 		TRIG_MIDDLE = 0;
	BCF         PORTA+0, 5 
;sonar.h,41 :: 		delay_us(2);
	MOVLW       3
	MOVWF       R13, 0
L_getDistanceSonar2633:
	DECFSZ      R13, 1, 0
	BRA         L_getDistanceSonar2633
;sonar.h,42 :: 		TRIG_MIDDLE = 1;
	BSF         PORTA+0, 5 
;sonar.h,43 :: 		delay_us(5);
	MOVLW       8
	MOVWF       R13, 0
L_getDistanceSonar2634:
	DECFSZ      R13, 1, 0
	BRA         L_getDistanceSonar2634
;sonar.h,44 :: 		TRIG_MIDDLE =0;
	BCF         PORTA+0, 5 
;sonar.h,46 :: 		while(!ECHO_MIDDLE)
L_getDistanceSonar2635:
	BTFSC       PORTE+0, 0 
	GOTO        L_getDistanceSonar2636
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
	GOTO        L__getDistanceSonar21033
	MOVF        getDistanceSonar2_H_L0+0, 0 
	SUBLW       240
L__getDistanceSonar21033:
	BTFSC       STATUS+0, 0 
	GOTO        L_getDistanceSonar2637
;sonar.h,51 :: 		break;
	GOTO        L_getDistanceSonar2636
L_getDistanceSonar2637:
;sonar.h,52 :: 		}
	GOTO        L_getDistanceSonar2635
L_getDistanceSonar2636:
;sonar.h,53 :: 		TMR1H=0;
	CLRF        TMR1H+0 
;sonar.h,54 :: 		TMR1L=0;
	CLRF        TMR1L+0 
;sonar.h,55 :: 		T1CON.TMR1ON=1;
	BSF         T1CON+0, 0 
;sonar.h,56 :: 		while(ECHO_MIDDLE)
L_getDistanceSonar2638:
	BTFSS       PORTE+0, 0 
	GOTO        L_getDistanceSonar2639
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
	GOTO        L__getDistanceSonar21034
	MOVF        getDistanceSonar2_H_L0+0, 0 
	SUBLW       240
L__getDistanceSonar21034:
	BTFSC       STATUS+0, 0 
	GOTO        L_getDistanceSonar2640
;sonar.h,61 :: 		break;
	GOTO        L_getDistanceSonar2639
L_getDistanceSonar2640:
;sonar.h,62 :: 		}
	GOTO        L_getDistanceSonar2638
L_getDistanceSonar2639:
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
L_getDistanceSonar2632:
;sonar.h,69 :: 		else if(Sensor == 'R'){
	MOVF        FARG_getDistanceSonar2_Sensor+0, 0 
	XORLW       82
	BTFSS       STATUS+0, 2 
	GOTO        L_getDistanceSonar2642
;sonar.h,70 :: 		TRIG_RIGHT = 0;
	BCF         PORTA+0, 0 
;sonar.h,71 :: 		delay_us(2);
	MOVLW       3
	MOVWF       R13, 0
L_getDistanceSonar2643:
	DECFSZ      R13, 1, 0
	BRA         L_getDistanceSonar2643
;sonar.h,72 :: 		TRIG_RIGHT = 1;
	BSF         PORTA+0, 0 
;sonar.h,73 :: 		delay_us(5);
	MOVLW       8
	MOVWF       R13, 0
L_getDistanceSonar2644:
	DECFSZ      R13, 1, 0
	BRA         L_getDistanceSonar2644
;sonar.h,74 :: 		TRIG_RIGHT =0;
	BCF         PORTA+0, 0 
;sonar.h,76 :: 		while(!ECHO_RIGHT)
L_getDistanceSonar2645:
	BTFSC       PORTA+0, 1 
	GOTO        L_getDistanceSonar2646
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
	GOTO        L__getDistanceSonar21035
	MOVF        getDistanceSonar2_H_L0+0, 0 
	SUBLW       240
L__getDistanceSonar21035:
	BTFSC       STATUS+0, 0 
	GOTO        L_getDistanceSonar2647
;sonar.h,81 :: 		break;
	GOTO        L_getDistanceSonar2646
L_getDistanceSonar2647:
;sonar.h,82 :: 		}
	GOTO        L_getDistanceSonar2645
L_getDistanceSonar2646:
;sonar.h,83 :: 		TMR1H=0;
	CLRF        TMR1H+0 
;sonar.h,84 :: 		TMR1L=0;
	CLRF        TMR1L+0 
;sonar.h,85 :: 		T1CON.TMR1ON=1;
	BSF         T1CON+0, 0 
;sonar.h,86 :: 		while(ECHO_RIGHT)
L_getDistanceSonar2648:
	BTFSS       PORTA+0, 1 
	GOTO        L_getDistanceSonar2649
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
	GOTO        L__getDistanceSonar21036
	MOVF        getDistanceSonar2_H_L0+0, 0 
	SUBLW       240
L__getDistanceSonar21036:
	BTFSC       STATUS+0, 0 
	GOTO        L_getDistanceSonar2650
;sonar.h,91 :: 		break;
	GOTO        L_getDistanceSonar2649
L_getDistanceSonar2650:
;sonar.h,92 :: 		}
	GOTO        L_getDistanceSonar2648
L_getDistanceSonar2649:
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
L_getDistanceSonar2642:
;sonar.h,99 :: 		else if(Sensor == 'L'){
	MOVF        FARG_getDistanceSonar2_Sensor+0, 0 
	XORLW       76
	BTFSS       STATUS+0, 2 
	GOTO        L_getDistanceSonar2652
;sonar.h,100 :: 		TRIG_LEFT = 0;
	BCF         PORTA+0, 2 
;sonar.h,101 :: 		delay_us(2);
	MOVLW       3
	MOVWF       R13, 0
L_getDistanceSonar2653:
	DECFSZ      R13, 1, 0
	BRA         L_getDistanceSonar2653
;sonar.h,102 :: 		TRIG_LEFT = 1;
	BSF         PORTA+0, 2 
;sonar.h,103 :: 		delay_us(5);
	MOVLW       8
	MOVWF       R13, 0
L_getDistanceSonar2654:
	DECFSZ      R13, 1, 0
	BRA         L_getDistanceSonar2654
;sonar.h,104 :: 		TRIG_LEFT =0;
	BCF         PORTA+0, 2 
;sonar.h,106 :: 		while(!ECHO_LEFT)
L_getDistanceSonar2655:
	BTFSC       PORTA+0, 3 
	GOTO        L_getDistanceSonar2656
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
	GOTO        L__getDistanceSonar21037
	MOVF        getDistanceSonar2_H_L0+0, 0 
	SUBLW       240
L__getDistanceSonar21037:
	BTFSC       STATUS+0, 0 
	GOTO        L_getDistanceSonar2657
;sonar.h,111 :: 		break;
	GOTO        L_getDistanceSonar2656
L_getDistanceSonar2657:
;sonar.h,112 :: 		}
	GOTO        L_getDistanceSonar2655
L_getDistanceSonar2656:
;sonar.h,113 :: 		TMR1H=0;
	CLRF        TMR1H+0 
;sonar.h,114 :: 		TMR1L=0;
	CLRF        TMR1L+0 
;sonar.h,115 :: 		T1CON.TMR1ON=1;
	BSF         T1CON+0, 0 
;sonar.h,116 :: 		while(ECHO_LEFT)
L_getDistanceSonar2658:
	BTFSS       PORTA+0, 3 
	GOTO        L_getDistanceSonar2659
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
	GOTO        L__getDistanceSonar21038
	MOVF        getDistanceSonar2_H_L0+0, 0 
	SUBLW       240
L__getDistanceSonar21038:
	BTFSC       STATUS+0, 0 
	GOTO        L_getDistanceSonar2660
;sonar.h,121 :: 		break;
	GOTO        L_getDistanceSonar2659
L_getDistanceSonar2660:
;sonar.h,122 :: 		}
	GOTO        L_getDistanceSonar2658
L_getDistanceSonar2659:
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
L_getDistanceSonar2652:
;sonar.h,129 :: 		}
	RETURN      0
; end of _getDistanceSonar2

_main:

;Main 7.0V.c,37 :: 		void main() {
;Main 7.0V.c,38 :: 		configure();
	CALL        _configure+0, 0
;Main 7.0V.c,39 :: 		setPID();
	CALL        _setPID+0, 0
;Main 7.0V.c,40 :: 		sendText("Starting...");
	MOVLW       ?lstr32_Main_327.0V+0
	MOVWF       FARG_sendText_aText+0 
	MOVLW       hi_addr(?lstr32_Main_327.0V+0)
	MOVWF       FARG_sendText_aText+1 
	CALL        _sendText+0, 0
;Main 7.0V.c,44 :: 		LEVEL1_STATE = NOT_REACHED;
	CLRF        _LEVEL1_STATE+0 
	CLRF        _LEVEL1_STATE+1 
;Main 7.0V.c,45 :: 		sendText("Starting Block  ");
	MOVLW       ?lstr33_Main_327.0V+0
	MOVWF       FARG_sendText_aText+0 
	MOVLW       hi_addr(?lstr33_Main_327.0V+0)
	MOVWF       FARG_sendText_aText+1 
	CALL        _sendText+0, 0
;Main 7.0V.c,46 :: 		LEVEL = 0;
	CLRF        _LEVEL+0 
	CLRF        _LEVEL+1 
;Main 7.0V.c,48 :: 		while(isAllWhite())
L_main661:
	CALL        _isAllWhite+0, 0
	MOVF        R0, 0 
	IORWF       R1, 0 
	BTFSC       STATUS+0, 2 
	GOTO        L_main662
;Main 7.0V.c,49 :: 		moveStraightSlow();
	CALL        _moveStraightSlow+0, 0
	GOTO        L_main661
L_main662:
;Main 7.0V.c,50 :: 		delay_ms(10);
	MOVLW       65
	MOVWF       R12, 0
	MOVLW       238
	MOVWF       R13, 0
L_main663:
	DECFSZ      R13, 1, 0
	BRA         L_main663
	DECFSZ      R12, 1, 0
	BRA         L_main663
	NOP
;Main 7.0V.c,51 :: 		LEVEL = 1;
	MOVLW       1
	MOVWF       _LEVEL+0 
	MOVLW       0
	MOVWF       _LEVEL+1 
;Main 7.0V.c,52 :: 		sendText("Level 1 Starting  ");
	MOVLW       ?lstr34_Main_327.0V+0
	MOVWF       FARG_sendText_aText+0 
	MOVLW       hi_addr(?lstr34_Main_327.0V+0)
	MOVWF       FARG_sendText_aText+1 
	CALL        _sendText+0, 0
;Main 7.0V.c,53 :: 		LEVEL1_STATE = REACHED;
	MOVLW       1
	MOVWF       _LEVEL1_STATE+0 
	MOVLW       0
	MOVWF       _LEVEL1_STATE+1 
;Main 7.0V.c,54 :: 		stop();
	CALL        _stop+0, 0
;Main 7.0V.c,58 :: 		moveForward(205,200);
	MOVLW       205
	MOVWF       FARG_moveForward_pwmLeft+0 
	MOVLW       0
	MOVWF       FARG_moveForward_pwmLeft+1 
	MOVLW       200
	MOVWF       FARG_moveForward_pwmRight+0 
	MOVLW       0
	MOVWF       FARG_moveForward_pwmRight+1 
	CALL        _moveForward+0, 0
;Main 7.0V.c,59 :: 		delay_ms(100);
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       138
	MOVWF       R12, 0
	MOVLW       85
	MOVWF       R13, 0
L_main664:
	DECFSZ      R13, 1, 0
	BRA         L_main664
	DECFSZ      R12, 1, 0
	BRA         L_main664
	DECFSZ      R11, 1, 0
	BRA         L_main664
	NOP
	NOP
;Main 7.0V.c,60 :: 		while(!isAllBlack()){
L_main665:
	CALL        _isAllBlack+0, 0
	MOVF        R0, 0 
	IORWF       R1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_main666
;Main 7.0V.c,62 :: 		if( Scout==1 &&(Sensor3==1 || Sensor4==1 || Sensor5==1 || Sensor6==1 || Sensor7==1) && Sensor1==0 && Sensor2==0 && Sensor8==0 && Sensor9==0)
	BTFSS       PORTB+0, 5 
	GOTO        L_main671
	BTFSC       PORTD+0, 4 
	GOTO        L__main964
	BTFSC       PORTD+0, 5 
	GOTO        L__main964
	BTFSC       PORTD+0, 6 
	GOTO        L__main964
	BTFSC       PORTD+0, 7 
	GOTO        L__main964
	BTFSC       PORTB+0, 2 
	GOTO        L__main964
	GOTO        L_main671
L__main964:
	BTFSC       PORTB+0, 4 
	GOTO        L_main671
	BTFSC       PORTB+0, 3 
	GOTO        L_main671
	BTFSC       PORTB+0, 6 
	GOTO        L_main671
	BTFSC       PORTB+0, 7 
	GOTO        L_main671
L__main963:
;Main 7.0V.c,63 :: 		lineFollowPID();
	CALL        _lineFollowPID+0, 0
	GOTO        L_main672
L_main671:
;Main 7.0V.c,65 :: 		lineFollowNormalWorked();
	CALL        _lineFollowNormalWorked+0, 0
L_main672:
;Main 7.0V.c,66 :: 		}
	GOTO        L_main665
L_main666:
;Main 7.0V.c,67 :: 		stop();
	CALL        _stop+0, 0
;Main 7.0V.c,68 :: 		sendText("  End of Level 1. Level 2 Starting  ");
	MOVLW       ?lstr35_Main_327.0V+0
	MOVWF       FARG_sendText_aText+0 
	MOVLW       hi_addr(?lstr35_Main_327.0V+0)
	MOVWF       FARG_sendText_aText+1 
	CALL        _sendText+0, 0
;Main 7.0V.c,69 :: 		LEVEL1_STATE = COMPLETED;
	MOVLW       2
	MOVWF       _LEVEL1_STATE+0 
	MOVLW       0
	MOVWF       _LEVEL1_STATE+1 
;Main 7.0V.c,70 :: 		LEVEL2_STATE = REACHED;
	MOVLW       1
	MOVWF       _LEVEL2_STATE+0 
	MOVLW       0
	MOVWF       _LEVEL2_STATE+1 
;Main 7.0V.c,71 :: 		LEVEL = 2;
	MOVLW       2
	MOVWF       _LEVEL+0 
	MOVLW       0
	MOVWF       _LEVEL+1 
;Main 7.0V.c,75 :: 		while(!isAllWhite() && LEVEL2_STATE != COMPLETED){
L_main673:
	CALL        _isAllWhite+0, 0
	MOVF        R0, 0 
	IORWF       R1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_main674
	MOVLW       0
	XORWF       _LEVEL2_STATE+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main1039
	MOVLW       2
	XORWF       _LEVEL2_STATE+0, 0 
L__main1039:
	BTFSC       STATUS+0, 2 
	GOTO        L_main674
L__main962:
;Main 7.0V.c,76 :: 		goThroughObstaclesJay();
	CALL        _goThroughObstaclesJay+0, 0
;Main 7.0V.c,77 :: 		}
	GOTO        L_main673
L_main674:
;Main 7.0V.c,79 :: 		stop();
	CALL        _stop+0, 0
;Main 7.0V.c,80 :: 		sendText("  End of Level 2. Level 3 Starting  ");
	MOVLW       ?lstr36_Main_327.0V+0
	MOVWF       FARG_sendText_aText+0 
	MOVLW       hi_addr(?lstr36_Main_327.0V+0)
	MOVWF       FARG_sendText_aText+1 
	CALL        _sendText+0, 0
;Main 7.0V.c,81 :: 		LEVEL2_STATE = COMPLETED;
	MOVLW       2
	MOVWF       _LEVEL2_STATE+0 
	MOVLW       0
	MOVWF       _LEVEL2_STATE+1 
;Main 7.0V.c,82 :: 		LEVEL3_STATE = REACHED;
	MOVLW       1
	MOVWF       _LEVEL3_STATE+0 
	MOVLW       0
	MOVWF       _LEVEL3_STATE+1 
;Main 7.0V.c,83 :: 		LEVEL = 3;
	MOVLW       3
	MOVWF       _LEVEL+0 
	MOVLW       0
	MOVWF       _LEVEL+1 
;Main 7.0V.c,87 :: 		level3Aligning();
	CALL        _level3Aligning+0, 0
;Main 7.0V.c,90 :: 		while(getDistanceSonar2('M') > 30){
L_main677:
	MOVLW       77
	MOVWF       FARG_getDistanceSonar2_Sensor+0 
	CALL        _getDistanceSonar2+0, 0
	MOVF        R0, 0 
	SUBLW       30
	BTFSC       STATUS+0, 0 
	GOTO        L_main678
;Main 7.0V.c,91 :: 		moveStraightFast();
	CALL        _moveStraightFast+0, 0
;Main 7.0V.c,92 :: 		delay_ms(1);
	MOVLW       7
	MOVWF       R12, 0
	MOVLW       125
	MOVWF       R13, 0
L_main679:
	DECFSZ      R13, 1, 0
	BRA         L_main679
	DECFSZ      R12, 1, 0
	BRA         L_main679
;Main 7.0V.c,93 :: 		}
	GOTO        L_main677
L_main678:
;Main 7.0V.c,94 :: 		rotateByDegree(-90);
	MOVLW       166
	MOVWF       FARG_rotateByDegree_degree+0 
	MOVLW       255
	MOVWF       FARG_rotateByDegree_degree+1 
	CALL        _rotateByDegree+0, 0
;Main 7.0V.c,95 :: 		delay_ms(100);
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       138
	MOVWF       R12, 0
	MOVLW       85
	MOVWF       R13, 0
L_main680:
	DECFSZ      R13, 1, 0
	BRA         L_main680
	DECFSZ      R12, 1, 0
	BRA         L_main680
	DECFSZ      R11, 1, 0
	BRA         L_main680
	NOP
	NOP
;Main 7.0V.c,96 :: 		while(!isAllBlack()){
L_main681:
	CALL        _isAllBlack+0, 0
	MOVF        R0, 0 
	IORWF       R1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_main682
;Main 7.0V.c,98 :: 		if(!isAllWhite()){
	CALL        _isAllWhite+0, 0
	MOVF        R0, 0 
	IORWF       R1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_main683
;Main 7.0V.c,99 :: 		sendText("got a arrow..  ");
	MOVLW       ?lstr37_Main_327.0V+0
	MOVWF       FARG_sendText_aText+0 
	MOVLW       hi_addr(?lstr37_Main_327.0V+0)
	MOVWF       FARG_sendText_aText+1 
	CALL        _sendText+0, 0
;Main 7.0V.c,100 :: 		lineFollowNormalWorkedForLast();
	CALL        _lineFollowNormalWorkedForLast+0, 0
;Main 7.0V.c,101 :: 		sendSensorStatus();
	CALL        _sendSensorStatus+0, 0
;Main 7.0V.c,102 :: 		if(( Sensor1==0 && Sensor2==0 && Sensor3==0 && Sensor4==0 && Sensor5==1 && Sensor6==0 && Sensor7==0 && Sensor8==0 && Sensor9==0)){
	BTFSC       PORTB+0, 4 
	GOTO        L_main686
	BTFSC       PORTB+0, 3 
	GOTO        L_main686
	BTFSC       PORTD+0, 4 
	GOTO        L_main686
	BTFSC       PORTD+0, 5 
	GOTO        L_main686
	BTFSS       PORTD+0, 6 
	GOTO        L_main686
	BTFSC       PORTD+0, 7 
	GOTO        L_main686
	BTFSC       PORTB+0, 2 
	GOTO        L_main686
	BTFSC       PORTB+0, 6 
	GOTO        L_main686
	BTFSC       PORTB+0, 7 
	GOTO        L_main686
L__main961:
;Main 7.0V.c,103 :: 		while(Sensor5==1)
L_main687:
	BTFSS       PORTD+0, 6 
	GOTO        L_main688
;Main 7.0V.c,104 :: 		moveStraightSlow();
	CALL        _moveStraightSlow+0, 0
	GOTO        L_main687
L_main688:
;Main 7.0V.c,105 :: 		while(isAllWhite())
L_main689:
	CALL        _isAllWhite+0, 0
	MOVF        R0, 0 
	IORWF       R1, 0 
	BTFSC       STATUS+0, 2 
	GOTO        L_main690
;Main 7.0V.c,106 :: 		moveStraightSlow();
	CALL        _moveStraightSlow+0, 0
	GOTO        L_main689
L_main690:
;Main 7.0V.c,107 :: 		}
L_main686:
;Main 7.0V.c,108 :: 		}
	GOTO        L_main691
L_main683:
;Main 7.0V.c,110 :: 		moveStraightSlow();
	CALL        _moveStraightSlow+0, 0
L_main691:
;Main 7.0V.c,112 :: 		if(getDistanceSonar2('M') < 5){
	MOVLW       77
	MOVWF       FARG_getDistanceSonar2_Sensor+0 
	CALL        _getDistanceSonar2+0, 0
	MOVLW       5
	SUBWF       R0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_main692
;Main 7.0V.c,113 :: 		rotateByDegree(90);
	MOVLW       90
	MOVWF       FARG_rotateByDegree_degree+0 
	MOVLW       0
	MOVWF       FARG_rotateByDegree_degree+1 
	CALL        _rotateByDegree+0, 0
;Main 7.0V.c,114 :: 		delay_ms(100);
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       138
	MOVWF       R12, 0
	MOVLW       85
	MOVWF       R13, 0
L_main693:
	DECFSZ      R13, 1, 0
	BRA         L_main693
	DECFSZ      R12, 1, 0
	BRA         L_main693
	DECFSZ      R11, 1, 0
	BRA         L_main693
	NOP
	NOP
;Main 7.0V.c,115 :: 		rotateByDegree(90);
	MOVLW       90
	MOVWF       FARG_rotateByDegree_degree+0 
	MOVLW       0
	MOVWF       FARG_rotateByDegree_degree+1 
	CALL        _rotateByDegree+0, 0
;Main 7.0V.c,116 :: 		delay_ms(100);
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       138
	MOVWF       R12, 0
	MOVLW       85
	MOVWF       R13, 0
L_main694:
	DECFSZ      R13, 1, 0
	BRA         L_main694
	DECFSZ      R12, 1, 0
	BRA         L_main694
	DECFSZ      R11, 1, 0
	BRA         L_main694
	NOP
	NOP
;Main 7.0V.c,117 :: 		delay_ms(1);
	MOVLW       7
	MOVWF       R12, 0
	MOVLW       125
	MOVWF       R13, 0
L_main695:
	DECFSZ      R13, 1, 0
	BRA         L_main695
	DECFSZ      R12, 1, 0
	BRA         L_main695
;Main 7.0V.c,118 :: 		}
L_main692:
;Main 7.0V.c,119 :: 		delay_ms(1);
	MOVLW       7
	MOVWF       R12, 0
	MOVLW       125
	MOVWF       R13, 0
L_main696:
	DECFSZ      R13, 1, 0
	BRA         L_main696
	DECFSZ      R12, 1, 0
	BRA         L_main696
;Main 7.0V.c,120 :: 		}
	GOTO        L_main681
L_main682:
;Main 7.0V.c,122 :: 		stop();
	CALL        _stop+0, 0
;Main 7.0V.c,125 :: 		}
	GOTO        $+0
; end of _main

_gotoTheGoal:

;Main 7.0V.c,127 :: 		void gotoTheGoal(){
;Main 7.0V.c,129 :: 		}
	RETURN      0
; end of _gotoTheGoal

_alignOnTheArrow:

;Main 7.0V.c,131 :: 		int alignOnTheArrow(){
;Main 7.0V.c,132 :: 		if(Scout==1 && Sensor1==0 && Sensor2==0 && Sensor3==0 && Sensor4==0 && Sensor5==0 && Sensor6==0 && Sensor7==0 && Sensor8==0 && Sensor9==0){
	BTFSS       PORTB+0, 5 
	GOTO        L_alignOnTheArrow699
	BTFSC       PORTB+0, 4 
	GOTO        L_alignOnTheArrow699
	BTFSC       PORTB+0, 3 
	GOTO        L_alignOnTheArrow699
	BTFSC       PORTD+0, 4 
	GOTO        L_alignOnTheArrow699
	BTFSC       PORTD+0, 5 
	GOTO        L_alignOnTheArrow699
	BTFSC       PORTD+0, 6 
	GOTO        L_alignOnTheArrow699
	BTFSC       PORTD+0, 7 
	GOTO        L_alignOnTheArrow699
	BTFSC       PORTB+0, 2 
	GOTO        L_alignOnTheArrow699
	BTFSC       PORTB+0, 6 
	GOTO        L_alignOnTheArrow699
	BTFSC       PORTB+0, 7 
	GOTO        L_alignOnTheArrow699
L__alignOnTheArrow974:
;Main 7.0V.c,134 :: 		}
	GOTO        L_alignOnTheArrow700
L_alignOnTheArrow699:
;Main 7.0V.c,135 :: 		else if(Scout==0 && Sensor1==1 && Sensor2==0 && Sensor3==0 && Sensor4==0 && Sensor5==0 && Sensor6==0 && Sensor7==0 && Sensor8==0 && Sensor9==0){
	BTFSC       PORTB+0, 5 
	GOTO        L_alignOnTheArrow703
	BTFSS       PORTB+0, 4 
	GOTO        L_alignOnTheArrow703
	BTFSC       PORTB+0, 3 
	GOTO        L_alignOnTheArrow703
	BTFSC       PORTD+0, 4 
	GOTO        L_alignOnTheArrow703
	BTFSC       PORTD+0, 5 
	GOTO        L_alignOnTheArrow703
	BTFSC       PORTD+0, 6 
	GOTO        L_alignOnTheArrow703
	BTFSC       PORTD+0, 7 
	GOTO        L_alignOnTheArrow703
	BTFSC       PORTB+0, 2 
	GOTO        L_alignOnTheArrow703
	BTFSC       PORTB+0, 6 
	GOTO        L_alignOnTheArrow703
	BTFSC       PORTB+0, 7 
	GOTO        L_alignOnTheArrow703
L__alignOnTheArrow973:
;Main 7.0V.c,137 :: 		}
	GOTO        L_alignOnTheArrow704
L_alignOnTheArrow703:
;Main 7.0V.c,138 :: 		else if(Scout==0 && Sensor1==0 && Sensor2==0 && Sensor3==0 && Sensor4==0 && Sensor5==0 && Sensor6==0 && Sensor7==0 && Sensor8==0 && Sensor9==1){
	BTFSC       PORTB+0, 5 
	GOTO        L_alignOnTheArrow707
	BTFSC       PORTB+0, 4 
	GOTO        L_alignOnTheArrow707
	BTFSC       PORTB+0, 3 
	GOTO        L_alignOnTheArrow707
	BTFSC       PORTD+0, 4 
	GOTO        L_alignOnTheArrow707
	BTFSC       PORTD+0, 5 
	GOTO        L_alignOnTheArrow707
	BTFSC       PORTD+0, 6 
	GOTO        L_alignOnTheArrow707
	BTFSC       PORTD+0, 7 
	GOTO        L_alignOnTheArrow707
	BTFSC       PORTB+0, 2 
	GOTO        L_alignOnTheArrow707
	BTFSC       PORTB+0, 6 
	GOTO        L_alignOnTheArrow707
	BTFSS       PORTB+0, 7 
	GOTO        L_alignOnTheArrow707
L__alignOnTheArrow972:
;Main 7.0V.c,140 :: 		}
	GOTO        L_alignOnTheArrow708
L_alignOnTheArrow707:
;Main 7.0V.c,141 :: 		else if(Scout==0 && Sensor1==0 && Sensor2==1 && Sensor3==0 && Sensor4==0 && Sensor5==0 && Sensor6==0 && Sensor7==0 && Sensor8==0 && Sensor9==0){
	BTFSC       PORTB+0, 5 
	GOTO        L_alignOnTheArrow711
	BTFSC       PORTB+0, 4 
	GOTO        L_alignOnTheArrow711
	BTFSS       PORTB+0, 3 
	GOTO        L_alignOnTheArrow711
	BTFSC       PORTD+0, 4 
	GOTO        L_alignOnTheArrow711
	BTFSC       PORTD+0, 5 
	GOTO        L_alignOnTheArrow711
	BTFSC       PORTD+0, 6 
	GOTO        L_alignOnTheArrow711
	BTFSC       PORTD+0, 7 
	GOTO        L_alignOnTheArrow711
	BTFSC       PORTB+0, 2 
	GOTO        L_alignOnTheArrow711
	BTFSC       PORTB+0, 6 
	GOTO        L_alignOnTheArrow711
	BTFSC       PORTB+0, 7 
	GOTO        L_alignOnTheArrow711
L__alignOnTheArrow971:
;Main 7.0V.c,143 :: 		}
	GOTO        L_alignOnTheArrow712
L_alignOnTheArrow711:
;Main 7.0V.c,144 :: 		else if(Scout==0 && Sensor1==0 && Sensor2==0 && Sensor3==0 && Sensor4==0 && Sensor5==0 && Sensor6==0 && Sensor7==0 && Sensor8==1 && Sensor9==0){
	BTFSC       PORTB+0, 5 
	GOTO        L_alignOnTheArrow715
	BTFSC       PORTB+0, 4 
	GOTO        L_alignOnTheArrow715
	BTFSC       PORTB+0, 3 
	GOTO        L_alignOnTheArrow715
	BTFSC       PORTD+0, 4 
	GOTO        L_alignOnTheArrow715
	BTFSC       PORTD+0, 5 
	GOTO        L_alignOnTheArrow715
	BTFSC       PORTD+0, 6 
	GOTO        L_alignOnTheArrow715
	BTFSC       PORTD+0, 7 
	GOTO        L_alignOnTheArrow715
	BTFSC       PORTB+0, 2 
	GOTO        L_alignOnTheArrow715
	BTFSS       PORTB+0, 6 
	GOTO        L_alignOnTheArrow715
	BTFSC       PORTB+0, 7 
	GOTO        L_alignOnTheArrow715
L__alignOnTheArrow970:
;Main 7.0V.c,146 :: 		}
	GOTO        L_alignOnTheArrow716
L_alignOnTheArrow715:
;Main 7.0V.c,147 :: 		else if(Scout==0 && Sensor1==0 && Sensor2==0 && Sensor3==1 && Sensor4==0 && Sensor5==0 && Sensor6==0 && Sensor7==0 && Sensor8==0 && Sensor9==0){
	BTFSC       PORTB+0, 5 
	GOTO        L_alignOnTheArrow719
	BTFSC       PORTB+0, 4 
	GOTO        L_alignOnTheArrow719
	BTFSC       PORTB+0, 3 
	GOTO        L_alignOnTheArrow719
	BTFSS       PORTD+0, 4 
	GOTO        L_alignOnTheArrow719
	BTFSC       PORTD+0, 5 
	GOTO        L_alignOnTheArrow719
	BTFSC       PORTD+0, 6 
	GOTO        L_alignOnTheArrow719
	BTFSC       PORTD+0, 7 
	GOTO        L_alignOnTheArrow719
	BTFSC       PORTB+0, 2 
	GOTO        L_alignOnTheArrow719
	BTFSC       PORTB+0, 6 
	GOTO        L_alignOnTheArrow719
	BTFSC       PORTB+0, 7 
	GOTO        L_alignOnTheArrow719
L__alignOnTheArrow969:
;Main 7.0V.c,149 :: 		}
	GOTO        L_alignOnTheArrow720
L_alignOnTheArrow719:
;Main 7.0V.c,150 :: 		else if(Scout==0 && Sensor1==0 && Sensor2==0 && Sensor3==0 && Sensor4==0 && Sensor5==0 && Sensor6==0 && Sensor7==1 && Sensor8==0 && Sensor9==0){
	BTFSC       PORTB+0, 5 
	GOTO        L_alignOnTheArrow723
	BTFSC       PORTB+0, 4 
	GOTO        L_alignOnTheArrow723
	BTFSC       PORTB+0, 3 
	GOTO        L_alignOnTheArrow723
	BTFSC       PORTD+0, 4 
	GOTO        L_alignOnTheArrow723
	BTFSC       PORTD+0, 5 
	GOTO        L_alignOnTheArrow723
	BTFSC       PORTD+0, 6 
	GOTO        L_alignOnTheArrow723
	BTFSC       PORTD+0, 7 
	GOTO        L_alignOnTheArrow723
	BTFSS       PORTB+0, 2 
	GOTO        L_alignOnTheArrow723
	BTFSC       PORTB+0, 6 
	GOTO        L_alignOnTheArrow723
	BTFSC       PORTB+0, 7 
	GOTO        L_alignOnTheArrow723
L__alignOnTheArrow968:
;Main 7.0V.c,152 :: 		}
	GOTO        L_alignOnTheArrow724
L_alignOnTheArrow723:
;Main 7.0V.c,153 :: 		else if(Scout==0 && Sensor1==0 && Sensor2==0 && Sensor3==0 && Sensor4==1 && Sensor5==0 && Sensor6==0 && Sensor7==0 && Sensor8==0 && Sensor9==0){
	BTFSC       PORTB+0, 5 
	GOTO        L_alignOnTheArrow727
	BTFSC       PORTB+0, 4 
	GOTO        L_alignOnTheArrow727
	BTFSC       PORTB+0, 3 
	GOTO        L_alignOnTheArrow727
	BTFSC       PORTD+0, 4 
	GOTO        L_alignOnTheArrow727
	BTFSS       PORTD+0, 5 
	GOTO        L_alignOnTheArrow727
	BTFSC       PORTD+0, 6 
	GOTO        L_alignOnTheArrow727
	BTFSC       PORTD+0, 7 
	GOTO        L_alignOnTheArrow727
	BTFSC       PORTB+0, 2 
	GOTO        L_alignOnTheArrow727
	BTFSC       PORTB+0, 6 
	GOTO        L_alignOnTheArrow727
	BTFSC       PORTB+0, 7 
	GOTO        L_alignOnTheArrow727
L__alignOnTheArrow967:
;Main 7.0V.c,155 :: 		}
	GOTO        L_alignOnTheArrow728
L_alignOnTheArrow727:
;Main 7.0V.c,156 :: 		else if(Scout==0 && Sensor1==0 && Sensor2==0 && Sensor3==0 && Sensor4==0 && Sensor5==0 && Sensor6==1 && Sensor7==0 && Sensor8==0 && Sensor9==0){
	BTFSC       PORTB+0, 5 
	GOTO        L_alignOnTheArrow731
	BTFSC       PORTB+0, 4 
	GOTO        L_alignOnTheArrow731
	BTFSC       PORTB+0, 3 
	GOTO        L_alignOnTheArrow731
	BTFSC       PORTD+0, 4 
	GOTO        L_alignOnTheArrow731
	BTFSC       PORTD+0, 5 
	GOTO        L_alignOnTheArrow731
	BTFSC       PORTD+0, 6 
	GOTO        L_alignOnTheArrow731
	BTFSS       PORTD+0, 7 
	GOTO        L_alignOnTheArrow731
	BTFSC       PORTB+0, 2 
	GOTO        L_alignOnTheArrow731
	BTFSC       PORTB+0, 6 
	GOTO        L_alignOnTheArrow731
	BTFSC       PORTB+0, 7 
	GOTO        L_alignOnTheArrow731
L__alignOnTheArrow966:
;Main 7.0V.c,158 :: 		}
	GOTO        L_alignOnTheArrow732
L_alignOnTheArrow731:
;Main 7.0V.c,159 :: 		else if(Scout==0 && Sensor1==0 && Sensor2==0 && Sensor3==0 && Sensor4==0 && Sensor5==1 && Sensor6==0 && Sensor7==0 && Sensor8==0 && Sensor9==0){
	BTFSC       PORTB+0, 5 
	GOTO        L_alignOnTheArrow735
	BTFSC       PORTB+0, 4 
	GOTO        L_alignOnTheArrow735
	BTFSC       PORTB+0, 3 
	GOTO        L_alignOnTheArrow735
	BTFSC       PORTD+0, 4 
	GOTO        L_alignOnTheArrow735
	BTFSC       PORTD+0, 5 
	GOTO        L_alignOnTheArrow735
	BTFSS       PORTD+0, 6 
	GOTO        L_alignOnTheArrow735
	BTFSC       PORTD+0, 7 
	GOTO        L_alignOnTheArrow735
	BTFSC       PORTB+0, 2 
	GOTO        L_alignOnTheArrow735
	BTFSC       PORTB+0, 6 
	GOTO        L_alignOnTheArrow735
	BTFSC       PORTB+0, 7 
	GOTO        L_alignOnTheArrow735
L__alignOnTheArrow965:
;Main 7.0V.c,161 :: 		}
L_alignOnTheArrow735:
L_alignOnTheArrow732:
L_alignOnTheArrow728:
L_alignOnTheArrow724:
L_alignOnTheArrow720:
L_alignOnTheArrow716:
L_alignOnTheArrow712:
L_alignOnTheArrow708:
L_alignOnTheArrow704:
L_alignOnTheArrow700:
;Main 7.0V.c,162 :: 		}
	RETURN      0
; end of _alignOnTheArrow

_isArrowFound:

;Main 7.0V.c,164 :: 		int isArrowFound(){
;Main 7.0V.c,165 :: 		if(!isAllWhite()){
	CALL        _isAllWhite+0, 0
	MOVF        R0, 0 
	IORWF       R1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_isArrowFound736
;Main 7.0V.c,166 :: 		return TRUE;
	MOVLW       1
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	RETURN      0
;Main 7.0V.c,167 :: 		}
L_isArrowFound736:
;Main 7.0V.c,169 :: 		return FALSE;
	CLRF        R0 
	CLRF        R1 
;Main 7.0V.c,171 :: 		}
	RETURN      0
; end of _isArrowFound

_moveStraightSlow:

;Main 7.0V.c,173 :: 		void moveStraightSlow(){
;Main 7.0V.c,174 :: 		moveForward(205,200);
	MOVLW       205
	MOVWF       FARG_moveForward_pwmLeft+0 
	MOVLW       0
	MOVWF       FARG_moveForward_pwmLeft+1 
	MOVLW       200
	MOVWF       FARG_moveForward_pwmRight+0 
	MOVLW       0
	MOVWF       FARG_moveForward_pwmRight+1 
	CALL        _moveForward+0, 0
;Main 7.0V.c,175 :: 		}
	RETURN      0
; end of _moveStraightSlow

_moveStraightFast:

;Main 7.0V.c,177 :: 		void moveStraightFast(){
;Main 7.0V.c,178 :: 		moveForward(255,250);
	MOVLW       255
	MOVWF       FARG_moveForward_pwmLeft+0 
	MOVLW       0
	MOVWF       FARG_moveForward_pwmLeft+1 
	MOVLW       250
	MOVWF       FARG_moveForward_pwmRight+0 
	MOVLW       0
	MOVWF       FARG_moveForward_pwmRight+1 
	CALL        _moveForward+0, 0
;Main 7.0V.c,179 :: 		}
	RETURN      0
; end of _moveStraightFast

_goThroughObstaclesWorking:

;Main 7.0V.c,181 :: 		void goThroughObstaclesWorking(){
;Main 7.0V.c,182 :: 		ROTATION_ANGLE = 0;
	CLRF        _ROTATION_ANGLE+0 
	CLRF        _ROTATION_ANGLE+1 
;Main 7.0V.c,183 :: 		if(isPathClear() == 0) {    // if not clear
	CALL        _isPathClear+0, 0
	MOVLW       0
	XORWF       R1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__goThroughObstaclesWorking1040
	MOVLW       0
	XORWF       R0, 0 
L__goThroughObstaclesWorking1040:
	BTFSS       STATUS+0, 2 
	GOTO        L_goThroughObstaclesWorking738
;Main 7.0V.c,185 :: 		for(counter = 1; counter <= 6; counter++) {
	MOVLW       1
	MOVWF       _counter+0 
	MOVLW       0
	MOVWF       _counter+1 
L_goThroughObstaclesWorking739:
	MOVLW       128
	MOVWF       R0 
	MOVLW       128
	XORWF       _counter+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__goThroughObstaclesWorking1041
	MOVF        _counter+0, 0 
	SUBLW       6
L__goThroughObstaclesWorking1041:
	BTFSS       STATUS+0, 0 
	GOTO        L_goThroughObstaclesWorking740
;Main 7.0V.c,187 :: 		if(counter % 2 == 0) {
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
	GOTO        L__goThroughObstaclesWorking1042
	MOVLW       0
	XORWF       R0, 0 
L__goThroughObstaclesWorking1042:
	BTFSS       STATUS+0, 2 
	GOTO        L_goThroughObstaclesWorking742
;Main 7.0V.c,188 :: 		odd = -1;
	MOVLW       255
	MOVWF       _odd+0 
	MOVLW       255
	MOVWF       _odd+1 
;Main 7.0V.c,189 :: 		} else {
	GOTO        L_goThroughObstaclesWorking743
L_goThroughObstaclesWorking742:
;Main 7.0V.c,190 :: 		odd = 1;
	MOVLW       1
	MOVWF       _odd+0 
	MOVLW       0
	MOVWF       _odd+1 
;Main 7.0V.c,191 :: 		}
L_goThroughObstaclesWorking743:
;Main 7.0V.c,193 :: 		degree = odd * counter * 30;
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
;Main 7.0V.c,194 :: 		rotateByDegree(degree);
	MOVF        R0, 0 
	MOVWF       FARG_rotateByDegree_degree+0 
	MOVF        R1, 0 
	MOVWF       FARG_rotateByDegree_degree+1 
	CALL        _rotateByDegree+0, 0
;Main 7.0V.c,195 :: 		ROTATION_ANGLE += degree;
	MOVF        _degree+0, 0 
	ADDWF       _ROTATION_ANGLE+0, 1 
	MOVF        _degree+1, 0 
	ADDWFC      _ROTATION_ANGLE+1, 1 
;Main 7.0V.c,196 :: 		if(isPathClear() == 0) {
	CALL        _isPathClear+0, 0
	MOVLW       0
	XORWF       R1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__goThroughObstaclesWorking1043
	MOVLW       0
	XORWF       R0, 0 
L__goThroughObstaclesWorking1043:
	BTFSS       STATUS+0, 2 
	GOTO        L_goThroughObstaclesWorking744
;Main 7.0V.c,197 :: 		continue;
	GOTO        L_goThroughObstaclesWorking741
;Main 7.0V.c,198 :: 		} else {
L_goThroughObstaclesWorking744:
;Main 7.0V.c,199 :: 		break;
	GOTO        L_goThroughObstaclesWorking740
;Main 7.0V.c,202 :: 		}
L_goThroughObstaclesWorking741:
;Main 7.0V.c,185 :: 		for(counter = 1; counter <= 6; counter++) {
	INFSNZ      _counter+0, 1 
	INCF        _counter+1, 1 
;Main 7.0V.c,202 :: 		}
	GOTO        L_goThroughObstaclesWorking739
L_goThroughObstaclesWorking740:
;Main 7.0V.c,203 :: 		}
L_goThroughObstaclesWorking738:
;Main 7.0V.c,204 :: 		DIRECTION += ROTATION_ANGLE;
	MOVF        _ROTATION_ANGLE+0, 0 
	ADDWF       _DIRECTION+0, 1 
	MOVF        _ROTATION_ANGLE+1, 0 
	ADDWFC      _DIRECTION+1, 1 
;Main 7.0V.c,205 :: 		moveStraightSlow();
	CALL        _moveStraightSlow+0, 0
;Main 7.0V.c,206 :: 		delay_ms(10);
	MOVLW       65
	MOVWF       R12, 0
	MOVLW       238
	MOVWF       R13, 0
L_goThroughObstaclesWorking746:
	DECFSZ      R13, 1, 0
	BRA         L_goThroughObstaclesWorking746
	DECFSZ      R12, 1, 0
	BRA         L_goThroughObstaclesWorking746
	NOP
;Main 7.0V.c,209 :: 		if(isAllWhite()) {
	CALL        _isAllWhite+0, 0
	MOVF        R0, 0 
	IORWF       R1, 0 
	BTFSC       STATUS+0, 2 
	GOTO        L_goThroughObstaclesWorking747
;Main 7.0V.c,211 :: 		if(abs(DIRECTION) >= 90) {
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
	GOTO        L__goThroughObstaclesWorking1044
	MOVLW       90
	SUBWF       R0, 0 
L__goThroughObstaclesWorking1044:
	BTFSS       STATUS+0, 0 
	GOTO        L_goThroughObstaclesWorking748
;Main 7.0V.c,212 :: 		sendText("Wrong Direction !!!");
	MOVLW       ?lstr38_Main_327.0V+0
	MOVWF       FARG_sendText_aText+0 
	MOVLW       hi_addr(?lstr38_Main_327.0V+0)
	MOVWF       FARG_sendText_aText+1 
	CALL        _sendText+0, 0
;Main 7.0V.c,213 :: 		rotateByDegree(90);
	MOVLW       90
	MOVWF       FARG_rotateByDegree_degree+0 
	MOVLW       0
	MOVWF       FARG_rotateByDegree_degree+1 
	CALL        _rotateByDegree+0, 0
;Main 7.0V.c,214 :: 		rotateByDegree(90);
	MOVLW       90
	MOVWF       FARG_rotateByDegree_degree+0 
	MOVLW       0
	MOVWF       FARG_rotateByDegree_degree+1 
	CALL        _rotateByDegree+0, 0
;Main 7.0V.c,215 :: 		DIRECTION = 0;
	CLRF        _DIRECTION+0 
	CLRF        _DIRECTION+1 
;Main 7.0V.c,217 :: 		while(!isAllBlack()){
L_goThroughObstaclesWorking749:
	CALL        _isAllBlack+0, 0
	MOVF        R0, 0 
	IORWF       R1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_goThroughObstaclesWorking750
;Main 7.0V.c,218 :: 		moveStraightSlow();
	CALL        _moveStraightSlow+0, 0
;Main 7.0V.c,219 :: 		}
	GOTO        L_goThroughObstaclesWorking749
L_goThroughObstaclesWorking750:
;Main 7.0V.c,220 :: 		} else {
	GOTO        L_goThroughObstaclesWorking751
L_goThroughObstaclesWorking748:
;Main 7.0V.c,221 :: 		LEVEL2_STATE = COMPLETED;
	MOVLW       2
	MOVWF       _LEVEL2_STATE+0 
	MOVLW       0
	MOVWF       _LEVEL2_STATE+1 
;Main 7.0V.c,222 :: 		}
L_goThroughObstaclesWorking751:
;Main 7.0V.c,224 :: 		}
L_goThroughObstaclesWorking747:
;Main 7.0V.c,225 :: 		}
	RETURN      0
; end of _goThroughObstaclesWorking

_goThroughObstacles:

;Main 7.0V.c,227 :: 		void goThroughObstacles(){
;Main 7.0V.c,228 :: 		if(getDistanceSonar2('M') < 10 ){
	MOVLW       77
	MOVWF       FARG_getDistanceSonar2_Sensor+0 
	CALL        _getDistanceSonar2+0, 0
	MOVLW       10
	SUBWF       R0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_goThroughObstacles752
;Main 7.0V.c,229 :: 		stop();
	CALL        _stop+0, 0
;Main 7.0V.c,230 :: 		if(DIRECTION<0){
	MOVLW       128
	XORWF       _DIRECTION+1, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__goThroughObstacles1045
	MOVLW       0
	SUBWF       _DIRECTION+0, 0 
L__goThroughObstacles1045:
	BTFSC       STATUS+0, 0 
	GOTO        L_goThroughObstacles753
;Main 7.0V.c,231 :: 		rotateByDegree(45);
	MOVLW       45
	MOVWF       FARG_rotateByDegree_degree+0 
	MOVLW       0
	MOVWF       FARG_rotateByDegree_degree+1 
	CALL        _rotateByDegree+0, 0
;Main 7.0V.c,232 :: 		DIRECTION +=45;
	MOVLW       45
	ADDWF       _DIRECTION+0, 1 
	MOVLW       0
	ADDWFC      _DIRECTION+1, 1 
;Main 7.0V.c,233 :: 		if(getDistanceSonar2('M') < 10 ){
	MOVLW       77
	MOVWF       FARG_getDistanceSonar2_Sensor+0 
	CALL        _getDistanceSonar2+0, 0
	MOVLW       10
	SUBWF       R0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_goThroughObstacles754
;Main 7.0V.c,234 :: 		rotateByDegree(-45);
	MOVLW       211
	MOVWF       FARG_rotateByDegree_degree+0 
	MOVLW       255
	MOVWF       FARG_rotateByDegree_degree+1 
	CALL        _rotateByDegree+0, 0
;Main 7.0V.c,235 :: 		rotateByDegree(-45);
	MOVLW       211
	MOVWF       FARG_rotateByDegree_degree+0 
	MOVLW       255
	MOVWF       FARG_rotateByDegree_degree+1 
	CALL        _rotateByDegree+0, 0
;Main 7.0V.c,236 :: 		DIRECTION -=90;
	MOVLW       90
	SUBWF       _DIRECTION+0, 1 
	MOVLW       0
	SUBWFB      _DIRECTION+1, 1 
;Main 7.0V.c,237 :: 		}
L_goThroughObstacles754:
;Main 7.0V.c,238 :: 		}
	GOTO        L_goThroughObstacles755
L_goThroughObstacles753:
;Main 7.0V.c,240 :: 		rotateByDegree(-45);
	MOVLW       211
	MOVWF       FARG_rotateByDegree_degree+0 
	MOVLW       255
	MOVWF       FARG_rotateByDegree_degree+1 
	CALL        _rotateByDegree+0, 0
;Main 7.0V.c,241 :: 		DIRECTION -=45;
	MOVLW       45
	SUBWF       _DIRECTION+0, 1 
	MOVLW       0
	SUBWFB      _DIRECTION+1, 1 
;Main 7.0V.c,242 :: 		if(getDistanceSonar2('M') < 10 ){
	MOVLW       77
	MOVWF       FARG_getDistanceSonar2_Sensor+0 
	CALL        _getDistanceSonar2+0, 0
	MOVLW       10
	SUBWF       R0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_goThroughObstacles756
;Main 7.0V.c,243 :: 		rotateByDegree(45);
	MOVLW       45
	MOVWF       FARG_rotateByDegree_degree+0 
	MOVLW       0
	MOVWF       FARG_rotateByDegree_degree+1 
	CALL        _rotateByDegree+0, 0
;Main 7.0V.c,244 :: 		rotateByDegree(45);
	MOVLW       45
	MOVWF       FARG_rotateByDegree_degree+0 
	MOVLW       0
	MOVWF       FARG_rotateByDegree_degree+1 
	CALL        _rotateByDegree+0, 0
;Main 7.0V.c,245 :: 		DIRECTION +=90;
	MOVLW       90
	ADDWF       _DIRECTION+0, 1 
	MOVLW       0
	ADDWFC      _DIRECTION+1, 1 
;Main 7.0V.c,246 :: 		}
L_goThroughObstacles756:
;Main 7.0V.c,247 :: 		}
L_goThroughObstacles755:
;Main 7.0V.c,248 :: 		}
	GOTO        L_goThroughObstacles757
L_goThroughObstacles752:
;Main 7.0V.c,250 :: 		moveStraightFast();
	CALL        _moveStraightFast+0, 0
;Main 7.0V.c,251 :: 		}
L_goThroughObstacles757:
;Main 7.0V.c,252 :: 		delay_ms(10);
	MOVLW       65
	MOVWF       R12, 0
	MOVLW       238
	MOVWF       R13, 0
L_goThroughObstacles758:
	DECFSZ      R13, 1, 0
	BRA         L_goThroughObstacles758
	DECFSZ      R12, 1, 0
	BRA         L_goThroughObstacles758
	NOP
;Main 7.0V.c,253 :: 		}
	RETURN      0
; end of _goThroughObstacles

_goThroughObstaclesJay:

;Main 7.0V.c,255 :: 		void goThroughObstaclesJay(){
;Main 7.0V.c,256 :: 		int ROTATION_ANGLE = 0;
	CLRF        goThroughObstaclesJay_ROTATION_ANGLE_L0+0 
	CLRF        goThroughObstaclesJay_ROTATION_ANGLE_L0+1 
;Main 7.0V.c,257 :: 		if(isPathClear() == 0) {
	CALL        _isPathClear+0, 0
	MOVLW       0
	XORWF       R1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__goThroughObstaclesJay1046
	MOVLW       0
	XORWF       R0, 0 
L__goThroughObstaclesJay1046:
	BTFSS       STATUS+0, 2 
	GOTO        L_goThroughObstaclesJay759
;Main 7.0V.c,258 :: 		rotateByDegree(30);
	MOVLW       30
	MOVWF       FARG_rotateByDegree_degree+0 
	MOVLW       0
	MOVWF       FARG_rotateByDegree_degree+1 
	CALL        _rotateByDegree+0, 0
;Main 7.0V.c,259 :: 		ROTATION_ANGLE += 30;
	MOVLW       30
	ADDWF       goThroughObstaclesJay_ROTATION_ANGLE_L0+0, 1 
	MOVLW       0
	ADDWFC      goThroughObstaclesJay_ROTATION_ANGLE_L0+1, 1 
;Main 7.0V.c,260 :: 		if(isPathClear() == 0) {
	CALL        _isPathClear+0, 0
	MOVLW       0
	XORWF       R1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__goThroughObstaclesJay1047
	MOVLW       0
	XORWF       R0, 0 
L__goThroughObstaclesJay1047:
	BTFSS       STATUS+0, 2 
	GOTO        L_goThroughObstaclesJay760
;Main 7.0V.c,261 :: 		rotateByDegree(-60);
	MOVLW       196
	MOVWF       FARG_rotateByDegree_degree+0 
	MOVLW       255
	MOVWF       FARG_rotateByDegree_degree+1 
	CALL        _rotateByDegree+0, 0
;Main 7.0V.c,262 :: 		ROTATION_ANGLE += -60;
	MOVLW       196
	ADDWF       goThroughObstaclesJay_ROTATION_ANGLE_L0+0, 1 
	MOVLW       255
	ADDWFC      goThroughObstaclesJay_ROTATION_ANGLE_L0+1, 1 
;Main 7.0V.c,263 :: 		if(isPathClear() == 0) {
	CALL        _isPathClear+0, 0
	MOVLW       0
	XORWF       R1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__goThroughObstaclesJay1048
	MOVLW       0
	XORWF       R0, 0 
L__goThroughObstaclesJay1048:
	BTFSS       STATUS+0, 2 
	GOTO        L_goThroughObstaclesJay761
;Main 7.0V.c,264 :: 		rotateByDegree(90);
	MOVLW       90
	MOVWF       FARG_rotateByDegree_degree+0 
	MOVLW       0
	MOVWF       FARG_rotateByDegree_degree+1 
	CALL        _rotateByDegree+0, 0
;Main 7.0V.c,265 :: 		ROTATION_ANGLE += 90;
	MOVLW       90
	ADDWF       goThroughObstaclesJay_ROTATION_ANGLE_L0+0, 1 
	MOVLW       0
	ADDWFC      goThroughObstaclesJay_ROTATION_ANGLE_L0+1, 1 
;Main 7.0V.c,266 :: 		if(isPathClear() == 0) {
	CALL        _isPathClear+0, 0
	MOVLW       0
	XORWF       R1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__goThroughObstaclesJay1049
	MOVLW       0
	XORWF       R0, 0 
L__goThroughObstaclesJay1049:
	BTFSS       STATUS+0, 2 
	GOTO        L_goThroughObstaclesJay762
;Main 7.0V.c,267 :: 		rotateByDegree(-90);
	MOVLW       166
	MOVWF       FARG_rotateByDegree_degree+0 
	MOVLW       255
	MOVWF       FARG_rotateByDegree_degree+1 
	CALL        _rotateByDegree+0, 0
;Main 7.0V.c,268 :: 		rotateByDegree(-30);
	MOVLW       226
	MOVWF       FARG_rotateByDegree_degree+0 
	MOVLW       255
	MOVWF       FARG_rotateByDegree_degree+1 
	CALL        _rotateByDegree+0, 0
;Main 7.0V.c,269 :: 		ROTATION_ANGLE += -120;
	MOVLW       136
	ADDWF       goThroughObstaclesJay_ROTATION_ANGLE_L0+0, 1 
	MOVLW       255
	ADDWFC      goThroughObstaclesJay_ROTATION_ANGLE_L0+1, 1 
;Main 7.0V.c,270 :: 		if(isPathClear() == 0) {
	CALL        _isPathClear+0, 0
	MOVLW       0
	XORWF       R1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__goThroughObstaclesJay1050
	MOVLW       0
	XORWF       R0, 0 
L__goThroughObstaclesJay1050:
	BTFSS       STATUS+0, 2 
	GOTO        L_goThroughObstaclesJay763
;Main 7.0V.c,271 :: 		rotateByDegree(90);
	MOVLW       90
	MOVWF       FARG_rotateByDegree_degree+0 
	MOVLW       0
	MOVWF       FARG_rotateByDegree_degree+1 
	CALL        _rotateByDegree+0, 0
;Main 7.0V.c,272 :: 		rotateByDegree(60);
	MOVLW       60
	MOVWF       FARG_rotateByDegree_degree+0 
	MOVLW       0
	MOVWF       FARG_rotateByDegree_degree+1 
	CALL        _rotateByDegree+0, 0
;Main 7.0V.c,273 :: 		ROTATION_ANGLE += 150;
	MOVLW       150
	ADDWF       goThroughObstaclesJay_ROTATION_ANGLE_L0+0, 1 
	MOVLW       0
	ADDWFC      goThroughObstaclesJay_ROTATION_ANGLE_L0+1, 1 
;Main 7.0V.c,274 :: 		if(isPathClear() == 0) {
	CALL        _isPathClear+0, 0
	MOVLW       0
	XORWF       R1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__goThroughObstaclesJay1051
	MOVLW       0
	XORWF       R0, 0 
L__goThroughObstaclesJay1051:
	BTFSS       STATUS+0, 2 
	GOTO        L_goThroughObstaclesJay764
;Main 7.0V.c,275 :: 		rotateByDegree(-90);
	MOVLW       166
	MOVWF       FARG_rotateByDegree_degree+0 
	MOVLW       255
	MOVWF       FARG_rotateByDegree_degree+1 
	CALL        _rotateByDegree+0, 0
;Main 7.0V.c,276 :: 		rotateByDegree(-90);
	MOVLW       166
	MOVWF       FARG_rotateByDegree_degree+0 
	MOVLW       255
	MOVWF       FARG_rotateByDegree_degree+1 
	CALL        _rotateByDegree+0, 0
;Main 7.0V.c,277 :: 		ROTATION_ANGLE += -180;
	MOVLW       76
	ADDWF       goThroughObstaclesJay_ROTATION_ANGLE_L0+0, 1 
	MOVLW       255
	ADDWFC      goThroughObstaclesJay_ROTATION_ANGLE_L0+1, 1 
;Main 7.0V.c,278 :: 		}
L_goThroughObstaclesJay764:
;Main 7.0V.c,279 :: 		}
L_goThroughObstaclesJay763:
;Main 7.0V.c,280 :: 		}
L_goThroughObstaclesJay762:
;Main 7.0V.c,281 :: 		}
L_goThroughObstaclesJay761:
;Main 7.0V.c,282 :: 		}
L_goThroughObstaclesJay760:
;Main 7.0V.c,283 :: 		}
L_goThroughObstaclesJay759:
;Main 7.0V.c,284 :: 		DIRECTION += ROTATION_ANGLE;
	MOVF        goThroughObstaclesJay_ROTATION_ANGLE_L0+0, 0 
	ADDWF       _DIRECTION+0, 1 
	MOVF        goThroughObstaclesJay_ROTATION_ANGLE_L0+1, 0 
	ADDWFC      _DIRECTION+1, 1 
;Main 7.0V.c,285 :: 		moveStraightFast();
	CALL        _moveStraightFast+0, 0
;Main 7.0V.c,286 :: 		delay_ms(10);
	MOVLW       65
	MOVWF       R12, 0
	MOVLW       238
	MOVWF       R13, 0
L_goThroughObstaclesJay765:
	DECFSZ      R13, 1, 0
	BRA         L_goThroughObstaclesJay765
	DECFSZ      R12, 1, 0
	BRA         L_goThroughObstaclesJay765
	NOP
;Main 7.0V.c,288 :: 		if(isAllWhite()) {
	CALL        _isAllWhite+0, 0
	MOVF        R0, 0 
	IORWF       R1, 0 
	BTFSC       STATUS+0, 2 
	GOTO        L_goThroughObstaclesJay766
;Main 7.0V.c,290 :: 		if(abs(DIRECTION) >= 90) {
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
	GOTO        L__goThroughObstaclesJay1052
	MOVLW       90
	SUBWF       R0, 0 
L__goThroughObstaclesJay1052:
	BTFSS       STATUS+0, 0 
	GOTO        L_goThroughObstaclesJay767
;Main 7.0V.c,291 :: 		sendText("Wrong Direction !!!");
	MOVLW       ?lstr39_Main_327.0V+0
	MOVWF       FARG_sendText_aText+0 
	MOVLW       hi_addr(?lstr39_Main_327.0V+0)
	MOVWF       FARG_sendText_aText+1 
	CALL        _sendText+0, 0
;Main 7.0V.c,292 :: 		rotateByDegree(90);
	MOVLW       90
	MOVWF       FARG_rotateByDegree_degree+0 
	MOVLW       0
	MOVWF       FARG_rotateByDegree_degree+1 
	CALL        _rotateByDegree+0, 0
;Main 7.0V.c,293 :: 		rotateByDegree(90);
	MOVLW       90
	MOVWF       FARG_rotateByDegree_degree+0 
	MOVLW       0
	MOVWF       FARG_rotateByDegree_degree+1 
	CALL        _rotateByDegree+0, 0
;Main 7.0V.c,295 :: 		DIRECTION = 0;
	CLRF        _DIRECTION+0 
	CLRF        _DIRECTION+1 
;Main 7.0V.c,296 :: 		level2Aligning();
	CALL        _level2Aligning+0, 0
;Main 7.0V.c,297 :: 		}
	GOTO        L_goThroughObstaclesJay768
L_goThroughObstaclesJay767:
;Main 7.0V.c,299 :: 		sendText("Corrent Direction !!!");
	MOVLW       ?lstr40_Main_327.0V+0
	MOVWF       FARG_sendText_aText+0 
	MOVLW       hi_addr(?lstr40_Main_327.0V+0)
	MOVWF       FARG_sendText_aText+1 
	CALL        _sendText+0, 0
;Main 7.0V.c,300 :: 		LEVEL2_STATE = COMPLETED;
	MOVLW       2
	MOVWF       _LEVEL2_STATE+0 
	MOVLW       0
	MOVWF       _LEVEL2_STATE+1 
;Main 7.0V.c,301 :: 		}
L_goThroughObstaclesJay768:
;Main 7.0V.c,302 :: 		}
L_goThroughObstaclesJay766:
;Main 7.0V.c,303 :: 		}
	RETURN      0
; end of _goThroughObstaclesJay

_isPathClear:

;Main 7.0V.c,307 :: 		int isPathClear() {
;Main 7.0V.c,308 :: 		if(getDistanceSonar2('L') < 7 || getDistanceSonar2('M') < 7 || getDistanceSonar2('R') < 7) {
	MOVLW       76
	MOVWF       FARG_getDistanceSonar2_Sensor+0 
	CALL        _getDistanceSonar2+0, 0
	MOVLW       7
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 0 
	GOTO        L__isPathClear975
	MOVLW       77
	MOVWF       FARG_getDistanceSonar2_Sensor+0 
	CALL        _getDistanceSonar2+0, 0
	MOVLW       7
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 0 
	GOTO        L__isPathClear975
	MOVLW       82
	MOVWF       FARG_getDistanceSonar2_Sensor+0 
	CALL        _getDistanceSonar2+0, 0
	MOVLW       7
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 0 
	GOTO        L__isPathClear975
	GOTO        L_isPathClear771
L__isPathClear975:
;Main 7.0V.c,309 :: 		return 0;     // Not Clear
	CLRF        R0 
	CLRF        R1 
	RETURN      0
;Main 7.0V.c,310 :: 		} else {
L_isPathClear771:
;Main 7.0V.c,311 :: 		return 1;
	MOVLW       1
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
;Main 7.0V.c,313 :: 		}
	RETURN      0
; end of _isPathClear

_checkSonar:

;Main 7.0V.c,315 :: 		void checkSonar(char Sensor){
;Main 7.0V.c,316 :: 		if(Sensor == 'L'){
	MOVF        FARG_checkSonar_Sensor+0, 0 
	XORLW       76
	BTFSS       STATUS+0, 2 
	GOTO        L_checkSonar773
;Main 7.0V.c,317 :: 		distanceSonar = getDistanceSonar2('L');
	MOVLW       76
	MOVWF       FARG_getDistanceSonar2_Sensor+0 
	CALL        _getDistanceSonar2+0, 0
	MOVF        R0, 0 
	MOVWF       _distanceSonar+0 
;Main 7.0V.c,318 :: 		if(distanceSonar < 10)
	MOVLW       10
	SUBWF       R0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_checkSonar774
;Main 7.0V.c,319 :: 		sendText("Obstacle" );
	MOVLW       ?lstr41_Main_327.0V+0
	MOVWF       FARG_sendText_aText+0 
	MOVLW       hi_addr(?lstr41_Main_327.0V+0)
	MOVWF       FARG_sendText_aText+1 
	CALL        _sendText+0, 0
L_checkSonar774:
;Main 7.0V.c,320 :: 		}
	GOTO        L_checkSonar775
L_checkSonar773:
;Main 7.0V.c,321 :: 		else if(Sensor == 'M'){
	MOVF        FARG_checkSonar_Sensor+0, 0 
	XORLW       77
	BTFSS       STATUS+0, 2 
	GOTO        L_checkSonar776
;Main 7.0V.c,322 :: 		distanceSonar = getDistanceSonar2('M');
	MOVLW       77
	MOVWF       FARG_getDistanceSonar2_Sensor+0 
	CALL        _getDistanceSonar2+0, 0
	MOVF        R0, 0 
	MOVWF       _distanceSonar+0 
;Main 7.0V.c,323 :: 		if(distanceSonar < 10)
	MOVLW       10
	SUBWF       R0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_checkSonar777
;Main 7.0V.c,324 :: 		sendText("Obstacle" );
	MOVLW       ?lstr42_Main_327.0V+0
	MOVWF       FARG_sendText_aText+0 
	MOVLW       hi_addr(?lstr42_Main_327.0V+0)
	MOVWF       FARG_sendText_aText+1 
	CALL        _sendText+0, 0
L_checkSonar777:
;Main 7.0V.c,325 :: 		}
	GOTO        L_checkSonar778
L_checkSonar776:
;Main 7.0V.c,326 :: 		else if(Sensor == 'R'){
	MOVF        FARG_checkSonar_Sensor+0, 0 
	XORLW       82
	BTFSS       STATUS+0, 2 
	GOTO        L_checkSonar779
;Main 7.0V.c,327 :: 		distanceSonar = getDistanceSonar2('R');
	MOVLW       82
	MOVWF       FARG_getDistanceSonar2_Sensor+0 
	CALL        _getDistanceSonar2+0, 0
	MOVF        R0, 0 
	MOVWF       _distanceSonar+0 
;Main 7.0V.c,328 :: 		if(distanceSonar < 10)
	MOVLW       10
	SUBWF       R0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_checkSonar780
;Main 7.0V.c,329 :: 		sendText("Obstacle" );
	MOVLW       ?lstr43_Main_327.0V+0
	MOVWF       FARG_sendText_aText+0 
	MOVLW       hi_addr(?lstr43_Main_327.0V+0)
	MOVWF       FARG_sendText_aText+1 
	CALL        _sendText+0, 0
L_checkSonar780:
;Main 7.0V.c,330 :: 		}
L_checkSonar779:
L_checkSonar778:
L_checkSonar775:
;Main 7.0V.c,331 :: 		delay_ms(500);
	MOVLW       13
	MOVWF       R11, 0
	MOVLW       175
	MOVWF       R12, 0
	MOVLW       182
	MOVWF       R13, 0
L_checkSonar781:
	DECFSZ      R13, 1, 0
	BRA         L_checkSonar781
	DECFSZ      R12, 1, 0
	BRA         L_checkSonar781
	DECFSZ      R11, 1, 0
	BRA         L_checkSonar781
	NOP
;Main 7.0V.c,332 :: 		}
	RETURN      0
; end of _checkSonar

_level3Aligning:

;Main 7.0V.c,334 :: 		void level3Aligning(){
;Main 7.0V.c,335 :: 		while(Sensor4 == 0 || Sensor5 == 0 || Sensor6 == 0)
L_level3Aligning782:
	BTFSS       PORTD+0, 5 
	GOTO        L__level3Aligning977
	BTFSS       PORTD+0, 6 
	GOTO        L__level3Aligning977
	BTFSS       PORTD+0, 7 
	GOTO        L__level3Aligning977
	GOTO        L_level3Aligning783
L__level3Aligning977:
;Main 7.0V.c,336 :: 		reverse(220,220);
	MOVLW       220
	MOVWF       FARG_reverse_pwmLeft+0 
	MOVLW       0
	MOVWF       FARG_reverse_pwmLeft+1 
	MOVLW       220
	MOVWF       FARG_reverse_pwmRight+0 
	MOVLW       0
	MOVWF       FARG_reverse_pwmRight+1 
	CALL        _reverse+0, 0
	GOTO        L_level3Aligning782
L_level3Aligning783:
;Main 7.0V.c,337 :: 		delay_ms(1);
	MOVLW       7
	MOVWF       R12, 0
	MOVLW       125
	MOVWF       R13, 0
L_level3Aligning786:
	DECFSZ      R13, 1, 0
	BRA         L_level3Aligning786
	DECFSZ      R12, 1, 0
	BRA         L_level3Aligning786
;Main 7.0V.c,338 :: 		stop();
	CALL        _stop+0, 0
;Main 7.0V.c,339 :: 		sendText("Sensor5 at LEVEL 2 ");
	MOVLW       ?lstr44_Main_327.0V+0
	MOVWF       FARG_sendText_aText+0 
	MOVLW       hi_addr(?lstr44_Main_327.0V+0)
	MOVWF       FARG_sendText_aText+1 
	CALL        _sendText+0, 0
;Main 7.0V.c,340 :: 		delay_ms(500);
	MOVLW       13
	MOVWF       R11, 0
	MOVLW       175
	MOVWF       R12, 0
	MOVLW       182
	MOVWF       R13, 0
L_level3Aligning787:
	DECFSZ      R13, 1, 0
	BRA         L_level3Aligning787
	DECFSZ      R12, 1, 0
	BRA         L_level3Aligning787
	DECFSZ      R11, 1, 0
	BRA         L_level3Aligning787
	NOP
;Main 7.0V.c,341 :: 		while(Sensor1==0 || Sensor2==0 || Sensor3==0 || Sensor4==0 || Sensor5==0 || Sensor6==0 || Sensor7==0 || Sensor8==0 || Sensor9==0){
L_level3Aligning788:
	BTFSS       PORTB+0, 4 
	GOTO        L__level3Aligning976
	BTFSS       PORTB+0, 3 
	GOTO        L__level3Aligning976
	BTFSS       PORTD+0, 4 
	GOTO        L__level3Aligning976
	BTFSS       PORTD+0, 5 
	GOTO        L__level3Aligning976
	BTFSS       PORTD+0, 6 
	GOTO        L__level3Aligning976
	BTFSS       PORTD+0, 7 
	GOTO        L__level3Aligning976
	BTFSS       PORTB+0, 2 
	GOTO        L__level3Aligning976
	BTFSS       PORTB+0, 6 
	GOTO        L__level3Aligning976
	BTFSS       PORTB+0, 7 
	GOTO        L__level3Aligning976
	GOTO        L_level3Aligning789
L__level3Aligning976:
;Main 7.0V.c,342 :: 		if(Sensor9 == 1)
	BTFSS       PORTB+0, 7 
	GOTO        L_level3Aligning792
;Main 7.0V.c,343 :: 		rotateAntiClockwise(220);
	MOVLW       220
	MOVWF       FARG_rotateAntiClockwise_pwm+0 
	MOVLW       0
	MOVWF       FARG_rotateAntiClockwise_pwm+1 
	CALL        _rotateAntiClockwise+0, 0
	GOTO        L_level3Aligning793
L_level3Aligning792:
;Main 7.0V.c,345 :: 		else if(Sensor1 == 1)
	BTFSS       PORTB+0, 4 
	GOTO        L_level3Aligning794
;Main 7.0V.c,346 :: 		rotateClockwise(220);
	MOVLW       220
	MOVWF       FARG_rotateClockwise_pwm+0 
	MOVLW       0
	MOVWF       FARG_rotateClockwise_pwm+1 
	CALL        _rotateClockwise+0, 0
L_level3Aligning794:
L_level3Aligning793:
;Main 7.0V.c,348 :: 		}
	GOTO        L_level3Aligning788
L_level3Aligning789:
;Main 7.0V.c,349 :: 		stop();
	CALL        _stop+0, 0
;Main 7.0V.c,350 :: 		}
	RETURN      0
; end of _level3Aligning

_level2Aligning:

;Main 7.0V.c,352 :: 		void level2Aligning(){
;Main 7.0V.c,353 :: 		while((Sensor1 == 0 || Sensor2 == 0 || Sensor3 == 0 || Sensor4 == 0 || Sensor5 == 0 || Sensor6 == 0) && (Sensor4 == 0 || Sensor5 == 0 || Sensor6 == 0 || Sensor7 == 0 || Sensor8 == 0 || Sensor9 == 0))
L_level2Aligning795:
	BTFSS       PORTB+0, 4 
	GOTO        L__level2Aligning981
	BTFSS       PORTB+0, 3 
	GOTO        L__level2Aligning981
	BTFSS       PORTD+0, 4 
	GOTO        L__level2Aligning981
	BTFSS       PORTD+0, 5 
	GOTO        L__level2Aligning981
	BTFSS       PORTD+0, 6 
	GOTO        L__level2Aligning981
	BTFSS       PORTD+0, 7 
	GOTO        L__level2Aligning981
	GOTO        L_level2Aligning796
L__level2Aligning981:
	BTFSS       PORTD+0, 5 
	GOTO        L__level2Aligning980
	BTFSS       PORTD+0, 6 
	GOTO        L__level2Aligning980
	BTFSS       PORTD+0, 7 
	GOTO        L__level2Aligning980
	BTFSS       PORTB+0, 2 
	GOTO        L__level2Aligning980
	BTFSS       PORTB+0, 6 
	GOTO        L__level2Aligning980
	BTFSS       PORTB+0, 7 
	GOTO        L__level2Aligning980
	GOTO        L_level2Aligning796
L__level2Aligning980:
L__level2Aligning979:
;Main 7.0V.c,354 :: 		moveForward(220,220);
	MOVLW       220
	MOVWF       FARG_moveForward_pwmLeft+0 
	MOVLW       0
	MOVWF       FARG_moveForward_pwmLeft+1 
	MOVLW       220
	MOVWF       FARG_moveForward_pwmRight+0 
	MOVLW       0
	MOVWF       FARG_moveForward_pwmRight+1 
	CALL        _moveForward+0, 0
	GOTO        L_level2Aligning795
L_level2Aligning796:
;Main 7.0V.c,355 :: 		delay_ms(1);
	MOVLW       7
	MOVWF       R12, 0
	MOVLW       125
	MOVWF       R13, 0
L_level2Aligning803:
	DECFSZ      R13, 1, 0
	BRA         L_level2Aligning803
	DECFSZ      R12, 1, 0
	BRA         L_level2Aligning803
;Main 7.0V.c,356 :: 		stop();
	CALL        _stop+0, 0
;Main 7.0V.c,357 :: 		sendText("Sensor5 at LEVEL 2 ");
	MOVLW       ?lstr45_Main_327.0V+0
	MOVWF       FARG_sendText_aText+0 
	MOVLW       hi_addr(?lstr45_Main_327.0V+0)
	MOVWF       FARG_sendText_aText+1 
	CALL        _sendText+0, 0
;Main 7.0V.c,358 :: 		delay_ms(500);
	MOVLW       13
	MOVWF       R11, 0
	MOVLW       175
	MOVWF       R12, 0
	MOVLW       182
	MOVWF       R13, 0
L_level2Aligning804:
	DECFSZ      R13, 1, 0
	BRA         L_level2Aligning804
	DECFSZ      R12, 1, 0
	BRA         L_level2Aligning804
	DECFSZ      R11, 1, 0
	BRA         L_level2Aligning804
	NOP
;Main 7.0V.c,359 :: 		while(Sensor1==0 || Sensor2==0 || Sensor3==0 || Sensor4==0 || Sensor5==0 || Sensor6==0 || Sensor7==0 || Sensor8==0 || Sensor9==0){
L_level2Aligning805:
	BTFSS       PORTB+0, 4 
	GOTO        L__level2Aligning978
	BTFSS       PORTB+0, 3 
	GOTO        L__level2Aligning978
	BTFSS       PORTD+0, 4 
	GOTO        L__level2Aligning978
	BTFSS       PORTD+0, 5 
	GOTO        L__level2Aligning978
	BTFSS       PORTD+0, 6 
	GOTO        L__level2Aligning978
	BTFSS       PORTD+0, 7 
	GOTO        L__level2Aligning978
	BTFSS       PORTB+0, 2 
	GOTO        L__level2Aligning978
	BTFSS       PORTB+0, 6 
	GOTO        L__level2Aligning978
	BTFSS       PORTB+0, 7 
	GOTO        L__level2Aligning978
	GOTO        L_level2Aligning806
L__level2Aligning978:
;Main 7.0V.c,360 :: 		if(Sensor9 == 1)
	BTFSS       PORTB+0, 7 
	GOTO        L_level2Aligning809
;Main 7.0V.c,361 :: 		rotateClockwise(220);
	MOVLW       220
	MOVWF       FARG_rotateClockwise_pwm+0 
	MOVLW       0
	MOVWF       FARG_rotateClockwise_pwm+1 
	CALL        _rotateClockwise+0, 0
	GOTO        L_level2Aligning810
L_level2Aligning809:
;Main 7.0V.c,363 :: 		else if(Sensor1 == 1)
	BTFSS       PORTB+0, 4 
	GOTO        L_level2Aligning811
;Main 7.0V.c,364 :: 		rotateAntiClockwise(220);
	MOVLW       220
	MOVWF       FARG_rotateAntiClockwise_pwm+0 
	MOVLW       0
	MOVWF       FARG_rotateAntiClockwise_pwm+1 
	CALL        _rotateAntiClockwise+0, 0
L_level2Aligning811:
L_level2Aligning810:
;Main 7.0V.c,366 :: 		}
	GOTO        L_level2Aligning805
L_level2Aligning806:
;Main 7.0V.c,367 :: 		stop();
	CALL        _stop+0, 0
;Main 7.0V.c,368 :: 		}
	RETURN      0
; end of _level2Aligning

_sendSensorStatusBack:

;Main 7.0V.c,370 :: 		void sendSensorStatusBack(){
;Main 7.0V.c,371 :: 		if( BackSensor1 == 1){
	BTFSS       PORTC+0, 3 
	GOTO        L_sendSensorStatusBack812
;Main 7.0V.c,372 :: 		debugText = "1";
	MOVLW       ?lstr46_Main_327.0V+0
	MOVWF       _debugText+0 
	MOVLW       hi_addr(?lstr46_Main_327.0V+0)
	MOVWF       _debugText+1 
;Main 7.0V.c,373 :: 		UART1_Write_Text(debugText);
	MOVF        _debugText+0, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVF        _debugText+1, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;Main 7.0V.c,374 :: 		}
	GOTO        L_sendSensorStatusBack813
L_sendSensorStatusBack812:
;Main 7.0V.c,375 :: 		else if( BackSensor1 == 0){
	BTFSC       PORTC+0, 3 
	GOTO        L_sendSensorStatusBack814
;Main 7.0V.c,376 :: 		debugText = "0";
	MOVLW       ?lstr47_Main_327.0V+0
	MOVWF       _debugText+0 
	MOVLW       hi_addr(?lstr47_Main_327.0V+0)
	MOVWF       _debugText+1 
;Main 7.0V.c,377 :: 		UART1_Write_Text(debugText);
	MOVF        _debugText+0, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVF        _debugText+1, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;Main 7.0V.c,378 :: 		}
L_sendSensorStatusBack814:
L_sendSensorStatusBack813:
;Main 7.0V.c,380 :: 		if( BackSensor2 == 1){
	BTFSS       PORTD+0, 0 
	GOTO        L_sendSensorStatusBack815
;Main 7.0V.c,381 :: 		debugText = "1";
	MOVLW       ?lstr48_Main_327.0V+0
	MOVWF       _debugText+0 
	MOVLW       hi_addr(?lstr48_Main_327.0V+0)
	MOVWF       _debugText+1 
;Main 7.0V.c,382 :: 		UART1_Write_Text(debugText);
	MOVF        _debugText+0, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVF        _debugText+1, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;Main 7.0V.c,383 :: 		}
	GOTO        L_sendSensorStatusBack816
L_sendSensorStatusBack815:
;Main 7.0V.c,384 :: 		else if( BackSensor2 == 0){
	BTFSC       PORTD+0, 0 
	GOTO        L_sendSensorStatusBack817
;Main 7.0V.c,385 :: 		debugText = "0";
	MOVLW       ?lstr49_Main_327.0V+0
	MOVWF       _debugText+0 
	MOVLW       hi_addr(?lstr49_Main_327.0V+0)
	MOVWF       _debugText+1 
;Main 7.0V.c,386 :: 		UART1_Write_Text(debugText);
	MOVF        _debugText+0, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVF        _debugText+1, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;Main 7.0V.c,387 :: 		}
L_sendSensorStatusBack817:
L_sendSensorStatusBack816:
;Main 7.0V.c,389 :: 		if( BackSensor3 == 1){
	BTFSS       PORTD+0, 1 
	GOTO        L_sendSensorStatusBack818
;Main 7.0V.c,390 :: 		debugText = "1";
	MOVLW       ?lstr50_Main_327.0V+0
	MOVWF       _debugText+0 
	MOVLW       hi_addr(?lstr50_Main_327.0V+0)
	MOVWF       _debugText+1 
;Main 7.0V.c,391 :: 		UART1_Write_Text(debugText);
	MOVF        _debugText+0, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVF        _debugText+1, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;Main 7.0V.c,392 :: 		}
	GOTO        L_sendSensorStatusBack819
L_sendSensorStatusBack818:
;Main 7.0V.c,393 :: 		else if( BackSensor3 == 0){
	BTFSC       PORTD+0, 1 
	GOTO        L_sendSensorStatusBack820
;Main 7.0V.c,394 :: 		debugText = "0";
	MOVLW       ?lstr51_Main_327.0V+0
	MOVWF       _debugText+0 
	MOVLW       hi_addr(?lstr51_Main_327.0V+0)
	MOVWF       _debugText+1 
;Main 7.0V.c,395 :: 		UART1_Write_Text(debugText);
	MOVF        _debugText+0, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVF        _debugText+1, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;Main 7.0V.c,396 :: 		}
L_sendSensorStatusBack820:
L_sendSensorStatusBack819:
;Main 7.0V.c,398 :: 		if( BackSensor4 == 1){
	BTFSS       PORTB+0, 1 
	GOTO        L_sendSensorStatusBack821
;Main 7.0V.c,399 :: 		debugText = "1";
	MOVLW       ?lstr52_Main_327.0V+0
	MOVWF       _debugText+0 
	MOVLW       hi_addr(?lstr52_Main_327.0V+0)
	MOVWF       _debugText+1 
;Main 7.0V.c,400 :: 		UART1_Write_Text(debugText);
	MOVF        _debugText+0, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVF        _debugText+1, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;Main 7.0V.c,401 :: 		}
	GOTO        L_sendSensorStatusBack822
L_sendSensorStatusBack821:
;Main 7.0V.c,402 :: 		else if( BackSensor4 == 0){
	BTFSC       PORTB+0, 1 
	GOTO        L_sendSensorStatusBack823
;Main 7.0V.c,403 :: 		debugText = "0";
	MOVLW       ?lstr53_Main_327.0V+0
	MOVWF       _debugText+0 
	MOVLW       hi_addr(?lstr53_Main_327.0V+0)
	MOVWF       _debugText+1 
;Main 7.0V.c,404 :: 		UART1_Write_Text(debugText);
	MOVF        _debugText+0, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVF        _debugText+1, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;Main 7.0V.c,405 :: 		}
L_sendSensorStatusBack823:
L_sendSensorStatusBack822:
;Main 7.0V.c,407 :: 		if( BackSensor5 == 1){
	BTFSS       PORTB+0, 0 
	GOTO        L_sendSensorStatusBack824
;Main 7.0V.c,408 :: 		debugText = "1;  ";
	MOVLW       ?lstr54_Main_327.0V+0
	MOVWF       _debugText+0 
	MOVLW       hi_addr(?lstr54_Main_327.0V+0)
	MOVWF       _debugText+1 
;Main 7.0V.c,409 :: 		UART1_Write_Text(debugText);
	MOVF        _debugText+0, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVF        _debugText+1, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;Main 7.0V.c,410 :: 		}
	GOTO        L_sendSensorStatusBack825
L_sendSensorStatusBack824:
;Main 7.0V.c,411 :: 		else if( BackSensor5 == 0){
	BTFSC       PORTB+0, 0 
	GOTO        L_sendSensorStatusBack826
;Main 7.0V.c,412 :: 		debugText = "0;  ";
	MOVLW       ?lstr55_Main_327.0V+0
	MOVWF       _debugText+0 
	MOVLW       hi_addr(?lstr55_Main_327.0V+0)
	MOVWF       _debugText+1 
;Main 7.0V.c,413 :: 		UART1_Write_Text(debugText);
	MOVF        _debugText+0, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVF        _debugText+1, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;Main 7.0V.c,414 :: 		}
L_sendSensorStatusBack826:
L_sendSensorStatusBack825:
;Main 7.0V.c,415 :: 		}
	RETURN      0
; end of _sendSensorStatusBack
