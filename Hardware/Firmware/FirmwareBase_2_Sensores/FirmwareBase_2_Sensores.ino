#include <ESP8266WiFi.h>
#include <WiFiClient.h>

#ifndef STASSID
#define STASSID "FAMILIA_GALLEGO"
#define STAPSK  "10091467hernando"
#endif

const char* ssid     = STASSID;
const char* password = STAPSK;

int Pin = 2;
int Pin2 = 14;

int flowPin1 = 5;
int flowPin2 = 4;

unsigned long flow1count = 0;
unsigned long flow2count = 0;

void setup()
{
    pinMode(Pin, OUTPUT);
    pinMode(Pin2, OUTPUT);
    digitalWrite(Pin, LOW);
    digitalWrite(Pin2, HIGH);
    Serial.begin(9600);
    Serial.print("Conectando a : ");
    Serial.println(ssid);

    WiFi.mode(WIFI_STA);
    WiFi.begin(ssid, password);

    while (WiFi.status() != WL_CONNECTED) {
      digitalWrite(Pin, HIGH);
      digitalWrite(Pin2, LOW);
      delay(150);
      digitalWrite(Pin, LOW);
      digitalWrite(Pin2, HIGH);
      delay(150);
      Serial.print(".");
    }
    
    Serial.println("");
    digitalWrite(Pin, HIGH);
    digitalWrite(Pin2, LOW);
    Serial.println("WiFi connectado");
    Serial.println("IP: ");
    Serial.println(WiFi.localIP());
    
    pinMode(flowPin1, INPUT_PULLUP);
    attachInterrupt(flowPin1, flow1, CHANGE);
    pinMode(flowPin2, INPUT_PULLUP);
    attachInterrupt(flowPin2, flow2, CHANGE);
}

void loop()
{
  Serial.print("Sensor 1: ");
  Serial.print(flow1count/450.0);
  Serial.print("Sensor 2: ");
  Serial.println(flow2count/450.0);
  //Serial.print("\tFlow 1 in pulses: ");
  //Serial.print(flow1count);
  //Serial.print("\tFlow 2 in pulse: ");
  //Serial.println(flow2count);
  delay(5000);
}

void flow1()
{
  flow1count +=1;
}

void flow2()
{
  flow2count +=1;
}
