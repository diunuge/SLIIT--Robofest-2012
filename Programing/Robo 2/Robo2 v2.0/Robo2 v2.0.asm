
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
L__isAllBlack545:
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
L__isAllWhite546:
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
	GOTO        L__rotateByDegree648
	MOVLW       166
	XORWF       FARG_rotateByDegree_degree+0, 0 
L__rotateByDegree648:
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
	GOTO        L__rotateByDegree649
	MOVLW       90
	XORWF       FARG_rotateByDegree_degree+0, 0 
L__rotateByDegree649:
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
	GOTO        L__rotateByDegree650
	MOVLW       226
	XORWF       FARG_rotateByDegree_degree+0, 0 
L__rotateByDegree650:
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
	GOTO        L__rotateByDegree651
	MOVLW       30
	XORWF       FARG_rotateByDegree_degree+0, 0 
L__rotateByDegree651:
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
	GOTO        L__rotateByDegree652
	MOVLW       196
	XORWF       FARG_rotateByDegree_degree+0, 0 
L__rotateByDegree652:
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
	GOTO        L__rotateByDegree653
	MOVLW       60
	XORWF       FARG_rotateByDegree_degree+0, 0 
L__rotateByDegree653:
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
	GOTO        L__rotateByDegree654
	MOVLW       211
	XORWF       FARG_rotateByDegree_degree+0, 0 
L__rotateByDegree654:
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
	GOTO        L__rotateByDegree655
	MOVLW       45
	XORWF       FARG_rotateByDegree_degree+0, 0 
L__rotateByDegree655:
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
	MOVLW       ?lstr3_Robo2_32v2.0+0
	MOVWF       _debugText+0 
	MOVLW       hi_addr(?lstr3_Robo2_32v2.0+0)
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
	MOVLW       ?lstr4_Robo2_32v2.0+0
	MOVWF       _debugText+0 
	MOVLW       hi_addr(?lstr4_Robo2_32v2.0+0)
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
	MOVLW       ?lstr5_Robo2_32v2.0+0
	MOVWF       _debugText+0 
	MOVLW       hi_addr(?lstr5_Robo2_32v2.0+0)
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
	MOVLW       ?lstr6_Robo2_32v2.0+0
	MOVWF       _debugText+0 
	MOVLW       hi_addr(?lstr6_Robo2_32v2.0+0)
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
	MOVLW       ?lstr7_Robo2_32v2.0+0
	MOVWF       _debugText+0 
	MOVLW       hi_addr(?lstr7_Robo2_32v2.0+0)
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
	MOVLW       ?lstr8_Robo2_32v2.0+0
	MOVWF       _debugText+0 
	MOVLW       hi_addr(?lstr8_Robo2_32v2.0+0)
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
	MOVLW       ?lstr9_Robo2_32v2.0+0
	MOVWF       _debugText+0 
	MOVLW       hi_addr(?lstr9_Robo2_32v2.0+0)
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
	MOVLW       ?lstr10_Robo2_32v2.0+0
	MOVWF       _debugText+0 
	MOVLW       hi_addr(?lstr10_Robo2_32v2.0+0)
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
	MOVLW       ?lstr11_Robo2_32v2.0+0
	MOVWF       _debugText+0 
	MOVLW       hi_addr(?lstr11_Robo2_32v2.0+0)
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
	MOVLW       ?lstr12_Robo2_32v2.0+0
	MOVWF       _debugText+0 
	MOVLW       hi_addr(?lstr12_Robo2_32v2.0+0)
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
	MOVLW       ?lstr13_Robo2_32v2.0+0
	MOVWF       _debugText+0 
	MOVLW       hi_addr(?lstr13_Robo2_32v2.0+0)
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
	MOVLW       ?lstr14_Robo2_32v2.0+0
	MOVWF       _debugText+0 
	MOVLW       hi_addr(?lstr14_Robo2_32v2.0+0)
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
	MOVLW       ?lstr15_Robo2_32v2.0+0
	MOVWF       _debugText+0 
	MOVLW       hi_addr(?lstr15_Robo2_32v2.0+0)
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
	MOVLW       ?lstr16_Robo2_32v2.0+0
	MOVWF       _debugText+0 
	MOVLW       hi_addr(?lstr16_Robo2_32v2.0+0)
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
	MOVLW       ?lstr17_Robo2_32v2.0+0
	MOVWF       _debugText+0 
	MOVLW       hi_addr(?lstr17_Robo2_32v2.0+0)
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
	MOVLW       ?lstr18_Robo2_32v2.0+0
	MOVWF       _debugText+0 
	MOVLW       hi_addr(?lstr18_Robo2_32v2.0+0)
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
	MOVLW       ?lstr19_Robo2_32v2.0+0
	MOVWF       _debugText+0 
	MOVLW       hi_addr(?lstr19_Robo2_32v2.0+0)
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
	MOVLW       ?lstr20_Robo2_32v2.0+0
	MOVWF       _debugText+0 
	MOVLW       hi_addr(?lstr20_Robo2_32v2.0+0)
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
	MOVLW       ?lstr21_Robo2_32v2.0+0
	MOVWF       _debugText+0 
	MOVLW       hi_addr(?lstr21_Robo2_32v2.0+0)
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
	MOVLW       ?lstr22_Robo2_32v2.0+0
	MOVWF       _debugText+0 
	MOVLW       hi_addr(?lstr22_Robo2_32v2.0+0)
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
	MOVLW       ?lstr23_Robo2_32v2.0+0
	MOVWF       _debugText+0 
	MOVLW       hi_addr(?lstr23_Robo2_32v2.0+0)
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
	MOVLW       ?lstr24_Robo2_32v2.0+0
	MOVWF       _debugText+0 
	MOVLW       hi_addr(?lstr24_Robo2_32v2.0+0)
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
	MOVLW       ?lstr25_Robo2_32v2.0+0
	MOVWF       _debugText+0 
	MOVLW       hi_addr(?lstr25_Robo2_32v2.0+0)
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
	MOVLW       ?lstr26_Robo2_32v2.0+0
	MOVWF       _debugText+0 
	MOVLW       hi_addr(?lstr26_Robo2_32v2.0+0)
	MOVWF       _debugText+1 
;debug.h,129 :: 		UART1_Write_Text(debugText);
	MOVF        _debugText+0, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVF        _debugText+1, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;debug.h,131 :: 		debugText = "Decrease PWM..   ";
	MOVLW       ?lstr27_Robo2_32v2.0+0
	MOVWF       _debugText+0 
	MOVLW       hi_addr(?lstr27_Robo2_32v2.0+0)
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
	GOTO        L__testPIC656
	MOVF        _count+0, 0 
	SUBLW       0
L__testPIC656:
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
;linefollow.h,19 :: 		MIN_RPM = 175;       //155
	MOVLW       175
	MOVWF       _MIN_RPM+0 
	MOVLW       0
	MOVWF       _MIN_RPM+1 
;linefollow.h,20 :: 		MID_RPM = 215;
	MOVLW       215
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
;linefollow.h,25 :: 		SLOW_PWM = 200;
	MOVLW       200
	MOVWF       _SLOW_PWM+0 
	MOVLW       0
	MOVWF       _SLOW_PWM+1 
;linefollow.h,26 :: 		MID_PWM = 200;
	MOVLW       200
	MOVWF       _MID_PWM+0 
	MOVLW       0
	MOVWF       _MID_PWM+1 
;linefollow.h,27 :: 		FAST_PWM = 220;
	MOVLW       220
	MOVWF       _FAST_PWM+0 
	MOVLW       0
	MOVWF       _FAST_PWM+1 
;linefollow.h,29 :: 		Kp = 10;
	MOVLW       0
	MOVWF       _Kp+0 
	MOVLW       0
	MOVWF       _Kp+1 
	MOVLW       32
	MOVWF       _Kp+2 
	MOVLW       130
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
	MOVLW       215
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
;linefollow.h,43 :: 		while( (Sensor3==1 || Sensor4==1 || Sensor5==1 || Sensor6==1 || Sensor7==1) && Sensor1==0 && Sensor2==0 && Sensor8==0 && Sensor9==0 ){
L_lineFollowPID77:
	BTFSC       PORTD+0, 4 
	GOTO        L__lineFollowPID566
	BTFSC       PORTD+0, 5 
	GOTO        L__lineFollowPID566
	BTFSC       PORTD+0, 6 
	GOTO        L__lineFollowPID566
	BTFSC       PORTD+0, 7 
	GOTO        L__lineFollowPID566
	BTFSC       PORTB+0, 2 
	GOTO        L__lineFollowPID566
	GOTO        L_lineFollowPID78
L__lineFollowPID566:
	BTFSC       PORTB+0, 4 
	GOTO        L_lineFollowPID78
	BTFSC       PORTB+0, 3 
	GOTO        L_lineFollowPID78
	BTFSC       PORTB+0, 6 
	GOTO        L_lineFollowPID78
	BTFSC       PORTB+0, 7 
	GOTO        L_lineFollowPID78
L__lineFollowPID565:
;linefollow.h,45 :: 		if( (Scout==0 && Sensor1==0 && Sensor2==0 && Sensor3==0 && Sensor4==1 && Sensor5==1 && Sensor6==1 && Sensor7==1 && Sensor8==1 && Sensor9==1) || (Scout==0 && Sensor1==0 && Sensor2==0 && Sensor3==0 && Sensor4==0 && Sensor5==1 && Sensor6==1 && Sensor7==1 && Sensor8==1 && Sensor9==1)){
	BTFSC       PORTB+0, 5 
	GOTO        L__lineFollowPID564
	BTFSC       PORTB+0, 4 
	GOTO        L__lineFollowPID564
	BTFSC       PORTB+0, 3 
	GOTO        L__lineFollowPID564
	BTFSC       PORTD+0, 4 
	GOTO        L__lineFollowPID564
	BTFSS       PORTD+0, 5 
	GOTO        L__lineFollowPID564
	BTFSS       PORTD+0, 6 
	GOTO        L__lineFollowPID564
	BTFSS       PORTD+0, 7 
	GOTO        L__lineFollowPID564
	BTFSS       PORTB+0, 2 
	GOTO        L__lineFollowPID564
	BTFSS       PORTB+0, 6 
	GOTO        L__lineFollowPID564
	BTFSS       PORTB+0, 7 
	GOTO        L__lineFollowPID564
	GOTO        L__lineFollowPID562
L__lineFollowPID564:
	BTFSC       PORTB+0, 5 
	GOTO        L__lineFollowPID563
	BTFSC       PORTB+0, 4 
	GOTO        L__lineFollowPID563
	BTFSC       PORTB+0, 3 
	GOTO        L__lineFollowPID563
	BTFSC       PORTD+0, 4 
	GOTO        L__lineFollowPID563
	BTFSC       PORTD+0, 5 
	GOTO        L__lineFollowPID563
	BTFSS       PORTD+0, 6 
	GOTO        L__lineFollowPID563
	BTFSS       PORTD+0, 7 
	GOTO        L__lineFollowPID563
	BTFSS       PORTB+0, 2 
	GOTO        L__lineFollowPID563
	BTFSS       PORTB+0, 6 
	GOTO        L__lineFollowPID563
	BTFSS       PORTB+0, 7 
	GOTO        L__lineFollowPID563
	GOTO        L__lineFollowPID562
L__lineFollowPID563:
	GOTO        L_lineFollowPID89
L__lineFollowPID562:
;linefollow.h,47 :: 		debugText = "90 to right..   ";
	MOVLW       ?lstr28_Robo2_32v2.0+0
	MOVWF       _debugText+0 
	MOVLW       hi_addr(?lstr28_Robo2_32v2.0+0)
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
L_lineFollowPID90:
	BTFSC       PORTB+0, 5 
	GOTO        L_lineFollowPID91
;linefollow.h,51 :: 		rotateClockwise(TEST_RPM);
	MOVF        _TEST_RPM+0, 0 
	MOVWF       FARG_rotateClockwise_pwm+0 
	MOVF        _TEST_RPM+1, 0 
	MOVWF       FARG_rotateClockwise_pwm+1 
	CALL        _rotateClockwise+0, 0
;linefollow.h,52 :: 		}
	GOTO        L_lineFollowPID90
L_lineFollowPID91:
;linefollow.h,53 :: 		}
	GOTO        L_lineFollowPID92
L_lineFollowPID89:
;linefollow.h,54 :: 		else if( (Scout==0 && Sensor1==1 && Sensor2==1 && Sensor3==1 && Sensor4==1 && Sensor7==0 && Sensor8==0 && Sensor9==0) && (Scout==0 && Sensor1==1 && Sensor2==1 && Sensor3==1 && Sensor4==1 && Sensor7==0 && Sensor8==0 && Sensor9==0)){
	BTFSC       PORTB+0, 5 
	GOTO        L_lineFollowPID99
	BTFSS       PORTB+0, 4 
	GOTO        L_lineFollowPID99
	BTFSS       PORTB+0, 3 
	GOTO        L_lineFollowPID99
	BTFSS       PORTD+0, 4 
	GOTO        L_lineFollowPID99
	BTFSS       PORTD+0, 5 
	GOTO        L_lineFollowPID99
	BTFSC       PORTB+0, 2 
	GOTO        L_lineFollowPID99
	BTFSC       PORTB+0, 6 
	GOTO        L_lineFollowPID99
	BTFSC       PORTB+0, 7 
	GOTO        L_lineFollowPID99
L__lineFollowPID561:
	BTFSC       PORTB+0, 5 
	GOTO        L_lineFollowPID99
	BTFSS       PORTB+0, 4 
	GOTO        L_lineFollowPID99
	BTFSS       PORTB+0, 3 
	GOTO        L_lineFollowPID99
	BTFSS       PORTD+0, 4 
	GOTO        L_lineFollowPID99
	BTFSS       PORTD+0, 5 
	GOTO        L_lineFollowPID99
	BTFSC       PORTB+0, 2 
	GOTO        L_lineFollowPID99
	BTFSC       PORTB+0, 6 
	GOTO        L_lineFollowPID99
	BTFSC       PORTB+0, 7 
	GOTO        L_lineFollowPID99
L__lineFollowPID560:
L__lineFollowPID559:
;linefollow.h,56 :: 		debugText = "90 to left..   ";
	MOVLW       ?lstr29_Robo2_32v2.0+0
	MOVWF       _debugText+0 
	MOVLW       hi_addr(?lstr29_Robo2_32v2.0+0)
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
L_lineFollowPID100:
	BTFSC       PORTB+0, 5 
	GOTO        L_lineFollowPID101
;linefollow.h,60 :: 		rotateAntiClockwise(TEST_RPM);
	MOVF        _TEST_RPM+0, 0 
	MOVWF       FARG_rotateAntiClockwise_pwm+0 
	MOVF        _TEST_RPM+1, 0 
	MOVWF       FARG_rotateAntiClockwise_pwm+1 
	CALL        _rotateAntiClockwise+0, 0
;linefollow.h,61 :: 		}
	GOTO        L_lineFollowPID100
L_lineFollowPID101:
;linefollow.h,62 :: 		}
L_lineFollowPID99:
L_lineFollowPID92:
;linefollow.h,65 :: 		if( Sensor3==1 && Sensor4==0 && Sensor5==0 && Sensor6==0 && Sensor7==0)
	BTFSS       PORTD+0, 4 
	GOTO        L_lineFollowPID104
	BTFSC       PORTD+0, 5 
	GOTO        L_lineFollowPID104
	BTFSC       PORTD+0, 6 
	GOTO        L_lineFollowPID104
	BTFSC       PORTD+0, 7 
	GOTO        L_lineFollowPID104
	BTFSC       PORTB+0, 2 
	GOTO        L_lineFollowPID104
L__lineFollowPID558:
;linefollow.h,66 :: 		deviation = 4;
	MOVLW       4
	MOVWF       _deviation+0 
	MOVLW       0
	MOVWF       _deviation+1 
L_lineFollowPID104:
;linefollow.h,67 :: 		if( Sensor3==1 && Sensor4==1 && Sensor5==0 && Sensor6==0 && Sensor7==0)
	BTFSS       PORTD+0, 4 
	GOTO        L_lineFollowPID107
	BTFSS       PORTD+0, 5 
	GOTO        L_lineFollowPID107
	BTFSC       PORTD+0, 6 
	GOTO        L_lineFollowPID107
	BTFSC       PORTD+0, 7 
	GOTO        L_lineFollowPID107
	BTFSC       PORTB+0, 2 
	GOTO        L_lineFollowPID107
L__lineFollowPID557:
;linefollow.h,68 :: 		deviation = 3;
	MOVLW       3
	MOVWF       _deviation+0 
	MOVLW       0
	MOVWF       _deviation+1 
L_lineFollowPID107:
;linefollow.h,69 :: 		if( Sensor3==1 && Sensor4==1 && Sensor5==1 && Sensor6==0 && Sensor7==0)
	BTFSS       PORTD+0, 4 
	GOTO        L_lineFollowPID110
	BTFSS       PORTD+0, 5 
	GOTO        L_lineFollowPID110
	BTFSS       PORTD+0, 6 
	GOTO        L_lineFollowPID110
	BTFSC       PORTD+0, 7 
	GOTO        L_lineFollowPID110
	BTFSC       PORTB+0, 2 
	GOTO        L_lineFollowPID110
L__lineFollowPID556:
;linefollow.h,70 :: 		deviation = 2;
	MOVLW       2
	MOVWF       _deviation+0 
	MOVLW       0
	MOVWF       _deviation+1 
L_lineFollowPID110:
;linefollow.h,71 :: 		if( Sensor3==0 && Sensor4==1 && Sensor5==0 && Sensor6==0 && Sensor7==0)
	BTFSC       PORTD+0, 4 
	GOTO        L_lineFollowPID113
	BTFSS       PORTD+0, 5 
	GOTO        L_lineFollowPID113
	BTFSC       PORTD+0, 6 
	GOTO        L_lineFollowPID113
	BTFSC       PORTD+0, 7 
	GOTO        L_lineFollowPID113
	BTFSC       PORTB+0, 2 
	GOTO        L_lineFollowPID113
L__lineFollowPID555:
;linefollow.h,72 :: 		deviation = 1;
	MOVLW       1
	MOVWF       _deviation+0 
	MOVLW       0
	MOVWF       _deviation+1 
L_lineFollowPID113:
;linefollow.h,74 :: 		if( Sensor3==0 && Sensor4==1 && Sensor5==1 && Sensor6==0 && Sensor7==0)
	BTFSC       PORTD+0, 4 
	GOTO        L_lineFollowPID116
	BTFSS       PORTD+0, 5 
	GOTO        L_lineFollowPID116
	BTFSS       PORTD+0, 6 
	GOTO        L_lineFollowPID116
	BTFSC       PORTD+0, 7 
	GOTO        L_lineFollowPID116
	BTFSC       PORTB+0, 2 
	GOTO        L_lineFollowPID116
L__lineFollowPID554:
;linefollow.h,75 :: 		deviation = 0;
	CLRF        _deviation+0 
	CLRF        _deviation+1 
L_lineFollowPID116:
;linefollow.h,76 :: 		if( Sensor3==0 && Sensor4==1 && Sensor5==1 && Sensor6==1 && Sensor7==0)
	BTFSC       PORTD+0, 4 
	GOTO        L_lineFollowPID119
	BTFSS       PORTD+0, 5 
	GOTO        L_lineFollowPID119
	BTFSS       PORTD+0, 6 
	GOTO        L_lineFollowPID119
	BTFSS       PORTD+0, 7 
	GOTO        L_lineFollowPID119
	BTFSC       PORTB+0, 2 
	GOTO        L_lineFollowPID119
L__lineFollowPID553:
;linefollow.h,77 :: 		deviation = 0;
	CLRF        _deviation+0 
	CLRF        _deviation+1 
