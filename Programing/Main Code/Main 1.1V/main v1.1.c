#include "motion.h"
#include "Configuration.h"

char* ConnectionEstablished = "Connection Established!";
int count, counter;
char command,command_old,error;                 // Auxiliary variables

unsigned int temp_res;

void main() {
      configure();
      
      UART1_Write_Text(ConnectionEstablished);
      
      temp_res = 'Z';

      do {
      temp_res = ADC_Read(0);   // Get 10-bit results of AD conversion
      PORTB = temp_res;         // Send lower 8 bits to PORTB
      PORTC = temp_res >> 8;    // Send 2 most significant bits to RC1, RC0

      //30cm-20cm
      if(temp_res<500 && temp_res >=400){
            command = 'A';

      }

      //30cm-40cm
      if(temp_res<400 && temp_res >=300){
            command = 'B';
      }

      //40cm-60cm
      if(temp_res<300 && temp_res >=200){
            command = 'C';
      }

      UART1_Write(command);
      delay_ms(100);
      /*******************    sending command     ********************/

      } while(1);

}