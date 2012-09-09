#line 1 "D:/Robotics/SLIIT- Robofest 2012/Programing/Test Codes/PID/PID_1.c"
#line 1 "d:/robotics/sliit- robofest 2012/programing/test codes/pid/motion.h"
#line 19 "d:/robotics/sliit- robofest 2012/programing/test codes/pid/motion.h"
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
  PORTC.B0  = 1;
  PORTC.B2  = 0;
 PWM1_Set_Duty(pwm);
}

void motorRight_foward(int pwm){
  PORTD.B0  = 1;
  PORTD.B1  = 0;
 PWM1_Set_Duty(pwm);
}

void motorLeft_reverse(int pwm){
  PORTC.B0  = 0;
  PORTC.B2  = 1;
 PWM1_Set_Duty(pwm);
}

void motorRight_reverse(int pwm){
  PORTD.B0  = 0;
  PORTD.B1  = 1;
 PWM1_Set_Duty(pwm);
}

void motorLeft_stop(){
  PORTC.B0  = 1;
  PORTC.B2  = 1;
}

 void motorRight_stop(){
  PORTD.B0  = 1;
  PORTD.B1  = 1;
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
#line 3 "D:/Robotics/SLIIT- Robofest 2012/Programing/Test Codes/PID/PID_1.c"
char* ConnectionEstablished = "Connection Established!";
int count, counter;
char command,command_old,error;
float Kp, Kd;
int deviation, previousDeviation;
float correction, totalError;
int MIN_RPM, MID_RPM, MAX_RPM;

unsigned int temp_res;

void configure(){

 PWM1_Init(5000);
 PWM2_Init(5000);
 PWM1_Start();
 PWM2_Start();
 UART1_Init(9600);
 TRISD=0;
 TRISC=0;
 TRISB=0;






 TRISA=255;

 ADCON0 = 0b11000001;
 ADCON1 = 0b00000000;

 TRISA = 0b11111111;

 TRISC = 0b00000000;
 TRISD = 0b00000000;

 PORTA = 0;

 PORTC = 0;
 PORTD = 0;


 INTCON.ADIF = 0;
 INTCON.ADIE = 1;
 INTCON.GIE = 1;

}

void setPID(){
 MIN_RPM = 165;
 MID_RPM = 210;
 MAX_RPM = 255;

 Kp = 10;
 Kd = 0;

 Pwm1_Set_Duty(MID_RPM);
 Pwm2_Set_Duty(MID_RPM);
}

void lineFollow(){

}

void main() {
 configure();

 UART1_Write_Text(ConnectionEstablished);
 setPID();

 testMotion(200);
#line 81 "D:/Robotics/SLIIT- Robofest 2012/Programing/Test Codes/PID/PID_1.c"
}