L_lineFollowPID119:
;linefollow.h,78 :: 		if( Sensor3==0 && Sensor4==0 && Sensor5==1 && Sensor6==0 && Sensor7==0)
	BTFSC       PORTD+0, 4 
	GOTO        L_lineFollowPID122
	BTFSC       PORTD+0, 5 
	GOTO        L_lineFollowPID122
	BTFSS       PORTD+0, 6 
	GOTO        L_lineFollowPID122
	BTFSC       PORTD+0, 7 
	GOTO        L_lineFollowPID122
	BTFSC       PORTB+0, 2 
	GOTO        L_lineFollowPID122
L__lineFollowPID552:
;linefollow.h,79 :: 		deviation = 0;
	CLRF        _deviation+0 
	CLRF        _deviation+1 
L_lineFollowPID122:
;linefollow.h,80 :: 		if( Sensor3==0 && Sensor4==0 && Sensor5==1 && Sensor6==1 && Sensor7==0)
	BTFSC       PORTD+0, 4 
	GOTO        L_lineFollowPID125
	BTFSC       PORTD+0, 5 
	GOTO        L_lineFollowPID125
	BTFSS       PORTD+0, 6 
	GOTO        L_lineFollowPID125
	BTFSS       PORTD+0, 7 
	GOTO        L_lineFollowPID125
	BTFSC       PORTB+0, 2 
	GOTO        L_lineFollowPID125
L__lineFollowPID551:
;linefollow.h,81 :: 		deviation = 0;
	CLRF        _deviation+0 
	CLRF        _deviation+1 
L_lineFollowPID125:
;linefollow.h,83 :: 		if( Sensor3==0 && Sensor4==0 && Sensor5==0 && Sensor6==1 && Sensor7==0)
	BTFSC       PORTD+0, 4 
	GOTO        L_lineFollowPID128
	BTFSC       PORTD+0, 5 
	GOTO        L_lineFollowPID128
	BTFSC       PORTD+0, 6 
	GOTO        L_lineFollowPID128
	BTFSS       PORTD+0, 7 
	GOTO        L_lineFollowPID128
	BTFSC       PORTB+0, 2 
	GOTO        L_lineFollowPID128
L__lineFollowPID550:
;linefollow.h,84 :: 		deviation = -1;
	MOVLW       255
	MOVWF       _deviation+0 
	MOVLW       255
	MOVWF       _deviation+1 
L_lineFollowPID128:
;linefollow.h,85 :: 		if( Sensor3==0 && Sensor4==0 && Sensor5==1 && Sensor6==1 && Sensor7==1)
	BTFSC       PORTD+0, 4 
	GOTO        L_lineFollowPID131
	BTFSC       PORTD+0, 5 
	GOTO        L_lineFollowPID131
	BTFSS       PORTD+0, 6 
	GOTO        L_lineFollowPID131
	BTFSS       PORTD+0, 7 
	GOTO        L_lineFollowPID131
	BTFSS       PORTB+0, 2 
	GOTO        L_lineFollowPID131
L__lineFollowPID549:
;linefollow.h,86 :: 		deviation = -2;
	MOVLW       254
	MOVWF       _deviation+0 
	MOVLW       255
	MOVWF       _deviation+1 
L_lineFollowPID131:
;linefollow.h,87 :: 		if( Sensor3==0 && Sensor4==0 && Sensor5==0 && Sensor6==1 && Sensor7==1)
	BTFSC       PORTD+0, 4 
	GOTO        L_lineFollowPID134
	BTFSC       PORTD+0, 5 
	GOTO        L_lineFollowPID134
	BTFSC       PORTD+0, 6 
	GOTO        L_lineFollowPID134
	BTFSS       PORTD+0, 7 
	GOTO        L_lineFollowPID134
	BTFSS       PORTB+0, 2 
	GOTO        L_lineFollowPID134
L__lineFollowPID548:
;linefollow.h,88 :: 		deviation = -3;
	MOVLW       253
	MOVWF       _deviation+0 
	MOVLW       255
	MOVWF       _deviation+1 
L_lineFollowPID134:
;linefollow.h,89 :: 		if( Sensor3==0 && Sensor4==0 && Sensor5==0 && Sensor6==0 && Sensor7==1)
	BTFSC       PORTD+0, 4 
	GOTO        L_lineFollowPID137
	BTFSC       PORTD+0, 5 
	GOTO        L_lineFollowPID137
	BTFSC       PORTD+0, 6 
	GOTO        L_lineFollowPID137
	BTFSC       PORTD+0, 7 
	GOTO        L_lineFollowPID137
	BTFSS       PORTB+0, 2 
	GOTO        L_lineFollowPID137
L__lineFollowPID547:
;linefollow.h,90 :: 		deviation = -4;
	MOVLW       252
	MOVWF       _deviation+0 
	MOVLW       255
	MOVWF       _deviation+1 
L_lineFollowPID137:
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
	GOTO        L_lineFollowPID77
L_lineFollowPID78:
;linefollow.h,106 :: 		}
	RETURN      0
; end of _lineFollowPID

_lineFollowNormalWorked:

;linefollow.h,108 :: 		void lineFollowNormalWorked(){
;linefollow.h,109 :: 		if(Scout == 1){
	BTFSS       PORTB+0, 5 
	GOTO        L_lineFollowNormalWorked138
;linefollow.h,111 :: 		if( Sensor3==0 && Sensor4==1 && Sensor5==1 && Sensor6==0 && Sensor7==0)
	BTFSC       PORTD+0, 4 
	GOTO        L_lineFollowNormalWorked141
	BTFSS       PORTD+0, 5 
	GOTO        L_lineFollowNormalWorked141
	BTFSS       PORTD+0, 6 
	GOTO        L_lineFollowNormalWorked141
	BTFSC       PORTD+0, 7 
	GOTO        L_lineFollowNormalWorked141
	BTFSC       PORTB+0, 2 
	GOTO        L_lineFollowNormalWorked141
L__lineFollowNormalWorked601:
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
	GOTO        L_lineFollowNormalWorked142
L_lineFollowNormalWorked141:
;linefollow.h,113 :: 		else if( Sensor3==0 && Sensor4==1 && Sensor5==1 && Sensor6==1 && Sensor7==0)
	BTFSC       PORTD+0, 4 
	GOTO        L_lineFollowNormalWorked145
	BTFSS       PORTD+0, 5 
	GOTO        L_lineFollowNormalWorked145
	BTFSS       PORTD+0, 6 
	GOTO        L_lineFollowNormalWorked145
	BTFSS       PORTD+0, 7 
	GOTO        L_lineFollowNormalWorked145
	BTFSC       PORTB+0, 2 
	GOTO        L_lineFollowNormalWorked145
L__lineFollowNormalWorked600:
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
	GOTO        L_lineFollowNormalWorked146
L_lineFollowNormalWorked145:
;linefollow.h,115 :: 		else if( Sensor3==0 && Sensor4==0 && Sensor5==1 && Sensor6==0 && Sensor7==0)
	BTFSC       PORTD+0, 4 
	GOTO        L_lineFollowNormalWorked149
	BTFSC       PORTD+0, 5 
	GOTO        L_lineFollowNormalWorked149
	BTFSS       PORTD+0, 6 
	GOTO        L_lineFollowNormalWorked149
	BTFSC       PORTD+0, 7 
	GOTO        L_lineFollowNormalWorked149
	BTFSC       PORTB+0, 2 
	GOTO        L_lineFollowNormalWorked149
L__lineFollowNormalWorked599:
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
	GOTO        L_lineFollowNormalWorked150
L_lineFollowNormalWorked149:
;linefollow.h,117 :: 		else if( Sensor3==0 && Sensor4==0 && Sensor5==1 && Sensor6==1 && Sensor7==0)
	BTFSC       PORTD+0, 4 
	GOTO        L_lineFollowNormalWorked153
	BTFSC       PORTD+0, 5 
	GOTO        L_lineFollowNormalWorked153
	BTFSS       PORTD+0, 6 
	GOTO        L_lineFollowNormalWorked153
	BTFSS       PORTD+0, 7 
	GOTO        L_lineFollowNormalWorked153
	BTFSC       PORTB+0, 2 
	GOTO        L_lineFollowNormalWorked153
L__lineFollowNormalWorked598:
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
	GOTO        L_lineFollowNormalWorked154
L_lineFollowNormalWorked153:
;linefollow.h,123 :: 		else if( Sensor3==1 && Sensor4==0 && Sensor5==0 && Sensor6==0 && Sensor7==0)
	BTFSS       PORTD+0, 4 
	GOTO        L_lineFollowNormalWorked157
	BTFSC       PORTD+0, 5 
	GOTO        L_lineFollowNormalWorked157
	BTFSC       PORTD+0, 6 
	GOTO        L_lineFollowNormalWorked157
	BTFSC       PORTD+0, 7 
	GOTO        L_lineFollowNormalWorked157
	BTFSC       PORTB+0, 2 
	GOTO        L_lineFollowNormalWorked157
L__lineFollowNormalWorked597:
;linefollow.h,125 :: 		turnLeft(FAST_PWM);
	MOVF        _FAST_PWM+0, 0 
	MOVWF       FARG_turnLeft_pwmRight+0 
	MOVF        _FAST_PWM+1, 0 
	MOVWF       FARG_turnLeft_pwmRight+1 
	CALL        _turnLeft+0, 0
	GOTO        L_lineFollowNormalWorked158
L_lineFollowNormalWorked157:
;linefollow.h,126 :: 		else if( Sensor3==1 && Sensor4==1 && Sensor5==0 && Sensor6==0 && Sensor7==0)
	BTFSS       PORTD+0, 4 
	GOTO        L_lineFollowNormalWorked161
	BTFSS       PORTD+0, 5 
	GOTO        L_lineFollowNormalWorked161
	BTFSC       PORTD+0, 6 
	GOTO        L_lineFollowNormalWorked161
	BTFSC       PORTD+0, 7 
	GOTO        L_lineFollowNormalWorked161
	BTFSC       PORTB+0, 2 
	GOTO        L_lineFollowNormalWorked161
L__lineFollowNormalWorked596:
;linefollow.h,128 :: 		turnLeft(FAST_PWM);
	MOVF        _FAST_PWM+0, 0 
	MOVWF       FARG_turnLeft_pwmRight+0 
	MOVF        _FAST_PWM+1, 0 
	MOVWF       FARG_turnLeft_pwmRight+1 
	CALL        _turnLeft+0, 0
	GOTO        L_lineFollowNormalWorked162
L_lineFollowNormalWorked161:
;linefollow.h,129 :: 		else if( Sensor3==1 && Sensor4==1 && Sensor5==1 && Sensor6==0 && Sensor7==0)
	BTFSS       PORTD+0, 4 
	GOTO        L_lineFollowNormalWorked165
	BTFSS       PORTD+0, 5 
	GOTO        L_lineFollowNormalWorked165
	BTFSS       PORTD+0, 6 
	GOTO        L_lineFollowNormalWorked165
	BTFSC       PORTD+0, 7 
	GOTO        L_lineFollowNormalWorked165
	BTFSC       PORTB+0, 2 
	GOTO        L_lineFollowNormalWorked165
L__lineFollowNormalWorked595:
;linefollow.h,131 :: 		turnLeft(FAST_PWM);
	MOVF        _FAST_PWM+0, 0 
	MOVWF       FARG_turnLeft_pwmRight+0 
	MOVF        _FAST_PWM+1, 0 
	MOVWF       FARG_turnLeft_pwmRight+1 
	CALL        _turnLeft+0, 0
	GOTO        L_lineFollowNormalWorked166
L_lineFollowNormalWorked165:
;linefollow.h,132 :: 		else if( Sensor3==0 && Sensor4==1 && Sensor5==0 && Sensor6==0 && Sensor7==0)
	BTFSC       PORTD+0, 4 
	GOTO        L_lineFollowNormalWorked169
	BTFSS       PORTD+0, 5 
	GOTO        L_lineFollowNormalWorked169
	BTFSC       PORTD+0, 6 
	GOTO        L_lineFollowNormalWorked169
	BTFSC       PORTD+0, 7 
	GOTO        L_lineFollowNormalWorked169
	BTFSC       PORTB+0, 2 
	GOTO        L_lineFollowNormalWorked169
L__lineFollowNormalWorked594:
;linefollow.h,134 :: 		turnLeft(FAST_PWM);
	MOVF        _FAST_PWM+0, 0 
	MOVWF       FARG_turnLeft_pwmRight+0 
	MOVF        _FAST_PWM+1, 0 
	MOVWF       FARG_turnLeft_pwmRight+1 
	CALL        _turnLeft+0, 0
	GOTO        L_lineFollowNormalWorked170
L_lineFollowNormalWorked169:
;linefollow.h,137 :: 		else if( Sensor3==0 && Sensor4==0 && Sensor5==0 && Sensor6==1 && Sensor7==0)
	BTFSC       PORTD+0, 4 
	GOTO        L_lineFollowNormalWorked173
	BTFSC       PORTD+0, 5 
	GOTO        L_lineFollowNormalWorked173
	BTFSC       PORTD+0, 6 
	GOTO        L_lineFollowNormalWorked173
	BTFSS       PORTD+0, 7 
	GOTO        L_lineFollowNormalWorked173
	BTFSC       PORTB+0, 2 
	GOTO        L_lineFollowNormalWorked173
L__lineFollowNormalWorked593:
;linefollow.h,139 :: 		turnRight(FAST_PWM);
	MOVF        _FAST_PWM+0, 0 
	MOVWF       FARG_turnRight_pwmLeft+0 
	MOVF        _FAST_PWM+1, 0 
	MOVWF       FARG_turnRight_pwmLeft+1 
	CALL        _turnRight+0, 0
	GOTO        L_lineFollowNormalWorked174
L_lineFollowNormalWorked173:
;linefollow.h,140 :: 		else if( Sensor3==0 && Sensor4==0 && Sensor5==1 && Sensor6==1 && Sensor7==1)
	BTFSC       PORTD+0, 4 
	GOTO        L_lineFollowNormalWorked177
	BTFSC       PORTD+0, 5 
	GOTO        L_lineFollowNormalWorked177
	BTFSS       PORTD+0, 6 
	GOTO        L_lineFollowNormalWorked177
	BTFSS       PORTD+0, 7 
	GOTO        L_lineFollowNormalWorked177
	BTFSS       PORTB+0, 2 
	GOTO        L_lineFollowNormalWorked177
L__lineFollowNormalWorked592:
;linefollow.h,142 :: 		turnRight(FAST_PWM);
	MOVF        _FAST_PWM+0, 0 
	MOVWF       FARG_turnRight_pwmLeft+0 
	MOVF        _FAST_PWM+1, 0 
	MOVWF       FARG_turnRight_pwmLeft+1 
	CALL        _turnRight+0, 0
	GOTO        L_lineFollowNormalWorked178
L_lineFollowNormalWorked177:
;linefollow.h,143 :: 		else if( Sensor3==0 && Sensor4==0 && Sensor5==0 && Sensor6==1 && Sensor7==1)
	BTFSC       PORTD+0, 4 
	GOTO        L_lineFollowNormalWorked181
	BTFSC       PORTD+0, 5 
	GOTO        L_lineFollowNormalWorked181
	BTFSC       PORTD+0, 6 
	GOTO        L_lineFollowNormalWorked181
	BTFSS       PORTD+0, 7 
	GOTO        L_lineFollowNormalWorked181
	BTFSS       PORTB+0, 2 
	GOTO        L_lineFollowNormalWorked181
L__lineFollowNormalWorked591:
;linefollow.h,145 :: 		turnRight(FAST_PWM);
	MOVF        _FAST_PWM+0, 0 
	MOVWF       FARG_turnRight_pwmLeft+0 
	MOVF        _FAST_PWM+1, 0 
	MOVWF       FARG_turnRight_pwmLeft+1 
	CALL        _turnRight+0, 0
	GOTO        L_lineFollowNormalWorked182
L_lineFollowNormalWorked181:
;linefollow.h,146 :: 		else if( Sensor3==0 && Sensor4==0 && Sensor5==0 && Sensor6==0 && Sensor7==1)
	BTFSC       PORTD+0, 4 
	GOTO        L_lineFollowNormalWorked185
	BTFSC       PORTD+0, 5 
	GOTO        L_lineFollowNormalWorked185
	BTFSC       PORTD+0, 6 
	GOTO        L_lineFollowNormalWorked185
	BTFSC       PORTD+0, 7 
	GOTO        L_lineFollowNormalWorked185
	BTFSS       PORTB+0, 2 
	GOTO        L_lineFollowNormalWorked185
L__lineFollowNormalWorked590:
;linefollow.h,148 :: 		turnRight(FAST_PWM);
	MOVF        _FAST_PWM+0, 0 
	MOVWF       FARG_turnRight_pwmLeft+0 
	MOVF        _FAST_PWM+1, 0 
	MOVWF       FARG_turnRight_pwmLeft+1 
	CALL        _turnRight+0, 0
	GOTO        L_lineFollowNormalWorked186
L_lineFollowNormalWorked185:
;linefollow.h,151 :: 		else if( Sensor3==1 && Sensor4==1 && Sensor5==1 && Sensor6==1 && Sensor7==0)
	BTFSS       PORTD+0, 4 
	GOTO        L_lineFollowNormalWorked189
	BTFSS       PORTD+0, 5 
	GOTO        L_lineFollowNormalWorked189
	BTFSS       PORTD+0, 6 
	GOTO        L_lineFollowNormalWorked189
	BTFSS       PORTD+0, 7 
	GOTO        L_lineFollowNormalWorked189
	BTFSC       PORTB+0, 2 
	GOTO        L_lineFollowNormalWorked189
L__lineFollowNormalWorked589:
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
	GOTO        L_lineFollowNormalWorked190
L_lineFollowNormalWorked189:
;linefollow.h,153 :: 		else if( Sensor3==0 && Sensor4==1 && Sensor5==1 && Sensor6==1 && Sensor7==1)
	BTFSC       PORTD+0, 4 
	GOTO        L_lineFollowNormalWorked193
	BTFSS       PORTD+0, 5 
	GOTO        L_lineFollowNormalWorked193
	BTFSS       PORTD+0, 6 
	GOTO        L_lineFollowNormalWorked193
	BTFSS       PORTD+0, 7 
	GOTO        L_lineFollowNormalWorked193
	BTFSS       PORTB+0, 2 
	GOTO        L_lineFollowNormalWorked193
L__lineFollowNormalWorked588:
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
	GOTO        L_lineFollowNormalWorked194
L_lineFollowNormalWorked193:
;linefollow.h,156 :: 		else if(isAllBlack()){
	CALL        _isAllBlack+0, 0
	MOVF        R0, 0 
	IORWF       R1, 0 
	BTFSC       STATUS+0, 2 
	GOTO        L_lineFollowNormalWorked195
;linefollow.h,159 :: 		sendSensorStatus();
	CALL        _sendSensorStatus+0, 0
;linefollow.h,160 :: 		}
	GOTO        L_lineFollowNormalWorked196
L_lineFollowNormalWorked195:
;linefollow.h,163 :: 		reverse(220,220);
	MOVLW       220
	MOVWF       FARG_reverse_pwmLeft+0 
	MOVLW       0
	MOVWF       FARG_reverse_pwmLeft+1 
	MOVLW       220
	MOVWF       FARG_reverse_pwmRight+0 
	MOVLW       0
	MOVWF       FARG_reverse_pwmRight+1 
	CALL        _reverse+0, 0
;linefollow.h,164 :: 		sendSensorStatus();
	CALL        _sendSensorStatus+0, 0
;linefollow.h,166 :: 		}
L_lineFollowNormalWorked196:
L_lineFollowNormalWorked194:
L_lineFollowNormalWorked190:
L_lineFollowNormalWorked186:
L_lineFollowNormalWorked182:
L_lineFollowNormalWorked178:
L_lineFollowNormalWorked174:
L_lineFollowNormalWorked170:
L_lineFollowNormalWorked166:
L_lineFollowNormalWorked162:
L_lineFollowNormalWorked158:
L_lineFollowNormalWorked154:
L_lineFollowNormalWorked150:
L_lineFollowNormalWorked146:
L_lineFollowNormalWorked142:
;linefollow.h,167 :: 		}
	GOTO        L_lineFollowNormalWorked197
