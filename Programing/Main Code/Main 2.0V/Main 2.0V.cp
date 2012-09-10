#line 1 "D:/Robotics/SLIIT- Robofest 2012/Programing/Main Code/Main 2.0V/Main 2.0V.c"
#line 1 "d:/robotics/sliit- robofest 2012/programing/main code/main 2.0v/linefollow.h"
#line 1 "d:/robotics/sliit- robofest 2012/programing/main code/main 2.0v/motion.h"
#line 19 "d:/robotics/sliit- robofest 2012/programing/main code/main 2.0v/motion.h"
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
#line 1 "d:/robotics/sliit- robofest 2012/programing/main code/main 2.0v/debug.h"



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
#line 4 "d:/robotics/sliit- robofest 2012/programing/main code/main 2.0v/linefollow.h"
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

void setPID(){
 MIN_RPM = 185;
 MID_RPM = 200;
 MAX_RPM = 255;
 TEST_RPM = 220;

 Kp = 6;
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
#line 1 "d:/robotics/sliit- robofest 2012/programing/main code/main 2.0v/configuration.h"
void configure(){


 TRISA = 0b11111111;
 TRISB = 0b11111111;
 TRISC = 0b00000000;
 TRISD = 0b11110010;


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
#line 1 "d:/robotics/sliit- robofest 2012/programing/main code/main 2.0v/ir.h"


unsigned int ir_value;

int getDistanceIR_GP2D120(unsigned int ir_value);

float getDistanceIR_GP2D120(unsigned int ir_value){
 float voltage = ir_value/1024*5;
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
#line 5 "D:/Robotics/SLIIT- Robofest 2012/Programing/Main Code/Main 2.0V/Main 2.0V.c"
char command, command_old,error, receiveCommand;
char txt[6];
float responseTime, distance;
int distanceInt;
char* distanceStr;




void updateDistance(){
  PORTD.B0  = 0;
 delay_us(10);
  PORTD.B0  = 1;
 delay_us(10);
  PORTD.B0  = 0;

 while( PORTD.B1 ==0);
 counter = 0;

 while( PORTD.B1 ==1){
 counter++;
 }
 responseTime = counter * 0.2 * 0.000001;
 distance = 340 * responseTime * 100 /2;
 distanceInt = distance;
}


void main() {
 configure();

 UART1_Write_Text(ConnectionEstablished);
 setPID();



 debugText = "          Starting..  ";
 UART1_Write_Text(debugText);
 count = 0;
 while(1){
 moveForward(200,200);
 delay_ms(10);

 ir_value = ADC_Read(0);
 if(300<=ir_value && ir_value<623){
 stop();
 debugText = " Obstacle! ";
 UART1_Write_Text(debugText);
 rotateAntiClockwise(255);
 delay_ms(220);
 }
 count++;
 if(count ==100){
 count = 0;
 debugText = " Clear";
 UART1_Write_Text(debugText);
 }
 }
#line 99 "D:/Robotics/SLIIT- Robofest 2012/Programing/Main Code/Main 2.0V/Main 2.0V.c"
}
