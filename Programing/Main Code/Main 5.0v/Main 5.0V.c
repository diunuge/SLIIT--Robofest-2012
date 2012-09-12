#include "lineFollow.h"
#include "Configuration.h"
#include "IR.h"
#include "Sonar.h"


unsigned short distanceSonar;
float distanceIR;
int distanceInt;
int DIRECTION = 0;

int isRightSafe();
int isMiddleSafe();
int isLeftSafe();
void moveStraightSlow();
void moveStraightFast();
void goThroughObstacles();
void goThroughObstaclesJay();
void level3Aligning();
int isPathClearSonar();
void checkSonar(char Sensor);

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

void main() {
      configure();
      setPID();
      sendText("Starting...");
      
      //while(1)
      //     checkSonar('L');

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
      while(!isAllBlack()){
            //lineFollowNormalWorked();
            if( Scout==1 &&(Sensor3==1 || Sensor4==1 || Sensor5==1 || Sensor6==1 || Sensor7==1) && Sensor1==0 && Sensor2==0 && Sensor8==0 && Sensor9==0)
                  lineFollowPID();
            else
                  lineFollowNormalWorked();
      }
      stop();
      sendText("  End of Level 1. Level 2 Starting  ");
      LEVEL1_STATE = COMPLETED;
      LEVEL2_STATE = REACHED;
      LEVEL = 2;

      /***********************     Level 2 Starting    ***************************/

      while(!isAllWhite()){
             goThroughObstaclesJay();
      }

      stop();
      sendText("  End of Level 2. Level 3 Starting  ");
      LEVEL2_STATE = COMPLETED;
      LEVEL3_STATE = REACHED;
      LEVEL = 3;
      
      /***********************     Level 3 Starting    ***************************/

      level3Aligning();

      while(!isAllBlack()){
            stop();
      }
      
      /***********************          Complete       ***************************/
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

void moveStraightFast(){
      moveForward(255,250);
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
       if(isPathClearSonar() == 0) {
            rotateByDegree(30);
            if(isPathClearSonar() == 0) {
                 rotateByDegree(-60);
                 if(isPathClearSonar() == 0) {
                      rotateByDegree(90);
                      if(isPathClearSonar() == 0) {
                          rotateByDegree(-90);
                          rotateByDegree(-30);
                          if(isPathClearSonar() == 0) {
                               rotateByDegree(90);
                               rotateByDegree(60);
                               if(isPathClearSonar() == 0) {
                                    rotateByDegree(-90);
                                    rotateByDegree(-90);
                               }
                          }
                      }
                 }
            }
       }
       moveStraightSlow();
       delay_ms(10);
}

void level3Aligning(){
       while(Sensor5 == 1)
             reverse(255,255);
       stop();
       delay_ms(500);
       while(!isAllBlack()){
             if(Sensor9 == 1)
                   rotateAntiClockwise(220);
             else if(Sensor1 == 1)
                   rotateClockwise(220);
       }

}

int isPathClearSonar() {
    if(getDistanceSonar2('L') < 10 || getDistanceSonar2('M') < 15 || getDistanceSonar2('R') < 10) {
       return 0;     // Not Clear
    } else {
       return 1;
    }
}
