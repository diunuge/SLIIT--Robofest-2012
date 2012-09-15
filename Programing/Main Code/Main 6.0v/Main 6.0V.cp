#line 1 "D:/Robotics/SLIIT- Robofest 2012/Programing/Main Code/Main 6.0v/Main 6.0V.c"
#line 1 "d:/robotics/sliit- robofest 2012/programing/main code/main 6.0v/linefollow.h"
#line 1 "d:/robotics/sliit- robofest 2012/programing/main code/main 6.0v/motion.h"
#line 1 "d:/robotics/sliit- robofest 2012/programing/main code/main 6.0v/sensorpanel.h"
#line 12 "d:/robotics/sliit- robofest 2012/programing/main code/main 6.0v/sensorpanel.h"
int isAllBlack();
int isAllWhite();

int isAllBlack(){
 if(  PORTB.B5 ==1 &&  PORTB.B4 ==1 &&  PORTB.B3 ==1 &&  PORTD.B4 ==1 &&  PORTD.B5 ==1 &&  PORTD.B6 ==1 &&  PORTD.B7 ==1 &&  PORTB.B2 ==1 &&  PORTB.B6 ==1 &&  PORTB.B7 ==1){
 return 1;
 }
 else
 return 0;
}

int isAllWhite(){
 if(  PORTB.B5 ==0 &&  PORTB.B4 ==0 &&  PORTB.B3 ==0 &&  PORTD.B4 ==0 &&  PORTD.B5 ==0 &&  PORTD.B6 ==0 &&  PORTD.B7 ==0 &&  PORTB.B2 ==0 &&  PORTB.B6 ==0 &&  PORTB.B7 ==0){
 return 1;
 }
 else
 return 0;
}
#line 10 "d:/robotics/sliit- robofest 2012/programing/main code/main 6.0v/motion.h"
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
void reverse(int pwmLeft, int pwmRight);
void stop();

void rotateByDegree(int degree);

void testMotion();


void motorLeft_foward(int pwm){
  PORTD.B2  = 1;
  PORTD.B3  = 0;
 PWM2_Set_Duty(pwm);
}

void motorRight_foward(int pwm){
  PORTC.B4  = 1;
  PORTC.B5  = 0;
 PWM1_Set_Duty(pwm);
}

void motorLeft_reverse(int pwm){
  PORTD.B2  = 0;
  PORTD.B3  = 1;
 PWM2_Set_Duty(pwm);
}

void motorRight_reverse(int pwm){
  PORTC.B4  = 0;
  PORTC.B5  = 1;
 PWM1_Set_Duty(pwm);
}

void motorLeft_stop(){
  PORTD.B2  = 1;
  PORTD.B3  = 1;
}

 void motorRight_stop(){
  PORTC.B4  = 1;
  PORTC.B5  = 1;
}

void moveForward(int pwmLeft, int pwmRight){
 motorLeft_foward(pwmLeft);
 motorRight_foward(pwmRight);
}