L_lineFollowNormalWorked138:
;linefollow.h,174 :: 		if( Sensor1==1 && Sensor2==1 && Sensor3==1 && Sensor4==1 && Sensor5==1 && Sensor6==0 && Sensor7==0 && Sensor8==0 && Sensor9==0)
	BTFSS       PORTB+0, 4 
	GOTO        L_lineFollowNormalWorked200
	BTFSS       PORTB+0, 3 
	GOTO        L_lineFollowNormalWorked200
	BTFSS       PORTD+0, 4 
	GOTO        L_lineFollowNormalWorked200
	BTFSS       PORTD+0, 5 
	GOTO        L_lineFollowNormalWorked200
	BTFSS       PORTD+0, 6 
	GOTO        L_lineFollowNormalWorked200
	BTFSC       PORTD+0, 7 
	GOTO        L_lineFollowNormalWorked200
	BTFSC       PORTB+0, 2 
	GOTO        L_lineFollowNormalWorked200
	BTFSC       PORTB+0, 6 
	GOTO        L_lineFollowNormalWorked200
	BTFSC       PORTB+0, 7 
	GOTO        L_lineFollowNormalWorked200
L__lineFollowNormalWorked587:
;linefollow.h,175 :: 		rotateByDegree(-90);
	MOVLW       166
	MOVWF       FARG_rotateByDegree_degree+0 
	MOVLW       255
	MOVWF       FARG_rotateByDegree_degree+1 
	CALL        _rotateByDegree+0, 0
	GOTO        L_lineFollowNormalWorked201
L_lineFollowNormalWorked200:
;linefollow.h,176 :: 		else if( Sensor1==1 && Sensor2==1 && Sensor3==1 && Sensor4==1 && Sensor5==1 && Sensor6==1 && Sensor7==0 && Sensor8==0 && Sensor9==0)
	BTFSS       PORTB+0, 4 
	GOTO        L_lineFollowNormalWorked204
	BTFSS       PORTB+0, 3 
	GOTO        L_lineFollowNormalWorked204
	BTFSS       PORTD+0, 4 
	GOTO        L_lineFollowNormalWorked204
	BTFSS       PORTD+0, 5 
	GOTO        L_lineFollowNormalWorked204
	BTFSS       PORTD+0, 6 
	GOTO        L_lineFollowNormalWorked204
	BTFSS       PORTD+0, 7 
	GOTO        L_lineFollowNormalWorked204
	BTFSC       PORTB+0, 2 
	GOTO        L_lineFollowNormalWorked204
	BTFSC       PORTB+0, 6 
	GOTO        L_lineFollowNormalWorked204
	BTFSC       PORTB+0, 7 
	GOTO        L_lineFollowNormalWorked204
L__lineFollowNormalWorked586:
;linefollow.h,177 :: 		rotateByDegree(-90);
	MOVLW       166
	MOVWF       FARG_rotateByDegree_degree+0 
	MOVLW       255
	MOVWF       FARG_rotateByDegree_degree+1 
	CALL        _rotateByDegree+0, 0
	GOTO        L_lineFollowNormalWorked205
L_lineFollowNormalWorked204:
;linefollow.h,178 :: 		else if( Sensor1==1 && Sensor2==1 && Sensor3==1 && Sensor4==1 && Sensor5==1 && Sensor6==1 && Sensor7==1 && Sensor8==0 && Sensor9==0)
	BTFSS       PORTB+0, 4 
	GOTO        L_lineFollowNormalWorked208
	BTFSS       PORTB+0, 3 
	GOTO        L_lineFollowNormalWorked208
	BTFSS       PORTD+0, 4 
	GOTO        L_lineFollowNormalWorked208
	BTFSS       PORTD+0, 5 
	GOTO        L_lineFollowNormalWorked208
	BTFSS       PORTD+0, 6 
	GOTO        L_lineFollowNormalWorked208
	BTFSS       PORTD+0, 7 
	GOTO        L_lineFollowNormalWorked208
	BTFSS       PORTB+0, 2 
	GOTO        L_lineFollowNormalWorked208
	BTFSC       PORTB+0, 6 
	GOTO        L_lineFollowNormalWorked208
	BTFSC       PORTB+0, 7 
	GOTO        L_lineFollowNormalWorked208
L__lineFollowNormalWorked585:
;linefollow.h,179 :: 		rotateByDegree(-90);
	MOVLW       166
	MOVWF       FARG_rotateByDegree_degree+0 
	MOVLW       255
	MOVWF       FARG_rotateByDegree_degree+1 
	CALL        _rotateByDegree+0, 0
	GOTO        L_lineFollowNormalWorked209
L_lineFollowNormalWorked208:
;linefollow.h,182 :: 		else if( Sensor1==0 && Sensor2==0 && Sensor3==1 && Sensor4==1 && Sensor5==1 && Sensor6==1 && Sensor7==1 && Sensor8==1 && Sensor9==1)
	BTFSC       PORTB+0, 4 
	GOTO        L_lineFollowNormalWorked212
	BTFSC       PORTB+0, 3 
	GOTO        L_lineFollowNormalWorked212
	BTFSS       PORTD+0, 4 
	GOTO        L_lineFollowNormalWorked212
	BTFSS       PORTD+0, 5 
	GOTO        L_lineFollowNormalWorked212
	BTFSS       PORTD+0, 6 
	GOTO        L_lineFollowNormalWorked212
	BTFSS       PORTD+0, 7 
	GOTO        L_lineFollowNormalWorked212
	BTFSS       PORTB+0, 2 
	GOTO        L_lineFollowNormalWorked212
	BTFSS       PORTB+0, 6 
	GOTO        L_lineFollowNormalWorked212
	BTFSS       PORTB+0, 7 
	GOTO        L_lineFollowNormalWorked212
L__lineFollowNormalWorked584:
;linefollow.h,183 :: 		rotateByDegree(90);
	MOVLW       90
	MOVWF       FARG_rotateByDegree_degree+0 
	MOVLW       0
	MOVWF       FARG_rotateByDegree_degree+1 
	CALL        _rotateByDegree+0, 0
	GOTO        L_lineFollowNormalWorked213
L_lineFollowNormalWorked212:
;linefollow.h,184 :: 		else if( Sensor1==0 && Sensor2==0 && Sensor3==0 && Sensor4==1 && Sensor5==1 && Sensor6==1 && Sensor7==1 && Sensor8==1 && Sensor9==1)
	BTFSC       PORTB+0, 4 
	GOTO        L_lineFollowNormalWorked216
	BTFSC       PORTB+0, 3 
	GOTO        L_lineFollowNormalWorked216
	BTFSC       PORTD+0, 4 
	GOTO        L_lineFollowNormalWorked216
	BTFSS       PORTD+0, 5 
	GOTO        L_lineFollowNormalWorked216
	BTFSS       PORTD+0, 6 
	GOTO        L_lineFollowNormalWorked216
	BTFSS       PORTD+0, 7 
	GOTO        L_lineFollowNormalWorked216
	BTFSS       PORTB+0, 2 
	GOTO        L_lineFollowNormalWorked216
	BTFSS       PORTB+0, 6 
	GOTO        L_lineFollowNormalWorked216
	BTFSS       PORTB+0, 7 
	GOTO        L_lineFollowNormalWorked216
L__lineFollowNormalWorked583:
;linefollow.h,185 :: 		rotateByDegree(90);
	MOVLW       90
	MOVWF       FARG_rotateByDegree_degree+0 
	MOVLW       0
	MOVWF       FARG_rotateByDegree_degree+1 
	CALL        _rotateByDegree+0, 0
	GOTO        L_lineFollowNormalWorked217
L_lineFollowNormalWorked216:
;linefollow.h,186 :: 		else if( Sensor1==0 && Sensor2==0 && Sensor3==0 && Sensor4==0 && Sensor5==1 && Sensor6==1 && Sensor7==1 && Sensor8==1 && Sensor9==1)
	BTFSC       PORTB+0, 4 
	GOTO        L_lineFollowNormalWorked220
	BTFSC       PORTB+0, 3 
	GOTO        L_lineFollowNormalWorked220
	BTFSC       PORTD+0, 4 
	GOTO        L_lineFollowNormalWorked220
	BTFSC       PORTD+0, 5 
	GOTO        L_lineFollowNormalWorked220
	BTFSS       PORTD+0, 6 
	GOTO        L_lineFollowNormalWorked220
	BTFSS       PORTD+0, 7 
	GOTO        L_lineFollowNormalWorked220
	BTFSS       PORTB+0, 2 
	GOTO        L_lineFollowNormalWorked220
	BTFSS       PORTB+0, 6 
	GOTO        L_lineFollowNormalWorked220
	BTFSS       PORTB+0, 7 
	GOTO        L_lineFollowNormalWorked220
L__lineFollowNormalWorked582:
;linefollow.h,187 :: 		rotateByDegree(90);
	MOVLW       90
	MOVWF       FARG_rotateByDegree_degree+0 
	MOVLW       0
	MOVWF       FARG_rotateByDegree_degree+1 
	CALL        _rotateByDegree+0, 0
	GOTO        L_lineFollowNormalWorked221
L_lineFollowNormalWorked220:
;linefollow.h,192 :: 		else if( Sensor3==1 && Sensor4==0 && Sensor5==0 && Sensor6==0 && Sensor7==0)
	BTFSS       PORTD+0, 4 
	GOTO        L_lineFollowNormalWorked224
	BTFSC       PORTD+0, 5 
	GOTO        L_lineFollowNormalWorked224
	BTFSC       PORTD+0, 6 
	GOTO        L_lineFollowNormalWorked224
	BTFSC       PORTD+0, 7 
	GOTO        L_lineFollowNormalWorked224
	BTFSC       PORTB+0, 2 
	GOTO        L_lineFollowNormalWorked224
L__lineFollowNormalWorked581:
;linefollow.h,194 :: 		turnLeft(FAST_PWM);
	MOVF        _FAST_PWM+0, 0 
	MOVWF       FARG_turnLeft_pwmRight+0 
	MOVF        _FAST_PWM+1, 0 
	MOVWF       FARG_turnLeft_pwmRight+1 
	CALL        _turnLeft+0, 0
	GOTO        L_lineFollowNormalWorked225
L_lineFollowNormalWorked224:
;linefollow.h,195 :: 		else if( Sensor3==1 && Sensor4==1 && Sensor5==0 && Sensor6==0 && Sensor7==0)
	BTFSS       PORTD+0, 4 
	GOTO        L_lineFollowNormalWorked228
	BTFSS       PORTD+0, 5 
	GOTO        L_lineFollowNormalWorked228
	BTFSC       PORTD+0, 6 
	GOTO        L_lineFollowNormalWorked228
	BTFSC       PORTD+0, 7 
	GOTO        L_lineFollowNormalWorked228
	BTFSC       PORTB+0, 2 
	GOTO        L_lineFollowNormalWorked228
L__lineFollowNormalWorked580:
;linefollow.h,197 :: 		turnLeft(FAST_PWM);
	MOVF        _FAST_PWM+0, 0 
	MOVWF       FARG_turnLeft_pwmRight+0 
	MOVF        _FAST_PWM+1, 0 
	MOVWF       FARG_turnLeft_pwmRight+1 
	CALL        _turnLeft+0, 0
	GOTO        L_lineFollowNormalWorked229
L_lineFollowNormalWorked228:
;linefollow.h,198 :: 		else if( Sensor3==1 && Sensor4==1 && Sensor5==1 && Sensor6==0 && Sensor7==0)
	BTFSS       PORTD+0, 4 
	GOTO        L_lineFollowNormalWorked232
	BTFSS       PORTD+0, 5 
	GOTO        L_lineFollowNormalWorked232
	BTFSS       PORTD+0, 6 
	GOTO        L_lineFollowNormalWorked232
	BTFSC       PORTD+0, 7 
	GOTO        L_lineFollowNormalWorked232
	BTFSC       PORTB+0, 2 
	GOTO        L_lineFollowNormalWorked232
L__lineFollowNormalWorked579:
;linefollow.h,200 :: 		turnLeft(FAST_PWM);
	MOVF        _FAST_PWM+0, 0 
	MOVWF       FARG_turnLeft_pwmRight+0 
	MOVF        _FAST_PWM+1, 0 
	MOVWF       FARG_turnLeft_pwmRight+1 
	CALL        _turnLeft+0, 0
	GOTO        L_lineFollowNormalWorked233
L_lineFollowNormalWorked232:
;linefollow.h,201 :: 		else if( Sensor3==0 && Sensor4==1 && Sensor5==0 && Sensor6==0 && Sensor7==0)
	BTFSC       PORTD+0, 4 
	GOTO        L_lineFollowNormalWorked236
	BTFSS       PORTD+0, 5 
	GOTO        L_lineFollowNormalWorked236
	BTFSC       PORTD+0, 6 
	GOTO        L_lineFollowNormalWorked236
	BTFSC       PORTD+0, 7 
	GOTO        L_lineFollowNormalWorked236
	BTFSC       PORTB+0, 2 
	GOTO        L_lineFollowNormalWorked236
L__lineFollowNormalWorked578:
;linefollow.h,203 :: 		turnLeft(FAST_PWM);
	MOVF        _FAST_PWM+0, 0 
	MOVWF       FARG_turnLeft_pwmRight+0 
	MOVF        _FAST_PWM+1, 0 
	MOVWF       FARG_turnLeft_pwmRight+1 
	CALL        _turnLeft+0, 0
	GOTO        L_lineFollowNormalWorked237
L_lineFollowNormalWorked236:
;linefollow.h,206 :: 		else if( Sensor3==0 && Sensor4==0 && Sensor5==0 && Sensor6==1 && Sensor7==0)
	BTFSC       PORTD+0, 4 
	GOTO        L_lineFollowNormalWorked240
	BTFSC       PORTD+0, 5 
	GOTO        L_lineFollowNormalWorked240
	BTFSC       PORTD+0, 6 
	GOTO        L_lineFollowNormalWorked240
	BTFSS       PORTD+0, 7 
	GOTO        L_lineFollowNormalWorked240
	BTFSC       PORTB+0, 2 
	GOTO        L_lineFollowNormalWorked240
L__lineFollowNormalWorked577:
;linefollow.h,208 :: 		turnRight(FAST_PWM);
	MOVF        _FAST_PWM+0, 0 
	MOVWF       FARG_turnRight_pwmLeft+0 
	MOVF        _FAST_PWM+1, 0 
	MOVWF       FARG_turnRight_pwmLeft+1 
	CALL        _turnRight+0, 0
	GOTO        L_lineFollowNormalWorked241
L_lineFollowNormalWorked240:
;linefollow.h,209 :: 		else if( Sensor3==0 && Sensor4==0 && Sensor5==1 && Sensor6==1 && Sensor7==1)
	BTFSC       PORTD+0, 4 
	GOTO        L_lineFollowNormalWorked244
	BTFSC       PORTD+0, 5 
	GOTO        L_lineFollowNormalWorked244
	BTFSS       PORTD+0, 6 
	GOTO        L_lineFollowNormalWorked244
	BTFSS       PORTD+0, 7 
	GOTO        L_lineFollowNormalWorked244
	BTFSS       PORTB+0, 2 
	GOTO        L_lineFollowNormalWorked244
L__lineFollowNormalWorked576:
;linefollow.h,211 :: 		turnRight(FAST_PWM);
	MOVF        _FAST_PWM+0, 0 
	MOVWF       FARG_turnRight_pwmLeft+0 
	MOVF        _FAST_PWM+1, 0 
	MOVWF       FARG_turnRight_pwmLeft+1 
	CALL        _turnRight+0, 0
	GOTO        L_lineFollowNormalWorked245
L_lineFollowNormalWorked244:
;linefollow.h,212 :: 		else if( Sensor3==0 && Sensor4==0 && Sensor5==0 && Sensor6==1 && Sensor7==1)
	BTFSC       PORTD+0, 4 
	GOTO        L_lineFollowNormalWorked248
	BTFSC       PORTD+0, 5 
	GOTO        L_lineFollowNormalWorked248
	BTFSC       PORTD+0, 6 
	GOTO        L_lineFollowNormalWorked248
	BTFSS       PORTD+0, 7 
	GOTO        L_lineFollowNormalWorked248
	BTFSS       PORTB+0, 2 
	GOTO        L_lineFollowNormalWorked248
L__lineFollowNormalWorked575:
;linefollow.h,214 :: 		turnRight(FAST_PWM);
	MOVF        _FAST_PWM+0, 0 
	MOVWF       FARG_turnRight_pwmLeft+0 
	MOVF        _FAST_PWM+1, 0 
	MOVWF       FARG_turnRight_pwmLeft+1 
	CALL        _turnRight+0, 0
	GOTO        L_lineFollowNormalWorked249
L_lineFollowNormalWorked248:
;linefollow.h,215 :: 		else if( Sensor3==0 && Sensor4==0 && Sensor5==0 && Sensor6==0 && Sensor7==1)
	BTFSC       PORTD+0, 4 
	GOTO        L_lineFollowNormalWorked252
	BTFSC       PORTD+0, 5 
	GOTO        L_lineFollowNormalWorked252
	BTFSC       PORTD+0, 6 
	GOTO        L_lineFollowNormalWorked252
	BTFSC       PORTD+0, 7 
	GOTO        L_lineFollowNormalWorked252
	BTFSS       PORTB+0, 2 
	GOTO        L_lineFollowNormalWorked252
L__lineFollowNormalWorked574:
;linefollow.h,217 :: 		turnRight(FAST_PWM);
	MOVF        _FAST_PWM+0, 0 
	MOVWF       FARG_turnRight_pwmLeft+0 
	MOVF        _FAST_PWM+1, 0 
	MOVWF       FARG_turnRight_pwmLeft+1 
	CALL        _turnRight+0, 0
	GOTO        L_lineFollowNormalWorked253
L_lineFollowNormalWorked252:
;linefollow.h,220 :: 		else if( Sensor3==1 && Sensor4==1 && Sensor5==1 && Sensor6==1 && Sensor7==0)
	BTFSS       PORTD+0, 4 
	GOTO        L_lineFollowNormalWorked256
	BTFSS       PORTD+0, 5 
	GOTO        L_lineFollowNormalWorked256
	BTFSS       PORTD+0, 6 
	GOTO        L_lineFollowNormalWorked256
	BTFSS       PORTD+0, 7 
	GOTO        L_lineFollowNormalWorked256
	BTFSC       PORTB+0, 2 
	GOTO        L_lineFollowNormalWorked256
L__lineFollowNormalWorked573:
;linefollow.h,221 :: 		moveForward(SLOW_PWM,FAST_PWM);
	MOVF        _SLOW_PWM+0, 0 
	MOVWF       FARG_moveForward_pwmLeft+0 
	MOVF        _SLOW_PWM+1, 0 
	MOVWF       FARG_moveForward_pwmLeft+1 
	MOVF        _FAST_PWM+0, 0 
	MOVWF       FARG_moveForward_pwmRight+0 
	MOVF        _FAST_PWM+1, 0 
	MOVWF       FARG_moveForward_pwmRight+1 
	CALL        _moveForward+0, 0
	GOTO        L_lineFollowNormalWorked257
L_lineFollowNormalWorked256:
;linefollow.h,222 :: 		else if( Sensor3==0 && Sensor4==1 && Sensor5==1 && Sensor6==1 && Sensor7==1)
	BTFSC       PORTD+0, 4 
	GOTO        L_lineFollowNormalWorked260
	BTFSS       PORTD+0, 5 
	GOTO        L_lineFollowNormalWorked260
	BTFSS       PORTD+0, 6 
	GOTO        L_lineFollowNormalWorked260
	BTFSS       PORTD+0, 7 
	GOTO        L_lineFollowNormalWorked260
	BTFSS       PORTB+0, 2 
	GOTO        L_lineFollowNormalWorked260
