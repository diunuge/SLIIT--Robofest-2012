
_motorLeft_foward:

;motion.h,36 :: 		void motorLeft_foward(int pwm){
;motion.h,37 :: 		Motor_Left_Forward = 1;
	BSF         PORTC+0, 0 
;motion.h,38 :: 		Motor_Left_Reverse = 0;
	BCF         PORTC+0, 2 
;motion.h,39 :: 		PWM1_Set_Duty(pwm);
	MOVF        FARG_motorLeft_foward_pwm+0, 0 
	MOVWF       FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;motion.h,40 :: 		}
	RETURN      0
; end of _motorLeft_foward

_motorRight_foward:

;motion.h,42 :: 		void motorRight_foward(int pwm){
;motion.h,43 :: 		Motor_Right_Forward = 1;
	BSF         PORTD+0, 0 
;motion.h,44 :: 		Motor_Right_Reverse = 0;
	BCF         PORTD+0, 1 
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
	BCF         PORTC+0, 0 
;motion.h,50 :: 		Motor_Left_Reverse = 1;
	BSF         PORTC+0, 2 
;motion.h,51 :: 		PWM1_Set_Duty(pwm);
	MOVF        FARG_motorLeft_reverse_pwm+0, 0 
	MOVWF       FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;motion.h,52 :: 		}
	RETURN      0
; end of _motorLeft_reverse

_motorRight_reverse:

;motion.h,54 :: 		void motorRight_reverse(int pwm){
;motion.h,55 :: 		Motor_Right_Forward = 0;
	BCF         PORTD+0, 0 
;motion.h,56 :: 		Motor_Right_Reverse = 1;
	BSF         PORTD+0, 1 
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
	BSF         PORTC+0, 0 
;motion.h,62 :: 		Motor_Left_Reverse = 1;
	BSF         PORTC+0, 2 
;motion.h,63 :: 		}
	RETURN      0
; end of _motorLeft_stop

_motorRight_stop:

;motion.h,65 :: 		void motorRight_stop(){
;motion.h,66 :: 		Motor_Right_Forward = 1;
	BSF         PORTD+0, 0 
;motion.h,67 :: 		Motor_Right_Reverse = 1;
	BSF         PORTD+0, 1 
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

;PID_1.c,13 :: 		void configure(){
;PID_1.c,15 :: 		PWM1_Init(5000);
	BSF         T2CON+0, 0, 0
	BCF         T2CON+0, 1, 0
	MOVLW       249
	MOVWF       PR2+0, 0
	CALL        _PWM1_Init+0, 0
;PID_1.c,16 :: 		PWM2_Init(5000);
	BSF         T2CON+0, 0, 0
	BCF         T2CON+0, 1, 0
	MOVLW       249
	MOVWF       PR2+0, 0
	CALL        _PWM2_Init+0, 0
;PID_1.c,17 :: 		PWM1_Start();
	CALL        _PWM1_Start+0, 0
;PID_1.c,18 :: 		PWM2_Start();
	CALL        _PWM2_Start+0, 0
;PID_1.c,19 :: 		UART1_Init(9600);
	MOVLW       129
	MOVWF       SPBRG+0 
	BSF         TXSTA+0, 2, 0
	CALL        _UART1_Init+0, 0
;PID_1.c,20 :: 		TRISD=0;
	CLRF        TRISD+0 
;PID_1.c,21 :: 		TRISC=0;
	CLRF        TRISC+0 
;PID_1.c,22 :: 		TRISB=0;
	CLRF        TRISB+0 
;PID_1.c,29 :: 		TRISA=255;
	MOVLW       255
	MOVWF       TRISA+0 
;PID_1.c,31 :: 		ADCON0 = 0b11000001;
	MOVLW       193
	MOVWF       ADCON0+0 
;PID_1.c,32 :: 		ADCON1 = 0b00000000;
	CLRF        ADCON1+0 
;PID_1.c,34 :: 		TRISA = 0b11111111;
	MOVLW       255
	MOVWF       TRISA+0 
;PID_1.c,36 :: 		TRISC = 0b00000000;
	CLRF        TRISC+0 
;PID_1.c,37 :: 		TRISD = 0b00000000;
	CLRF        TRISD+0 
;PID_1.c,39 :: 		PORTA = 0;
	CLRF        PORTA+0 
;PID_1.c,41 :: 		PORTC = 0;
	CLRF        PORTC+0 
;PID_1.c,42 :: 		PORTD = 0;
	CLRF        PORTD+0 
;PID_1.c,45 :: 		INTCON.ADIF = 0;
	BCF         INTCON+0, 6 
;PID_1.c,46 :: 		INTCON.ADIE = 1;
	BSF         INTCON+0, 6 
;PID_1.c,47 :: 		INTCON.GIE = 1;
	BSF         INTCON+0, 7 
;PID_1.c,49 :: 		}
	RETURN      0
; end of _configure

_setPID:

;PID_1.c,51 :: 		void setPID(){
;PID_1.c,52 :: 		MIN_RPM = 165;
	MOVLW       165
	MOVWF       _MIN_RPM+0 
	MOVLW       0
	MOVWF       _MIN_RPM+1 
;PID_1.c,53 :: 		MID_RPM = 210;
	MOVLW       210
	MOVWF       _MID_RPM+0 
	MOVLW       0
	MOVWF       _MID_RPM+1 
;PID_1.c,54 :: 		MAX_RPM = 255;
	MOVLW       255
	MOVWF       _MAX_RPM+0 
	MOVLW       0
	MOVWF       _MAX_RPM+1 
;PID_1.c,56 :: 		Kp = 10;
	MOVLW       0
	MOVWF       _Kp+0 
	MOVLW       0
	MOVWF       _Kp+1 
	MOVLW       32
	MOVWF       _Kp+2 
	MOVLW       130
	MOVWF       _Kp+3 
;PID_1.c,57 :: 		Kd = 0;
	CLRF        _Kd+0 
	CLRF        _Kd+1 
	CLRF        _Kd+2 
	CLRF        _Kd+3 
;PID_1.c,59 :: 		Pwm1_Set_Duty(MID_RPM);
	MOVLW       210
	MOVWF       FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;PID_1.c,60 :: 		Pwm2_Set_Duty(MID_RPM);
	MOVF        _MID_RPM+0, 0 
	MOVWF       FARG_PWM2_Set_Duty_new_duty+0 
	CALL        _PWM2_Set_Duty+0, 0
;PID_1.c,61 :: 		}
	RETURN      0
; end of _setPID

_lineFollow:

;PID_1.c,63 :: 		void lineFollow(){
;PID_1.c,65 :: 		}
	RETURN      0
; end of _lineFollow

_main:

;PID_1.c,67 :: 		void main() {
;PID_1.c,68 :: 		configure();
	CALL        _configure+0, 0
;PID_1.c,70 :: 		UART1_Write_Text(ConnectionEstablished);
	MOVF        _ConnectionEstablished+0, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVF        _ConnectionEstablished+1, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;PID_1.c,71 :: 		setPID();
	CALL        _setPID+0, 0
;PID_1.c,73 :: 		testMotion(200);
	MOVLW       200
	MOVWF       FARG_testMotion_pwm+0 
	MOVLW       0
	MOVWF       FARG_testMotion_pwm+1 
	CALL        _testMotion+0, 0
;PID_1.c,81 :: 		}
	GOTO        $+0
; end of _main
