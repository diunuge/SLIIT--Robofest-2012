#include "motion.h"
#include "Configuration.h"

char* ConnectionEstablished = "Connection Established!";
char* debugText = "move forward";
int count, counter;
char command, command_old,error, receiveCommand;                 // Auxiliary variables
float Kp, Kd;
int deviation, previousDeviation;
float correction, totalError;
int MIN_RPM, MID_RPM, MAX_RPM, TEST_RPM;

unsigned int temp_res;

void setPID();
void lineFollowNormal();
void lineFollowPID();
void sendSensorStatus();
void testPIC();

void main() {
      configure();

      UART1_Write_Text(ConnectionEstablished);
      setPID();
      
      //testPIC();


      
      debugText = "          Starting..  ";
      UART1_Write_Text(debugText);
      
      delay_ms(1000);
      debugText = "Test Sensors   ";
      UART1_Write_Text(debugText);
      
      for(count=0; count<2; count++){
            receiveCommand = UART1_Read();
            sendSensorStatus();
            delay_ms(1000);
      }                                                  //while( receiveCommand != 'A' && receiveCommand != 'a' );
      
      debugText = "Start Line follow..   ";
      UART1_Write_Text(debugText);
      lineFollowNormal();
}

void setPID(){
      MIN_RPM = 155;       //185
      MID_RPM = 210;
      MAX_RPM = 255;
      TEST_RPM = 200;

      Kp = 10;
      Kd = 0;

      Pwm1_Set_Duty(MID_RPM);
      Pwm2_Set_Duty(MID_RPM);
}

void lineFollowNormal(){
      while(1){
            if( Sensor4==1 && Sensor5==1){
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
                  turnLeft(TEST_RPM);
            }
            else if( Sensor4==0 && Sensor5==1 && Scout==0){
                  //turn right
                  turnRight(TEST_RPM);
            }
            else if( Sensor4==0 && Sensor5==0 ){
                  if(Sensor3 ==1){
                        turnLeft(TEST_RPM);
                  }
                  else if(Sensor6 ==1){
                        turnRight(TEST_RPM);
                  }
                  else if(Sensor2 ==1){
                        rotateAntiClockwise(TEST_RPM);
                  }
                  else if(Sensor7 ==1){
                        rotateClockwise(TEST_RPM);
                  }
                  //stop
                  stop();
            }
            //sendSensorStatus();
      }
}

void lineFollowPID(){
      /*
      
      */
}

void sendSensorStatus(){
      if( Sensor1 == 1){
            debugText = "1";
            UART1_Write_Text(debugText);
      }
      else if( Sensor1 == 0){
            debugText = "0";
            UART1_Write_Text(debugText);
      }

      if( Sensor2 == 1){
            debugText = "1";
            UART1_Write_Text(debugText);
      }
      else if( Sensor2 == 0){
            debugText = "0";
            UART1_Write_Text(debugText);
      }

      if( Sensor3 == 1){
            debugText = "1";
            UART1_Write_Text(debugText);
      }
      else if( Sensor3 == 0){
            debugText = "0";
            UART1_Write_Text(debugText);
      }

      if( Sensor4 == 1){
            debugText = "1";
            UART1_Write_Text(debugText);
      }
      else if( Sensor4 == 0){
            debugText = "0";
            UART1_Write_Text(debugText);
      }

      if( Sensor5 == 1){
            debugText = "1";
            UART1_Write_Text(debugText);
      }
      else if( Sensor5 == 0){
            debugText = "0";
            UART1_Write_Text(debugText);
      }

      if( Sensor6 == 1){
            debugText = "1";
            UART1_Write_Text(debugText);
      }
      else if( Sensor6 == 0){
            debugText = "0";
            UART1_Write_Text(debugText);
      }

      if( Sensor7 == 1){
            debugText = "1";
            UART1_Write_Text(debugText);
      }
      else if( Sensor7 == 0){
            debugText = "0";
            UART1_Write_Text(debugText);
      }

      if( Sensor8 == 1){
            debugText = "1";
            UART1_Write_Text(debugText);
      }
      else if( Sensor8 == 0){
            debugText = "0";
            UART1_Write_Text(debugText);
      }

      if( Sensor9 == 1){
            debugText = "1";
            UART1_Write_Text(debugText);
      }
      else if( Sensor9 == 0){
            debugText = "0";
            UART1_Write_Text(debugText);
      }

      if( Scout == 1){
            debugText = " 1; ";
            UART1_Write_Text(debugText);
      }
      else if( Scout == 0){
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
            //debugText = count;
            //UART1_Write_Text(debugText);
      }
}