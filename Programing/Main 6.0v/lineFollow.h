#include "motion.h"
#include "debug.h"

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
      MIN_RPM = 215;       //155
      MID_RPM = 235;
      MAX_RPM = 255;
      TEST_RPM = 200;

      //for normal line follwing
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
      //while( !(Sensor3==0 && Sensor4==0 && Sensor5==0 && Sensor6==0 && Sensor7==0) ){

            /*if( (Scout==0 && Sensor1==0 && Sensor2==0 && Sensor3==0 && Sensor4==1 && Sensor5==1 && Sensor6==1 && Sensor7==1 && Sensor8==1 && Sensor9==1) || (Scout==0 && Sensor1==0 && Sensor2==0 && Sensor3==0 && Sensor4==0 && Sensor5==1 && Sensor6==1 && Sensor7==1 && Sensor8==1 && Sensor9==1)){
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
            }*/

      //calculate daviation
      if( Sensor3==1 && Sensor4==0 && Sensor5==0 && Sensor6==0 && Sensor7==0)
          deviation = 15;
      if( Sensor3==1 && Sensor4==1 && Sensor5==0 && Sensor6==0 && Sensor7==0)
          deviation = 10;
      if( Sensor3==1 && Sensor4==1 && Sensor5==1 && Sensor6==0 && Sensor7==0)
          deviation = 4;
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
          deviation = -4;
      if( Sensor3==0 && Sensor4==0 && Sensor5==0 && Sensor6==1 && Sensor7==1)
          deviation = -10;
      if( Sensor3==0 && Sensor4==0 && Sensor5==0 && Sensor6==0 && Sensor7==1)
          deviation = -15;

      correction =  Kp*deviation + Ki*totalError + Kd*(deviation-previousDeviation);
      totalError += correction;
      previousDeviation = deviation;

      PID_LeftRPM = MID_RPM + correction;
      PID_RightRPM = MID_RPM - correction;

      moveForward(PID_LeftRPM, PID_RightRPM);

      //}
      //correction = 0;
      //totalError = 0;
      //sendSensorStatus();
}