void reverse(int pwmLeft, int pwmRight){
 motorLeft_reverse(pwmLeft);
 motorRight_reverse(pwmRight);
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

void rotateByDegree(int degree){
 if( degree == -90 ){
 rotateAntiClockwise(255);
 delay_ms(230);
 stop();
 }
 else if( degree == 90 ){
 rotateClockwise(255);
 delay_ms(230);
 stop();
 }
 else if( degree == -30 ){
 rotateAntiClockwise(255);
 delay_ms(100);
 stop();
 delay_ms(200);
 }
 else if( degree == 30 ){
 rotateClockwise(255);
 delay_ms(100);
 stop();
 delay_ms(200);
 }
 else if( degree == -60 ){
 rotateAntiClockwise(255);
 delay_ms(155);
 stop();
 delay_ms(200);
 }
 else if( degree == 60 ){
 rotateClockwise(255);
 delay_ms(155);
 stop();
 delay_ms(200);
 }
 else if( degree == -45 ){
 rotateAntiClockwise(255);
 delay_ms(135);
 stop();
 delay_ms(200);
 }
 else if( degree == 45 ){
 rotateClockwise(255);
 delay_ms(135);
 stop();
 delay_ms(200);
 }
 else if( degree == -2 ){
 rotateAntiClockwise(255);
 delay_ms(6);
 stop();
 delay_ms(50);
 }
 else if( degree == 2 ){
 rotateClockwise(255);
 delay_ms(6);
 stop();
 delay_ms(50);
 }
}

void testMotion(int pwm){
 rotateClockwise(pwm);
 delay_ms(1000);
 rotateAntiClockwise(pwm);
 delay_ms(1000);
 moveForward(pwm,pwm);
 delay_ms(1000);
}
#line 1 "d:/robotics/sliit- robofest 2012/programing/main code/main 6.0v/debug.h"



char* ConnectionEstablished = "Connection Established!";
char* debugText = "move forward";
int count, counter;

void sendSensorStatus();
void sendText(char* aText);
void testPIC();


void sendSensorStatus(){
 if(  PORTB.B4  == 1){
 debugText = "1";
 UART1_Write_Text(debugText);
 }
 else if(  PORTB.B4  == 0){
 debugText = "0";
 UART1_Write_Text(debugText);
 }

 if(  PORTB.B3  == 1){
 debugText = "1";
 UART1_Write_Text(debugText);
 }
 else if(  PORTB.B3  == 0){
 debugText = "0";
 UART1_Write_Text(debugText);
 }

 if(  PORTD.B4  == 1){
 debugText = "1";
 UART1_Write_Text(debugText);
 }
 else if(  PORTD.B4  == 0){
 debugText = "0";
 UART1_Write_Text(debugText);
 }

 if(  PORTD.B5  == 1){
 debugText = "1";
 UART1_Write_Text(debugText);
 }
 else if(  PORTD.B5  == 0){
 debugText = "0";
 UART1_Write_Text(debugText);
 }

 if(  PORTD.B6  == 1){
 debugText = "1";
 UART1_Write_Text(debugText);
 }
 else if(  PORTD.B6  == 0){
 debugText = "0";
 UART1_Write_Text(debugText);
 }

 if(  PORTD.B7  == 1){
 debugText = "1";
 UART1_Write_Text(debugText);
 }
 else if(  PORTD.B7  == 0){
 debugText = "0";
 UART1_Write_Text(debugText);
 }

 if(  PORTB.B2  == 1){
 debugText = "1";
 UART1_Write_Text(debugText);
 }
 else if(  PORTB.B2  == 0){
 debugText = "0";
 UART1_Write_Text(debugText);
 }

 if(  PORTB.B6  == 1){
 debugText = "1";
 UART1_Write_Text(debugText);
 }
 else if(  PORTB.B6  == 0){
 debugText = "0";
 UART1_Write_Text(debugText);
 }

 if(  PORTB.B7  == 1){
 debugText = "1";
 UART1_Write_Text(debugText);
 }
 else if(  PORTB.B7  == 0){
 debugText = "0";
 UART1_Write_Text(debugText);
 }

 if(  PORTB.B5  == 1){
 debugText = " 1; ";
 UART1_Write_Text(debugText);
 }
 else if(  PORTB.B5  == 0){
 debugText = " 0; ";
 UART1_Write_Text(debugText);
 }
}

void sendText(char* aText){
 UART1_Write_Text(aText);
}

void testPIC(){
 moveForward(200,200);
 debugText = "move Forward  ";
 UART1_Write_Text(debugText);
 delay_ms(5000);

 motorRight_foward(255);
 debugText = "turn Left";
 UART1_Write_Text(debugText);
 motorLeft_stop();
 delay_ms(5000);

 motorLeft_foward(255);
 debugText = "turn Right";
 UART1_Write_Text(debugText);
 motorRight_stop();
 delay_ms(5000);

 stop();
 debugText = "Stopping..   ";
 UART1_Write_Text(debugText);

 debugText = "Decrease PWM..   ";
 UART1_Write_Text(debugText);

 for( count=255; count>0; count--){
 moveForward(count,count);
 delay_ms(100);


 }
}
#line 4 "d:/robotics/sliit- robofest 2012/programing/main code/main 6.0v/linefollow.h"
float Kp, Ki, Kd;
int deviation, previousDeviation;
float correction, totalError;
int MIN_RPM, MID_RPM, MAX_RPM, TEST_RPM, PID_RightRPM, PID_LeftRPM;
int SLOW_PWM, MID_PWM, FAST_PWM;


void setPID();
int isOnThePath();
void lineFollowNormal();
void lineFollowNormalWorked();
void lineFollowPID();
void lineFollow();

void setPID(){
 MIN_RPM = 215;
 MID_RPM = 235;
 MAX_RPM = 255;
 TEST_RPM = 200;


 SLOW_PWM = 255;
 MID_PWM = 200;
 FAST_PWM = 255;

 Kp = 2;
 Ki = 0;
 Kd = 0;

 totalError = 0;
 previousDeviation = 0;
 PID_LeftRPM = 0;
 PID_RightRPM = 0;

 Pwm1_Set_Duty(MID_RPM);
 Pwm2_Set_Duty(MID_RPM);
}

void lineFollowPID(){
#line 65 "d:/robotics/sliit- robofest 2012/programing/main code/main 6.0v/linefollow.h"
 if(  PORTD.B4 ==1 &&  PORTD.B5 ==0 &&  PORTD.B6 ==0 &&  PORTD.B7 ==0 &&  PORTB.B2 ==0)
 deviation = 15;
 if(  PORTD.B4 ==1 &&  PORTD.B5 ==1 &&  PORTD.B6 ==0 &&  PORTD.B7 ==0 &&  PORTB.B2 ==0)
 deviation = 10;
 if(  PORTD.B4 ==1 &&  PORTD.B5 ==1 &&  PORTD.B6 ==1 &&  PORTD.B7 ==0 &&  PORTB.B2 ==0)
 deviation = 4;
 if(  PORTD.B4 ==0 &&  PORTD.B5 ==1 &&  PORTD.B6 ==0 &&  PORTD.B7 ==0 &&  PORTB.B2 ==0)
 deviation = 1;

 if(  PORTD.B4 ==0 &&  PORTD.B5 ==1 &&  PORTD.B6 ==1 &&  PORTD.B7 ==0 &&  PORTB.B2 ==0)
 deviation = 0;
 if(  PORTD.B4 ==0 &&  PORTD.B5 ==1 &&  PORTD.B6 ==1 &&  PORTD.B7 ==1 &&  PORTB.B2 ==0)
 deviation = 0;
 if(  PORTD.B4 ==0 &&  PORTD.B5 ==0 &&  PORTD.B6 ==1 &&  PORTD.B7 ==0 &&  PORTB.B2 ==0)
 deviation = 0;
 if(  PORTD.B4 ==0 &&  PORTD.B5 ==0 &&  PORTD.B6 ==1 &&  PORTD.B7 ==1 &&  PORTB.B2 ==0)
 deviation = 0;

 if(  PORTD.B4 ==0 &&  PORTD.B5 ==0 &&  PORTD.B6 ==0 &&  PORTD.B7 ==1 &&  PORTB.B2 ==0)
 deviation = -1;
 if(  PORTD.B4 ==0 &&  PORTD.B5 ==0 &&  PORTD.B6 ==1 &&  PORTD.B7 ==1 &&  PORTB.B2 ==1)
 deviation = -4;
 if(  PORTD.B4 ==0 &&  PORTD.B5 ==0 &&  PORTD.B6 ==0 &&  PORTD.B7 ==1 &&  PORTB.B2 ==1)
 deviation = -10;
 if(  PORTD.B4 ==0 &&  PORTD.B5 ==0 &&  PORTD.B6 ==0 &&  PORTD.B7 ==0 &&  PORTB.B2 ==1)
 deviation = -15;

 correction = Kp*deviation + Ki*totalError + Kd*(deviation-previousDeviation);
 totalError += correction;
 previousDeviation = deviation;

 PID_LeftRPM = MID_RPM + correction;
 PID_RightRPM = MID_RPM - correction;

 moveForward(PID_LeftRPM, PID_RightRPM);





}

void lineFollowNormalWorked(){
 if( PORTB.B5  == 1){

 if(  PORTD.B4 ==0 &&  PORTD.B5 ==1 &&  PORTD.B6 ==1 &&  PORTD.B7 ==0 &&  PORTB.B2 ==0)
 moveForward(SLOW_PWM,FAST_PWM);
 else if(  PORTD.B4 ==0 &&  PORTD.B5 ==1 &&  PORTD.B6 ==1 &&  PORTD.B7 ==1 &&  PORTB.B2 ==0)
 moveForward(FAST_PWM,FAST_PWM);
 else if(  PORTD.B4 ==0 &&  PORTD.B5 ==0 &&  PORTD.B6 ==1 &&  PORTD.B7 ==0 &&  PORTB.B2 ==0)
 moveForward(FAST_PWM,FAST_PWM);
 else if(  PORTD.B4 ==0 &&  PORTD.B5 ==0 &&  PORTD.B6 ==1 &&  PORTD.B7 ==1 &&  PORTB.B2 ==0)
 moveForward(FAST_PWM,SLOW_PWM);




 else if(  PORTD.B4 ==1 &&  PORTD.B5 ==0 &&  PORTD.B6 ==0 &&  PORTD.B7 ==0 &&  PORTB.B2 ==0)

 turnLeft(FAST_PWM);
 else if(  PORTD.B4 ==1 &&  PORTD.B5 ==1 &&  PORTD.B6 ==0 &&  PORTD.B7 ==0 &&  PORTB.B2 ==0)

 turnLeft(FAST_PWM);
 else if(  PORTD.B4 ==1 &&  PORTD.B5 ==1 &&  PORTD.B6 ==1 &&  PORTD.B7 ==0 &&  PORTB.B2 ==0)

 turnLeft(FAST_PWM);
 else if(  PORTD.B4 ==0 &&  PORTD.B5 ==1 &&  PORTD.B6 ==0 &&  PORTD.B7 ==0 &&  PORTB.B2 ==0)

 turnLeft(FAST_PWM);


 else if(  PORTD.B4 ==0 &&  PORTD.B5 ==0 &&  PORTD.B6 ==0 &&  PORTD.B7 ==1 &&  PORTB.B2 ==0)

 turnRight(FAST_PWM);
 else if(  PORTD.B4 ==0 &&  PORTD.B5 ==0 &&  PORTD.B6 ==1 &&  PORTD.B7 ==1 &&  PORTB.B2 ==1)

 turnRight(FAST_PWM);
 else if(  PORTD.B4 ==0 &&  PORTD.B5 ==0 &&  PORTD.B6 ==0 &&  PORTD.B7 ==1 &&  PORTB.B2 ==1)

 turnRight(FAST_PWM);
 else if(  PORTD.B4 ==0 &&  PORTD.B5 ==0 &&  PORTD.B6 ==0 &&  PORTD.B7 ==0 &&  PORTB.B2 ==1)

 turnRight(FAST_PWM);


 else if(  PORTD.B4 ==1 &&  PORTD.B5 ==1 &&  PORTD.B6 ==1 &&  PORTD.B7 ==1 &&  PORTB.B2 ==0)
 moveForward(FAST_PWM,FAST_PWM);
 else if(  PORTD.B4 ==0 &&  PORTD.B5 ==1 &&  PORTD.B6 ==1 &&  PORTD.B7 ==1 &&  PORTB.B2 ==1)
 moveForward(FAST_PWM,FAST_PWM);
 else if(  PORTB.B4 ==0 &&  PORTB.B3 ==0 &&  PORTD.B4 ==0 &&  PORTD.B5 ==0 &&  PORTD.B6 ==0 &&  PORTD.B7 ==0 &&  PORTB.B2 ==0 &&  PORTB.B6 ==0 &&  PORTB.B7 ==0)
 moveForward(255,255);

 else if(isAllBlack()){


 sendSensorStatus();
 }
 else{

 reverse(220,220);
 sendSensorStatus();

 }
 }

 else{




 if(  PORTB.B4 ==1 &&  PORTB.B3 ==1 &&  PORTD.B4 ==1 &&  PORTD.B5 ==1 &&  PORTD.B6 ==1 &&  PORTD.B7 ==0 &&  PORTB.B2 ==0 &&  PORTB.B6 ==0 &&  PORTB.B7 ==0)
 rotateByDegree(-90);
 else if(  PORTB.B4 ==1 &&  PORTB.B3 ==1 &&  PORTD.B4 ==1 &&  PORTD.B5 ==1 &&  PORTD.B6 ==1 &&  PORTD.B7 ==1 &&  PORTB.B2 ==0 &&  PORTB.B6 ==0 &&  PORTB.B7 ==0)
 rotateByDegree(-90);
 else if(  PORTB.B4 ==1 &&  PORTB.B3 ==1 &&  PORTD.B4 ==1 &&  PORTD.B5 ==1 &&  PORTD.B6 ==1 &&  PORTD.B7 ==1 &&  PORTB.B2 ==1 &&  PORTB.B6 ==0 &&  PORTB.B7 ==0)
 rotateByDegree(-90);


 else if(  PORTB.B4 ==0 &&  PORTB.B3 ==0 &&  PORTD.B4 ==1 &&  PORTD.B5 ==1 &&  PORTD.B6 ==1 &&  PORTD.B7 ==1 &&  PORTB.B2 ==1 &&  PORTB.B6 ==1 &&  PORTB.B7 ==1)
 rotateByDegree(90);
 else if(  PORTB.B4 ==0 &&  PORTB.B3 ==0 &&  PORTD.B4 ==0 &&  PORTD.B5 ==1 &&  PORTD.B6 ==1 &&  PORTD.B7 ==1 &&  PORTB.B2 ==1 &&  PORTB.B6 ==1 &&  PORTB.B7 ==1)
 rotateByDegree(90);
 else if(  PORTB.B4 ==0 &&  PORTB.B3 ==0 &&  PORTD.B4 ==0 &&  PORTD.B5 ==0 &&  PORTD.B6 ==1 &&  PORTD.B7 ==1 &&  PORTB.B2 ==1 &&  PORTB.B6 ==1 &&  PORTB.B7 ==1)
 rotateByDegree(90);




 else if(  PORTD.B4 ==1 &&  PORTD.B5 ==0 &&  PORTD.B6 ==0 &&  PORTD.B7 ==0 &&  PORTB.B2 ==0)

 turnLeft(FAST_PWM);
 else if(  PORTD.B4 ==1 &&  PORTD.B5 ==1 &&  PORTD.B6 ==0 &&  PORTD.B7 ==0 &&  PORTB.B2 ==0)

 turnLeft(FAST_PWM);
 else if(  PORTD.B4 ==1 &&  PORTD.B5 ==1 &&  PORTD.B6 ==1 &&  PORTD.B7 ==0 &&  PORTB.B2 ==0)

 turnLeft(FAST_PWM);
 else if(  PORTD.B4 ==0 &&  PORTD.B5 ==1 &&  PORTD.B6 ==0 &&  PORTD.B7 ==0 &&  PORTB.B2 ==0)

 turnLeft(FAST_PWM);


 else if(  PORTD.B4 ==0 &&  PORTD.B5 ==0 &&  PORTD.B6 ==0 &&  PORTD.B7 ==1 &&  PORTB.B2 ==0)

 turnRight(FAST_PWM);
 else if(  PORTD.B4 ==0 &&  PORTD.B5 ==0 &&  PORTD.B6 ==1 &&  PORTD.B7 ==1 &&  PORTB.B2 ==1)

 turnRight(FAST_PWM);
 else if(  PORTD.B4 ==0 &&  PORTD.B5 ==0 &&  PORTD.B6 ==0 &&  PORTD.B7 ==1 &&  PORTB.B2 ==1)

 turnRight(FAST_PWM);
 else if(  PORTD.B4 ==0 &&  PORTD.B5 ==0 &&  PORTD.B6 ==0 &&  PORTD.B7 ==0 &&  PORTB.B2 ==1)

 turnRight(FAST_PWM);


 else if(  PORTD.B4 ==1 &&  PORTD.B5 ==1 &&  PORTD.B6 ==1 &&  PORTD.B7 ==1 &&  PORTB.B2 ==0)
 moveForward(SLOW_PWM,FAST_PWM);
 else if(  PORTD.B4 ==0 &&  PORTD.B5 ==1 &&  PORTD.B6 ==1 &&  PORTD.B7 ==1 &&  PORTB.B2 ==1)
 moveForward(FAST_PWM,SLOW_PWM);
 else if(  PORTB.B3 ==1 &&  PORTD.B4 ==1 &&  PORTD.B5 ==1 &&  PORTD.B6 ==0 &&  PORTD.B7 ==1 &&  PORTB.B2 ==1 &&  PORTB.B6 ==1)
 while( PORTB.B5 ==0)
 rotateAntiClockwise(255);
 else if(  PORTB.B4 ==0 &&  PORTB.B3 ==0 &&  PORTD.B4 ==0 &&  PORTD.B5 ==0 &&  PORTD.B6 ==0 &&  PORTD.B7 ==0 &&  PORTB.B2 ==0 &&  PORTB.B6 ==1 &&  PORTB.B7 ==1)
 while( PORTB.B5 ==0)
 rotateClockwise(255);
 else if(  PORTB.B4 ==1 &&  PORTB.B3 ==1 &&  PORTD.B4 ==0 &&  PORTD.B5 ==0 &&  PORTD.B6 ==0 &&  PORTD.B7 ==0 &&  PORTB.B2 ==0 &&  PORTB.B6 ==0 &&  PORTB.B7 ==0)
 while( PORTB.B5 ==0)
 rotateAntiClockwise(255);


 else if(  PORTD.B4 ==0 &&  PORTD.B5 ==1 &&  PORTD.B6 ==1 &&  PORTD.B7 ==0 &&  PORTB.B2 ==0)
 moveForward(SLOW_PWM,FAST_PWM);
 else if(  PORTD.B4 ==0 &&  PORTD.B5 ==1 &&  PORTD.B6 ==1 &&  PORTD.B7 ==1 &&  PORTB.B2 ==0)
 moveForward(FAST_PWM,FAST_PWM);
 else if(  PORTD.B4 ==0 &&  PORTD.B5 ==0 &&  PORTD.B6 ==1 &&  PORTD.B7 ==0 &&  PORTB.B2 ==0)
 moveForward(FAST_PWM,FAST_PWM);
 else if(  PORTD.B4 ==0 &&  PORTD.B5 ==0 &&  PORTD.B6 ==1 &&  PORTD.B7 ==1 &&  PORTB.B2 ==0)
 moveForward(FAST_PWM,SLOW_PWM);


 else if(isAllWhite()){


 sendSensorStatus();
 }
 else{

 reverse(220,220);
 sendSensorStatus();

 }
 }
}

int isOnThePath(){
 if((( PORTD.B4 ==0 &&  PORTD.B5 ==1 &&  PORTD.B6 ==1 &&  PORTD.B7 ==0 &&  PORTB.B2 ==0) || (  PORTD.B4 ==0 &&  PORTD.B5 ==1 &&  PORTD.B6 ==1 &&  PORTD.B7 ==1 &&  PORTB.B2 ==0) || (  PORTD.B4 ==0 &&  PORTD.B5 ==0 &&  PORTD.B6 ==1 &&  PORTD.B7 ==0 &&  PORTB.B2 ==0) || (  PORTD.B4 ==0 &&  PORTD.B5 ==0 &&  PORTD.B6 ==1 &&  PORTD.B7 ==1 &&  PORTB.B2 ==0)) &&  PORTB.B4 ==0 &&  PORTB.B3 ==0 &&  PORTB.B6 ==0 &&  PORTB.B7 ==0)
 return 1;
 else
 return 0;
}

void lineFollow(){

 while(1){
 if( ( PORTD.B4 ==1 ||  PORTD.B5 ==1 ||  PORTD.B6 ==1 ||  PORTD.B7 ==1 ||  PORTB.B2 ==1) &&  PORTB.B4 ==0 &&  PORTB.B3 ==0 &&  PORTB.B6 ==0 &&  PORTB.B7 ==0 ){

 debugText = "Line follow PID..   ";
 UART1_Write_Text(debugText);
 sendSensorStatus();
 lineFollowPID();
 }
 else if( !(  PORTB.B5 ==1 &&  PORTB.B4 ==1 &&  PORTB.B3 ==1 &&  PORTD.B4 ==1 &&  PORTD.B5 ==1 &&  PORTD.B6 ==1 &&  PORTD.B7 ==1 &&  PORTB.B2 ==1 &&  PORTB.B6 ==1 &&  PORTB.B7 ==1) || !(  PORTB.B5 ==0 &&  PORTB.B4 ==0 &&  PORTB.B3 ==0 &&  PORTD.B4 ==0 &&  PORTD.B5 ==0 &&  PORTD.B6 ==0 &&  PORTD.B7 ==0 &&  PORTB.B2 ==0 &&  PORTB.B6 ==0 &&  PORTB.B7 ==0)){

 debugText = "Line follow Normal..   ";
 UART1_Write_Text(debugText);
 sendSensorStatus();
 lineFollowNormal();
 }
 else if((  PORTB.B5 ==1 &&  PORTB.B4 ==1 &&  PORTB.B3 ==1 &&  PORTD.B4 ==1 &&  PORTD.B5 ==1 &&  PORTD.B6 ==1 &&  PORTD.B7 ==1 &&  PORTB.B2 ==1 &&  PORTB.B6 ==1 &&  PORTB.B7 ==1) || !(  PORTB.B5 ==0 &&  PORTB.B4 ==0 &&  PORTB.B3 ==0 &&  PORTD.B4 ==0 &&  PORTD.B5 ==0 &&  PORTD.B6 ==0 &&  PORTD.B7 ==0 &&  PORTB.B2 ==0 &&  PORTB.B6 ==0 &&  PORTB.B7 ==0)){

 stop();
 sendSensorStatus();

 }
 }
}

void lineFollowNormal(){
 while(1){
 if(  PORTB.B5 ==1 &&  PORTB.B4 ==1 &&  PORTB.B3 ==1 &&  PORTD.B4 ==1 &&  PORTD.B5 ==1 &&  PORTD.B6 ==1 &&  PORTD.B7 ==1 &&  PORTB.B2 ==1 &&  PORTB.B6 ==1 &&  PORTB.B7 ==1){
 stop();
 }
 else if( ( PORTB.B5 ==0 &&  PORTB.B4 ==0 &&  PORTB.B3 ==0 &&  PORTD.B4 ==0 &&  PORTD.B5 ==1 &&  PORTD.B6 ==1 &&  PORTD.B7 ==1 &&  PORTB.B2 ==1 &&  PORTB.B6 ==1 &&  PORTB.B7 ==1) || ( PORTB.B5 ==0 &&  PORTB.B4 ==0 &&  PORTB.B3 ==0 &&  PORTD.B4 ==0 &&  PORTD.B5 ==0 &&  PORTD.B6 ==1 &&  PORTD.B7 ==1 &&  PORTB.B2 ==1 &&  PORTB.B6 ==1 &&  PORTB.B7 ==1)){

 debugText = "90 to right..   ";
 UART1_Write_Text(debugText);
 sendSensorStatus();
 while( PORTB.B5 ==0){
 rotateClockwise(TEST_RPM);
 }
 }
 else if( ( PORTB.B5 ==0 &&  PORTB.B4 ==1 &&  PORTB.B3 ==1 &&  PORTD.B4 ==1 &&  PORTD.B5 ==1 &&  PORTD.B6 ==1 &&  PORTD.B7 ==0 &&  PORTB.B2 ==0 &&  PORTB.B6 ==0 &&  PORTB.B7 ==0) && ( PORTB.B5 ==0 &&  PORTB.B4 ==1 &&  PORTB.B3 ==1 &&  PORTD.B4 ==1 &&  PORTD.B5 ==1 &&  PORTD.B6 ==0 &&  PORTD.B7 ==0 &&  PORTB.B2 ==0 &&  PORTB.B6 ==0 &&  PORTB.B7 ==0)){

 debugText = "90 to left..   ";
 UART1_Write_Text(debugText);
 sendSensorStatus();
 while( PORTB.B5 ==0){
 rotateAntiClockwise(TEST_RPM);
 }
 }
 else if(  PORTD.B5 ==1 &&  PORTD.B6 ==1){

 moveForward(TEST_RPM,TEST_RPM);
 }
 else if(  PORTD.B5 ==1 &&  PORTD.B6 ==0 &&  PORTB.B5 ==1){

 turnLeft(TEST_RPM);
 }
 else if(  PORTD.B5 ==0 &&  PORTD.B6 ==1 &&  PORTB.B5 ==1){

 turnRight(TEST_RPM);
 }
 else if(  PORTD.B5 ==1 &&  PORTD.B6 ==0 &&  PORTB.B5 ==0){

 stop();

 rotateAntiClockwise(TEST_RPM);
 }
 else if(  PORTD.B5 ==0 &&  PORTD.B6 ==1 &&  PORTB.B5 ==0){

 stop();

 rotateClockwise(TEST_RPM);
 }
 else if(  PORTD.B5 ==0 &&  PORTD.B6 ==0 ){
 if( PORTD.B4  ==1){
 rotateAntiClockwise(TEST_RPM);
 }
 else if( PORTD.B7  ==1){
 rotateClockwise(TEST_RPM);
 }
 else if( PORTB.B3  ==1){
 rotateAntiClockwise(TEST_RPM);
 }
 else if( PORTB.B2  ==1){
 rotateClockwise(TEST_RPM);
 }

 else{
 stop();


 }
 }

 }

}

void lineFollowNormalWorkedForLast(){
 if( PORTB.B5  == 1){

 if(  PORTD.B4 ==0 &&  PORTD.B5 ==1 &&  PORTD.B6 ==1 &&  PORTD.B7 ==0 &&  PORTB.B2 ==0)
 moveForward(SLOW_PWM,FAST_PWM);
 else if(  PORTD.B4 ==0 &&  PORTD.B5 ==1 &&  PORTD.B6 ==1 &&  PORTD.B7 ==1 &&  PORTB.B2 ==0)
 moveForward(FAST_PWM,FAST_PWM);
 else if(  PORTD.B4 ==0 &&  PORTD.B5 ==0 &&  PORTD.B6 ==1 &&  PORTD.B7 ==0 &&  PORTB.B2 ==0)
 moveForward(FAST_PWM,FAST_PWM);
 else if(  PORTD.B4 ==0 &&  PORTD.B5 ==0 &&  PORTD.B6 ==1 &&  PORTD.B7 ==1 &&  PORTB.B2 ==0)
 moveForward(FAST_PWM,SLOW_PWM);




 else if(  PORTD.B4 ==1 &&  PORTD.B5 ==0 &&  PORTD.B6 ==0 &&  PORTD.B7 ==0 &&  PORTB.B2 ==0)

 turnLeft(FAST_PWM);
 else if(  PORTD.B4 ==1 &&  PORTD.B5 ==1 &&  PORTD.B6 ==0 &&  PORTD.B7 ==0 &&  PORTB.B2 ==0)

 turnLeft(FAST_PWM);
 else if(  PORTD.B4 ==1 &&  PORTD.B5 ==1 &&  PORTD.B6 ==1 &&  PORTD.B7 ==0 &&  PORTB.B2 ==0)

 turnLeft(FAST_PWM);
 else if(  PORTD.B4 ==0 &&  PORTD.B5 ==1 &&  PORTD.B6 ==0 &&  PORTD.B7 ==0 &&  PORTB.B2 ==0)

 turnLeft(FAST_PWM);


 else if(  PORTD.B4 ==0 &&  PORTD.B5 ==0 &&  PORTD.B6 ==0 &&  PORTD.B7 ==1 &&  PORTB.B2 ==0)

 turnRight(FAST_PWM);
 else if(  PORTD.B4 ==0 &&  PORTD.B5 ==0 &&  PORTD.B6 ==1 &&  PORTD.B7 ==1 &&  PORTB.B2 ==1)

 turnRight(FAST_PWM);
 else if(  PORTD.B4 ==0 &&  PORTD.B5 ==0 &&  PORTD.B6 ==0 &&  PORTD.B7 ==1 &&  PORTB.B2 ==1)

 turnRight(FAST_PWM);
 else if(  PORTD.B4 ==0 &&  PORTD.B5 ==0 &&  PORTD.B6 ==0 &&  PORTD.B7 ==0 &&  PORTB.B2 ==1)

 turnRight(FAST_PWM);


 else if(  PORTD.B4 ==1 &&  PORTD.B5 ==1 &&  PORTD.B6 ==1 &&  PORTD.B7 ==1 &&  PORTB.B2 ==0)
 moveForward(FAST_PWM,FAST_PWM);
 else if(  PORTD.B4 ==0 &&  PORTD.B5 ==1 &&  PORTD.B6 ==1 &&  PORTD.B7 ==1 &&  PORTB.B2 ==1)
 moveForward(FAST_PWM,FAST_PWM);
 else if(  PORTB.B4 ==0 &&  PORTB.B3 ==0 &&  PORTD.B4 ==0 &&  PORTD.B5 ==0 &&  PORTD.B6 ==0 &&  PORTD.B7 ==0 &&  PORTB.B2 ==0 &&  PORTB.B6 ==0 &&  PORTB.B7 ==0)
 moveForward(255,255);

 else if(isAllBlack()){


 sendSensorStatus();
 }
 else{

 moveForward(205,200);
 sendSensorStatus();

 }
 }

 else{




 if(  PORTB.B4 ==1 &&  PORTB.B3 ==1 &&  PORTD.B4 ==1 &&  PORTD.B5 ==1 &&  PORTD.B6 ==1 &&  PORTD.B7 ==0 &&  PORTB.B2 ==0 &&  PORTB.B6 ==0 &&  PORTB.B7 ==0)
 rotateByDegree(-90);
 else if(  PORTB.B4 ==1 &&  PORTB.B3 ==1 &&  PORTD.B4 ==1 &&  PORTD.B5 ==1 &&  PORTD.B6 ==1 &&  PORTD.B7 ==1 &&  PORTB.B2 ==0 &&  PORTB.B6 ==0 &&  PORTB.B7 ==0)
 rotateByDegree(-90);
 else if(  PORTB.B4 ==1 &&  PORTB.B3 ==1 &&  PORTD.B4 ==1 &&  PORTD.B5 ==1 &&  PORTD.B6 ==1 &&  PORTD.B7 ==1 &&  PORTB.B2 ==1 &&  PORTB.B6 ==0 &&  PORTB.B7 ==0)
 rotateByDegree(-90);


 else if(  PORTB.B4 ==0 &&  PORTB.B3 ==0 &&  PORTD.B4 ==1 &&  PORTD.B5 ==1 &&  PORTD.B6 ==1 &&  PORTD.B7 ==1 &&  PORTB.B2 ==1 &&  PORTB.B6 ==1 &&  PORTB.B7 ==1)
 rotateByDegree(90);
 else if(  PORTB.B4 ==0 &&  PORTB.B3 ==0 &&  PORTD.B4 ==0 &&  PORTD.B5 ==1 &&  PORTD.B6 ==1 &&  PORTD.B7 ==1 &&  PORTB.B2 ==1 &&  PORTB.B6 ==1 &&  PORTB.B7 ==1)
 rotateByDegree(90);
 else if(  PORTB.B4 ==0 &&  PORTB.B3 ==0 &&  PORTD.B4 ==0 &&  PORTD.B5 ==0 &&  PORTD.B6 ==1 &&  PORTD.B7 ==1 &&  PORTB.B2 ==1 &&  PORTB.B6 ==1 &&  PORTB.B7 ==1)
 rotateByDegree(90);




 else if(  PORTD.B4 ==1 &&  PORTD.B5 ==0 &&  PORTD.B6 ==0 &&  PORTD.B7 ==0 &&  PORTB.B2 ==0)

 turnLeft(FAST_PWM);
 else if(  PORTD.B4 ==1 &&  PORTD.B5 ==1 &&  PORTD.B6 ==0 &&  PORTD.B7 ==0 &&  PORTB.B2 ==0)

 turnLeft(FAST_PWM);
 else if(  PORTD.B4 ==1 &&  PORTD.B5 ==1 &&  PORTD.B6 ==1 &&  PORTD.B7 ==0 &&  PORTB.B2 ==0)

 turnLeft(FAST_PWM);
 else if(  PORTD.B4 ==0 &&  PORTD.B5 ==1 &&  PORTD.B6 ==0 &&  PORTD.B7 ==0 &&  PORTB.B2 ==0)

 turnLeft(FAST_PWM);


 else if(  PORTD.B4 ==0 &&  PORTD.B5 ==0 &&  PORTD.B6 ==0 &&  PORTD.B7 ==1 &&  PORTB.B2 ==0)

 turnRight(FAST_PWM);
 else if(  PORTD.B4 ==0 &&  PORTD.B5 ==0 &&  PORTD.B6 ==1 &&  PORTD.B7 ==1 &&  PORTB.B2 ==1)

 turnRight(FAST_PWM);
 else if(  PORTD.B4 ==0 &&  PORTD.B5 ==0 &&  PORTD.B6 ==0 &&  PORTD.B7 ==1 &&  PORTB.B2 ==1)

 turnRight(FAST_PWM);
 else if(  PORTD.B4 ==0 &&  PORTD.B5 ==0 &&  PORTD.B6 ==0 &&  PORTD.B7 ==0 &&  PORTB.B2 ==1)

 turnRight(FAST_PWM);


 else if(  PORTD.B4 ==1 &&  PORTD.B5 ==1 &&  PORTD.B6 ==1 &&  PORTD.B7 ==1 &&  PORTB.B2 ==0)
 moveForward(SLOW_PWM,FAST_PWM);
 else if(  PORTD.B4 ==0 &&  PORTD.B5 ==1 &&  PORTD.B6 ==1 &&  PORTD.B7 ==1 &&  PORTB.B2 ==1)
 moveForward(FAST_PWM,SLOW_PWM);
 else if(  PORTB.B3 ==1 &&  PORTD.B4 ==1 &&  PORTD.B5 ==1 &&  PORTD.B6 ==0 &&  PORTD.B7 ==1 &&  PORTB.B2 ==1 &&  PORTB.B6 ==1)
 while( PORTB.B5 ==0)
 rotateAntiClockwise(255);
 else if(  PORTB.B4 ==0 &&  PORTB.B3 ==0 &&  PORTD.B4 ==0 &&  PORTD.B5 ==0 &&  PORTD.B6 ==0 &&  PORTD.B7 ==0 &&  PORTB.B2 ==0 &&  PORTB.B6 ==1 &&  PORTB.B7 ==1)
 while( PORTB.B5 ==0)
 rotateClockwise(255);
 else if(  PORTB.B4 ==1 &&  PORTB.B3 ==1 &&  PORTD.B4 ==0 &&  PORTD.B5 ==0 &&  PORTD.B6 ==0 &&  PORTD.B7 ==0 &&  PORTB.B2 ==0 &&  PORTB.B6 ==0 &&  PORTB.B7 ==0)
 while( PORTB.B5 ==0)
 rotateAntiClockwise(255);


 else if(  PORTD.B4 ==0 &&  PORTD.B5 ==1 &&  PORTD.B6 ==1 &&  PORTD.B7 ==0 &&  PORTB.B2 ==0)
 moveForward(SLOW_PWM,FAST_PWM);
 else if(  PORTD.B4 ==0 &&  PORTD.B5 ==1 &&  PORTD.B6 ==1 &&  PORTD.B7 ==1 &&  PORTB.B2 ==0)
 moveForward(FAST_PWM,FAST_PWM);
 else if(  PORTD.B4 ==0 &&  PORTD.B5 ==0 &&  PORTD.B6 ==1 &&  PORTD.B7 ==0 &&  PORTB.B2 ==0)
 moveForward(FAST_PWM,FAST_PWM);
 else if(  PORTD.B4 ==0 &&  PORTD.B5 ==0 &&  PORTD.B6 ==1 &&  PORTD.B7 ==1 &&  PORTB.B2 ==0)
 moveForward(FAST_PWM,SLOW_PWM);


 else if(isAllWhite()){


 sendSensorStatus();
 }
 else{

 moveForward(205,200);
 sendSensorStatus();

 }
 }
}
#line 1 "d:/robotics/sliit- robofest 2012/programing/main code/main 6.0v/configuration.h"






int LEVEL, LEVEL1_STATE, LEVEL2_STATE, LEVEL3_STATE;

void configure(){


 TRISA = 0b11001010;
 TRISB = 0b11111111;
 TRISC = 0b00000000;
 TRISD = 0b11110010;
 TRISE = 0b00000101;

 PORTA = 0;
 PORTB = 0;
 PORTC = 0;
 PORTD = 0;
 PORTE = 0;

 PWM1_Init(5000);
 PWM2_Init(5000);
 PWM1_Start();
 PWM2_Start();
 UART1_Init(9600);







 ADCON0 = 0b11000001;
 ADCON1 = 0b00000110;







 LEVEL = 0;
 LEVEL1_STATE =  0 ;
 LEVEL2_STATE =  0 ;
 LEVEL3_STATE =  0 ;


 T0CON=0xC3;
 TMR0L=0x00;
 INTCON.TMR0IE=1;

 T1CON=0x80;
 TMR1H=0x00;
 TMR1L=0x00;
}
#line 1 "d:/robotics/sliit- robofest 2012/programing/main code/main 6.0v/ir.h"




unsigned int ir_value;
float voltage;

int getDistanceIR_GP2D120(char sensor);

float getDistanceIR_GP2D120(char sensor){
 if (sensor == 'M'){
 ir_value = ADC_Read( PORTA.B0 );
 }
 else if(sensor == 'R'){
 ir_value = ADC_Read( PORTA.B1 );
 }
 else if(sensor == 'L'){
 ir_value = ADC_Read( PORTA.B2 );
 }
 else
 ir_value = 0;

 voltage = (float)ir_value/1024*5;
 if( 610<=ir_value && ir_value<623)
 return 3.0 - 12.5*(voltage - 3.04);

 else if( 557<=ir_value && ir_value<610 )
 return 3.75 - 1.04*(voltage - 2.98);

 else if( 481<=ir_value && ir_value<557 )
 return 5 - 2.5*(voltage - 2.75);

 else if( 409<=ir_value && ir_value<481 )
 return 6 - 2.85*(voltage - 2.35);

 else if( 364<=ir_value && ir_value<409 )
 return 7 - 4*(voltage - 2);

 else if( 317<=ir_value && ir_value<364 )
 return 8 - 5*(voltage - 1.75);

 else if( 286<=ir_value && ir_value<317 )
 return 9 - 6.667*(voltage - 1.55);

 else if( 256<=ir_value && ir_value<286 )
 return 10 - 6.667*(voltage - 1.4);

 else if( 215<=ir_value && ir_value<256 )
 return 12 - 10*(voltage - 1.25);

 else if( 186<=ir_value && ir_value<215 )
 return 14 - 15.38*(voltage - 1.05);

 else if( 166<=ir_value && ir_value<186 )
 return 16 - 20*(voltage - 0.94);

 else if( 147<=ir_value && ir_value<166 )
 return 18 - 22.23*(voltage - 0.81);

 else if( 133<=ir_value && ir_value<147 )
 return 20 - 28.57*(voltage - 0.65);

 else if( 106<=ir_value && ir_value<133 )
 return 25 - 45.45*(voltage - 0.52);

 else if( 88<=ir_value && ir_value<106 )
 return 30 - 55*(voltage - 0.43);

 else if( 78<=ir_value && ir_value<88 )
 return 35 - 100*(voltage - 0.38);

 else if( 65<=ir_value && ir_value<78 )
 return 40 - 83.33*(voltage - 0.32);
 else
 return 50;
}
#line 1 "d:/robotics/sliit- robofest 2012/programing/main code/main 6.0v/sonar.h"







int _counter, _distanceSonar;
float _responseTime, _distance;
float getSonarDistance();
unsigned short getDistanceSonar2(char Sensor);


float getSonarDistance(){
  PORTA.B5  = 0;
 delay_us(10);
  PORTA.B5  = 1;
 delay_us(10);
  PORTA.B5  = 0;

 while( PORTE.B0 ==0);
 _counter = 0;

 while( PORTE.B0 ==1){
 _counter++;
 }
 _responseTime = _counter * 0.2 * 0.000001;
 _distance = 340 * _responseTime * 100 /2;
 return _distance;
}

unsigned short getDistanceSonar2(char Sensor){
 unsigned double x,y;
 unsigned int L;
 unsigned int H;
 TMR1H=0x00;
 TMR1L=0x00;
 if(Sensor=='M'){

  PORTA.B5  = 0;
 delay_us(2);
  PORTA.B5  = 1;
 delay_us(5);
  PORTA.B5  =0;

 while(! PORTE.B0 )
 {
 L=(TMR1L);
 H=(TMR1H);
 if(H>0xF0)
 break;
 }
 TMR1H=0;
 TMR1L=0;
 T1CON.TMR1ON=1;
 while( PORTE.B0 )
 {
 L=(TMR1L);
 H=(TMR1H);
 if(H>0xF0)
 break;
 }
 L=(TMR1L);
 H=(TMR1H);
 x=(H*256 + L)*0.2;
 y= (x/2)/29.1;
 return (int)y;
 }
 else if(Sensor == 'R'){
  PORTA.B0  = 0;
 delay_us(2);
  PORTA.B0  = 1;
 delay_us(5);
  PORTA.B0  =0;

 while(! PORTA.B1 )
 {
 L=(TMR1L);
 H=(TMR1H);
 if(H>0xF0)
 break;
 }
 TMR1H=0;
 TMR1L=0;
 T1CON.TMR1ON=1;
 while( PORTA.B1 )
 {
 L=(TMR1L);
 H=(TMR1H);
 if(H>0xF0)
 break;
 }
 L=(TMR1L);
 H=(TMR1H);
 x=(H*256 + L)*0.2;
 y= (x/2)/29.1;
 return (int)y;
 }
 else if(Sensor == 'L'){
  PORTA.B2  = 0;
 delay_us(2);
  PORTA.B2  = 1;
 delay_us(5);
  PORTA.B2  =0;

 while(! PORTA.B3 )
 {
 L=(TMR1L);
 H=(TMR1H);
 if(H>0xF0)
 break;
 }
 TMR1H=0;
 TMR1L=0;
 T1CON.TMR1ON=1;
 while( PORTA.B3 )
 {
 L=(TMR1L);
 H=(TMR1H);
 if(H>0xF0)
 break;
 }
 L=(TMR1L);
 H=(TMR1H);
 x=(H*256 + L)*0.2;
 y= (x/2)/29.1;
 return (int)y;
 }
}
#line 7 "D:/Robotics/SLIIT- Robofest 2012/Programing/Main Code/Main 6.0v/Main 6.0V.c"
unsigned short distanceSonar;
float distanceIR;
int distanceInt;
int DIRECTION = 0;
int ROTATION_ANGLE, odd, degree;

int isRightSafe();
int isMiddleSafe();
int isLeftSafe();
void moveStraightSlow();
void moveStraightFast();
void goThroughObstacles();
void goThroughObstaclesJay();
void goThroughObstaclesWorking();
void level3Aligning();
int isPathClear();
void checkSonar(char Sensor);

void level3Aligning(){
 while( PORTD.B5  == 0 ||  PORTD.B6  == 0 ||  PORTD.B7  == 0)
 reverse(220,220);
 delay_ms(1);
 stop();
 sendText("Sensor5 at LEVEL 2 ");
 delay_ms(500);
 while( PORTB.B4 ==0 ||  PORTB.B3 ==0 ||  PORTD.B4 ==0 ||  PORTD.B5 ==0 ||  PORTD.B6 ==0 ||  PORTD.B7 ==0 ||  PORTB.B2 ==0 ||  PORTB.B6 ==0 ||  PORTB.B7 ==0){
 if( PORTB.B7  == 1)
 rotateAntiClockwise(220);

 else if( PORTB.B4  == 1)
 rotateClockwise(220);

 }
 stop();
}

void level2Aligning(){
 while(( PORTB.B4  == 0 ||  PORTB.B3  == 0 ||  PORTD.B4  == 0 ||  PORTD.B5  == 0 ||  PORTD.B6  == 0 ||  PORTD.B7  == 0) && ( PORTD.B5  == 0 ||  PORTD.B6  == 0 ||  PORTD.B7  == 0 ||  PORTB.B2  == 0 ||  PORTB.B6  == 0 ||  PORTB.B7  == 0))
 moveForward(220,220);
 delay_ms(1);
 stop();
 sendText("Sensor5 at LEVEL 2 ");
 delay_ms(500);
 while( PORTB.B4 ==0 ||  PORTB.B3 ==0 ||  PORTD.B4 ==0 ||  PORTD.B5 ==0 ||  PORTD.B6 ==0 ||  PORTD.B7 ==0 ||  PORTB.B2 ==0 ||  PORTB.B6 ==0 ||  PORTB.B7 ==0){
 if( PORTB.B7  == 1)
 rotateClockwise(220);

 else if( PORTB.B4  == 1)
 rotateAntiClockwise(220);

 }
 stop();
}

void main() {
 configure();
 setPID();
 sendText("Starting...");
#line 76 "D:/Robotics/SLIIT- Robofest 2012/Programing/Main Code/Main 6.0v/Main 6.0V.c"
 LEVEL1_STATE =  0 ;
 sendText("Starting Block  ");
 LEVEL = 0;

 while(isAllWhite())
 moveStraightSlow();
 delay_ms(10);
 LEVEL = 1;
 sendText("Level 1 Starting  ");
 LEVEL1_STATE =  1 ;
 stop();



 moveForward(205,200);
 delay_ms(100);
 while(!isAllBlack()){

 if(  PORTB.B5 ==1 &&( PORTD.B4 ==1 ||  PORTD.B5 ==1 ||  PORTD.B6 ==1 ||  PORTD.B7 ==1 ||  PORTB.B2 ==1) &&  PORTB.B4 ==0 &&  PORTB.B3 ==0 &&  PORTB.B6 ==0 &&  PORTB.B7 ==0)
 lineFollowPID();
 else
 lineFollowNormalWorked();
 }
 stop();
 sendText("  End of Level 1. Level 2 Starting  ");
 LEVEL1_STATE =  2 ;
 LEVEL2_STATE =  1 ;
 LEVEL = 2;



 while(!isAllWhite() && LEVEL2_STATE !=  2 ){
 goThroughObstaclesJay();
 }

 stop();
 sendText("  End of Level 2. Level 3 Starting  ");
 LEVEL2_STATE =  2 ;
 LEVEL3_STATE =  1 ;
 LEVEL = 3;



 level3Aligning();



 moveStraightSlow();
 delay_ms(2000);

 rotateByDegree(-90);
 delay_ms(100);
 while(!isAllBlack()){

 if(!isAllWhite()){
 sendText("got a arrow..  ");
 lineFollowNormalWorkedForLast();
 sendSensorStatus();
 if((  PORTB.B4 ==0 &&  PORTB.B3 ==0 &&  PORTD.B4 ==0 &&  PORTD.B5 ==0 &&  PORTD.B6 ==1 &&  PORTD.B7 ==0 &&  PORTB.B2 ==0 &&  PORTB.B6 ==0 &&  PORTB.B7 ==0)){
 while( PORTD.B6 ==1)
 moveStraightSlow();
 while(isAllWhite())
 moveStraightSlow();
 }
 }
 else
 moveStraightSlow();

 if(getDistanceSonar2('M') < 5){
 rotateByDegree(90);
 delay_ms(100);
 rotateByDegree(90);
 delay_ms(100);
 delay_ms(1);
 }
 delay_ms(1);
 }

 stop();


}

int isRightSafe(){
 ir_value = ADC_Read( PORTA.B1 );
 if(250<=ir_value && ir_value<800){
 return  0 ;
 }
 return  1 ;
}

int isMiddleSafe(){
 ir_value = ADC_Read( PORTA.B0 );
 if(250<=ir_value && ir_value<800){
 return  0 ;
 }
 return  1 ;
}

int isLeftSafe(){
 ir_value = ADC_Read( PORTA.B2 );
 if(250<=ir_value && ir_value<800){
 return  0 ;
 }
 return  1 ;
}

void moveStraightSlow(){
 moveForward(205,200);
}

void moveStraightFast(){
 moveForward(255,250);
}

void goThroughObstaclesWorking(){
 ROTATION_ANGLE = 0;
 if(isPathClear() == 0) {

 for(counter = 1; counter <= 6; counter++) {

 if(counter % 2 == 0) {
 odd = -1;
 } else {
 odd = 1;
 }

 degree = odd * counter * 30;
 rotateByDegree(degree);
 ROTATION_ANGLE += degree;
 if(isPathClear() == 0) {
 continue;
 } else {
 break;
 }

 }
 }
 DIRECTION += ROTATION_ANGLE;
 moveStraightSlow();
 delay_ms(10);


 if(isAllWhite()) {

 if(abs(DIRECTION) >= 90) {
 sendText("Wrong Direction !!!");
 rotateByDegree(90);
 rotateByDegree(90);
 DIRECTION = 0;

 while(!isAllBlack()){
 moveStraightSlow();
 }
 } else {
 LEVEL2_STATE =  2 ;
 }

 }
}

void goThroughObstacles(){
 if(getDistanceSonar2('M') < 10 ){
 stop();
 if(DIRECTION<0){
 rotateByDegree(45);
 DIRECTION +=45;
 if(getDistanceSonar2('M') < 10 ){
 rotateByDegree(-45);
 rotateByDegree(-45);
 DIRECTION -=90;
 }
 }
 else{
 rotateByDegree(-45);
 DIRECTION -=45;
 if(getDistanceSonar2('M') < 10 ){
 rotateByDegree(45);
 rotateByDegree(45);
 DIRECTION +=90;
 }
 }
 }
 else{
 moveStraightFast();
 }
 delay_ms(10);
}

void goThroughObstaclesJay(){
 int ROTATION_ANGLE = 0;
 if(isPathClear() == 0) {
 rotateByDegree(30);
 ROTATION_ANGLE += 30;
 if(isPathClear() == 0) {
 rotateByDegree(-60);
 ROTATION_ANGLE += -60;
 if(isPathClear() == 0) {
 rotateByDegree(90);
 ROTATION_ANGLE += 90;
 if(isPathClear() == 0) {
 rotateByDegree(-90);
 rotateByDegree(-30);
 ROTATION_ANGLE += -120;
 if(isPathClear() == 0) {
 rotateByDegree(90);
 rotateByDegree(60);
 ROTATION_ANGLE += 150;
 if(isPathClear() == 0) {
 rotateByDegree(-90);
 rotateByDegree(-90);
 ROTATION_ANGLE += -180;
 }
 }
 }
 }
 }
 }
 DIRECTION += ROTATION_ANGLE;
 moveStraightSlow();
 delay_ms(10);

 if(isAllWhite()) {

 if(abs(DIRECTION) >= 90) {
 sendText("Wrong Direction !!!");
 rotateByDegree(90);
 rotateByDegree(90);

 DIRECTION = 0;
 level2Aligning();
 }
 else{
 sendText("Corrent Direction !!!");
 LEVEL2_STATE =  2 ;
 }
 }
}



int isPathClear() {
 if(getDistanceSonar2('L') < 5 || getDistanceSonar2('M') < 5 || getDistanceSonar2('R') < 5) {
 return 0;
 } else {
 return 1;
 }
}

void checkSonar(char Sensor){
 if(Sensor == 'L'){
 distanceSonar = getDistanceSonar2('L');
 if(distanceSonar < 10)
 sendText("Obstacle" );
 }
 else if(Sensor == 'M'){
 distanceSonar = getDistanceSonar2('M');
 if(distanceSonar < 10)
 sendText("Obstacle" );
 }
 else if(Sensor == 'R'){
 distanceSonar = getDistanceSonar2('R');
 if(distanceSonar < 10)
 sendText("Obstacle" );
 }
 delay_ms(500);
}