L__lineFollowNormalWorked572:
;linefollow.h,223 :: 		moveForward(FAST_PWM,SLOW_PWM);
	MOVF        _FAST_PWM+0, 0 
	MOVWF       FARG_moveForward_pwmLeft+0 
	MOVF        _FAST_PWM+1, 0 
	MOVWF       FARG_moveForward_pwmLeft+1 
	MOVF        _SLOW_PWM+0, 0 
	MOVWF       FARG_moveForward_pwmRight+0 
	MOVF        _SLOW_PWM+1, 0 
	MOVWF       FARG_moveForward_pwmRight+1 
	CALL        _moveForward+0, 0
	GOTO        L_lineFollowNormalWorked261
L_lineFollowNormalWorked260:
;linefollow.h,224 :: 		else if( Sensor2==1 && Sensor3==1 && Sensor4==1 && Sensor5==0 && Sensor6==1 && Sensor7==1 && Sensor8==1)
	BTFSS       PORTB+0, 3 
	GOTO        L_lineFollowNormalWorked264
	BTFSS       PORTD+0, 4 
	GOTO        L_lineFollowNormalWorked264
	BTFSS       PORTD+0, 5 
	GOTO        L_lineFollowNormalWorked264
	BTFSC       PORTD+0, 6 
	GOTO        L_lineFollowNormalWorked264
	BTFSS       PORTD+0, 7 
	GOTO        L_lineFollowNormalWorked264
	BTFSS       PORTB+0, 2 
	GOTO        L_lineFollowNormalWorked264
	BTFSS       PORTB+0, 6 
	GOTO        L_lineFollowNormalWorked264
L__lineFollowNormalWorked571:
;linefollow.h,225 :: 		while(Scout==0)
L_lineFollowNormalWorked265:
	BTFSC       PORTB+0, 5 
	GOTO        L_lineFollowNormalWorked266
;linefollow.h,226 :: 		rotateAntiClockwise(255);
	MOVLW       255
	MOVWF       FARG_rotateAntiClockwise_pwm+0 
	MOVLW       0
	MOVWF       FARG_rotateAntiClockwise_pwm+1 
	CALL        _rotateAntiClockwise+0, 0
	GOTO        L_lineFollowNormalWorked265
L_lineFollowNormalWorked266:
	GOTO        L_lineFollowNormalWorked267
L_lineFollowNormalWorked264:
;linefollow.h,229 :: 		else if( Sensor3==0 && Sensor4==1 && Sensor5==1 && Sensor6==0 && Sensor7==0)
	BTFSC       PORTD+0, 4 
	GOTO        L_lineFollowNormalWorked270
	BTFSS       PORTD+0, 5 
	GOTO        L_lineFollowNormalWorked270
	BTFSS       PORTD+0, 6 
	GOTO        L_lineFollowNormalWorked270
	BTFSC       PORTD+0, 7 
	GOTO        L_lineFollowNormalWorked270
	BTFSC       PORTB+0, 2 
	GOTO        L_lineFollowNormalWorked270
L__lineFollowNormalWorked570:
;linefollow.h,230 :: 		moveForward(SLOW_PWM,FAST_PWM);
	MOVF        _SLOW_PWM+0, 0 
	MOVWF       FARG_moveForward_pwmLeft+0 
	MOVF        _SLOW_PWM+1, 0 
	MOVWF       FARG_moveForward_pwmLeft+1 
	MOVF        _FAST_PWM+0, 0 
	MOVWF       FARG_moveForward_pwmRight+0 
	MOVF        _FAST_PWM+1, 0 
	MOVWF       FARG_moveForward_pwmRight+1 
	CALL        _moveForward+0, 0
	GOTO        L_lineFollowNormalWorked271
L_lineFollowNormalWorked270:
;linefollow.h,231 :: 		else if( Sensor3==0 && Sensor4==1 && Sensor5==1 && Sensor6==1 && Sensor7==0)
	BTFSC       PORTD+0, 4 
	GOTO        L_lineFollowNormalWorked274
	BTFSS       PORTD+0, 5 
	GOTO        L_lineFollowNormalWorked274
	BTFSS       PORTD+0, 6 
	GOTO        L_lineFollowNormalWorked274
	BTFSS       PORTD+0, 7 
	GOTO        L_lineFollowNormalWorked274
	BTFSC       PORTB+0, 2 
	GOTO        L_lineFollowNormalWorked274
L__lineFollowNormalWorked569:
;linefollow.h,232 :: 		moveForward(FAST_PWM,FAST_PWM);
	MOVF        _FAST_PWM+0, 0 
	MOVWF       FARG_moveForward_pwmLeft+0 
	MOVF        _FAST_PWM+1, 0 
	MOVWF       FARG_moveForward_pwmLeft+1 
	MOVF        _FAST_PWM+0, 0 
	MOVWF       FARG_moveForward_pwmRight+0 
	MOVF        _FAST_PWM+1, 0 
	MOVWF       FARG_moveForward_pwmRight+1 
	CALL        _moveForward+0, 0
	GOTO        L_lineFollowNormalWorked275
L_lineFollowNormalWorked274:
;linefollow.h,233 :: 		else if( Sensor3==0 && Sensor4==0 && Sensor5==1 && Sensor6==0 && Sensor7==0)
	BTFSC       PORTD+0, 4 
	GOTO        L_lineFollowNormalWorked278
	BTFSC       PORTD+0, 5 
	GOTO        L_lineFollowNormalWorked278
	BTFSS       PORTD+0, 6 
	GOTO        L_lineFollowNormalWorked278
	BTFSC       PORTD+0, 7 
	GOTO        L_lineFollowNormalWorked278
	BTFSC       PORTB+0, 2 
	GOTO        L_lineFollowNormalWorked278
L__lineFollowNormalWorked568:
;linefollow.h,234 :: 		moveForward(FAST_PWM,FAST_PWM);
	MOVF        _FAST_PWM+0, 0 
	MOVWF       FARG_moveForward_pwmLeft+0 
	MOVF        _FAST_PWM+1, 0 
	MOVWF       FARG_moveForward_pwmLeft+1 
	MOVF        _FAST_PWM+0, 0 
	MOVWF       FARG_moveForward_pwmRight+0 
	MOVF        _FAST_PWM+1, 0 
	MOVWF       FARG_moveForward_pwmRight+1 
	CALL        _moveForward+0, 0
	GOTO        L_lineFollowNormalWorked279
L_lineFollowNormalWorked278:
;linefollow.h,235 :: 		else if( Sensor3==0 && Sensor4==0 && Sensor5==1 && Sensor6==1 && Sensor7==0)
	BTFSC       PORTD+0, 4 
	GOTO        L_lineFollowNormalWorked282
	BTFSC       PORTD+0, 5 
	GOTO        L_lineFollowNormalWorked282
	BTFSS       PORTD+0, 6 
	GOTO        L_lineFollowNormalWorked282
	BTFSS       PORTD+0, 7 
	GOTO        L_lineFollowNormalWorked282
	BTFSC       PORTB+0, 2 
	GOTO        L_lineFollowNormalWorked282
L__lineFollowNormalWorked567:
;linefollow.h,236 :: 		moveForward(FAST_PWM,SLOW_PWM);
	MOVF        _FAST_PWM+0, 0 
	MOVWF       FARG_moveForward_pwmLeft+0 
	MOVF        _FAST_PWM+1, 0 
	MOVWF       FARG_moveForward_pwmLeft+1 
	MOVF        _SLOW_PWM+0, 0 
	MOVWF       FARG_moveForward_pwmRight+0 
	MOVF        _SLOW_PWM+1, 0 
	MOVWF       FARG_moveForward_pwmRight+1 
	CALL        _moveForward+0, 0
	GOTO        L_lineFollowNormalWorked283
L_lineFollowNormalWorked282:
;linefollow.h,239 :: 		else if(isAllWhite()){
	CALL        _isAllWhite+0, 0
	MOVF        R0, 0 
	IORWF       R1, 0 
	BTFSC       STATUS+0, 2 
	GOTO        L_lineFollowNormalWorked284
;linefollow.h,242 :: 		sendSensorStatus();
	CALL        _sendSensorStatus+0, 0
;linefollow.h,243 :: 		}
	GOTO        L_lineFollowNormalWorked285
L_lineFollowNormalWorked284:
;linefollow.h,246 :: 		reverse(220,220);
	MOVLW       220
	MOVWF       FARG_reverse_pwmLeft+0 
	MOVLW       0
	MOVWF       FARG_reverse_pwmLeft+1 
	MOVLW       220
	MOVWF       FARG_reverse_pwmRight+0 
	MOVLW       0
	MOVWF       FARG_reverse_pwmRight+1 
	CALL        _reverse+0, 0
;linefollow.h,247 :: 		sendSensorStatus();
	CALL        _sendSensorStatus+0, 0
;linefollow.h,249 :: 		}
L_lineFollowNormalWorked285:
L_lineFollowNormalWorked283:
L_lineFollowNormalWorked279:
L_lineFollowNormalWorked275:
L_lineFollowNormalWorked271:
L_lineFollowNormalWorked267:
L_lineFollowNormalWorked261:
L_lineFollowNormalWorked257:
L_lineFollowNormalWorked253:
L_lineFollowNormalWorked249:
L_lineFollowNormalWorked245:
L_lineFollowNormalWorked241:
L_lineFollowNormalWorked237:
L_lineFollowNormalWorked233:
L_lineFollowNormalWorked229:
L_lineFollowNormalWorked225:
L_lineFollowNormalWorked221:
L_lineFollowNormalWorked217:
L_lineFollowNormalWorked213:
L_lineFollowNormalWorked209:
L_lineFollowNormalWorked205:
L_lineFollowNormalWorked201:
;linefollow.h,250 :: 		}
L_lineFollowNormalWorked197:
;linefollow.h,251 :: 		}
	RETURN      0
; end of _lineFollowNormalWorked

_isOnThePath:

;linefollow.h,253 :: 		int isOnThePath(){
;linefollow.h,254 :: 		if(((Sensor3==0 && Sensor4==1 && Sensor5==1 && Sensor6==0 && Sensor7==0) || ( Sensor3==0 && Sensor4==1 && Sensor5==1 && Sensor6==1 && Sensor7==0) || ( Sensor3==0 && Sensor4==0 && Sensor5==1 && Sensor6==0 && Sensor7==0) || ( Sensor3==0 && Sensor4==0 && Sensor5==1 && Sensor6==1 && Sensor7==0)) && Sensor1==0 && Sensor2==0 && Sensor8==0 && Sensor9==0)
	BTFSC       PORTD+0, 4 
	GOTO        L__isOnThePath607
	BTFSS       PORTD+0, 5 
	GOTO        L__isOnThePath607
	BTFSS       PORTD+0, 6 
	GOTO        L__isOnThePath607
	BTFSC       PORTD+0, 7 
	GOTO        L__isOnThePath607
	BTFSC       PORTB+0, 2 
	GOTO        L__isOnThePath607
	GOTO        L__isOnThePath603
L__isOnThePath607:
	BTFSC       PORTD+0, 4 
	GOTO        L__isOnThePath606
	BTFSS       PORTD+0, 5 
	GOTO        L__isOnThePath606
	BTFSS       PORTD+0, 6 
	GOTO        L__isOnThePath606
	BTFSS       PORTD+0, 7 
	GOTO        L__isOnThePath606
	BTFSC       PORTB+0, 2 
	GOTO        L__isOnThePath606
	GOTO        L__isOnThePath603
L__isOnThePath606:
	BTFSC       PORTD+0, 4 
	GOTO        L__isOnThePath605
	BTFSC       PORTD+0, 5 
	GOTO        L__isOnThePath605
	BTFSS       PORTD+0, 6 
	GOTO        L__isOnThePath605
	BTFSC       PORTD+0, 7 
	GOTO        L__isOnThePath605
	BTFSC       PORTB+0, 2 
	GOTO        L__isOnThePath605
	GOTO        L__isOnThePath603
L__isOnThePath605:
	BTFSC       PORTD+0, 4 
	GOTO        L__isOnThePath604
	BTFSC       PORTD+0, 5 
	GOTO        L__isOnThePath604
	BTFSS       PORTD+0, 6 
	GOTO        L__isOnThePath604
	BTFSS       PORTD+0, 7 
	GOTO        L__isOnThePath604
	BTFSC       PORTB+0, 2 
	GOTO        L__isOnThePath604
	GOTO        L__isOnThePath603
L__isOnThePath604:
	GOTO        L_isOnThePath298
L__isOnThePath603:
	BTFSC       PORTB+0, 4 
	GOTO        L_isOnThePath298
	BTFSC       PORTB+0, 3 
	GOTO        L_isOnThePath298
	BTFSC       PORTB+0, 6 
	GOTO        L_isOnThePath298
	BTFSC       PORTB+0, 7 
	GOTO        L_isOnThePath298
L__isOnThePath602:
;linefollow.h,255 :: 		return 1;
	MOVLW       1
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	RETURN      0
L_isOnThePath298:
;linefollow.h,257 :: 		return 0;
	CLRF        R0 
	CLRF        R1 
;linefollow.h,258 :: 		}
	RETURN      0
; end of _isOnThePath

_lineFollow:

;linefollow.h,260 :: 		void lineFollow(){
;linefollow.h,262 :: 		while(1){
L_lineFollow300:
;linefollow.h,263 :: 		if( (Sensor3==1 || Sensor4==1 || Sensor5==1 || Sensor6==1 || Sensor7==1) && Sensor1==0 && Sensor2==0 && Sensor8==0 && Sensor9==0 ){
	BTFSC       PORTD+0, 4 
	GOTO        L__lineFollow612
	BTFSC       PORTD+0, 5 
	GOTO        L__lineFollow612
	BTFSC       PORTD+0, 6 
	GOTO        L__lineFollow612
	BTFSC       PORTD+0, 7 
	GOTO        L__lineFollow612
	BTFSC       PORTB+0, 2 
	GOTO        L__lineFollow612
	GOTO        L_lineFollow306
L__lineFollow612:
	BTFSC       PORTB+0, 4 
	GOTO        L_lineFollow306
	BTFSC       PORTB+0, 3 
	GOTO        L_lineFollow306
	BTFSC       PORTB+0, 6 
	GOTO        L_lineFollow306
	BTFSC       PORTB+0, 7 
	GOTO        L_lineFollow306
L__lineFollow611:
;linefollow.h,265 :: 		debugText = "Line follow PID..   ";
	MOVLW       ?lstr30_Robo2_32v2.0+0
	MOVWF       _debugText+0 
	MOVLW       hi_addr(?lstr30_Robo2_32v2.0+0)
	MOVWF       _debugText+1 
;linefollow.h,266 :: 		UART1_Write_Text(debugText);
	MOVF        _debugText+0, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVF        _debugText+1, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;linefollow.h,267 :: 		sendSensorStatus();
	CALL        _sendSensorStatus+0, 0
;linefollow.h,268 :: 		lineFollowPID();
	CALL        _lineFollowPID+0, 0
;linefollow.h,269 :: 		}
	GOTO        L_lineFollow307
L_lineFollow306:
;linefollow.h,270 :: 		else if( !( Scout==1 && Sensor1==1 && Sensor2==1 && Sensor3==1 && Sensor4==1 && Sensor5==1 && Sensor6==1 && Sensor7==1 && Sensor8==1 && Sensor9==1) || !( Scout==0 && Sensor1==0 && Sensor2==0 && Sensor3==0 && Sensor4==0 && Sensor5==0 && Sensor6==0 && Sensor7==0 && Sensor8==0 && Sensor9==0)){
	BTFSS       PORTB+0, 5 
	GOTO        L_lineFollow309
	BTFSS       PORTB+0, 4 
	GOTO        L_lineFollow309
	BTFSS       PORTB+0, 3 
	GOTO        L_lineFollow309
	BTFSS       PORTD+0, 4 
	GOTO        L_lineFollow309
	BTFSS       PORTD+0, 5 
	GOTO        L_lineFollow309
	BTFSS       PORTD+0, 6 
	GOTO        L_lineFollow309
	BTFSS       PORTD+0, 7 
	GOTO        L_lineFollow309
	BTFSS       PORTB+0, 2 
	GOTO        L_lineFollow309
	BTFSS       PORTB+0, 6 
	GOTO        L_lineFollow309
	BTFSS       PORTB+0, 7 
	GOTO        L_lineFollow309
	MOVLW       1
	MOVWF       R0 
	GOTO        L_lineFollow308
L_lineFollow309:
	CLRF        R0 
L_lineFollow308:
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L__lineFollow610
	BTFSC       PORTB+0, 5 
	GOTO        L_lineFollow311
	BTFSC       PORTB+0, 4 
	GOTO        L_lineFollow311
	BTFSC       PORTB+0, 3 
	GOTO        L_lineFollow311
	BTFSC       PORTD+0, 4 
	GOTO        L_lineFollow311
	BTFSC       PORTD+0, 5 
	GOTO        L_lineFollow311
	BTFSC       PORTD+0, 6 
	GOTO        L_lineFollow311
	BTFSC       PORTD+0, 7 
	GOTO        L_lineFollow311
	BTFSC       PORTB+0, 2 
	GOTO        L_lineFollow311
	BTFSC       PORTB+0, 6 
	GOTO        L_lineFollow311
	BTFSC       PORTB+0, 7 
	GOTO        L_lineFollow311
	MOVLW       1
	MOVWF       R0 
	GOTO        L_lineFollow310
L_lineFollow311:
	CLRF        R0 
L_lineFollow310:
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L__lineFollow610
	GOTO        L_lineFollow314
L__lineFollow610:
;linefollow.h,272 :: 		debugText = "Line follow Normal..   ";
	MOVLW       ?lstr31_Robo2_32v2.0+0
	MOVWF       _debugText+0 
	MOVLW       hi_addr(?lstr31_Robo2_32v2.0+0)
	MOVWF       _debugText+1 
;linefollow.h,273 :: 		UART1_Write_Text(debugText);
	MOVF        _debugText+0, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVF        _debugText+1, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;linefollow.h,274 :: 		sendSensorStatus();
	CALL        _sendSensorStatus+0, 0
;linefollow.h,275 :: 		lineFollowNormal();
	CALL        _lineFollowNormal+0, 0
;linefollow.h,276 :: 		}
	GOTO        L_lineFollow315
L_lineFollow314:
;linefollow.h,277 :: 		else if(( Scout==1 && Sensor1==1 && Sensor2==1 && Sensor3==1 && Sensor4==1 && Sensor5==1 && Sensor6==1 && Sensor7==1 && Sensor8==1 && Sensor9==1) || !( Scout==0 && Sensor1==0 && Sensor2==0 && Sensor3==0 && Sensor4==0 && Sensor5==0 && Sensor6==0 && Sensor7==0 && Sensor8==0 && Sensor9==0)){
	BTFSS       PORTB+0, 5 
	GOTO        L__lineFollow609
	BTFSS       PORTB+0, 4 
	GOTO        L__lineFollow609
	BTFSS       PORTB+0, 3 
	GOTO        L__lineFollow609
	BTFSS       PORTD+0, 4 
	GOTO        L__lineFollow609
	BTFSS       PORTD+0, 5 
	GOTO        L__lineFollow609
	BTFSS       PORTD+0, 6 
	GOTO        L__lineFollow609
	BTFSS       PORTD+0, 7 
	GOTO        L__lineFollow609
	BTFSS       PORTB+0, 2 
	GOTO        L__lineFollow609
	BTFSS       PORTB+0, 6 
	GOTO        L__lineFollow609
	BTFSS       PORTB+0, 7 
	GOTO        L__lineFollow609
	GOTO        L__lineFollow608
L__lineFollow609:
	BTFSC       PORTB+0, 5 
	GOTO        L_lineFollow319
	BTFSC       PORTB+0, 4 
	GOTO        L_lineFollow319
	BTFSC       PORTB+0, 3 
	GOTO        L_lineFollow319
	BTFSC       PORTD+0, 4 
	GOTO        L_lineFollow319
	BTFSC       PORTD+0, 5 
	GOTO        L_lineFollow319
	BTFSC       PORTD+0, 6 
	GOTO        L_lineFollow319
	BTFSC       PORTD+0, 7 
	GOTO        L_lineFollow319
	BTFSC       PORTB+0, 2 
	GOTO        L_lineFollow319
	BTFSC       PORTB+0, 6 
	GOTO        L_lineFollow319
	BTFSC       PORTB+0, 7 
	GOTO        L_lineFollow319
	MOVLW       1
	MOVWF       R0 
	GOTO        L_lineFollow318
L_lineFollow319:
	CLRF        R0 
L_lineFollow318:
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L__lineFollow608
	GOTO        L_lineFollow322
L__lineFollow608:
;linefollow.h,279 :: 		stop();
	CALL        _stop+0, 0
;linefollow.h,280 :: 		sendSensorStatus();
	CALL        _sendSensorStatus+0, 0
;linefollow.h,282 :: 		}
L_lineFollow322:
L_lineFollow315:
L_lineFollow307:
;linefollow.h,283 :: 		}
	GOTO        L_lineFollow300
;linefollow.h,284 :: 		}
	RETURN      0
