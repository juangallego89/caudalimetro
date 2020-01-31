#include <ESP8266WiFi.h>
#include <WiFiClient.h>

int flowPin1 = 5;
int flowPin2 = 4;
unsigned long flow1count = 0;
unsigned long flow2count = 0;

void setup()
{
    Serial.begin(115200);
    pinMode(flowPin1, INPUT_PULLUP);
    attachInterrupt(flowPin1, flow1, CHANGE);
    pinMode(flowPin2, INPUT_PULLUP);
    attachInterrupt(flowPin2, flow2, CHANGE);
}

void loop()
{
  Serial.print("Flow 1 in Liters: ");
  Serial.print(flow1count/450.0);
  Serial.print("\tFlow 2 in Liters: ");
  Serial.print(flow2count/450.0);
  Serial.print("\tFlow 1 in pulses: ");
  Serial.print(flow1count);
  Serial.print("\tFlow 2 in pulse: ");
  Serial.println(flow2count);
  delay(2000);
}

void flow1()
{
flow1count +=1;
}

void flow2()
{
flow2count +=1;
}
