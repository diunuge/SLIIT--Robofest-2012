#define  Scout  PORTD.B0
#define  Sensor1  PORTD.B0
#define  Sensor2  PORTD.B0
#define  Sensor3  PORTD.B0
#define  Sensor4  PORTD.B0
#define  Sensor5  PORTD.B0
#define  Sensor6  PORTD.B0
#define  Sensor7  PORTD.B0
#define  Sensor8  PORTD.B0
#define  Sensor9  PORTD.B0

#define  Motor_Right_Forward  PORTD.B0
#define  Motor_Right_Reverse  PORTD.B1
#define  Motor_Right_Enable   PORTC.B1
#define  Motor_Left_Forward   PORTC.B0
#define  Motor_Left_Reverse   PORTC.B2
#define  Motor_Left_Enable    PORTC.B3

void motorLeft_foward(int pwm);
void motorRight_foward(int pwm);
void motorLeft_reverse(int pwm);
void motorRight_reverse(int pwm);
void motorLeft_stop();
void motorRight_stop();

void moveForward(int pwmLeft, int pwmRight);
void turnRight(int pwmLeft);
void turnLeft(int pwmRight);
void rotateClockwise(int pwm);
void rotateAntiClockwise(int pwm);
void stop();

void testMotion();


void motorLeft_foward(int pwm){
      Motor_Left_Forward = 1;
      Motor_Left_Reverse = 0;
      PWM1_Set_Duty(pwm);
}

void motorRight_foward(int pwm){
      Motor_Right_Forward = 1;
      Motor_Right_Reverse = 0;
      PWM1_Set_Duty(pwm);
}

void motorLeft_reverse(int pwm){
      Motor_Left_Forward = 0;
      Motor_Left_Reverse = 1;
      PWM1_Set_Duty(pwm);
}

void motorRight_reverse(int pwm){
      Motor_Right_Forward = 0;
      Motor_Right_Reverse = 1;
      PWM1_Set_Duty(pwm);
}

void motorLeft_stop(){
      Motor_Left_Forward = 1;
      Motor_Left_Reverse = 1;
}

 void motorRight_stop(){
      Motor_Right_Forward = 1;
      Motor_Right_Reverse = 1;
}

void moveForward(int pwmLeft, int pwmRight){
      motorLeft_foward(pwmLeft);
      motorRight_foward(pwmRight);
}

void turnRight(int pwmLeft){
      motorLeft_foward(pwmLeft);
      motorRight_stop();
}

void turnLeft(int pwmRight){
      motorRight_foward(pwmRight);
      motorLeft_stop();
}

void rotateClockwise(int pwm){
      motorLeft_foward(pwm);
      motorRight_reverse(pwm);
}

void rotateAntiClockwise(int pwm){
      motorLeft_reverse(pwm);
      motorRight_foward(pwm);
}

void stop(){
      motorLeft_stop();
      motorRight_stop();
}

void testMotion(int pwm){
      rotateClockwise(pwm);
      delay_ms(1000);
      rotateAntiClockwise(pwm);
      delay_ms(1000);
      moveForward(pwm,pwm);
      delay_ms(1000);
}
