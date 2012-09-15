#define  Scout  PORTB.B5
#define  Sensor1  PORTB.B4
#define  Sensor2  PORTB.B3
#define  Sensor3  PORTD.B4
#define  Sensor4  PORTD.B5
#define  Sensor5  PORTD.B6
#define  Sensor6  PORTD.B7
#define  Sensor7  PORTB.B2
#define  Sensor8  PORTB.B6
#define  Sensor9  PORTB.B7

int isAllBlack();
int isAllWhite();

int isAllBlack(){
      if( Scout==1 && Sensor1==1 && Sensor2==1 && Sensor3==1 && Sensor4==1 && Sensor5==1 && Sensor6==1 && Sensor7==1 && Sensor8==1 && Sensor9==1){
            return 1;
      }
      else
            return 0;
}

int isAllWhite(){
      if( Scout==0 && Sensor1==0 && Sensor2==0 && Sensor3==0 && Sensor4==0 && Sensor5==0 && Sensor6==0 && Sensor7==0 && Sensor8==0 && Sensor9==0){
            return 1;
      }
      else
            return 0;
}