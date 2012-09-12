#define TRIG_RIGHT PORTA.B0         //PORTE.B1
#define ECHO_RIGHT PORTA.B1         //PORTE.B2
#define TRIG_MIDDLE PORTA.B5
#define ECHO_MIDDLE PORTE.B0
#define TRIG_LEFT PORTA.B2
#define ECHO_LEFT PORTA.B3

int _counter, _distanceSonar;
float _responseTime, _distance;
float getSonarDistance();
unsigned short getDistanceSonar2(char Sensor);


float getSonarDistance(){
      TRIG_MIDDLE = 0;
      delay_us(10);
      TRIG_MIDDLE = 1;
      delay_us(10);
      TRIG_MIDDLE = 0;

      while(ECHO_MIDDLE==0);
      _counter = 0;

      while(ECHO_MIDDLE==1){
            _counter++;
      }
      _responseTime = _counter * 0.2 * 0.000001; //in s
      _distance = 340 * _responseTime * 100 /2;// in cm
      return _distance;
}

unsigned short getDistanceSonar2(char Sensor){
       unsigned double x,y;
       unsigned int L;
       unsigned int H;
       TMR1H=0x00;
       TMR1L=0x00;
       if(Sensor=='M'){

                  TRIG_MIDDLE = 0;
                  delay_us(2);
                  TRIG_MIDDLE = 1;
                  delay_us(5);
                  TRIG_MIDDLE =0;

                  while(!ECHO_MIDDLE)
                  {
                      L=(TMR1L);
                      H=(TMR1H);
                      if(H>0xF0)
                               break;
                  }
                  TMR1H=0;
                  TMR1L=0;
                  T1CON.TMR1ON=1;
                  while(ECHO_MIDDLE)
                  {
                      L=(TMR1L);
                      H=(TMR1H);
                      if(H>0xF0)
                                    break;
                  }
                  L=(TMR1L);
                  H=(TMR1H);
                  x=(H*256 + L)*0.2;
                  y= (x/2)/29.1;
                  return (int)y;
       }
       else if(Sensor == 'R'){
                  TRIG_RIGHT = 0;
                  delay_us(2);
                  TRIG_RIGHT = 1;
                  delay_us(5);
                  TRIG_RIGHT =0;

                  while(!ECHO_RIGHT)
                  {
                      L=(TMR1L);
                      H=(TMR1H);
                      if(H>0xF0)
                                break;
                  }
                  TMR1H=0;
                  TMR1L=0;
                  T1CON.TMR1ON=1;
                  while(ECHO_RIGHT)
                  {
                      L=(TMR1L);
                      H=(TMR1H);
                      if(H>0xF0)
                                    break;
                  }
                  L=(TMR1L);
                  H=(TMR1H);
                  x=(H*256 + L)*0.2;
                  y= (x/2)/29.1;
                  return (int)y;
       }
       else if(Sensor == 'L'){
                  TRIG_LEFT = 0;
                  delay_us(2);
                  TRIG_LEFT = 1;
                  delay_us(5);
                  TRIG_LEFT =0;

                  while(!ECHO_LEFT)
                  {
                      L=(TMR1L);
                      H=(TMR1H);
                      if(H>0xF0)
                                break;
                  }
                  TMR1H=0;
                  TMR1L=0;
                  T1CON.TMR1ON=1;
                  while(ECHO_LEFT)
                  {
                      L=(TMR1L);
                      H=(TMR1H);
                      if(H>0xF0)
                                    break;
                  }
                  L=(TMR1L);
                  H=(TMR1H);
                  x=(H*256 + L)*0.2;
                  y= (x/2)/29.1;
                  return (int)y;
       }
}