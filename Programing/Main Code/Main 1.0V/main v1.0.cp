#line 1 "D:/Robotics/SLIIT- Robofest 2012/Programing/Main Code/Main 1.0V/main v1.0.c"
int count, counter;
char command,command_old,error;

unsigned int temp_res;

void configureation(){





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



void countInc(){
 if(count==1000000)
 count = 0;
 else
 count++;


}

void main() {
 configureation();
#line 67 "D:/Robotics/SLIIT- Robofest 2012/Programing/Main Code/Main 1.0V/main v1.0.c"
 UART1_Write_Text("Connected!.. ");
 temp_res = 'Z';

 do {
 temp_res = ADC_Read(2);
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
#line 108 "D:/Robotics/SLIIT- Robofest 2012/Programing/Main Code/Main 1.0V/main v1.0.c"
 } while(1);
}