void lineFollowNormalWorked(){
      if(Scout == 1){
                  //on the path
                  if( Sensor3==0 && Sensor4==1 && Sensor5==1 && Sensor6==0 && Sensor7==0)
                        moveForward(SLOW_PWM,FAST_PWM);
                  else if( Sensor3==0 && Sensor4==1 && Sensor5==1 && Sensor6==1 && Sensor7==0)
                        moveForward(FAST_PWM,FAST_PWM);
                  else if( Sensor3==0 && Sensor4==0 && Sensor5==1 && Sensor6==0 && Sensor7==0)
                        moveForward(FAST_PWM,FAST_PWM);
                  else if( Sensor3==0 && Sensor4==0 && Sensor5==1 && Sensor6==1 && Sensor7==0)
                        moveForward(FAST_PWM,SLOW_PWM);


                  //out of pat; have to turn
                            //turn to left
                  else if( Sensor3==1 && Sensor4==0 && Sensor5==0 && Sensor6==0 && Sensor7==0)
                        //while(!isOnThePath())
                              turnLeft(FAST_PWM);
                  else if( Sensor3==1 && Sensor4==1 && Sensor5==0 && Sensor6==0 && Sensor7==0)
                        //while(!isOnThePath())
                              turnLeft(FAST_PWM);
                  else if( Sensor3==1 && Sensor4==1 && Sensor5==1 && Sensor6==0 && Sensor7==0)
                        //while(!isOnThePath())
                              turnLeft(FAST_PWM);
                  else if( Sensor3==0 && Sensor4==1 && Sensor5==0 && Sensor6==0 && Sensor7==0)
                        //while(!isOnThePath())
                              turnLeft(FAST_PWM);

                             //turn to right
                  else if( Sensor3==0 && Sensor4==0 && Sensor5==0 && Sensor6==1 && Sensor7==0)
                        //while(!isOnThePath())
                              turnRight(FAST_PWM);
                  else if( Sensor3==0 && Sensor4==0 && Sensor5==1 && Sensor6==1 && Sensor7==1)
                        //while(!isOnThePath())
                              turnRight(FAST_PWM);
                  else if( Sensor3==0 && Sensor4==0 && Sensor5==0 && Sensor6==1 && Sensor7==1)
                        //while(!isOnThePath())
                              turnRight(FAST_PWM);
                  else if( Sensor3==0 && Sensor4==0 && Sensor5==0 && Sensor6==0 && Sensor7==1)
                        //while(!isOnThePath())
                              turnRight(FAST_PWM);

                  //special
                  else if( Sensor3==1 && Sensor4==1 && Sensor5==1 && Sensor6==1 && Sensor7==0)
                        moveForward(FAST_PWM,FAST_PWM);
                  else if( Sensor3==0 && Sensor4==1 && Sensor5==1 && Sensor6==1 && Sensor7==1)
                        moveForward(FAST_PWM,FAST_PWM);
                  else if( Sensor1==0 && Sensor2==0 && Sensor3==0 && Sensor4==0 && Sensor5==0 && Sensor6==0 && Sensor7==0 && Sensor8==0 && Sensor9==0)
                        moveForward(255,255);

            else if(isAllBlack()){
                  // all black
                  //stop();
                  sendSensorStatus();
            }
            else{
                  //stop();
                  reverse(220,220);
                  sendSensorStatus();
                  //delay_ms(1000);
            }
      }

      else{

            //if(){
                  //90 turn
                        //to left
                  if( Sensor1==1 && Sensor2==1 && Sensor3==1 && Sensor4==1 && Sensor5==1 && Sensor6==0 && Sensor7==0 && Sensor8==0 && Sensor9==0)
                        rotateByDegree(-90);
                  else if( Sensor1==1 && Sensor2==1 && Sensor3==1 && Sensor4==1 && Sensor5==1 && Sensor6==1 && Sensor7==0 && Sensor8==0 && Sensor9==0)
                        rotateByDegree(-90);
                  else if( Sensor1==1 && Sensor2==1 && Sensor3==1 && Sensor4==1 && Sensor5==1 && Sensor6==1 && Sensor7==1 && Sensor8==0 && Sensor9==0)
                        rotateByDegree(-90);

                        //to right
                  else if( Sensor1==0 && Sensor2==0 && Sensor3==1 && Sensor4==1 && Sensor5==1 && Sensor6==1 && Sensor7==1 && Sensor8==1 && Sensor9==1)
                        rotateByDegree(90);
                  else if( Sensor1==0 && Sensor2==0 && Sensor3==0 && Sensor4==1 && Sensor5==1 && Sensor6==1 && Sensor7==1 && Sensor8==1 && Sensor9==1)
                        rotateByDegree(90);
                  else if( Sensor1==0 && Sensor2==0 && Sensor3==0 && Sensor4==0 && Sensor5==1 && Sensor6==1 && Sensor7==1 && Sensor8==1 && Sensor9==1)
                        rotateByDegree(90);


            //on the path but heavy turn
                           //turn to left
                  else if( Sensor3==1 && Sensor4==0 && Sensor5==0 && Sensor6==0 && Sensor7==0)
                        //while(!isOnThePath())
                              turnLeft(FAST_PWM);
                  else if( Sensor3==1 && Sensor4==1 && Sensor5==0 && Sensor6==0 && Sensor7==0)
                        //while(!isOnThePath())
                              turnLeft(FAST_PWM);
                  else if( Sensor3==1 && Sensor4==1 && Sensor5==1 && Sensor6==0 && Sensor7==0)
                        //while(!isOnThePath())
                              turnLeft(FAST_PWM);
                  else if( Sensor3==0 && Sensor4==1 && Sensor5==0 && Sensor6==0 && Sensor7==0)
                        //while(!isOnThePath())
                              turnLeft(FAST_PWM);

                             //turn to right
                  else if( Sensor3==0 && Sensor4==0 && Sensor5==0 && Sensor6==1 && Sensor7==0)
                        //while(!isOnThePath())
                              turnRight(FAST_PWM);
                  else if( Sensor3==0 && Sensor4==0 && Sensor5==1 && Sensor6==1 && Sensor7==1)
                        //while(!isOnThePath())
                              turnRight(FAST_PWM);
                  else if( Sensor3==0 && Sensor4==0 && Sensor5==0 && Sensor6==1 && Sensor7==1)
                        //while(!isOnThePath())
                              turnRight(FAST_PWM);
                  else if( Sensor3==0 && Sensor4==0 && Sensor5==0 && Sensor6==0 && Sensor7==1)
                        //while(!isOnThePath())
                              turnRight(FAST_PWM);

                  //special
                  else if( Sensor3==1 && Sensor4==1 && Sensor5==1 && Sensor6==1 && Sensor7==0)
                        moveForward(SLOW_PWM,FAST_PWM);
                  else if( Sensor3==0 && Sensor4==1 && Sensor5==1 && Sensor6==1 && Sensor7==1)
                        moveForward(FAST_PWM,SLOW_PWM);
                  else if( Sensor2==1 && Sensor3==1 && Sensor4==1 && Sensor5==0 && Sensor6==1 && Sensor7==1 && Sensor8==1)
                        while(Scout==0)
                              rotateAntiClockwise(255);
                  else if( Sensor1==0 && Sensor2==0 && Sensor3==0 && Sensor4==0 && Sensor5==0 && Sensor6==0 && Sensor7==0 && Sensor8==1 && Sensor9==1)
                        while(Scout==0)
                              rotateClockwise(255);
                  else if( Sensor1==1 && Sensor2==1 && Sensor3==0 && Sensor4==0 && Sensor5==0 && Sensor6==0 && Sensor7==0 && Sensor8==0 && Sensor9==0)
                        while(Scout==0)
                              rotateAntiClockwise(255);

                  //on the path
                  else if( Sensor3==0 && Sensor4==1 && Sensor5==1 && Sensor6==0 && Sensor7==0)
                        moveForward(SLOW_PWM,FAST_PWM);
                  else if( Sensor3==0 && Sensor4==1 && Sensor5==1 && Sensor6==1 && Sensor7==0)
                        moveForward(FAST_PWM,FAST_PWM);
                  else if( Sensor3==0 && Sensor4==0 && Sensor5==1 && Sensor6==0 && Sensor7==0)
                        moveForward(FAST_PWM,FAST_PWM);
                  else if( Sensor3==0 && Sensor4==0 && Sensor5==1 && Sensor6==1 && Sensor7==0)
                        moveForward(FAST_PWM,SLOW_PWM);

            //}
            else if(isAllWhite()){
                  // all black
                  //stop();
                  sendSensorStatus();
            }
            else{
                  //stop();
                  reverse(220,220);
                  sendSensorStatus();
                  //delay_ms(1000);
            }
      }
}

int isOnThePath(){
      if(((Sensor3==0 && Sensor4==1 && Sensor5==1 && Sensor6==0 && Sensor7==0) || ( Sensor3==0 && Sensor4==1 && Sensor5==1 && Sensor6==1 && Sensor7==0) || ( Sensor3==0 && Sensor4==0 && Sensor5==1 && Sensor6==0 && Sensor7==0) || ( Sensor3==0 && Sensor4==0 && Sensor5==1 && Sensor6==1 && Sensor7==0)) && Sensor1==0 && Sensor2==0 && Sensor8==0 && Sensor9==0)
            return 1;
      else
            return 0;
}

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
      while(1){              //!((Sensor3==1 || Sensor4==1 || Sensor5==1 || Sensor6==1 || Sensor7==1) && Sensor1==0 && Sensor2==0 && Sensor8==0 && Sensor9==0)
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