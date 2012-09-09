#include "lineFollow.h"
#include "Configuration.h"
//#include "debug.h"

char command, command_old,error, receiveCommand;                 // Auxiliary variables

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
