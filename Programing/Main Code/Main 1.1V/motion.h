#define  Motor_Right_Forward  PORTD.B0
#define  Motor_Right_Reverse  PORTD.B1
#define  Motor_Left_Forward   PORTC.B0
#define  Motor_Left_Reverse   PORTC.B3

void motorLeft_foward(int pwm);










void motorLeft_foward(int pwm){
      Motor_Right_Forward = 1;
      Motor_Right_Reverse = 0;
      PWM1_Set_Duty(pwm);
}