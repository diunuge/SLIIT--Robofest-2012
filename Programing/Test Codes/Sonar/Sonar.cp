#line 1 "D:/Robotics/SLIIT- Robofest 2012/Programing/Test Codes/Sonar/Sonar.c"

char* ConnectionEstablished = "Connection Established!";
int count, counter;
char command,command_old,error;

unsigned int temp_res;

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

void main() {
 configure();

 UART1_Write_Text(ConnectionEstablished);

 do {




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
