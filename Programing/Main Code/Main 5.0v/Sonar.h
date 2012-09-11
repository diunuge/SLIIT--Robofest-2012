#define TRIG PORTD.B0
#define ECHO PORTD.B1

int _counter;
float _responseTime, _distance;

float getSonarDistance(){
      TRIG = 0;
      delay_us(10);
      TRIG = 1;
      delay_us(10);
      TRIG = 0;

      while(ECHO==0);
      _counter = 0;

      while(ECHO==1){
            _counter++;
      }
      _responseTime = _counter * 0.2 * 0.000001; //in s
      _distance = 340 * _responseTime * 100 /2;// in cm
      return _distance;
}

unsigned short getDistanceSonar2(char c){
       unsigned double x,y;
       unsigned int L;
       unsigned int H;
       TMR1H=0x00;
       TMR1L=0x00;
       if(c=='L'){

                  TRIG = 0;
                  delay_us(2);
                  TRIG = 1;
                  delay_us(5);
                  TRIG =0;

                  while(!ECHO)
                  {
                      L=(TMR1L);
                      H=(TMR1H);
                      if(H>0xF0)
                               break;
                  }
                  TMR1H=0;
                  TMR1L=0;
                  T1CON.TMR1ON=1;
                  while(ECHO)
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
       }/*else if(c == 'R'){
                  TRIG = 0;
                  delay_us(2);
                  TRIG = 1;
                  delay_us(5);
                  TRIG =0;

                  while(!ECHO)
                  {
                      L=(TMR1L);
                      H=(TMR1H);
                      if(H>0xF0)
                                break;
                  }
                  TMR1H=0;
                  TMR1L=0;
                  T1CON.TMR1ON=1;
                  while(ECHO)
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
       }*/
}