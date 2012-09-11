#include "lineFollow.h"
#include "Configuration.h"
#include "IR.h"
#include "Sonar.h"


int distanceInt;
//void lineFollowNormal2();
void lineFollowNormal3();
int isOnThePath();
int isRightSafe();
int isMiddleSafe();
int isLeftSafe();
void moveStraightSlow();


void main() {
      configure();
      setPID();
      sendText("Starting...");

      /***********************     Starting Point    ***************************/
      if(isAllBlack()){
            LEVEL1_STATE = NOT_REACHED;
            sendText("Starting Block  ");
            LEVEL = 0;

            rotateByDegree(-90);
            while(!isAllWhite())
                  moveStraightSlow();
            while(isAllWhite())
                  moveStraightSlow();
            LEVEL = 1;
            sendText("Level 1 Starting  ");
            LEVEL1_STATE = REACHED;
            stop();
      }
      
      /***********************     Level 1 Starting    ***************************/
      
      moveForward(205,200);
      delay_ms(100);
      while(!isAllBlack())
            lineFollowNormal3();
            //lineFollowPID();
      stop();
      sendText("  End of Level 1. Level 2 Starting  ");
      LEVEL1_STATE = COMPLETED;
      LEVEL2_STATE = REACHED;
      LEVEL = 2;
      
      /***********************     Level 2 Starting    ***************************/
      
      while(1)
              stop();
      
      while(!isAllWhite()){
             if(isLeftSafe() && isMiddleSafe() && isRightSafe()){
                    moveStraightSlow();
             }
             if(!isLeftSafe() && isMiddleSafe() && isRightSafe()){
                    stop();
             }
             if(isLeftSafe() && !isMiddleSafe() && isRightSafe()){
                    stop();
             }
             if(isLeftSafe() && isMiddleSafe() && !isRightSafe()){
                    stop();
             }
      }
      
      
      stop();
      sendText("  End of Level 2. Level 3 Starting  ");
      LEVEL2_STATE = COMPLETED;
      LEVEL3_STATE = REACHED;
      LEVEL = 3;
}

int isRightSafe(){
      ir_value = ADC_Read(IRSensorRight);
      if(250<=ir_value && ir_value<800){                         // ~5cm
            return FALSE;
      }
      return TRUE;
}

int isMiddleSafe(){
      ir_value = ADC_Read(IRSensorCenter);
      if(250<=ir_value && ir_value<800){                         // ~5cm
            return FALSE;
      }
      return TRUE;
}

int isLeftSafe(){
      ir_value = ADC_Read(IRSensorLeft);
      if(250<=ir_value && ir_value<800){                         // ~5cm
            return FALSE;
      }
      return TRUE;
}

void moveStraightSlow(){
      moveForward(205,200);
}

void lineFollowNormal2(){
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
                        while(!isOnThePath())
                              turnLeft(FAST_PWM);
                  else if( Sensor3==1 && Sensor4==1 && Sensor5==0 && Sensor6==0 && Sensor7==0)
                        while(!isOnThePath())
                              turnLeft(FAST_PWM);
                  else if( Sensor3==1 && Sensor4==1 && Sensor5==1 && Sensor6==0 && Sensor7==0)
                        while(!isOnThePath())
                              turnLeft(FAST_PWM);
                  else if( Sensor3==0 && Sensor4==1 && Sensor5==0 && Sensor6==0 && Sensor7==0)
                        while(!isOnThePath())
                              turnLeft(FAST_PWM);
                              
                             //turn to right
                  else if( Sensor3==0 && Sensor4==0 && Sensor5==0 && Sensor6==1 && Sensor7==0)
                        while(!isOnThePath())
                              turnRight(FAST_PWM);
                  else if( Sensor3==0 && Sensor4==0 && Sensor5==1 && Sensor6==1 && Sensor7==1)
                        while(!isOnThePath())
                              turnRight(FAST_PWM);
                  else if( Sensor3==0 && Sensor4==0 && Sensor5==0 && Sensor6==1 && Sensor7==1)
                        while(!isOnThePath())
                              turnRight(FAST_PWM);
                  else if( Sensor3==0 && Sensor4==0 && Sensor5==0 && Sensor6==0 && Sensor7==1)
                        while(!isOnThePath())
                              turnRight(FAST_PWM);
                        
            else if(isAllBlack()){
                  // all black
                  stop();
            }
            else
                  stop();
      }

      else{

                  //on the path but heavy turn
                           //turn to left
                  if( Sensor3==1 && Sensor4==0 && Sensor5==0 && Sensor6==0 && Sensor7==0)
                        while(!isOnThePath())
                              turnLeft(FAST_PWM);
                  else if( Sensor3==1 && Sensor4==1 && Sensor5==0 && Sensor6==0 && Sensor7==0)
                        while(!isOnThePath())
                              turnLeft(FAST_PWM);
                  else if( Sensor3==1 && Sensor4==1 && Sensor5==1 && Sensor6==0 && Sensor7==0)
                        while(!isOnThePath())
                              turnLeft(FAST_PWM);
                  else if( Sensor3==0 && Sensor4==1 && Sensor5==0 && Sensor6==0 && Sensor7==0)
                        while(!isOnThePath())
                              turnLeft(FAST_PWM);

                             //turn to right
                  else if( Sensor3==0 && Sensor4==0 && Sensor5==0 && Sensor6==1 && Sensor7==0)
                        while(!isOnThePath())
                              turnRight(FAST_PWM);
                  else if( Sensor3==0 && Sensor4==0 && Sensor5==1 && Sensor6==1 && Sensor7==1)
                        while(!isOnThePath())
                              turnRight(FAST_PWM);
                  else if( Sensor3==0 && Sensor4==0 && Sensor5==0 && Sensor6==1 && Sensor7==1)
                        while(!isOnThePath())
                              turnRight(FAST_PWM);
                  else if( Sensor3==0 && Sensor4==0 && Sensor5==0 && Sensor6==0 && Sensor7==1)
                        while(!isOnThePath())
                              turnRight(FAST_PWM);
            //else if(){
                  //90 turn
            //}
            else if(isAllWhite()){
                  // all black
                  stop();
            }
            else
                  stop();
      }
}

void lineFollowNormal3(){
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

            else if(isAllBlack()){
                  // all black
                  //stop();
                  sendSensorStatus();
            }
            else{
                  stop();
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
                  stop();
                  sendSensorStatus();
                  //delay_ms(1000);
            }
      }
}

int isOnThePath(){
      if(((Sensor3==0 && Sensor4==1 && Sensor5==1 && Sensor6==0 && Sensor7==0) || ( Sensor3==0 && Sensor4==1 && Sensor5==1 && Sensor6==1 && Sensor7==0) || ( Sensor3==0 && Sensor4==0 && Sensor5==1 && Sensor6==0 && Sensor7==0) || ( Sensor3==0 && Sensor4==0 && Sensor5==1 && Sensor6==1 && Sensor7==0)) && Sensor1==0 && Sensor2==0 && Sensor8==0 && Sensor9==0)
            return TRUE;
      else
            return FALSE;
}