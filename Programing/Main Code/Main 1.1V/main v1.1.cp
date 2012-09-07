#line 1 "D:/Robotics/SLIIT- Robofest 2012/Programing/Main Code/Main 1.1V/main v1.1.c"
#line 1 "d:/robotics/sliit- robofest 2012/programing/main code/main 1.1v/motion.h"





void motorLeft_foward(int pwm);










void motorLeft_foward(int pwm){
  PORTD.B0  = 1;
  PORTD.B1  = 0;
 PWM1_Set_Duty(pwm);
}
#line 1 "d:/robotics/sliit- robofest 2012/programing/main code/main 1.1v/configuration.h"
void configure(){





 UART1_Init(9600);
 TRISD=0;
 TRISC=0;
 TRISB=0;






 TRISA=255;

 ADCON0 = 0b11000001;
 ADCON1 = 0b00000000;





 TRISA = 0b11111111;





 PORTA = 0;





 INTCON.ADIF = 0;
 INTCON.ADIE = 1;
 INTCON.GIE = 1;

}
#line 4 "D:/Robotics/SLIIT- Robofest 2012/Programing/Main Code/Main 1.1V/main v1.1.c"
char* ConnectionEstablished = "Connection Established!";
int count, counter;
char command,command_old,error;

unsigned int temp_res;

void main() {
 configure();

 UART1_Write_Text(ConnectionEstablished);

 temp_res = 'Z';

 do {
 temp_res = ADC_Read(0);
 PORTB = temp_res;
 PORTC = temp_res >> 8;


 if(temp_res<500 && temp_res >=400){
 command = 'A';

 }


 if(temp_res<400 && temp_res >=300){
 command = 'B';
 }


 if(temp_res<300 && temp_res >=200){
 command = 'C';
 }

 UART1_Write(command);
 delay_ms(100);


 } while(1);

}
