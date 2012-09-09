#include "motion.h"
#include "Configuration.h"

char* ConnectionEstablished = "Connection Established!";
char* debugText = "move forward";
int count, counter;
char command, command_old,error, receiveCommand;                 // Auxiliary variables
float Kp, Ki, Kd;
int deviation, previousDeviation;
float correction, totalError;
int MIN_RPM, MID_RPM, MAX_RPM, TEST_RPM, PID_RightRPM, PID_LeftRPM;

unsigned int temp_res;

void setPID();
void lineFollowNormal();
void lineFollowPID();
void lineFollow();
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
      
      for(count=0; count<5; count++){
            receiveCommand = UART1_Read();
            sendSensorStatus();
            delay_ms(1000);
      }                                                  //while( receiveCommand != 'A' && receiveCommand != 'a' );
      
      debugText = "Start Line follow..   ";
      UART1_Write_Text(debugText);
      //lineFollowNormal();
      lineFollow();
}
void lineFollow(){
      //
      while(1){
            if( (Sensor3==1 || Sensor4==1 || Sensor5==1 || Sensor6==1 || Sensor7==1) && Sensor1==0 && Sensor2==0 && Sensor8==0 && Sensor9==0 ){
                  //not a L turn or junction
                  debugText = "Line follow PID..   ";
                  UART1_Write_Text(debugText);
                  lineFollowPID();
            }
            else if( !( Scout==1 && Sensor1==1 && Sensor2==1 && Sensor3==1 && Sensor4==1 && Sensor5==1 && Sensor6==1 && Sensor7==1 && Sensor8==1 && Sensor9==1) || !( Scout==0 && Sensor1==0 && Sensor2==0 && Sensor3==0 && Sensor4==0 && Sensor5==0 && Sensor6==0 && Sensor7==0 && Sensor8==0 && Sensor9==0)){
                  //Not all sensors are 0 or 1
                  debugText = "Line follow Normal..   ";
                  UART1_Write_Text(debugText);
                  lineFollowNormal();
            }
            else if(( Scout==1 && Sensor1==1 && Sensor2==1 && Sensor3==1 && Sensor4==1 && Sensor5==1 && Sensor6==1 && Sensor7==1 && Sensor8==1 && Sensor9==1) || !( Scout==0 && Sensor1==0 && Sensor2==0 && Sensor3==0 && Sensor4==0 && Sensor5==0 && Sensor6==0 && Sensor7==0 && Sensor8==0 && Sensor9==0)){
                  //all sensors are 0 or 1
                  stop();
                  sendSensorStatus();
                  delay_ms(200);
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
                  while(Scout==0){
                        rotateClockwise(TEST_RPM);
                  }
            }
            else if( (Scout==0 && Sensor1==1 && Sensor2==1 && Sensor3==1 && Sensor4==1 && Sensor5==1 && Sensor6==1 && Sensor7==0 && Sensor8==0 && Sensor9==0) && (Scout==0 && Sensor1==1 && Sensor2==1 && Sensor3==1 && Sensor4==1 && Sensor5==1 && Sensor6==0 && Sensor7==0 && Sensor8==0 && Sensor9==0)){
                  //90 turn to left
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
                      sendSensorStatus();
                      //delay_ms(1000);
                  }
            }
            //sendSensorStatus();
      }
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
      while( !(Sensor3==0 && Sensor4==0 && Sensor5==0 && Sensor6==0 && Sensor7==0)){

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