#define  IRSensor0  PORTA.B0

unsigned int ir_value;

int getDistanceIR_GP2D120(unsigned int ir_value);

float getDistanceIR_GP2D120(unsigned int ir_value){           //10-bit results
      float voltage = ir_value/1024*5;
      if( 610<=ir_value && ir_value<623)         //3cm - 3.75cm
            return 3.0 - 12.5*(voltage - 3.04);
      else if( 557<=ir_value && ir_value<610 )
            return 3.75 - 1.04*(voltage - 2.98);  //3.75 - 4cm
      else
            return 20.0;
}