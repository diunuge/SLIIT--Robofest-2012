//Wijesinghe D.B
//debug.h

char* ConnectionEstablished = "Connection Established!";
char* debugText = "move forward";
int count, counter;

void sendSensorStatus();
void sendSensorStatusBack();
void sendText(char* aText);
void testPIC();


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

void sendText(char* aText){
      UART1_Write_Text(aText);
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