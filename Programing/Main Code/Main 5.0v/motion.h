

#include "SensorPanel.h"

#define  Motor_Right_Forward  PORTC.B4
#define  Motor_Right_Reverse  PORTC.B5
#define  Motor_Right_Enable   PORTC.B2
#define  Motor_Left_Forward   PORTD.B2
#define  Motor_Left_Reverse   PORTD.B3
#define  Motor_Left_Enable    PORTC.B1

void motorLeft_foward(int pwm);
void motorRight_foward(int pwm);
void motorLeft_reverse(int pwm);
void motorRight_reverse(int pwm);
void motorLeft_stop();
void motorRight_stop();

void moveForward(int pwmLeft, int pwmRight);
void turnRight(int pwmLeft);
void turnLeft(int pwmRight);
void rotateClockwise(int pwm);
void rotateAntiClockwise(int pwm);
void reverse(int pwmLeft, int pwmRight);
void stop();

void rotateByDegree(int degree);

void testMotion();


void motorLeft_foward(int pwm){
      Motor_Left_Forward = 1;
      Motor_Left_Reverse = 0;
      PWM2_Set_Duty(pwm);
}

void motorRight_foward(int pwm){
      Motor_Right_Forward = 1;
      Motor_Right_Reverse = 0;
      PWM1_Set_Duty(pwm);
}

void motorLeft_reverse(int pwm){
      Motor_Left_Forward = 0;
      Motor_Left_Reverse = 1;
      PWM2_Set_Duty(pwm);
}

void motorRight_reverse(int pwm){
      Motor_Right_Forward = 0;
      Motor_Right_Reverse = 1;
      PWM1_Set_Duty(pwm);
}

void motorLeft_stop(){
      Motor_Left_Forward = 1;
      Motor_Left_Reverse = 1;
}

 void motorRight_stop(){
      Motor_Right_Forward = 1;
      Motor_Right_Reverse = 1;
}

void moveForward(int pwmLeft, int pwmRight){
      motorLeft_foward(pwmLeft);
      motorRight_foward(pwmRight);
}

void reverse(int pwmLeft, int pwmRight){
      motorLeft_reverse(pwmLeft);
      motorRight_reverse(pwmRight);
}

void turnRight(int pwmLeft){
      motorLeft_foward(pwmLeft);
      motorRight_stop();
}

void turnLeft(int pwmRight){
      motorRight_foward(pwmRight);
      motorLeft_stop();
}

void rotateClockwise(int pwm){
      motorLeft_foward(pwm);
      motorRight_reverse(pwm);
}

void rotateAntiClockwise(int pwm){
      motorLeft_reverse(pwm);
      motorRight_foward(pwm);
}

void stop(){
      motorLeft_stop();
      motorRight_stop();
}

void rotateByDegree(int degree){
      if( degree == -90 ){
            rotateAntiClockwise(255);
            delay_ms(220);
            stop();
      }
      else if( degree == 90 ){
            rotateClockwise(255);
            delay_ms(220);
            stop();
      }
      else if( degree == -30 ){
            rotateAntiClockwise(255);
            delay_ms(100);
            stop();
            delay_ms(200);
      }
      else if( degree == 30 ){
            rotateClockwise(255);
            delay_ms(100);
            stop();
            delay_ms(200);
      }
      else if( degree == -60 ){
            rotateAntiClockwise(255);
            delay_ms(155);
            stop();
            delay_ms(200);
      }
      else if( degree == 60 ){
            rotateClockwise(255);
            delay_ms(155);
            stop();
            delay_ms(200);
      }
      else if( degree == -45 ){
            rotateAntiClockwise(255);
            delay_ms(135);
            stop();
            delay_ms(200);
      }
      else if( degree == 45 ){
            rotateClockwise(255);
            delay_ms(135);
            stop();
            delay_ms(200);
      }
}

void testMotion(int pwm){
      rotateClockwise(pwm);
      delay_ms(1000);
      rotateAntiClockwise(pwm);
      delay_ms(1000);
      moveForward(pwm,pwm);
      delay_ms(1000);
}