; end of _lineFollow

_lineFollowNormal:

;linefollow.h,286 :: 		void lineFollowNormal(){
;linefollow.h,287 :: 		while(!((Sensor3==1 || Sensor4==1 || Sensor5==1 || Sensor6==1 || Sensor7==1) && Sensor1==0 && Sensor2==0 && Sensor8==0 && Sensor9==0)){
L_lineFollowNormal323:
	BTFSC       PORTD+0, 4 
	GOTO        L__lineFollowNormal626
	BTFSC       PORTD+0, 5 
	GOTO        L__lineFollowNormal626
	BTFSC       PORTD+0, 6 
	GOTO        L__lineFollowNormal626
	BTFSC       PORTD+0, 7 
	GOTO        L__lineFollowNormal626
	BTFSC       PORTB+0, 2 
	GOTO        L__lineFollowNormal626
	GOTO        L_lineFollowNormal328
L__lineFollowNormal626:
	BTFSC       PORTB+0, 4 
	GOTO        L_lineFollowNormal328
	BTFSC       PORTB+0, 3 
	GOTO        L_lineFollowNormal328
	BTFSC       PORTB+0, 6 
	GOTO        L_lineFollowNormal328
	BTFSC       PORTB+0, 7 
	GOTO        L_lineFollowNormal328
	MOVLW       1
	MOVWF       R0 
	GOTO        L_lineFollowNormal327
L_lineFollowNormal328:
	CLRF        R0 
L_lineFollowNormal327:
	MOVF        R0, 1 
	BTFSS       STATUS+0, 2 
	GOTO        L_lineFollowNormal324
;linefollow.h,288 :: 		if( Scout==1 && Sensor1==1 && Sensor2==1 && Sensor3==1 && Sensor4==1 && Sensor5==1 && Sensor6==1 && Sensor7==1 && Sensor8==1 && Sensor9==1){
	BTFSS       PORTB+0, 5 
	GOTO        L_lineFollowNormal331
	BTFSS       PORTB+0, 4 
	GOTO        L_lineFollowNormal331
	BTFSS       PORTB+0, 3 
	GOTO        L_lineFollowNormal331
	BTFSS       PORTD+0, 4 
	GOTO        L_lineFollowNormal331
	BTFSS       PORTD+0, 5 
	GOTO        L_lineFollowNormal331
	BTFSS       PORTD+0, 6 
	GOTO        L_lineFollowNormal331
	BTFSS       PORTD+0, 7 
	GOTO        L_lineFollowNormal331
	BTFSS       PORTB+0, 2 
	GOTO        L_lineFollowNormal331
	BTFSS       PORTB+0, 6 
	GOTO        L_lineFollowNormal331
	BTFSS       PORTB+0, 7 
	GOTO        L_lineFollowNormal331
L__lineFollowNormal625:
;linefollow.h,289 :: 		stop();
	CALL        _stop+0, 0
;linefollow.h,290 :: 		}
	GOTO        L_lineFollowNormal332
L_lineFollowNormal331:
;linefollow.h,291 :: 		else if( (Scout==0 && Sensor1==0 && Sensor2==0 && Sensor3==0 && Sensor4==1 && Sensor5==1 && Sensor6==1 && Sensor7==1 && Sensor8==1 && Sensor9==1) || (Scout==0 && Sensor1==0 && Sensor2==0 && Sensor3==0 && Sensor4==0 && Sensor5==1 && Sensor6==1 && Sensor7==1 && Sensor8==1 && Sensor9==1)){
	BTFSC       PORTB+0, 5 
	GOTO        L__lineFollowNormal624
	BTFSC       PORTB+0, 4 
	GOTO        L__lineFollowNormal624
	BTFSC       PORTB+0, 3 
	GOTO        L__lineFollowNormal624
	BTFSC       PORTD+0, 4 
	GOTO        L__lineFollowNormal624
	BTFSS       PORTD+0, 5 
	GOTO        L__lineFollowNormal624
	BTFSS       PORTD+0, 6 
	GOTO        L__lineFollowNormal624
	BTFSS       PORTD+0, 7 
	GOTO        L__lineFollowNormal624
	BTFSS       PORTB+0, 2 
	GOTO        L__lineFollowNormal624
	BTFSS       PORTB+0, 6 
	GOTO        L__lineFollowNormal624
	BTFSS       PORTB+0, 7 
	GOTO        L__lineFollowNormal624
	GOTO        L__lineFollowNormal622
L__lineFollowNormal624:
	BTFSC       PORTB+0, 5 
	GOTO        L__lineFollowNormal623
	BTFSC       PORTB+0, 4 
	GOTO        L__lineFollowNormal623
	BTFSC       PORTB+0, 3 
	GOTO        L__lineFollowNormal623
	BTFSC       PORTD+0, 4 
	GOTO        L__lineFollowNormal623
	BTFSC       PORTD+0, 5 
	GOTO        L__lineFollowNormal623
	BTFSS       PORTD+0, 6 
	GOTO        L__lineFollowNormal623
	BTFSS       PORTD+0, 7 
	GOTO        L__lineFollowNormal623
	BTFSS       PORTB+0, 2 
	GOTO        L__lineFollowNormal623
	BTFSS       PORTB+0, 6 
	GOTO        L__lineFollowNormal623
	BTFSS       PORTB+0, 7 
	GOTO        L__lineFollowNormal623
	GOTO        L__lineFollowNormal622
L__lineFollowNormal623:
	GOTO        L_lineFollowNormal339
L__lineFollowNormal622:
;linefollow.h,293 :: 		debugText = "90 to right..   ";
	MOVLW       ?lstr32_Robo2_32v2.0+0
	MOVWF       _debugText+0 
	MOVLW       hi_addr(?lstr32_Robo2_32v2.0+0)
	MOVWF       _debugText+1 
;linefollow.h,294 :: 		UART1_Write_Text(debugText);
	MOVF        _debugText+0, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVF        _debugText+1, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;linefollow.h,295 :: 		sendSensorStatus();
	CALL        _sendSensorStatus+0, 0
;linefollow.h,296 :: 		while(Scout==0){
L_lineFollowNormal340:
	BTFSC       PORTB+0, 5 
	GOTO        L_lineFollowNormal341
;linefollow.h,297 :: 		rotateClockwise(TEST_RPM);
	MOVF        _TEST_RPM+0, 0 
	MOVWF       FARG_rotateClockwise_pwm+0 
	MOVF        _TEST_RPM+1, 0 
	MOVWF       FARG_rotateClockwise_pwm+1 
	CALL        _rotateClockwise+0, 0
;linefollow.h,298 :: 		}
	GOTO        L_lineFollowNormal340
L_lineFollowNormal341:
;linefollow.h,299 :: 		}
	GOTO        L_lineFollowNormal342
L_lineFollowNormal339:
;linefollow.h,300 :: 		else if( (Scout==0 && Sensor1==1 && Sensor2==1 && Sensor3==1 && Sensor4==1 && Sensor5==1 && Sensor6==0 && Sensor7==0 && Sensor8==0 && Sensor9==0) && (Scout==0 && Sensor1==1 && Sensor2==1 && Sensor3==1 && Sensor4==1 && Sensor5==0 && Sensor6==0 && Sensor7==0 && Sensor8==0 && Sensor9==0)){
	BTFSC       PORTB+0, 5 
	GOTO        L_lineFollowNormal349
	BTFSS       PORTB+0, 4 
	GOTO        L_lineFollowNormal349
	BTFSS       PORTB+0, 3 
	GOTO        L_lineFollowNormal349
	BTFSS       PORTD+0, 4 
	GOTO        L_lineFollowNormal349
	BTFSS       PORTD+0, 5 
	GOTO        L_lineFollowNormal349
	BTFSS       PORTD+0, 6 
	GOTO        L_lineFollowNormal349
	BTFSC       PORTD+0, 7 
	GOTO        L_lineFollowNormal349
	BTFSC       PORTB+0, 2 
	GOTO        L_lineFollowNormal349
	BTFSC       PORTB+0, 6 
	GOTO        L_lineFollowNormal349
	BTFSC       PORTB+0, 7 
	GOTO        L_lineFollowNormal349
L__lineFollowNormal621:
	BTFSC       PORTB+0, 5 
	GOTO        L_lineFollowNormal349
	BTFSS       PORTB+0, 4 
	GOTO        L_lineFollowNormal349
	BTFSS       PORTB+0, 3 
	GOTO        L_lineFollowNormal349
	BTFSS       PORTD+0, 4 
	GOTO        L_lineFollowNormal349
	BTFSS       PORTD+0, 5 
	GOTO        L_lineFollowNormal349
	BTFSC       PORTD+0, 6 
	GOTO        L_lineFollowNormal349
	BTFSC       PORTD+0, 7 
	GOTO        L_lineFollowNormal349
	BTFSC       PORTB+0, 2 
	GOTO        L_lineFollowNormal349
	BTFSC       PORTB+0, 6 
	GOTO        L_lineFollowNormal349
	BTFSC       PORTB+0, 7 
	GOTO        L_lineFollowNormal349
L__lineFollowNormal620:
L__lineFollowNormal619:
;linefollow.h,302 :: 		debugText = "90 to left..   ";
	MOVLW       ?lstr33_Robo2_32v2.0+0
	MOVWF       _debugText+0 
	MOVLW       hi_addr(?lstr33_Robo2_32v2.0+0)
	MOVWF       _debugText+1 
;linefollow.h,303 :: 		UART1_Write_Text(debugText);
	MOVF        _debugText+0, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVF        _debugText+1, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;linefollow.h,304 :: 		sendSensorStatus();
	CALL        _sendSensorStatus+0, 0
;linefollow.h,305 :: 		while(Scout==0){
L_lineFollowNormal350:
	BTFSC       PORTB+0, 5 
	GOTO        L_lineFollowNormal351
;linefollow.h,306 :: 		rotateAntiClockwise(TEST_RPM);
	MOVF        _TEST_RPM+0, 0 
	MOVWF       FARG_rotateAntiClockwise_pwm+0 
	MOVF        _TEST_RPM+1, 0 
	MOVWF       FARG_rotateAntiClockwise_pwm+1 
	CALL        _rotateAntiClockwise+0, 0
;linefollow.h,307 :: 		}
	GOTO        L_lineFollowNormal350
L_lineFollowNormal351:
;linefollow.h,308 :: 		}
	GOTO        L_lineFollowNormal352
L_lineFollowNormal349:
;linefollow.h,309 :: 		else if( Sensor4==1 && Sensor5==1){
	BTFSS       PORTD+0, 5 
	GOTO        L_lineFollowNormal355
	BTFSS       PORTD+0, 6 
	GOTO        L_lineFollowNormal355
L__lineFollowNormal618:
;linefollow.h,311 :: 		moveForward(TEST_RPM,TEST_RPM);
	MOVF        _TEST_RPM+0, 0 
	MOVWF       FARG_moveForward_pwmLeft+0 
	MOVF        _TEST_RPM+1, 0 
	MOVWF       FARG_moveForward_pwmLeft+1 
	MOVF        _TEST_RPM+0, 0 
	MOVWF       FARG_moveForward_pwmRight+0 
	MOVF        _TEST_RPM+1, 0 
	MOVWF       FARG_moveForward_pwmRight+1 
	CALL        _moveForward+0, 0
;linefollow.h,312 :: 		}
	GOTO        L_lineFollowNormal356
L_lineFollowNormal355:
;linefollow.h,313 :: 		else if( Sensor4==1 && Sensor5==0 && Scout==1){
	BTFSS       PORTD+0, 5 
	GOTO        L_lineFollowNormal359
	BTFSC       PORTD+0, 6 
	GOTO        L_lineFollowNormal359
	BTFSS       PORTB+0, 5 
	GOTO        L_lineFollowNormal359
L__lineFollowNormal617:
;linefollow.h,315 :: 		turnLeft(TEST_RPM);
	MOVF        _TEST_RPM+0, 0 
	MOVWF       FARG_turnLeft_pwmRight+0 
	MOVF        _TEST_RPM+1, 0 
	MOVWF       FARG_turnLeft_pwmRight+1 
	CALL        _turnLeft+0, 0
;linefollow.h,316 :: 		}
	GOTO        L_lineFollowNormal360
L_lineFollowNormal359:
;linefollow.h,317 :: 		else if( Sensor4==0 && Sensor5==1 && Scout==1){
	BTFSC       PORTD+0, 5 
	GOTO        L_lineFollowNormal363
	BTFSS       PORTD+0, 6 
	GOTO        L_lineFollowNormal363
	BTFSS       PORTB+0, 5 
	GOTO        L_lineFollowNormal363
L__lineFollowNormal616:
;linefollow.h,319 :: 		turnRight(TEST_RPM);
	MOVF        _TEST_RPM+0, 0 
	MOVWF       FARG_turnRight_pwmLeft+0 
	MOVF        _TEST_RPM+1, 0 
	MOVWF       FARG_turnRight_pwmLeft+1 
	CALL        _turnRight+0, 0
;linefollow.h,320 :: 		}
	GOTO        L_lineFollowNormal364
L_lineFollowNormal363:
;linefollow.h,321 :: 		else if( Sensor4==1 && Sensor5==0 && Scout==0){
	BTFSS       PORTD+0, 5 
	GOTO        L_lineFollowNormal367
	BTFSC       PORTD+0, 6 
	GOTO        L_lineFollowNormal367
	BTFSC       PORTB+0, 5 
	GOTO        L_lineFollowNormal367
L__lineFollowNormal615:
;linefollow.h,323 :: 		stop();
	CALL        _stop+0, 0
;linefollow.h,325 :: 		rotateAntiClockwise(TEST_RPM);
	MOVF        _TEST_RPM+0, 0 
	MOVWF       FARG_rotateAntiClockwise_pwm+0 
	MOVF        _TEST_RPM+1, 0 
	MOVWF       FARG_rotateAntiClockwise_pwm+1 
	CALL        _rotateAntiClockwise+0, 0
;linefollow.h,326 :: 		}
	GOTO        L_lineFollowNormal368
L_lineFollowNormal367:
;linefollow.h,327 :: 		else if( Sensor4==0 && Sensor5==1 && Scout==0){
	BTFSC       PORTD+0, 5 
	GOTO        L_lineFollowNormal371
	BTFSS       PORTD+0, 6 
	GOTO        L_lineFollowNormal371
	BTFSC       PORTB+0, 5 
	GOTO        L_lineFollowNormal371
L__lineFollowNormal614:
;linefollow.h,329 :: 		stop();
	CALL        _stop+0, 0
;linefollow.h,331 :: 		rotateClockwise(TEST_RPM);
	MOVF        _TEST_RPM+0, 0 
	MOVWF       FARG_rotateClockwise_pwm+0 
	MOVF        _TEST_RPM+1, 0 
	MOVWF       FARG_rotateClockwise_pwm+1 
	CALL        _rotateClockwise+0, 0
;linefollow.h,332 :: 		}
	GOTO        L_lineFollowNormal372
L_lineFollowNormal371:
;linefollow.h,333 :: 		else if( Sensor4==0 && Sensor5==0 ){
	BTFSC       PORTD+0, 5 
	GOTO        L_lineFollowNormal375
	BTFSC       PORTD+0, 6 
	GOTO        L_lineFollowNormal375
L__lineFollowNormal613:
;linefollow.h,334 :: 		if(Sensor3 ==1){
	BTFSS       PORTD+0, 4 
	GOTO        L_lineFollowNormal376
;linefollow.h,335 :: 		rotateAntiClockwise(TEST_RPM);
	MOVF        _TEST_RPM+0, 0 
	MOVWF       FARG_rotateAntiClockwise_pwm+0 
	MOVF        _TEST_RPM+1, 0 
	MOVWF       FARG_rotateAntiClockwise_pwm+1 
	CALL        _rotateAntiClockwise+0, 0
;linefollow.h,336 :: 		}
	GOTO        L_lineFollowNormal377
L_lineFollowNormal376:
;linefollow.h,337 :: 		else if(Sensor6 ==1){
	BTFSS       PORTD+0, 7 
	GOTO        L_lineFollowNormal378
;linefollow.h,338 :: 		rotateClockwise(TEST_RPM);
	MOVF        _TEST_RPM+0, 0 
	MOVWF       FARG_rotateClockwise_pwm+0 
	MOVF        _TEST_RPM+1, 0 
	MOVWF       FARG_rotateClockwise_pwm+1 
	CALL        _rotateClockwise+0, 0
;linefollow.h,339 :: 		}
	GOTO        L_lineFollowNormal379
L_lineFollowNormal378:
;linefollow.h,340 :: 		else if(Sensor2 ==1){
	BTFSS       PORTB+0, 3 
	GOTO        L_lineFollowNormal380
;linefollow.h,341 :: 		rotateAntiClockwise(TEST_RPM);
	MOVF        _TEST_RPM+0, 0 
	MOVWF       FARG_rotateAntiClockwise_pwm+0 
	MOVF        _TEST_RPM+1, 0 
	MOVWF       FARG_rotateAntiClockwise_pwm+1 
	CALL        _rotateAntiClockwise+0, 0
;linefollow.h,342 :: 		}
	GOTO        L_lineFollowNormal381
L_lineFollowNormal380:
;linefollow.h,343 :: 		else if(Sensor7 ==1){
	BTFSS       PORTB+0, 2 
	GOTO        L_lineFollowNormal382
;linefollow.h,344 :: 		rotateClockwise(TEST_RPM);
	MOVF        _TEST_RPM+0, 0 
	MOVWF       FARG_rotateClockwise_pwm+0 
	MOVF        _TEST_RPM+1, 0 
	MOVWF       FARG_rotateClockwise_pwm+1 
	CALL        _rotateClockwise+0, 0
;linefollow.h,345 :: 		}
	GOTO        L_lineFollowNormal383
L_lineFollowNormal382:
;linefollow.h,348 :: 		stop();
	CALL        _stop+0, 0
;linefollow.h,351 :: 		}
L_lineFollowNormal383:
L_lineFollowNormal381:
L_lineFollowNormal379:
L_lineFollowNormal377:
;linefollow.h,352 :: 		}
L_lineFollowNormal375:
L_lineFollowNormal372:
L_lineFollowNormal368:
L_lineFollowNormal364:
L_lineFollowNormal360:
L_lineFollowNormal356:
L_lineFollowNormal352:
L_lineFollowNormal342:
L_lineFollowNormal332:
;linefollow.h,354 :: 		}
	GOTO        L_lineFollowNormal323
L_lineFollowNormal324:
;linefollow.h,356 :: 		}
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
	GOTO        L_getDistanceIR_GP2D120384
