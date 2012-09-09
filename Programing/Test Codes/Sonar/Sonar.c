
char* ConnectionEstablished = "Connection Established!";
int count, counter;
char command,command_old,error;                 // Auxiliary variables

unsigned int temp_res;

void configure(){

      //PWM1_Init(5000);
      //PWM2_Init(5000);
      //PWM1_Start();
      //PWM2_Start();
      UART1_Init(9600);
      TRISD=0;
      TRISC=0;
      TRISB=0;
      //INTCON=0b11010000;
      //PIR2.B1=0;             //TMR3 Overflow Interrupt Flag bit
      //PIE2.B1=1;             //TMR3 Overflow Interrupt Enable bit
      //T3CON=0b00010001;
      //TMR3L=200;           //one register of 16 bit Timer 3 (TME3H & TMR3L)
      //ADCON1=0;
      TRISA=255;

      ADCON0 = 0b11000001;
      ADCON1 = 0b00000000;
      //UART1_Init(9600);
      //PWM1_Init(5000);
      //PWM2_Init(5000);
      //PWM1_Start();
      //PWM2_Start();
      TRISA = 0b11111111;
      //TRISB = 0b00000000;
      //TRISC = 0b00000000;
      //TRISD = 0b00000000;
      //TRISE = 0b000;
      PORTA = 0;
      //PORTB = 0;
      //PORTC = 0;
      //PORTD = 0;
      //PORTE = 0;
      INTCON.ADIF = 0;
      INTCON.ADIE = 1;
      INTCON.GIE = 1;

}

void main() {
      configure();

      UART1_Write_Text(ConnectionEstablished);

      do {



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