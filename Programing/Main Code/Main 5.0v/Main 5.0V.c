#include "lineFollow.h"
#include "Configuration.h"
#include "IR.h"
#include "Sonar.h"


unsigned short distanceSonar;
int distanceInt;
int DIRECTION = 0;

int isRightSafe();
int isMiddleSafe();
int isLeftSafe();
void moveStraightSlow();
void goThroughObstacles();



void main() {
      configure();
      setPID();
      sendText("Starting...");

      /***********************     Starting Point    ***************************/

      LEVEL1_STATE = NOT_REACHED;
      sendText("Starting Block  ");
      LEVEL = 0;
            
      while(isAllWhite())
            moveStraightSlow();
      LEVEL = 1;
      sendText("Level 1 Starting  ");
      LEVEL1_STATE = REACHED;
      stop();

      /***********************     Level 1 Starting    ***************************/

      moveForward(205,200);
      delay_ms(100);
      while(!isAllBlack())
            lineFollowNormalWorked();
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

void goThroughObstacles(){
       distanceSonar = getDistanceSonar2('L');
       if( distanceSonar < 20 ){
             if( DIRECTION >= 0 ){
                   sendText(" rotateByDegree -30  ");
                   rotateByDegree(-30);
                   DIRECTION -= 30;
             }
             else{
                   sendText(" rotateByDegree +30  ");
                   rotateByDegree(30);
                   DIRECTION += 30;
             }
       }
       else{
             moveForward(220,220);
       }
}
