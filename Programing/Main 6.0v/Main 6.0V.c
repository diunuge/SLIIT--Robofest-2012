#include "lineFollow.h"
#include "Configuration.h"
#include "IR.h"
#include "Sonar.h"


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
       while(Sensor4 == 0 || Sensor5 == 0 || Sensor6 == 0)
             reverse(220,220);
       delay_ms(1);
       stop();
       sendText("Sensor5 at LEVEL 2 ");
       delay_ms(500);
       while(Sensor1==0 || Sensor2==0 || Sensor3==0 || Sensor4==0 || Sensor5==0 || Sensor6==0 || Sensor7==0 || Sensor8==0 || Sensor9==0){
             if(Sensor9 == 1)
                   rotateAntiClockwise(220);
                   //rotateByDegree(-2);
             else if(Sensor1 == 1)
                   rotateClockwise(220);
                   //rotateByDegree(2);
       }
       stop();
}

void level2Aligning(){
       while((Sensor1 == 0 || Sensor2 == 0 || Sensor3 == 0 || Sensor4 == 0 || Sensor5 == 0 || Sensor6 == 0) && (Sensor4 == 0 || Sensor5 == 0 || Sensor6 == 0 || Sensor7 == 0 || Sensor8 == 0 || Sensor9 == 0))
             moveForward(220,220);
       delay_ms(1);
       stop();
       sendText("Sensor5 at LEVEL 2 ");
       delay_ms(500);
       while(Sensor1==0 || Sensor2==0 || Sensor3==0 || Sensor4==0 || Sensor5==0 || Sensor6==0 || Sensor7==0 || Sensor8==0 || Sensor9==0){
             if(Sensor9 == 1)
                   rotateClockwise(220);
                   //rotateByDegree(-2);
             else if(Sensor1 == 1)
                   rotateAntiClockwise(220);
                   //rotateByDegree(2);
       }
       stop();
}

void main() {
      configure();
      setPID();
      sendText("Starting...");

      /*while(!isAllWhite())
             moveStraightFast();
      level2Aligning();
      while(1){
            stop();
      }*/
      //     checkSonar('L');

      /***********************     Starting Point    ***************************/

      LEVEL1_STATE = NOT_REACHED;
      sendText("Starting Block  ");
      LEVEL = 0;

      while(isAllWhite())
            moveStraightSlow();
      delay_ms(10);
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

      while(!isAllWhite() && LEVEL2_STATE != COMPLETED){
             goThroughObstaclesJay();
      }

      stop();
      sendText("  End of Level 2. Level 3 Starting  ");
      LEVEL2_STATE = COMPLETED;
      LEVEL3_STATE = REACHED;
      LEVEL = 3;

      /***********************     Level 3 Starting    ***************************/

      level3Aligning();
      
      /*rotateByDegree(-90);
      while(getDistanceSonar2('M') > 5)
            moveStraightSlow();*/
      

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

void goThroughObstaclesWorking(){
       ROTATION_ANGLE = 0;
       if(isPathClear() == 0) {    // if not clear

            for(counter = 1; counter <= 6; counter++) {
                 // check for o counter value
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
           // check the DIRECTION
           if(abs(DIRECTION) >= 90) {
                sendText("Wrong Direction !!!");
                rotateByDegree(90);
                rotateByDegree(90);
                DIRECTION = 0;

                while(!isAllBlack()){
                     moveStraightSlow();
                }
           } else {
               LEVEL2_STATE = COMPLETED;
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
       moveStraightFast();
       delay_ms(10);

       if(isAllWhite()) {
           // check the DIRECTION
           if(abs(DIRECTION) >= 90) {
                sendText("Wrong Direction !!!");
                rotateByDegree(90);
                rotateByDegree(90);
                
                DIRECTION = 0;
                level2Aligning();
           }
           else{
                 sendText("Corrent Direction !!!");
                 LEVEL2_STATE = COMPLETED;
           }
       }
}



int isPathClear() {
    if(getDistanceSonar2('L') < 7 || getDistanceSonar2('M') < 7 || getDistanceSonar2('R') < 7) {
       return 0;     // Not Clear
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