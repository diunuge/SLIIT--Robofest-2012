#include "motion.h"
#include "debug.h"

float Kp, Ki, Kd;
int deviation, previousDeviation;
float correction, totalError;
int MIN_RPM, MID_RPM, MAX_RPM, TEST_RPM, PID_RightRPM, PID_LeftRPM;

void setPID();
void lineFollowNormal();
void lineFollowPID();
void lineFollow();

void lineFollow(){
      //
      while(1){
            if( (Sensor3==1 || Sensor4==1 || Sensor5==1 || Sensor6==1 || Sensor7==1) && Sensor1==0 && Sensor2==0 && Sensor8==0 && Sensor9==0 ){
                  //not a L turn or junction
                  debugText = "Line follow PID..   ";
                  UART1_Write_Text(debugText);
                  sendSensorStatus();
                  lineFollowPID();
            }
            else if( !( Scout==1 && Sensor1==1 && Sensor2==1 && Sensor3==1 && Sensor4==1 && Sensor5==1 && Sensor6==1 && Sensor7==1 && Sensor8==1 && Sensor9==1) || !( Scout==0 && Sensor1==0 && Sensor2==0 && Sensor3==0 && Sensor4==0 && Sensor5==0 && Sensor6==0 && Sensor7==0 && Sensor8==0 && Sensor9==0)){
                  //Not all sensors are 0 or 1
                  debugText = "Line follow Normal..   ";
                  UART1_Write_Text(debugText);
                  sendSensorStatus();
                  lineFollowNormal();
            }
            else if(( Scout==1 && Sensor1==1 && Sensor2==1 && Sensor3==1 && Sensor4==1 && Sensor5==1 && Sensor6==1 && Sensor7==1 && Sensor8==1 && Sensor9==1) || !( Scout==0 && Sensor1==0 && Sensor2==0 && Sensor3==0 && Sensor4==0 && Sensor5==0 && Sensor6==0 && Sensor7==0 && Sensor8==0 && Sensor9==0)){
                  //all sensors are 0 or 1
                  stop();
                  sendSensorStatus();
                  //delay_ms(1000);
            }
      }
}

void lineFollowNormal(){
      while(!((Sensor3==1 || Sensor4==1 || Sensor5==1 || Sensor6==1 || Sensor7==1) && Sensor1==0 && Sensor2==0 && Sensor8==0 && Sensor9==0)){
            if( Scout==1 && Sensor1==1 && Sensor2==1 && Sensor3==1 && Sensor4==1 && Sensor5==1 && Sensor6==1 && Sensor7==1 && Sensor8==1 && Sensor9==1){
                  stop();
            }
            else if( (Scout==0 && Sensor1==0 && Sensor2==0 && Sensor3==0 && Sensor4==1 && Sensor5==1 && Sensor6==1 && Sensor7==1 && Sensor8==1 && Sensor9==1) || (Scout==0 && Sensor1==0 && Sensor2==0 && Sensor3==0 && Sensor4==0 && Sensor5==1 && Sensor6==1 && Sensor7==1 && Sensor8==1 && Sensor9==1)){
                  //90 turn to right
                  debugText = "90 to right..   ";
                  UART1_Write_Text(debugText);
                  sendSensorStatus();
                  while(Scout==0){
                        rotateClockwise(TEST_RPM);
                  }
            }
            else if( (Scout==0 && Sensor1==1 && Sensor2==1 && Sensor3==1 && Sensor4==1 && Sensor5==1 && Sensor6==0 && Sensor7==0 && Sensor8==0 && Sensor9==0) && (Scout==0 && Sensor1==1 && Sensor2==1 && Sensor3==1 && Sensor4==1 && Sensor5==0 && Sensor6==0 && Sensor7==0 && Sensor8==0 && Sensor9==0)){
                  //90 turn to left
                  debugText = "90 to left..   ";
                  UART1_Write_Text(debugText);
                  sendSensorStatus();
                  while(Scout==0){
                        rotateAntiClockwise(TEST_RPM);
                  }
            }
            else if( Sensor4==1 && Sensor5==1){
                  //move forward
                  moveForward(TEST_RPM,TEST_RPM);
            }
            else if( Sensor4==1 && Sensor5==0 && Scout==1){
                  //turn left
                  turnLeft(TEST_RPM);
            }
            else if( Sensor4==0 && Sensor5==1 && Scout==1){
                  //turn right
                  turnRight(TEST_RPM);
            }
            else if( Sensor4==1 && Sensor5==0 && Scout==0){
                  //turn left
                  stop();
                  //delay_ms(10);
                  rotateAntiClockwise(TEST_RPM);
            }
            else if( Sensor4==0 && Sensor5==1 && Scout==0){
                  //turn right
                  stop();
                  //delay_ms(10);
                  rotateClockwise(TEST_RPM);
            }
            else if( Sensor4==0 && Sensor5==0 ){
                  if(Sensor3 ==1){
                        rotateAntiClockwise(TEST_RPM);
                  }
                  else if(Sensor6 ==1){
                        rotateClockwise(TEST_RPM);
                  }
                  else if(Sensor2 ==1){
                        rotateAntiClockwise(TEST_RPM);
                  }
                  else if(Sensor7 ==1){
                        rotateClockwise(TEST_RPM);
                  }
                  //stop
                  else{
                      stop();
                      //sendSensorStatus();
                      //delay_ms(200);
                  }
            }
            //sendSensorStatus();
      }
      //sendSensorStatus();
}

