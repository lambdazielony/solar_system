#include "HX711.h"

#define calibration_factor 3600.0 //This value is obtained using the SparkFun_HX711_Calibration sketch

#define DOUT  2
#define CLK  3

float kg = 0;

HX711 scale(DOUT, CLK);

void setup() {
  Serial.begin(9600);
  scale.set_scale(calibration_factor); //This value is obtained by using the SparkFun_HX711_Calibration sketch
  scale.tare(); //Assuming there is no weight on the scale at start up, reset the scale to 0
}

void loop() {
  kg = scale.get_units()*0.45;
  if(abs(kg) < 100) {
    Serial.print("0");
    if(abs(kg) < 10) Serial.print("0");
  }
  Serial.print(abs(kg));
  Serial.println();
}
