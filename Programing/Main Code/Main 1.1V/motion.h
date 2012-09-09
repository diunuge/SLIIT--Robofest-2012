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
#define  Motor_Right_Enable   PORTD.B1
#define  Motor_Left_Forward   PORTC.B0
#define  Motor_Left_Reverse   PORTC.B3
#define  Motor_Left_Enable    PORTC.B3

void motorLeft_foward(int pwm);










void motorLeft_foward(int pwm){
      Motor_Right_Forward = 1;
      Motor_Right_Reverse = 0;
      PWM1_Set_Duty(pwm);
}