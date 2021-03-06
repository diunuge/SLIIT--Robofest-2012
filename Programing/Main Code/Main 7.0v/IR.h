#define  IRSensorCenter  PORTA.B0
#define  IRSensorRight   PORTA.B1
#define  IRSensorLeft    PORTA.B2

unsigned int ir_value;
float voltage;
int isRightSafe();
int isMiddleSafe();
int isLeftSafe();

int getDistanceIR_GP2D120(char sensor);

float getDistanceIR_GP2D120(char sensor){           //10-bit results
      if (sensor == 'M'){
            ir_value = ADC_Read(IRSensorCenter);
      }
      else if(sensor == 'R'){
            ir_value = ADC_Read(IRSensorRight);
      }
      else if(sensor == 'L'){
            ir_value = ADC_Read(IRSensorLeft);
      }
      else
            ir_value = 0;
            
      voltage = (float)ir_value/1024*5;
      if( 610<=ir_value && ir_value<623)         //3cm - 3.75cm
            return 3.0 - 12.5*(voltage - 3.04);
            
      else if( 557<=ir_value && ir_value<610 )
            return 3.75 - 1.04*(voltage - 2.98);  //3.75 - 4cm
            
      else if( 481<=ir_value && ir_value<557 )
            return 5 - 2.5*(voltage - 2.75);       //4cm - 5cm
            
      else if( 409<=ir_value && ir_value<481 )
            return 6 - 2.85*(voltage - 2.35);       //5cm - 6cm
            
      else if( 364<=ir_value && ir_value<409 )
            return 7 - 4*(voltage - 2);             //6cm - 7cm
            
      else if( 317<=ir_value && ir_value<364 )
            return 8 - 5*(voltage - 1.75);          //7cm - 8cm
            
      else if( 286<=ir_value && ir_value<317 )
            return 9 - 6.667*(voltage - 1.55);      //8cm - 9cm
            
      else if( 256<=ir_value && ir_value<286 )
            return 10 - 6.667*(voltage - 1.4);       //9cm - 10cm
            
      else if( 215<=ir_value && ir_value<256 )
            return 12 - 10*(voltage - 1.25);         //10cm - 12cm
            
      else if( 186<=ir_value && ir_value<215 )
            return 14 - 15.38*(voltage - 1.05);      //12cm - 14cm
            
      else if( 166<=ir_value && ir_value<186 )
            return 16 - 20*(voltage - 0.94);         //14cm - 16cm
            
      else if( 147<=ir_value && ir_value<166 )
            return 18 - 22.23*(voltage - 0.81);      //16cm - 18cm
            
      else if( 133<=ir_value && ir_value<147 )
            return 20 - 28.57*(voltage - 0.65);       //18cm - 20cm
            
      else if( 106<=ir_value && ir_value<133 )
            return 25 - 45.45*(voltage - 0.52);       //20cm - 25cm
            
      else if( 88<=ir_value && ir_value<106 )
            return 30 - 55*(voltage - 0.43);           //25cm - 30cm
            
      else if( 78<=ir_value && ir_value<88 )
            return 35 - 100*(voltage - 0.38);         //30cm - 35cm

      else if( 65<=ir_value && ir_value<78 )
            return 40 - 83.33*(voltage - 0.32);       //35cm - 40cm
      else
            return 50;
}

/*while(1){
            distanceIR = getDistanceIR_GP2D120('M');
            if( distanceIR < 3.0 )
                  sendText(" 3");
            else if(distanceIR < 4.0)
                  sendText(" 4");
            else if(distanceIR < 5.0)
                  sendText(" 5");
            else if(distanceIR < 6.0)
                  sendText(" 6");
            else if(distanceIR < 7.0)
                  sendText(" 7");
            else if(distanceIR < 8.0)
                  sendText(" 8");
            else if(distanceIR < 9.0)
                  sendText(" 9");
            else if(distanceIR < 10.0)
                  sendText(" 10");
            else if(distanceIR < 11.0)
                  sendText(" 11");
            else if(distanceIR < 12.0)
                  sendText(" 12");
            else if(distanceIR < 13.0)
                  sendText(" 13<");
            else{
                  sendText(" A");
            }
            delay_ms(500);
      }*/
      
int isRightSafe(){
      ir_value = ADC_Read(IRSensorRight);
      if(250<=ir_value && ir_value<800){                         // ~5cm
            return FALSE;
      }
      return TRUE;
}

int isMiddleSafe(){
      ir_value = ADC_Read(IRSensorCenter);
      if(250<=ir_value && ir_value<800){                         // ~5cm
            return FALSE;
      }
      return TRUE;
}

int isLeftSafe(){
      ir_value = ADC_Read(IRSensorLeft);
      if(250<=ir_value && ir_value<800){                         // ~5cm
            return FALSE;
      }
      return TRUE;
}