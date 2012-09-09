#line 1 "D:/Robotics/SLIIT- Robofest 2012/Programing/Robo 2/Robo2 v1.1.c"
#line 1 "d:/robotics/sliit- robofest 2012/programing/robo 2/linefollow.h"
#line 1 "d:/robotics/sliit- robofest 2012/programing/robo 2/motion.h"
#line 19 "d:/robotics/sliit- robofest 2012/programing/robo 2/motion.h"
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
#line 1 "d:/robotics/sliit- robofest 2012/programing/robo 2/debug.h"



char* ConnectionEstablished = "Connection Established!";
char* debugText = "move forward";
int count, counter;

void sendSensorStatus();
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
#line 4 "d:/robotics/sliit- robofest 2012/programing/robo 2/linefollow.h"
float Kp, Ki, Kd;
int deviation, previousDeviation;
float correction, totalError;
int MIN_RPM, MID_RPM, MAX_RPM, TEST_RPM, PID_RightRPM, PID_LeftRPM;

void setPID();
void lineFollowNormal();
void lineFollowPID();
void lineFollow();

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
 while(!(( PORTD.B4 ==1 ||  PORTD.B5 ==1 ||  PORTD.B6 ==1 ||  PORTD.B7 ==1 ||  PORTB.B2 ==1) &&  PORTB.B4 ==0 &&  PORTB.B3 ==0 &&  PORTB.B6 ==0 &&  PORTB.B7 ==0)){
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

void setPID(){
 MIN_RPM = 185;
 MID_RPM = 180;
 MAX_RPM = 255;
 TEST_RPM = 200;

 Kp = 9;
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
 while( !( PORTD.B4 ==0 &&  PORTD.B5 ==0 &&  PORTD.B6 ==0 &&  PORTD.B7 ==0 &&  PORTB.B2 ==0) ){

 if( ( PORTB.B5 ==0 &&  PORTB.B4 ==0 &&  PORTB.B3 ==0 &&  PORTD.B4 ==0 &&  PORTD.B5 ==1 &&  PORTD.B6 ==1 &&  PORTD.B7 ==1 &&  PORTB.B2 ==1 &&  PORTB.B6 ==1 &&  PORTB.B7 ==1) || ( PORTB.B5 ==0 &&  PORTB.B4 ==0 &&  PORTB.B3 ==0 &&  PORTD.B4 ==0 &&  PORTD.B5 ==0 &&  PORTD.B6 ==1 &&  PORTD.B7 ==1 &&  PORTB.B2 ==1 &&  PORTB.B6 ==1 &&  PORTB.B7 ==1)){

 debugText = "90 to right..   ";
 UART1_Write_Text(debugText);
 sendSensorStatus();
 while( PORTB.B5 ==0){
 rotateClockwise(TEST_RPM);
 }
 }
 else if( ( PORTB.B5 ==0 &&  PORTB.B4 ==1 &&  PORTB.B3 ==1 &&  PORTD.B4 ==1 &&  PORTD.B5 ==1 &&  PORTB.B2 ==0 &&  PORTB.B6 ==0 &&  PORTB.B7 ==0) && ( PORTB.B5 ==0 &&  PORTB.B4 ==1 &&  PORTB.B3 ==1 &&  PORTD.B4 ==1 &&  PORTD.B5 ==1 &&  PORTB.B2 ==0 &&  PORTB.B6 ==0 &&  PORTB.B7 ==0)){

 debugText = "90 to left..   ";
 UART1_Write_Text(debugText);
 sendSensorStatus();
 while( PORTB.B5 ==0){
 rotateAntiClockwise(TEST_RPM);
 }
 }


 if(  PORTD.B4 ==1 &&  PORTD.B5 ==0 &&  PORTD.B6 ==0 &&  PORTD.B7 ==0 &&  PORTB.B2 ==0)
 deviation = 4;
 if(  PORTD.B4 ==1 &&  PORTD.B5 ==1 &&  PORTD.B6 ==0 &&  PORTD.B7 ==0 &&  PORTB.B2 ==0)
 deviation = 3;
 if(  PORTD.B4 ==1 &&  PORTD.B5 ==1 &&  PORTD.B6 ==1 &&  PORTD.B7 ==0 &&  PORTB.B2 ==0)
 deviation = 2;
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
 deviation = -2;
 if(  PORTD.B4 ==0 &&  PORTD.B5 ==0 &&  PORTD.B6 ==0 &&  PORTD.B7 ==1 &&  PORTB.B2 ==1)
 deviation = -3;
 if(  PORTD.B4 ==0 &&  PORTD.B5 ==0 &&  PORTD.B6 ==0 &&  PORTD.B7 ==0 &&  PORTB.B2 ==1)
 deviation = -4;

 correction = Kp*deviation + Ki*totalError + Kd*(deviation-previousDeviation);
 totalError += correction;
 previousDeviation = deviation;

 PID_LeftRPM = MID_RPM - correction;
 PID_RightRPM = MID_RPM + correction;

 moveForward(PID_LeftRPM, PID_RightRPM);

 }
 correction = 0;
 totalError = 0;

}
#line 1 "d:/robotics/sliit- robofest 2012/programing/robo 2/configuration.h"
void configure(){


 TRISA = 0b11111111;
 TRISB = 0b11111111;
 TRISC = 0b00000000;
 TRISD = 0b11110000;


 PORTA = 0;
 PORTB = 0;
 PORTC = 0;
 PORTD = 0;


 PWM1_Init(5000);
 PWM2_Init(5000);
 PWM1_Start();
 PWM2_Start();
 UART1_Init(9600);







 ADCON0 = 0b11000001;
 ADCON1 = 0b00000000;





}
#line 5 "D:/Robotics/SLIIT- Robofest 2012/Programing/Robo 2/Robo2 v1.1.c"
char command, command_old,error, receiveCommand;

void main() {
 configure();

 UART1_Write_Text(ConnectionEstablished);
 setPID();



 debugText = "          Starting..  ";
 UART1_Write_Text(debugText);

 delay_ms(1000);
 debugText = "Test Sensors   ";
 UART1_Write_Text(debugText);

 for(count=0; count<5; count++){
 receiveCommand = UART1_Read();
 sendSensorStatus();
 delay_ms(1000);
 }

 debugText = "Start Line follow..   ";
 UART1_Write_Text(debugText);

 lineFollow();
}
