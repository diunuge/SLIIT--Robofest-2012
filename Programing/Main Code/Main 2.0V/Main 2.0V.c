#include "lineFollow.h"
#include "Configuration.h"
#include "IR.h"

char command, command_old,error, receiveCommand;                 // Auxiliary variables
char txt[6];
float responseTime, distance;
int distanceInt;
char* distanceStr;
#define TRIG PORTD.B0
#define ECHO PORTD.B1
//0.2us cycle time

void updateDistance(){
      TRIG = 0;
      delay_us(10);
      TRIG = 1;
      delay_us(10);
      TRIG = 0;

      while(ECHO==0);
      counter = 0;

      while(ECHO==1){
            counter++;
      }
      responseTime = counter * 0.2 * 0.000001; //in s
      distance = 340 * responseTime * 100 /2;// in cm
      distanceInt = distance;
}


void main() {
      configure();

      UART1_Write_Text(ConnectionEstablished);
      setPID();

      //testPIC();

      debugText = "          Starting..  ";
      UART1_Write_Text(debugText);
      count = 0;
      while(1){
            moveForward(200,200);
            delay_ms(10);
            //updateDistance();
            ir_value = ADC_Read(0);
            if(300<=ir_value && ir_value<623){                         // 2 --> 14cm
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
      
      /////////////////////////////////////////////////////////////////////////////////////////
      /*while(1){

      debugText = " Rotate Clockwise ";
      UART1_Write_Text(debugText);
      rotateClockwise(255);
      delay_ms(220);
      stop();

      delay_ms(2000);

      debugText = " Rotate Anti Clockwise ";
      UART1_Write_Text(debugText);
      rotateAntiClockwise(255);
      delay_ms(220);
      stop();

      delay_ms(2000);

      }*/
      /////////////////////////////////////////////////////////////////////////////////////
      /*delay_ms(1000);
      debugText = "Test Sensors   ";
      UART1_Write_Text(debugText);

      for(count=0; count<5; count++){
            receiveCommand = UART1_Read();
            sendSensorStatus();
            delay_ms(1000);
      }*/                                                 //while( receiveCommand != 'A' && receiveCommand != 'a' );

      /*debugText = "Start Line follow..   ";
      UART1_Write_Text(debugText);
      lineFollowNormal();*/
      //lineFollow();
}