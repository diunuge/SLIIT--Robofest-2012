#line 1 "D:/Robotics/SLIIT- Robofest 2012/Programing/Test Codes/LCD/LCD.c"

sbit LCD_RS at RB5_bit;
sbit LCD_EN at RB4_bit;
sbit LCD_D4 at RB3_bit;
sbit LCD_D5 at RB2_bit;
sbit LCD_D6 at RB1_bit;
sbit LCD_D7 at RB0_bit;

sbit LCD_RS_Direction at TRISB5_bit;
sbit LCD_EN_Direction at TRISB4_bit;
sbit LCD_D4_Direction at TRISB3_bit;
sbit LCD_D5_Direction at TRISB2_bit;
sbit LCD_D6_Direction at TRISB1_bit;
sbit LCD_D7_Direction at TRISB0_bit;


char txt1[] = "Diunuge Buddhika";
char txt2[] = "Robofest Test";
char txt3[] = "Lcd4bit";
char txt4[] = "example";

char i;

void Move_Delay() {
 Delay_ms(500);
}

void main(){
 TRISD = 0;
 TRISC = 0;
 TRISA = 0;





 Lcd_Init();

 Lcd_Cmd(_LCD_CLEAR);
 Lcd_Cmd(_LCD_CURSOR_OFF);
 Lcd_Out(1,6,txt3);

 Lcd_Out(2,6,txt4);
 Delay_ms(2000);
 Lcd_Cmd(_LCD_CLEAR);

 Lcd_Out(1,1,txt1);
 Lcd_Out(2,2,txt2);

 Delay_ms(2000);


 for(i=0; i<4; i++) {
 Lcd_Cmd(_LCD_SHIFT_RIGHT);
 Move_Delay();
 }

 while(1) {
 for(i=0; i<8; i++) {
 Lcd_Cmd(_LCD_SHIFT_LEFT);
 Move_Delay();
 }

 PORTA = 255;
 PORTC = 255;
 PORTD = 255;

 for(i=0; i<8; i++) {
 Lcd_Cmd(_LCD_SHIFT_RIGHT);
 Move_Delay();
 }

 PORTA = 0;
 PORTC = 0;
 PORTD = 0;
 }
}