void setPID(){
      MIN_RPM = 185;       //155
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
      while( (Sensor3==1 || Sensor4==1 || Sensor5==1 || Sensor6==1 || Sensor7==1) && Sensor1==0 && Sensor2==0 && Sensor8==0 && Sensor9==0 ){
      
            if( (Scout==0 && Sensor1==0 && Sensor2==0 && Sensor3==0 && Sensor4==1 && Sensor5==1 && Sensor6==1 && Sensor7==1 && Sensor8==1 && Sensor9==1) || (Scout==0 && Sensor1==0 && Sensor2==0 && Sensor3==0 && Sensor4==0 && Sensor5==1 && Sensor6==1 && Sensor7==1 && Sensor8==1 && Sensor9==1)){
                  //90 turn to right
                  debugText = "90 to right..   ";
                  UART1_Write_Text(debugText);
                  sendSensorStatus();
                  while(Scout==0){
                        rotateClockwise(TEST_RPM);
                  }
            }
            else if( (Scout==0 && Sensor1==1 && Sensor2==1 && Sensor3==1 && Sensor4==1 && Sensor7==0 && Sensor8==0 && Sensor9==0) && (Scout==0 && Sensor1==1 && Sensor2==1 && Sensor3==1 && Sensor4==1 && Sensor7==0 && Sensor8==0 && Sensor9==0)){
                  //90 turn to left
                  debugText = "90 to left..   ";
                  UART1_Write_Text(debugText);
                  sendSensorStatus();
                  while(Scout==0){
                        rotateAntiClockwise(TEST_RPM);
                  }
            }

      //calculate daviation
      if( Sensor3==1 && Sensor4==0 && Sensor5==0 && Sensor6==0 && Sensor7==0)
          deviation = 4;
      if( Sensor3==1 && Sensor4==1 && Sensor5==0 && Sensor6==0 && Sensor7==0)
          deviation = 3;
      if( Sensor3==1 && Sensor4==1 && Sensor5==1 && Sensor6==0 && Sensor7==0)
          deviation = 2;
      if( Sensor3==0 && Sensor4==1 && Sensor5==0 && Sensor6==0 && Sensor7==0)
          deviation = 1;

      if( Sensor3==0 && Sensor4==1 && Sensor5==1 && Sensor6==0 && Sensor7==0)
          deviation = 0;
      if( Sensor3==0 && Sensor4==1 && Sensor5==1 && Sensor6==1 && Sensor7==0)
          deviation = 0;
      if( Sensor3==0 && Sensor4==0 && Sensor5==1 && Sensor6==0 && Sensor7==0)
          deviation = 0;
      if( Sensor3==0 && Sensor4==0 && Sensor5==1 && Sensor6==1 && Sensor7==0)
          deviation = 0;

      if( Sensor3==0 && Sensor4==0 && Sensor5==0 && Sensor6==1 && Sensor7==0)
          deviation = -1;
      if( Sensor3==0 && Sensor4==0 && Sensor5==1 && Sensor6==1 && Sensor7==1)
          deviation = -2;
      if( Sensor3==0 && Sensor4==0 && Sensor5==0 && Sensor6==1 && Sensor7==1)
          deviation = -3;
      if( Sensor3==0 && Sensor4==0 && Sensor5==0 && Sensor6==0 && Sensor7==1)
          deviation = -4;

      correction =  Kp*deviation + Ki*totalError + Kd*(deviation-previousDeviation);
      totalError += correction;
      previousDeviation = deviation;

      PID_LeftRPM = MID_RPM - correction;
      PID_RightRPM = MID_RPM + correction;

      moveForward(PID_LeftRPM, PID_RightRPM);

      }
      correction = 0;
      totalError = 0;
      //sendSensorStatus();
}