;ir.h,12 :: 		ir_value = ADC_Read(IRSensorCenter);
	MOVLW       0
	BTFSC       PORTA+0, 1 
	MOVLW       1
	MOVWF       FARG_ADC_Read_channel+0 
	CALL        _ADC_Read+0, 0
	MOVF        R0, 0 
	MOVWF       _ir_value+0 
	MOVF        R1, 0 
	MOVWF       _ir_value+1 
;ir.h,13 :: 		}
	GOTO        L_getDistanceIR_GP2D120385
L_getDistanceIR_GP2D120384:
;ir.h,14 :: 		else if(sensor == 'R'){
	MOVF        FARG_getDistanceIR_GP2D120_sensor+0, 0 
	XORLW       82
	BTFSS       STATUS+0, 2 
	GOTO        L_getDistanceIR_GP2D120386
;ir.h,15 :: 		ir_value = ADC_Read(IRSensorRight);
	MOVLW       0
	BTFSC       PORTA+0, 2 
	MOVLW       1
	MOVWF       FARG_ADC_Read_channel+0 
	CALL        _ADC_Read+0, 0
	MOVF        R0, 0 
	MOVWF       _ir_value+0 
	MOVF        R1, 0 
	MOVWF       _ir_value+1 
;ir.h,16 :: 		}
	GOTO        L_getDistanceIR_GP2D120387
L_getDistanceIR_GP2D120386:
;ir.h,17 :: 		else if(sensor == 'L'){
	MOVF        FARG_getDistanceIR_GP2D120_sensor+0, 0 
	XORLW       76
	BTFSS       STATUS+0, 2 
	GOTO        L_getDistanceIR_GP2D120388
;ir.h,18 :: 		ir_value = ADC_Read(IRSensorLeft);
	MOVLW       0
	BTFSC       PORTA+0, 0 
	MOVLW       1
	MOVWF       FARG_ADC_Read_channel+0 
	CALL        _ADC_Read+0, 0
	MOVF        R0, 0 
	MOVWF       _ir_value+0 
	MOVF        R1, 0 
	MOVWF       _ir_value+1 
;ir.h,19 :: 		}
	GOTO        L_getDistanceIR_GP2D120389
L_getDistanceIR_GP2D120388:
;ir.h,21 :: 		ir_value = 0;
	CLRF        _ir_value+0 
	CLRF        _ir_value+1 
L_getDistanceIR_GP2D120389:
L_getDistanceIR_GP2D120387:
L_getDistanceIR_GP2D120385:
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
	GOTO        L__getDistanceIR_GP2D120657
	MOVLW       98
	SUBWF       _ir_value+0, 0 
L__getDistanceIR_GP2D120657:
	BTFSS       STATUS+0, 0 
	GOTO        L_getDistanceIR_GP2D120392
	MOVLW       2
	SUBWF       _ir_value+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__getDistanceIR_GP2D120658
	MOVLW       111
	SUBWF       _ir_value+0, 0 
L__getDistanceIR_GP2D120658:
	BTFSC       STATUS+0, 0 
	GOTO        L_getDistanceIR_GP2D120392
L__getDistanceIR_GP2D120643:
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
L_getDistanceIR_GP2D120392:
;ir.h,27 :: 		else if( 557<=ir_value && ir_value<610 )
	MOVLW       2
	SUBWF       _ir_value+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__getDistanceIR_GP2D120659
	MOVLW       45
	SUBWF       _ir_value+0, 0 
L__getDistanceIR_GP2D120659:
	BTFSS       STATUS+0, 0 
	GOTO        L_getDistanceIR_GP2D120396
	MOVLW       2
	SUBWF       _ir_value+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__getDistanceIR_GP2D120660
	MOVLW       98
	SUBWF       _ir_value+0, 0 
L__getDistanceIR_GP2D120660:
	BTFSC       STATUS+0, 0 
	GOTO        L_getDistanceIR_GP2D120396
L__getDistanceIR_GP2D120642:
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
L_getDistanceIR_GP2D120396:
;ir.h,30 :: 		else if( 481<=ir_value && ir_value<557 )
	MOVLW       1
	SUBWF       _ir_value+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__getDistanceIR_GP2D120661
	MOVLW       225
	SUBWF       _ir_value+0, 0 
L__getDistanceIR_GP2D120661:
	BTFSS       STATUS+0, 0 
	GOTO        L_getDistanceIR_GP2D120400
	MOVLW       2
	SUBWF       _ir_value+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__getDistanceIR_GP2D120662
	MOVLW       45
	SUBWF       _ir_value+0, 0 
L__getDistanceIR_GP2D120662:
	BTFSC       STATUS+0, 0 
	GOTO        L_getDistanceIR_GP2D120400
L__getDistanceIR_GP2D120641:
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
L_getDistanceIR_GP2D120400:
;ir.h,33 :: 		else if( 409<=ir_value && ir_value<481 )
	MOVLW       1
	SUBWF       _ir_value+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__getDistanceIR_GP2D120663
	MOVLW       153
	SUBWF       _ir_value+0, 0 
L__getDistanceIR_GP2D120663:
	BTFSS       STATUS+0, 0 
	GOTO        L_getDistanceIR_GP2D120404
	MOVLW       1
	SUBWF       _ir_value+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__getDistanceIR_GP2D120664
	MOVLW       225
	SUBWF       _ir_value+0, 0 
L__getDistanceIR_GP2D120664:
	BTFSC       STATUS+0, 0 
	GOTO        L_getDistanceIR_GP2D120404
L__getDistanceIR_GP2D120640:
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
L_getDistanceIR_GP2D120404:
;ir.h,36 :: 		else if( 364<=ir_value && ir_value<409 )
	MOVLW       1
	SUBWF       _ir_value+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__getDistanceIR_GP2D120665
	MOVLW       108
	SUBWF       _ir_value+0, 0 
L__getDistanceIR_GP2D120665:
	BTFSS       STATUS+0, 0 
	GOTO        L_getDistanceIR_GP2D120408
	MOVLW       1
	SUBWF       _ir_value+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__getDistanceIR_GP2D120666
	MOVLW       153
	SUBWF       _ir_value+0, 0 
L__getDistanceIR_GP2D120666:
	BTFSC       STATUS+0, 0 
	GOTO        L_getDistanceIR_GP2D120408
L__getDistanceIR_GP2D120639:
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
L_getDistanceIR_GP2D120408:
;ir.h,39 :: 		else if( 317<=ir_value && ir_value<364 )
	MOVLW       1
	SUBWF       _ir_value+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__getDistanceIR_GP2D120667
	MOVLW       61
	SUBWF       _ir_value+0, 0 
L__getDistanceIR_GP2D120667:
	BTFSS       STATUS+0, 0 
	GOTO        L_getDistanceIR_GP2D120412
	MOVLW       1
	SUBWF       _ir_value+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__getDistanceIR_GP2D120668
	MOVLW       108
	SUBWF       _ir_value+0, 0 
L__getDistanceIR_GP2D120668:
	BTFSC       STATUS+0, 0 
	GOTO        L_getDistanceIR_GP2D120412
L__getDistanceIR_GP2D120638:
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
L_getDistanceIR_GP2D120412:
;ir.h,42 :: 		else if( 286<=ir_value && ir_value<317 )
	MOVLW       1
	SUBWF       _ir_value+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__getDistanceIR_GP2D120669
	MOVLW       30
	SUBWF       _ir_value+0, 0 
L__getDistanceIR_GP2D120669:
	BTFSS       STATUS+0, 0 
	GOTO        L_getDistanceIR_GP2D120416
	MOVLW       1
	SUBWF       _ir_value+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__getDistanceIR_GP2D120670
	MOVLW       61
	SUBWF       _ir_value+0, 0 
L__getDistanceIR_GP2D120670:
	BTFSC       STATUS+0, 0 
	GOTO        L_getDistanceIR_GP2D120416
L__getDistanceIR_GP2D120637:
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
L_getDistanceIR_GP2D120416:
;ir.h,45 :: 		else if( 256<=ir_value && ir_value<286 )
	MOVLW       1
	SUBWF       _ir_value+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__getDistanceIR_GP2D120671
	MOVLW       0
	SUBWF       _ir_value+0, 0 
L__getDistanceIR_GP2D120671:
	BTFSS       STATUS+0, 0 
	GOTO        L_getDistanceIR_GP2D120420
	MOVLW       1
	SUBWF       _ir_value+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__getDistanceIR_GP2D120672
	MOVLW       30
	SUBWF       _ir_value+0, 0 
L__getDistanceIR_GP2D120672:
	BTFSC       STATUS+0, 0 
	GOTO        L_getDistanceIR_GP2D120420
L__getDistanceIR_GP2D120636:
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
L_getDistanceIR_GP2D120420:
;ir.h,48 :: 		else if( 215<=ir_value && ir_value<256 )
	MOVLW       0
	SUBWF       _ir_value+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__getDistanceIR_GP2D120673
	MOVLW       215
	SUBWF       _ir_value+0, 0 
L__getDistanceIR_GP2D120673:
	BTFSS       STATUS+0, 0 
	GOTO        L_getDistanceIR_GP2D120424
	MOVLW       1
	SUBWF       _ir_value+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__getDistanceIR_GP2D120674
	MOVLW       0
	SUBWF       _ir_value+0, 0 
L__getDistanceIR_GP2D120674:
	BTFSC       STATUS+0, 0 
	GOTO        L_getDistanceIR_GP2D120424
L__getDistanceIR_GP2D120635:
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
L_getDistanceIR_GP2D120424:
;ir.h,51 :: 		else if( 186<=ir_value && ir_value<215 )
	MOVLW       0
	SUBWF       _ir_value+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__getDistanceIR_GP2D120675
	MOVLW       186
	SUBWF       _ir_value+0, 0 
L__getDistanceIR_GP2D120675:
	BTFSS       STATUS+0, 0 
	GOTO        L_getDistanceIR_GP2D120428
	MOVLW       0
	SUBWF       _ir_value+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__getDistanceIR_GP2D120676
	MOVLW       215
	SUBWF       _ir_value+0, 0 
L__getDistanceIR_GP2D120676:
	BTFSC       STATUS+0, 0 
	GOTO        L_getDistanceIR_GP2D120428
L__getDistanceIR_GP2D120634:
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
L_getDistanceIR_GP2D120428:
;ir.h,54 :: 		else if( 166<=ir_value && ir_value<186 )
	MOVLW       0
	SUBWF       _ir_value+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__getDistanceIR_GP2D120677
	MOVLW       166
	SUBWF       _ir_value+0, 0 
L__getDistanceIR_GP2D120677:
	BTFSS       STATUS+0, 0 
	GOTO        L_getDistanceIR_GP2D120432
	MOVLW       0
	SUBWF       _ir_value+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__getDistanceIR_GP2D120678
	MOVLW       186
	SUBWF       _ir_value+0, 0 
L__getDistanceIR_GP2D120678:
	BTFSC       STATUS+0, 0 
	GOTO        L_getDistanceIR_GP2D120432
L__getDistanceIR_GP2D120633:
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
L_getDistanceIR_GP2D120432:
;ir.h,57 :: 		else if( 147<=ir_value && ir_value<166 )
	MOVLW       0
	SUBWF       _ir_value+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__getDistanceIR_GP2D120679
	MOVLW       147
	SUBWF       _ir_value+0, 0 
L__getDistanceIR_GP2D120679:
	BTFSS       STATUS+0, 0 
	GOTO        L_getDistanceIR_GP2D120436
	MOVLW       0
	SUBWF       _ir_value+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__getDistanceIR_GP2D120680
	MOVLW       166
	SUBWF       _ir_value+0, 0 
L__getDistanceIR_GP2D120680:
	BTFSC       STATUS+0, 0 
	GOTO        L_getDistanceIR_GP2D120436
L__getDistanceIR_GP2D120632:
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
L_getDistanceIR_GP2D120436:
;ir.h,60 :: 		else if( 133<=ir_value && ir_value<147 )
	MOVLW       0
	SUBWF       _ir_value+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__getDistanceIR_GP2D120681
	MOVLW       133
	SUBWF       _ir_value+0, 0 
L__getDistanceIR_GP2D120681:
	BTFSS       STATUS+0, 0 
	GOTO        L_getDistanceIR_GP2D120440
	MOVLW       0
	SUBWF       _ir_value+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__getDistanceIR_GP2D120682
	MOVLW       147
	SUBWF       _ir_value+0, 0 
L__getDistanceIR_GP2D120682:
	BTFSC       STATUS+0, 0 
	GOTO        L_getDistanceIR_GP2D120440
L__getDistanceIR_GP2D120631:
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
L_getDistanceIR_GP2D120440:
;ir.h,63 :: 		else if( 106<=ir_value && ir_value<133 )
	MOVLW       0
	SUBWF       _ir_value+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__getDistanceIR_GP2D120683
	MOVLW       106
	SUBWF       _ir_value+0, 0 
L__getDistanceIR_GP2D120683:
	BTFSS       STATUS+0, 0 
	GOTO        L_getDistanceIR_GP2D120444
	MOVLW       0
	SUBWF       _ir_value+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__getDistanceIR_GP2D120684
	MOVLW       133
	SUBWF       _ir_value+0, 0 
L__getDistanceIR_GP2D120684:
	BTFSC       STATUS+0, 0 
	GOTO        L_getDistanceIR_GP2D120444
L__getDistanceIR_GP2D120630:
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
L_getDistanceIR_GP2D120444:
;ir.h,66 :: 		else if( 88<=ir_value && ir_value<106 )
	MOVLW       0
	SUBWF       _ir_value+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__getDistanceIR_GP2D120685
	MOVLW       88
	SUBWF       _ir_value+0, 0 
L__getDistanceIR_GP2D120685:
	BTFSS       STATUS+0, 0 
	GOTO        L_getDistanceIR_GP2D120448
	MOVLW       0
	SUBWF       _ir_value+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__getDistanceIR_GP2D120686
	MOVLW       106
	SUBWF       _ir_value+0, 0 
L__getDistanceIR_GP2D120686:
	BTFSC       STATUS+0, 0 
	GOTO        L_getDistanceIR_GP2D120448
L__getDistanceIR_GP2D120629:
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
L_getDistanceIR_GP2D120448:
;ir.h,69 :: 		else if( 78<=ir_value && ir_value<88 )
	MOVLW       0
	SUBWF       _ir_value+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__getDistanceIR_GP2D120687
	MOVLW       78
	SUBWF       _ir_value+0, 0 
L__getDistanceIR_GP2D120687:
	BTFSS       STATUS+0, 0 
	GOTO        L_getDistanceIR_GP2D120452
	MOVLW       0
	SUBWF       _ir_value+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__getDistanceIR_GP2D120688
	MOVLW       88
	SUBWF       _ir_value+0, 0 
L__getDistanceIR_GP2D120688:
	BTFSC       STATUS+0, 0 
	GOTO        L_getDistanceIR_GP2D120452
L__getDistanceIR_GP2D120628:
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
L_getDistanceIR_GP2D120452:
;ir.h,72 :: 		else if( 65<=ir_value && ir_value<78 )
	MOVLW       0
	SUBWF       _ir_value+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__getDistanceIR_GP2D120689
	MOVLW       65
	SUBWF       _ir_value+0, 0 
L__getDistanceIR_GP2D120689:
	BTFSS       STATUS+0, 0 
	GOTO        L_getDistanceIR_GP2D120456
	MOVLW       0
	SUBWF       _ir_value+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__getDistanceIR_GP2D120690
	MOVLW       78
	SUBWF       _ir_value+0, 0 
L__getDistanceIR_GP2D120690:
	BTFSC       STATUS+0, 0 
	GOTO        L_getDistanceIR_GP2D120456
L__getDistanceIR_GP2D120627:
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
L_getDistanceIR_GP2D120456:
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
L_getSonarDistance458:
	DECFSZ      R13, 1, 0
	BRA         L_getSonarDistance458
	NOP
;sonar.h,17 :: 		TRIG_MIDDLE = 1;
	BSF         PORTA+0, 5 
;sonar.h,18 :: 		delay_us(10);
	MOVLW       16
	MOVWF       R13, 0
L_getSonarDistance459:
	DECFSZ      R13, 1, 0
	BRA         L_getSonarDistance459
	NOP
;sonar.h,19 :: 		TRIG_MIDDLE = 0;
	BCF         PORTA+0, 5 
;sonar.h,21 :: 		while(ECHO_MIDDLE==0);
L_getSonarDistance460:
	BTFSC       PORTE+0, 0 
	GOTO        L_getSonarDistance461
	GOTO        L_getSonarDistance460
L_getSonarDistance461:
;sonar.h,22 :: 		_counter = 0;
	CLRF        __counter+0 
	CLRF        __counter+1 
;sonar.h,24 :: 		while(ECHO_MIDDLE==1){
L_getSonarDistance462:
	BTFSS       PORTE+0, 0 
	GOTO        L_getSonarDistance463
;sonar.h,25 :: 		_counter++;
	INFSNZ      __counter+0, 1 
	INCF        __counter+1, 1 
;sonar.h,26 :: 		}
	GOTO        L_getSonarDistance462
L_getSonarDistance463:
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
	GOTO        L_getDistanceSonar2464
;sonar.h,40 :: 		TRIG_MIDDLE = 0;
	BCF         PORTA+0, 5 
;sonar.h,41 :: 		delay_us(2);
	MOVLW       3
	MOVWF       R13, 0
L_getDistanceSonar2465:
	DECFSZ      R13, 1, 0
	BRA         L_getDistanceSonar2465
;sonar.h,42 :: 		TRIG_MIDDLE = 1;
	BSF         PORTA+0, 5 
;sonar.h,43 :: 		delay_us(5);
	MOVLW       8
	MOVWF       R13, 0
L_getDistanceSonar2466:
	DECFSZ      R13, 1, 0
	BRA         L_getDistanceSonar2466
;sonar.h,44 :: 		TRIG_MIDDLE =0;
	BCF         PORTA+0, 5 
;sonar.h,46 :: 		while(!ECHO_MIDDLE)
L_getDistanceSonar2467:
	BTFSC       PORTE+0, 0 
	GOTO        L_getDistanceSonar2468
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
	GOTO        L__getDistanceSonar2691
	MOVF        getDistanceSonar2_H_L0+0, 0 
	SUBLW       240
L__getDistanceSonar2691:
	BTFSC       STATUS+0, 0 
	GOTO        L_getDistanceSonar2469
;sonar.h,51 :: 		break;
	GOTO        L_getDistanceSonar2468
L_getDistanceSonar2469:
;sonar.h,52 :: 		}
	GOTO        L_getDistanceSonar2467
L_getDistanceSonar2468:
;sonar.h,53 :: 		TMR1H=0;
	CLRF        TMR1H+0 
;sonar.h,54 :: 		TMR1L=0;
	CLRF        TMR1L+0 
;sonar.h,55 :: 		T1CON.TMR1ON=1;
	BSF         T1CON+0, 0 
;sonar.h,56 :: 		while(ECHO_MIDDLE)
L_getDistanceSonar2470:
	BTFSS       PORTE+0, 0 
	GOTO        L_getDistanceSonar2471
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
	GOTO        L__getDistanceSonar2692
	MOVF        getDistanceSonar2_H_L0+0, 0 
	SUBLW       240
L__getDistanceSonar2692:
	BTFSC       STATUS+0, 0 
	GOTO        L_getDistanceSonar2472
;sonar.h,61 :: 		break;
	GOTO        L_getDistanceSonar2471
L_getDistanceSonar2472:
;sonar.h,62 :: 		}
	GOTO        L_getDistanceSonar2470
