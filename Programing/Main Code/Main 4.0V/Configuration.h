#define  NOT_REACHED 0
#define  REACHED 1
#define  COMPLETED 2
#define  TRUE 1
#define  FALSE 0

int LEVEL, LEVEL1_STATE, LEVEL2_STATE, LEVEL3_STATE;
int SLOW_PWM, MID_PWM, FAST_PWM;

void configure(){


      TRISA = 0b11111111;
      TRISB = 0b11111111;
      TRISC = 0b00000000;
      TRISD = 0b11110010;
      //TRISE = 0b000;

      PORTA = 0;
      PORTB = 0;
      PORTC = 0;
      PORTD = 0;
      //PORTE = 0;
      
      PWM1_Init(5000);
      PWM2_Init(5000);
      PWM1_Start();
      PWM2_Start();
      UART1_Init(9600);
      //INTCON=0b11010000;
      //PIR2.B1=0;             //TMR3 Overflow Interrupt Flag bit
      //PIE2.B1=1;             //TMR3 Overflow Interrupt Enable bit
      //T3CON=0b00010001;
      //TMR3L=200;           //one register of 16 bit Timer 3 (TME3H & TMR3L)
      //ADCON1=0;

      ADCON0 = 0b11000001;
      ADCON1 = 0b00000000;

      //T0CON = 0b00000111;
      //T0CON.B7 = 1;

      //INTCON.ADIF = 0;
      //INTCON.ADIE = 1;
      //INTCON.GIE = 1;
      LEVEL = 0;
      LEVEL1_STATE  = NOT_REACHED;
      LEVEL2_STATE  = NOT_REACHED;
      LEVEL3_STATE  = NOT_REACHED;
      
      SLOW_PWM = 180;
      MID_PWM = 220;
      FAST_PWM = 220;
      
      /*T0CON=0xC3;
      TMR0L=0x00;
      INTCON.TMR0IE=1;

      T1CON=0x80;
      TMR1H=0x00;
      TMR1L=0x00;*/
}