L_getDistanceSonar2471:
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
L_getDistanceSonar2464:
;sonar.h,69 :: 		else if(Sensor == 'R'){
	MOVF        FARG_getDistanceSonar2_Sensor+0, 0 
	XORLW       82
	BTFSS       STATUS+0, 2 
	GOTO        L_getDistanceSonar2474
;sonar.h,70 :: 		TRIG_RIGHT = 0;
	BCF         PORTA+0, 0 
;sonar.h,71 :: 		delay_us(2);
	MOVLW       3
	MOVWF       R13, 0
L_getDistanceSonar2475:
	DECFSZ      R13, 1, 0
	BRA         L_getDistanceSonar2475
;sonar.h,72 :: 		TRIG_RIGHT = 1;
	BSF         PORTA+0, 0 
;sonar.h,73 :: 		delay_us(5);
	MOVLW       8
	MOVWF       R13, 0
L_getDistanceSonar2476:
	DECFSZ      R13, 1, 0
	BRA         L_getDistanceSonar2476
;sonar.h,74 :: 		TRIG_RIGHT =0;
	BCF         PORTA+0, 0 
;sonar.h,76 :: 		while(!ECHO_RIGHT)
L_getDistanceSonar2477:
	BTFSC       PORTA+0, 1 
	GOTO        L_getDistanceSonar2478
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
	GOTO        L__getDistanceSonar2693
	MOVF        getDistanceSonar2_H_L0+0, 0 
	SUBLW       240
L__getDistanceSonar2693:
	BTFSC       STATUS+0, 0 
	GOTO        L_getDistanceSonar2479
;sonar.h,81 :: 		break;
	GOTO        L_getDistanceSonar2478
L_getDistanceSonar2479:
;sonar.h,82 :: 		}
	GOTO        L_getDistanceSonar2477
L_getDistanceSonar2478:
;sonar.h,83 :: 		TMR1H=0;
	CLRF        TMR1H+0 
;sonar.h,84 :: 		TMR1L=0;
	CLRF        TMR1L+0 
;sonar.h,85 :: 		T1CON.TMR1ON=1;
	BSF         T1CON+0, 0 
;sonar.h,86 :: 		while(ECHO_RIGHT)
L_getDistanceSonar2480:
	BTFSS       PORTA+0, 1 
	GOTO        L_getDistanceSonar2481
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
	GOTO        L__getDistanceSonar2694
	MOVF        getDistanceSonar2_H_L0+0, 0 
	SUBLW       240
L__getDistanceSonar2694:
	BTFSC       STATUS+0, 0 
	GOTO        L_getDistanceSonar2482
;sonar.h,91 :: 		break;
	GOTO        L_getDistanceSonar2481
L_getDistanceSonar2482:
;sonar.h,92 :: 		}
	GOTO        L_getDistanceSonar2480
L_getDistanceSonar2481:
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
L_getDistanceSonar2474:
;sonar.h,99 :: 		else if(Sensor == 'L'){
	MOVF        FARG_getDistanceSonar2_Sensor+0, 0 
	XORLW       76
	BTFSS       STATUS+0, 2 
	GOTO        L_getDistanceSonar2484
;sonar.h,100 :: 		TRIG_LEFT = 0;
	BCF         PORTA+0, 2 
;sonar.h,101 :: 		delay_us(2);
	MOVLW       3
	MOVWF       R13, 0
L_getDistanceSonar2485:
	DECFSZ      R13, 1, 0
	BRA         L_getDistanceSonar2485
;sonar.h,102 :: 		TRIG_LEFT = 1;
	BSF         PORTA+0, 2 
;sonar.h,103 :: 		delay_us(5);
	MOVLW       8
	MOVWF       R13, 0
L_getDistanceSonar2486:
	DECFSZ      R13, 1, 0
	BRA         L_getDistanceSonar2486
;sonar.h,104 :: 		TRIG_LEFT =0;
	BCF         PORTA+0, 2 
;sonar.h,106 :: 		while(!ECHO_LEFT)
L_getDistanceSonar2487:
	BTFSC       PORTA+0, 3 
	GOTO        L_getDistanceSonar2488
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
	GOTO        L__getDistanceSonar2695
	MOVF        getDistanceSonar2_H_L0+0, 0 
	SUBLW       240
L__getDistanceSonar2695:
	BTFSC       STATUS+0, 0 
	GOTO        L_getDistanceSonar2489
;sonar.h,111 :: 		break;
	GOTO        L_getDistanceSonar2488
L_getDistanceSonar2489:
;sonar.h,112 :: 		}
	GOTO        L_getDistanceSonar2487
L_getDistanceSonar2488:
;sonar.h,113 :: 		TMR1H=0;
	CLRF        TMR1H+0 
;sonar.h,114 :: 		TMR1L=0;
	CLRF        TMR1L+0 
;sonar.h,115 :: 		T1CON.TMR1ON=1;
	BSF         T1CON+0, 0 
;sonar.h,116 :: 		while(ECHO_LEFT)
L_getDistanceSonar2490:
	BTFSS       PORTA+0, 3 
	GOTO        L_getDistanceSonar2491
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
	GOTO        L__getDistanceSonar2696
	MOVF        getDistanceSonar2_H_L0+0, 0 
	SUBLW       240
L__getDistanceSonar2696:
	BTFSC       STATUS+0, 0 
	GOTO        L_getDistanceSonar2492
;sonar.h,121 :: 		break;
	GOTO        L_getDistanceSonar2491
L_getDistanceSonar2492:
;sonar.h,122 :: 		}
	GOTO        L_getDistanceSonar2490
L_getDistanceSonar2491:
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
L_getDistanceSonar2484:
;sonar.h,129 :: 		}
	RETURN      0
; end of _getDistanceSonar2

_main:

;Robo2 v2.0.c,23 :: 		void main() {
;Robo2 v2.0.c,24 :: 		configure();
	CALL        _configure+0, 0
;Robo2 v2.0.c,25 :: 		setPID();
	CALL        _setPID+0, 0
;Robo2 v2.0.c,26 :: 		sendText("Starting...");
	MOVLW       ?lstr34_Robo2_32v2.0+0
	MOVWF       FARG_sendText_aText+0 
	MOVLW       hi_addr(?lstr34_Robo2_32v2.0+0)
	MOVWF       FARG_sendText_aText+1 
	CALL        _sendText+0, 0
;Robo2 v2.0.c,33 :: 		while(!isAllWhite()){
L_main493:
	CALL        _isAllWhite+0, 0
	MOVF        R0, 0 
	IORWF       R1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_main494
;Robo2 v2.0.c,34 :: 		goThroughObstaclesJay();
	CALL        _goThroughObstaclesJay+0, 0
;Robo2 v2.0.c,35 :: 		}
	GOTO        L_main493
L_main494:
;Robo2 v2.0.c,39 :: 		LEVEL1_STATE = NOT_REACHED;
	CLRF        _LEVEL1_STATE+0 
	CLRF        _LEVEL1_STATE+1 
;Robo2 v2.0.c,40 :: 		sendText("Starting Block  ");
	MOVLW       ?lstr35_Robo2_32v2.0+0
	MOVWF       FARG_sendText_aText+0 
	MOVLW       hi_addr(?lstr35_Robo2_32v2.0+0)
	MOVWF       FARG_sendText_aText+1 
	CALL        _sendText+0, 0
;Robo2 v2.0.c,41 :: 		LEVEL = 0;
	CLRF        _LEVEL+0 
	CLRF        _LEVEL+1 
;Robo2 v2.0.c,43 :: 		while(isAllWhite())
L_main495:
	CALL        _isAllWhite+0, 0
	MOVF        R0, 0 
	IORWF       R1, 0 
	BTFSC       STATUS+0, 2 
	GOTO        L_main496
;Robo2 v2.0.c,44 :: 		moveStraightSlow();
	CALL        _moveStraightSlow+0, 0
	GOTO        L_main495
L_main496:
;Robo2 v2.0.c,45 :: 		LEVEL = 1;
	MOVLW       1
	MOVWF       _LEVEL+0 
	MOVLW       0
	MOVWF       _LEVEL+1 
;Robo2 v2.0.c,46 :: 		sendText("Level 1 Starting  ");
	MOVLW       ?lstr36_Robo2_32v2.0+0
	MOVWF       FARG_sendText_aText+0 
	MOVLW       hi_addr(?lstr36_Robo2_32v2.0+0)
	MOVWF       FARG_sendText_aText+1 
	CALL        _sendText+0, 0
;Robo2 v2.0.c,47 :: 		LEVEL1_STATE = REACHED;
	MOVLW       1
	MOVWF       _LEVEL1_STATE+0 
	MOVLW       0
	MOVWF       _LEVEL1_STATE+1 
;Robo2 v2.0.c,48 :: 		stop();
	CALL        _stop+0, 0
;Robo2 v2.0.c,52 :: 		moveForward(205,200);
	MOVLW       205
	MOVWF       FARG_moveForward_pwmLeft+0 
	MOVLW       0
	MOVWF       FARG_moveForward_pwmLeft+1 
	MOVLW       200
	MOVWF       FARG_moveForward_pwmRight+0 
	MOVLW       0
	MOVWF       FARG_moveForward_pwmRight+1 
	CALL        _moveForward+0, 0
;Robo2 v2.0.c,53 :: 		delay_ms(100);
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       138
	MOVWF       R12, 0
	MOVLW       85
	MOVWF       R13, 0
L_main497:
	DECFSZ      R13, 1, 0
	BRA         L_main497
	DECFSZ      R12, 1, 0
	BRA         L_main497
	DECFSZ      R11, 1, 0
	BRA         L_main497
	NOP
	NOP
;Robo2 v2.0.c,54 :: 		while(!isAllBlack()){
L_main498:
	CALL        _isAllBlack+0, 0
	MOVF        R0, 0 
	IORWF       R1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_main499
;Robo2 v2.0.c,55 :: 		lineFollow();
	CALL        _lineFollow+0, 0
;Robo2 v2.0.c,60 :: 		}
	GOTO        L_main498
L_main499:
;Robo2 v2.0.c,61 :: 		stop();
	CALL        _stop+0, 0
;Robo2 v2.0.c,62 :: 		sendText("  End of Level 1. Level 2 Starting  ");
	MOVLW       ?lstr37_Robo2_32v2.0+0
	MOVWF       FARG_sendText_aText+0 
	MOVLW       hi_addr(?lstr37_Robo2_32v2.0+0)
	MOVWF       FARG_sendText_aText+1 
	CALL        _sendText+0, 0
;Robo2 v2.0.c,63 :: 		LEVEL1_STATE = COMPLETED;
	MOVLW       2
	MOVWF       _LEVEL1_STATE+0 
	MOVLW       0
	MOVWF       _LEVEL1_STATE+1 
;Robo2 v2.0.c,64 :: 		LEVEL2_STATE = REACHED;
	MOVLW       1
	MOVWF       _LEVEL2_STATE+0 
	MOVLW       0
	MOVWF       _LEVEL2_STATE+1 
;Robo2 v2.0.c,65 :: 		LEVEL = 2;
	MOVLW       2
	MOVWF       _LEVEL+0 
	MOVLW       0
	MOVWF       _LEVEL+1 
;Robo2 v2.0.c,69 :: 		while(!isAllWhite()){
L_main500:
	CALL        _isAllWhite+0, 0
	MOVF        R0, 0 
	IORWF       R1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_main501
;Robo2 v2.0.c,70 :: 		goThroughObstaclesJay();
	CALL        _goThroughObstaclesJay+0, 0
;Robo2 v2.0.c,71 :: 		}
	GOTO        L_main500
L_main501:
;Robo2 v2.0.c,73 :: 		stop();
	CALL        _stop+0, 0
;Robo2 v2.0.c,74 :: 		sendText("  End of Level 2. Level 3 Starting  ");
	MOVLW       ?lstr38_Robo2_32v2.0+0
	MOVWF       FARG_sendText_aText+0 
	MOVLW       hi_addr(?lstr38_Robo2_32v2.0+0)
	MOVWF       FARG_sendText_aText+1 
	CALL        _sendText+0, 0
;Robo2 v2.0.c,75 :: 		LEVEL2_STATE = COMPLETED;
	MOVLW       2
	MOVWF       _LEVEL2_STATE+0 
	MOVLW       0
	MOVWF       _LEVEL2_STATE+1 
;Robo2 v2.0.c,76 :: 		LEVEL3_STATE = REACHED;
	MOVLW       1
	MOVWF       _LEVEL3_STATE+0 
	MOVLW       0
	MOVWF       _LEVEL3_STATE+1 
;Robo2 v2.0.c,77 :: 		LEVEL = 3;
	MOVLW       3
	MOVWF       _LEVEL+0 
	MOVLW       0
	MOVWF       _LEVEL+1 
;Robo2 v2.0.c,83 :: 		while(!isAllBlack()){
L_main502:
	CALL        _isAllBlack+0, 0
	MOVF        R0, 0 
	IORWF       R1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_main503
;Robo2 v2.0.c,84 :: 		stop();
	CALL        _stop+0, 0
;Robo2 v2.0.c,85 :: 		}
	GOTO        L_main502
L_main503:
;Robo2 v2.0.c,88 :: 		}
	GOTO        $+0
; end of _main

_isRightSafe:

;Robo2 v2.0.c,90 :: 		int isRightSafe(){
;Robo2 v2.0.c,91 :: 		ir_value = ADC_Read(IRSensorRight);
	MOVLW       0
	BTFSC       PORTA+0, 2 
	MOVLW       1
	MOVWF       FARG_ADC_Read_channel+0 
	CALL        _ADC_Read+0, 0
	MOVF        R0, 0 
	MOVWF       _ir_value+0 
	MOVF        R1, 0 
	MOVWF       _ir_value+1 
;Robo2 v2.0.c,92 :: 		if(250<=ir_value && ir_value<800){                         // ~5cm
	MOVLW       0
	SUBWF       R1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__isRightSafe697
	MOVLW       250
	SUBWF       R0, 0 
L__isRightSafe697:
	BTFSS       STATUS+0, 0 
	GOTO        L_isRightSafe506
	MOVLW       3
	SUBWF       _ir_value+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__isRightSafe698
	MOVLW       32
	SUBWF       _ir_value+0, 0 
L__isRightSafe698:
	BTFSC       STATUS+0, 0 
	GOTO        L_isRightSafe506
L__isRightSafe644:
;Robo2 v2.0.c,93 :: 		return FALSE;
	CLRF        R0 
	CLRF        R1 
	RETURN      0
;Robo2 v2.0.c,94 :: 		}
L_isRightSafe506:
;Robo2 v2.0.c,96 :: 		return TRUE;
	MOVLW       1
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
;Robo2 v2.0.c,97 :: 		}
	RETURN      0
; end of _isRightSafe

_isMiddleSafe:

;Robo2 v2.0.c,99 :: 		int isMiddleSafe(){
;Robo2 v2.0.c,100 :: 		ir_value = ADC_Read(IRSensorCenter);
	MOVLW       0
	BTFSC       PORTA+0, 1 
	MOVLW       1
	MOVWF       FARG_ADC_Read_channel+0 
	CALL        _ADC_Read+0, 0
	MOVF        R0, 0 
	MOVWF       _ir_value+0 
	MOVF        R1, 0 
	MOVWF       _ir_value+1 
;Robo2 v2.0.c,101 :: 		if(250<=ir_value && ir_value<800){                         // ~5cm
	MOVLW       0
	SUBWF       R1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__isMiddleSafe699
	MOVLW       250
	SUBWF       R0, 0 
L__isMiddleSafe699:
	BTFSS       STATUS+0, 0 
	GOTO        L_isMiddleSafe510
	MOVLW       3
	SUBWF       _ir_value+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__isMiddleSafe700
	MOVLW       32
	SUBWF       _ir_value+0, 0 
L__isMiddleSafe700:
	BTFSC       STATUS+0, 0 
	GOTO        L_isMiddleSafe510
L__isMiddleSafe645:
;Robo2 v2.0.c,102 :: 		return FALSE;
	CLRF        R0 
	CLRF        R1 
	RETURN      0
;Robo2 v2.0.c,103 :: 		}
L_isMiddleSafe510:
;Robo2 v2.0.c,105 :: 		return TRUE;
	MOVLW       1
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
;Robo2 v2.0.c,106 :: 		}
	RETURN      0
; end of _isMiddleSafe

_isLeftSafe:

;Robo2 v2.0.c,108 :: 		int isLeftSafe(){
;Robo2 v2.0.c,109 :: 		ir_value = ADC_Read(IRSensorLeft);
	MOVLW       0
	BTFSC       PORTA+0, 0 
	MOVLW       1
	MOVWF       FARG_ADC_Read_channel+0 
	CALL        _ADC_Read+0, 0
	MOVF        R0, 0 
	MOVWF       _ir_value+0 
	MOVF        R1, 0 
	MOVWF       _ir_value+1 
;Robo2 v2.0.c,110 :: 		if(250<=ir_value && ir_value<800){                         // ~5cm
	MOVLW       0
	SUBWF       R1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__isLeftSafe701
	MOVLW       250
	SUBWF       R0, 0 
L__isLeftSafe701:
	BTFSS       STATUS+0, 0 
	GOTO        L_isLeftSafe514
	MOVLW       3
	SUBWF       _ir_value+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__isLeftSafe702
	MOVLW       32
	SUBWF       _ir_value+0, 0 
L__isLeftSafe702:
	BTFSC       STATUS+0, 0 
	GOTO        L_isLeftSafe514
L__isLeftSafe646:
;Robo2 v2.0.c,111 :: 		return FALSE;
	CLRF        R0 
	CLRF        R1 
	RETURN      0
;Robo2 v2.0.c,112 :: 		}
L_isLeftSafe514:
;Robo2 v2.0.c,114 :: 		return TRUE;
	MOVLW       1
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
;Robo2 v2.0.c,115 :: 		}
	RETURN      0
; end of _isLeftSafe

_moveStraightSlow:

;Robo2 v2.0.c,117 :: 		void moveStraightSlow(){
;Robo2 v2.0.c,118 :: 		moveForward(205,200);
	MOVLW       205
	MOVWF       FARG_moveForward_pwmLeft+0 
	MOVLW       0
	MOVWF       FARG_moveForward_pwmLeft+1 
	MOVLW       200
	MOVWF       FARG_moveForward_pwmRight+0 
	MOVLW       0
	MOVWF       FARG_moveForward_pwmRight+1 
	CALL        _moveForward+0, 0
;Robo2 v2.0.c,119 :: 		}
	RETURN      0
; end of _moveStraightSlow

_moveStraightFast:

;Robo2 v2.0.c,121 :: 		void moveStraightFast(){
;Robo2 v2.0.c,122 :: 		moveForward(255,250);
	MOVLW       255
	MOVWF       FARG_moveForward_pwmLeft+0 
	MOVLW       0
	MOVWF       FARG_moveForward_pwmLeft+1 
	MOVLW       250
	MOVWF       FARG_moveForward_pwmRight+0 
	MOVLW       0
	MOVWF       FARG_moveForward_pwmRight+1 
	CALL        _moveForward+0, 0
;Robo2 v2.0.c,123 :: 		}
	RETURN      0
; end of _moveStraightFast

_goThroughObstacles:

;Robo2 v2.0.c,125 :: 		void goThroughObstacles(){
;Robo2 v2.0.c,126 :: 		if(getDistanceSonar2('M') < 10 ){
	MOVLW       77
	MOVWF       FARG_getDistanceSonar2_Sensor+0 
	CALL        _getDistanceSonar2+0, 0
	MOVLW       10
	SUBWF       R0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_goThroughObstacles516
;Robo2 v2.0.c,127 :: 		stop();
	CALL        _stop+0, 0
;Robo2 v2.0.c,128 :: 		if(DIRECTION<0){
	MOVLW       128
	XORWF       _DIRECTION+1, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__goThroughObstacles703
	MOVLW       0
	SUBWF       _DIRECTION+0, 0 
L__goThroughObstacles703:
	BTFSC       STATUS+0, 0 
	GOTO        L_goThroughObstacles517
;Robo2 v2.0.c,129 :: 		rotateByDegree(45);
	MOVLW       45
	MOVWF       FARG_rotateByDegree_degree+0 
	MOVLW       0
	MOVWF       FARG_rotateByDegree_degree+1 
	CALL        _rotateByDegree+0, 0
;Robo2 v2.0.c,130 :: 		DIRECTION +=45;
	MOVLW       45
	ADDWF       _DIRECTION+0, 1 
	MOVLW       0
	ADDWFC      _DIRECTION+1, 1 
;Robo2 v2.0.c,131 :: 		if(getDistanceSonar2('M') < 10 ){
	MOVLW       77
	MOVWF       FARG_getDistanceSonar2_Sensor+0 
	CALL        _getDistanceSonar2+0, 0
	MOVLW       10
	SUBWF       R0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_goThroughObstacles518
;Robo2 v2.0.c,132 :: 		rotateByDegree(-45);
	MOVLW       211
	MOVWF       FARG_rotateByDegree_degree+0 
	MOVLW       255
	MOVWF       FARG_rotateByDegree_degree+1 
	CALL        _rotateByDegree+0, 0
;Robo2 v2.0.c,133 :: 		rotateByDegree(-45);
	MOVLW       211
	MOVWF       FARG_rotateByDegree_degree+0 
	MOVLW       255
	MOVWF       FARG_rotateByDegree_degree+1 
	CALL        _rotateByDegree+0, 0
;Robo2 v2.0.c,134 :: 		DIRECTION -=90;
	MOVLW       90
	SUBWF       _DIRECTION+0, 1 
	MOVLW       0
	SUBWFB      _DIRECTION+1, 1 
;Robo2 v2.0.c,135 :: 		}
L_goThroughObstacles518:
;Robo2 v2.0.c,136 :: 		}
	GOTO        L_goThroughObstacles519
L_goThroughObstacles517:
;Robo2 v2.0.c,138 :: 		rotateByDegree(-45);
	MOVLW       211
	MOVWF       FARG_rotateByDegree_degree+0 
	MOVLW       255
	MOVWF       FARG_rotateByDegree_degree+1 
	CALL        _rotateByDegree+0, 0
;Robo2 v2.0.c,139 :: 		DIRECTION -=45;
	MOVLW       45
	SUBWF       _DIRECTION+0, 1 
	MOVLW       0
	SUBWFB      _DIRECTION+1, 1 
;Robo2 v2.0.c,140 :: 		if(getDistanceSonar2('M') < 10 ){
	MOVLW       77
	MOVWF       FARG_getDistanceSonar2_Sensor+0 
	CALL        _getDistanceSonar2+0, 0
	MOVLW       10
	SUBWF       R0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_goThroughObstacles520
;Robo2 v2.0.c,141 :: 		rotateByDegree(45);
	MOVLW       45
	MOVWF       FARG_rotateByDegree_degree+0 
	MOVLW       0
	MOVWF       FARG_rotateByDegree_degree+1 
	CALL        _rotateByDegree+0, 0
;Robo2 v2.0.c,142 :: 		rotateByDegree(45);
	MOVLW       45
	MOVWF       FARG_rotateByDegree_degree+0 
	MOVLW       0
	MOVWF       FARG_rotateByDegree_degree+1 
	CALL        _rotateByDegree+0, 0
;Robo2 v2.0.c,143 :: 		DIRECTION +=90;
	MOVLW       90
	ADDWF       _DIRECTION+0, 1 
	MOVLW       0
	ADDWFC      _DIRECTION+1, 1 
;Robo2 v2.0.c,144 :: 		}
L_goThroughObstacles520:
;Robo2 v2.0.c,145 :: 		}
L_goThroughObstacles519:
;Robo2 v2.0.c,146 :: 		}
	GOTO        L_goThroughObstacles521
L_goThroughObstacles516:
;Robo2 v2.0.c,148 :: 		moveStraightFast();
	CALL        _moveStraightFast+0, 0
;Robo2 v2.0.c,149 :: 		}
L_goThroughObstacles521:
;Robo2 v2.0.c,150 :: 		delay_ms(10);
	MOVLW       65
	MOVWF       R12, 0
	MOVLW       238
	MOVWF       R13, 0
L_goThroughObstacles522:
	DECFSZ      R13, 1, 0
	BRA         L_goThroughObstacles522
	DECFSZ      R12, 1, 0
	BRA         L_goThroughObstacles522
	NOP
;Robo2 v2.0.c,151 :: 		}
	RETURN      0
; end of _goThroughObstacles

_goThroughObstaclesJay:

;Robo2 v2.0.c,153 :: 		void goThroughObstaclesJay(){
;Robo2 v2.0.c,154 :: 		int ROTATION_ANGLE = 0;
	CLRF        goThroughObstaclesJay_ROTATION_ANGLE_L0+0 
	CLRF        goThroughObstaclesJay_ROTATION_ANGLE_L0+1 
;Robo2 v2.0.c,155 :: 		if(isPathClear() == 0) {
	CALL        _isPathClear+0, 0
	MOVLW       0
	XORWF       R1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__goThroughObstaclesJay704
	MOVLW       0
	XORWF       R0, 0 
L__goThroughObstaclesJay704:
	BTFSS       STATUS+0, 2 
	GOTO        L_goThroughObstaclesJay523
;Robo2 v2.0.c,156 :: 		rotateByDegree(30);
	MOVLW       30
	MOVWF       FARG_rotateByDegree_degree+0 
	MOVLW       0
	MOVWF       FARG_rotateByDegree_degree+1 
	CALL        _rotateByDegree+0, 0
;Robo2 v2.0.c,157 :: 		ROTATION_ANGLE += 30;
	MOVLW       30
	ADDWF       goThroughObstaclesJay_ROTATION_ANGLE_L0+0, 1 
	MOVLW       0
	ADDWFC      goThroughObstaclesJay_ROTATION_ANGLE_L0+1, 1 
;Robo2 v2.0.c,158 :: 		if(isPathClear() == 0) {
	CALL        _isPathClear+0, 0
	MOVLW       0
	XORWF       R1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__goThroughObstaclesJay705
	MOVLW       0
	XORWF       R0, 0 
L__goThroughObstaclesJay705:
	BTFSS       STATUS+0, 2 
	GOTO        L_goThroughObstaclesJay524
;Robo2 v2.0.c,159 :: 		rotateByDegree(-60);
	MOVLW       196
	MOVWF       FARG_rotateByDegree_degree+0 
	MOVLW       255
	MOVWF       FARG_rotateByDegree_degree+1 
	CALL        _rotateByDegree+0, 0
;Robo2 v2.0.c,160 :: 		ROTATION_ANGLE += -60;
	MOVLW       196
	ADDWF       goThroughObstaclesJay_ROTATION_ANGLE_L0+0, 1 
	MOVLW       255
	ADDWFC      goThroughObstaclesJay_ROTATION_ANGLE_L0+1, 1 
;Robo2 v2.0.c,161 :: 		if(isPathClear() == 0) {
	CALL        _isPathClear+0, 0
	MOVLW       0
	XORWF       R1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__goThroughObstaclesJay706
	MOVLW       0
	XORWF       R0, 0 
L__goThroughObstaclesJay706:
	BTFSS       STATUS+0, 2 
	GOTO        L_goThroughObstaclesJay525
;Robo2 v2.0.c,162 :: 		rotateByDegree(90);
	MOVLW       90
	MOVWF       FARG_rotateByDegree_degree+0 
	MOVLW       0
	MOVWF       FARG_rotateByDegree_degree+1 
	CALL        _rotateByDegree+0, 0
;Robo2 v2.0.c,163 :: 		ROTATION_ANGLE += 90;
	MOVLW       90
	ADDWF       goThroughObstaclesJay_ROTATION_ANGLE_L0+0, 1 
	MOVLW       0
	ADDWFC      goThroughObstaclesJay_ROTATION_ANGLE_L0+1, 1 
;Robo2 v2.0.c,164 :: 		if(isPathClear() == 0) {
	CALL        _isPathClear+0, 0
	MOVLW       0
	XORWF       R1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__goThroughObstaclesJay707
	MOVLW       0
	XORWF       R0, 0 
L__goThroughObstaclesJay707:
	BTFSS       STATUS+0, 2 
	GOTO        L_goThroughObstaclesJay526
;Robo2 v2.0.c,165 :: 		rotateByDegree(-90);
	MOVLW       166
	MOVWF       FARG_rotateByDegree_degree+0 
	MOVLW       255
	MOVWF       FARG_rotateByDegree_degree+1 
	CALL        _rotateByDegree+0, 0
;Robo2 v2.0.c,166 :: 		rotateByDegree(-30);
	MOVLW       226
	MOVWF       FARG_rotateByDegree_degree+0 
	MOVLW       255
	MOVWF       FARG_rotateByDegree_degree+1 
	CALL        _rotateByDegree+0, 0
;Robo2 v2.0.c,167 :: 		ROTATION_ANGLE += -120;
	MOVLW       136
	ADDWF       goThroughObstaclesJay_ROTATION_ANGLE_L0+0, 1 
	MOVLW       255
	ADDWFC      goThroughObstaclesJay_ROTATION_ANGLE_L0+1, 1 
;Robo2 v2.0.c,168 :: 		if(isPathClear() == 0) {
	CALL        _isPathClear+0, 0
	MOVLW       0
	XORWF       R1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__goThroughObstaclesJay708
	MOVLW       0
	XORWF       R0, 0 
L__goThroughObstaclesJay708:
	BTFSS       STATUS+0, 2 
	GOTO        L_goThroughObstaclesJay527
;Robo2 v2.0.c,169 :: 		rotateByDegree(90);
	MOVLW       90
	MOVWF       FARG_rotateByDegree_degree+0 
	MOVLW       0
	MOVWF       FARG_rotateByDegree_degree+1 
	CALL        _rotateByDegree+0, 0
;Robo2 v2.0.c,170 :: 		rotateByDegree(60);
	MOVLW       60
	MOVWF       FARG_rotateByDegree_degree+0 
	MOVLW       0
	MOVWF       FARG_rotateByDegree_degree+1 
	CALL        _rotateByDegree+0, 0
;Robo2 v2.0.c,171 :: 		ROTATION_ANGLE += 150;
	MOVLW       150
	ADDWF       goThroughObstaclesJay_ROTATION_ANGLE_L0+0, 1 
	MOVLW       0
	ADDWFC      goThroughObstaclesJay_ROTATION_ANGLE_L0+1, 1 
;Robo2 v2.0.c,172 :: 		if(isPathClear() == 0) {
	CALL        _isPathClear+0, 0
	MOVLW       0
	XORWF       R1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__goThroughObstaclesJay709
	MOVLW       0
	XORWF       R0, 0 
L__goThroughObstaclesJay709:
	BTFSS       STATUS+0, 2 
	GOTO        L_goThroughObstaclesJay528
;Robo2 v2.0.c,173 :: 		rotateByDegree(-90);
	MOVLW       166
	MOVWF       FARG_rotateByDegree_degree+0 
	MOVLW       255
	MOVWF       FARG_rotateByDegree_degree+1 
	CALL        _rotateByDegree+0, 0
;Robo2 v2.0.c,174 :: 		rotateByDegree(-90);
	MOVLW       166
	MOVWF       FARG_rotateByDegree_degree+0 
	MOVLW       255
	MOVWF       FARG_rotateByDegree_degree+1 
	CALL        _rotateByDegree+0, 0
;Robo2 v2.0.c,175 :: 		ROTATION_ANGLE += -180;
	MOVLW       76
	ADDWF       goThroughObstaclesJay_ROTATION_ANGLE_L0+0, 1 
	MOVLW       255
	ADDWFC      goThroughObstaclesJay_ROTATION_ANGLE_L0+1, 1 
;Robo2 v2.0.c,176 :: 		}
L_goThroughObstaclesJay528:
;Robo2 v2.0.c,177 :: 		}
L_goThroughObstaclesJay527:
;Robo2 v2.0.c,178 :: 		}
L_goThroughObstaclesJay526:
;Robo2 v2.0.c,179 :: 		}
L_goThroughObstaclesJay525:
;Robo2 v2.0.c,180 :: 		}
L_goThroughObstaclesJay524:
;Robo2 v2.0.c,181 :: 		}
L_goThroughObstaclesJay523:
;Robo2 v2.0.c,182 :: 		DIRECTION += ROTATION_ANGLE;
	MOVF        goThroughObstaclesJay_ROTATION_ANGLE_L0+0, 0 
	ADDWF       _DIRECTION+0, 1 
	MOVF        goThroughObstaclesJay_ROTATION_ANGLE_L0+1, 0 
	ADDWFC      _DIRECTION+1, 1 
;Robo2 v2.0.c,183 :: 		moveStraightSlow();
	CALL        _moveStraightSlow+0, 0
;Robo2 v2.0.c,184 :: 		delay_ms(10);
	MOVLW       65
	MOVWF       R12, 0
	MOVLW       238
	MOVWF       R13, 0
L_goThroughObstaclesJay529:
	DECFSZ      R13, 1, 0
	BRA         L_goThroughObstaclesJay529
	DECFSZ      R12, 1, 0
	BRA         L_goThroughObstaclesJay529
	NOP
;Robo2 v2.0.c,186 :: 		if(isAllWhite()) {
	CALL        _isAllWhite+0, 0
	MOVF        R0, 0 
	IORWF       R1, 0 
	BTFSC       STATUS+0, 2 
	GOTO        L_goThroughObstaclesJay530
;Robo2 v2.0.c,188 :: 		if(abs(DIRECTION) >= 90) {
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
	GOTO        L__goThroughObstaclesJay710
	MOVLW       90
	SUBWF       R0, 0 
L__goThroughObstaclesJay710:
	BTFSS       STATUS+0, 0 
	GOTO        L_goThroughObstaclesJay531
;Robo2 v2.0.c,189 :: 		sendText("Wrong Direction !!!");
	MOVLW       ?lstr39_Robo2_32v2.0+0
	MOVWF       FARG_sendText_aText+0 
	MOVLW       hi_addr(?lstr39_Robo2_32v2.0+0)
	MOVWF       FARG_sendText_aText+1 
	CALL        _sendText+0, 0
;Robo2 v2.0.c,190 :: 		rotateByDegree(90);
	MOVLW       90
	MOVWF       FARG_rotateByDegree_degree+0 
	MOVLW       0
	MOVWF       FARG_rotateByDegree_degree+1 
	CALL        _rotateByDegree+0, 0
;Robo2 v2.0.c,191 :: 		rotateByDegree(90);
	MOVLW       90
	MOVWF       FARG_rotateByDegree_degree+0 
	MOVLW       0
	MOVWF       FARG_rotateByDegree_degree+1 
	CALL        _rotateByDegree+0, 0
;Robo2 v2.0.c,192 :: 		DIRECTION = 0;
	CLRF        _DIRECTION+0 
	CLRF        _DIRECTION+1 
;Robo2 v2.0.c,193 :: 		moveStraightSlow();
	CALL        _moveStraightSlow+0, 0
;Robo2 v2.0.c,194 :: 		delay_ms(200);
	MOVLW       6
	MOVWF       R11, 0
	MOVLW       19
	MOVWF       R12, 0
	MOVLW       173
	MOVWF       R13, 0
L_goThroughObstaclesJay532:
	DECFSZ      R13, 1, 0
	BRA         L_goThroughObstaclesJay532
	DECFSZ      R12, 1, 0
	BRA         L_goThroughObstaclesJay532
	DECFSZ      R11, 1, 0
	BRA         L_goThroughObstaclesJay532
	NOP
	NOP
;Robo2 v2.0.c,195 :: 		}
L_goThroughObstaclesJay531:
;Robo2 v2.0.c,196 :: 		sendText("Corrent Direction !!!");
	MOVLW       ?lstr40_Robo2_32v2.0+0
	MOVWF       FARG_sendText_aText+0 
	MOVLW       hi_addr(?lstr40_Robo2_32v2.0+0)
	MOVWF       FARG_sendText_aText+1 
	CALL        _sendText+0, 0
;Robo2 v2.0.c,197 :: 		}
L_goThroughObstaclesJay530:
;Robo2 v2.0.c,198 :: 		}
	RETURN      0
; end of _goThroughObstaclesJay

_level3Aligning:

;Robo2 v2.0.c,200 :: 		void level3Aligning(){
;Robo2 v2.0.c,201 :: 		while(Sensor5 == 1)
L_level3Aligning533:
	BTFSS       PORTD+0, 6 
	GOTO        L_level3Aligning534
;Robo2 v2.0.c,202 :: 		reverse(180,180);
	MOVLW       180
	MOVWF       FARG_reverse_pwmLeft+0 
	MOVLW       0
	MOVWF       FARG_reverse_pwmLeft+1 
	MOVLW       180
	MOVWF       FARG_reverse_pwmRight+0 
	MOVLW       0
	MOVWF       FARG_reverse_pwmRight+1 
	CALL        _reverse+0, 0
	GOTO        L_level3Aligning533
L_level3Aligning534:
;Robo2 v2.0.c,203 :: 		stop();
	CALL        _stop+0, 0
;Robo2 v2.0.c,204 :: 		delay_ms(500);
	MOVLW       13
	MOVWF       R11, 0
	MOVLW       175
	MOVWF       R12, 0
	MOVLW       182
	MOVWF       R13, 0
L_level3Aligning535:
	DECFSZ      R13, 1, 0
	BRA         L_level3Aligning535
	DECFSZ      R12, 1, 0
	BRA         L_level3Aligning535
	DECFSZ      R11, 1, 0
	BRA         L_level3Aligning535
	NOP
;Robo2 v2.0.c,205 :: 		while(!isAllBlack()){
L_level3Aligning536:
	CALL        _isAllBlack+0, 0
	MOVF        R0, 0 
	IORWF       R1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_level3Aligning537
;Robo2 v2.0.c,206 :: 		if(Sensor9 == 1)
	BTFSS       PORTB+0, 7 
	GOTO        L_level3Aligning538
;Robo2 v2.0.c,207 :: 		rotateAntiClockwise(180);
	MOVLW       180
	MOVWF       FARG_rotateAntiClockwise_pwm+0 
	MOVLW       0
	MOVWF       FARG_rotateAntiClockwise_pwm+1 
	CALL        _rotateAntiClockwise+0, 0
	GOTO        L_level3Aligning539
L_level3Aligning538:
;Robo2 v2.0.c,208 :: 		else if(Sensor1 == 1)
	BTFSS       PORTB+0, 4 
	GOTO        L_level3Aligning540
;Robo2 v2.0.c,209 :: 		rotateClockwise(180);
	MOVLW       180
	MOVWF       FARG_rotateClockwise_pwm+0 
	MOVLW       0
	MOVWF       FARG_rotateClockwise_pwm+1 
	CALL        _rotateClockwise+0, 0
L_level3Aligning540:
L_level3Aligning539:
;Robo2 v2.0.c,210 :: 		}
	GOTO        L_level3Aligning536
L_level3Aligning537:
;Robo2 v2.0.c,212 :: 		}
	RETURN      0
; end of _level3Aligning

_isPathClear:

;Robo2 v2.0.c,214 :: 		int isPathClear() {
;Robo2 v2.0.c,215 :: 		if( isLeftSafe() || isMiddleSafe() || isRightSafe()) {
	CALL        _isLeftSafe+0, 0
	MOVF        R0, 0 
	IORWF       R1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__isPathClear647
	CALL        _isMiddleSafe+0, 0
	MOVF        R0, 0 
	IORWF       R1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__isPathClear647
	CALL        _isRightSafe+0, 0
	MOVF        R0, 0 
	IORWF       R1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__isPathClear647
	GOTO        L_isPathClear543
L__isPathClear647:
;Robo2 v2.0.c,216 :: 		return 0;     // Not Clear
	CLRF        R0 
	CLRF        R1 
	RETURN      0
;Robo2 v2.0.c,217 :: 		} else {
L_isPathClear543:
;Robo2 v2.0.c,218 :: 		return 1;
	MOVLW       1
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
;Robo2 v2.0.c,220 :: 		}
	RETURN      0
; end of _isPathClear
