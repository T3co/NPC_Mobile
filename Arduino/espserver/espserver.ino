#include <WiFi.h>
#include <WebServer.h>
#include <Arduino.h>
#include <WiFiMulti.h>
#include "website.h"

#define RXD2 16
#define TXD2 17

#define ledpin 2
WiFiMulti wifiMulti;


WebServer server(80);
char XML[512];
char buf[64];

int temp = 0;
int packet = 0;
bool a = false;

void UXML(){//updates the char array of the XML (the "file")
   strcpy(XML, "<?xml version = '1.0'?>\n<Data>\n");
  sprintf(buf, "<temp>%d</temp>\n", temp);
  strcat(XML, buf);
  sprintf(buf, "<packet>%d</packet>\n", packet);
  strcat(XML, buf);
  strcat(XML, "</Data>\n");
}

void setup() {

  Serial.begin(9600);
  Serial2.begin(9600, SERIAL_8N1, RXD2, TXD2);

  pinMode(ledpin, OUTPUT);

  wifiMulti.addAP("Ams_2.4GHz", "0523993253A");
  wifiMulti.addAP("ORYAM", "12345678");
  wifiMulti.addAP("upstairs", "10203040");

  // WiFi.scanNetworks will return the number of networks found
  int n = WiFi.scanNetworks();
  Serial.println("scan done");
  if (n == 0) {
      Serial.println("no networks found");
  } 
  else {
    Serial.print(n);
    Serial.println(" networks found");
    for (int i = 0; i < n; ++i) {
      // Print SSID and RSSI for each network found
      Serial.print(i + 1);
      Serial.print(": ");
      Serial.print(WiFi.SSID(i));
      Serial.print(" (");
      Serial.print(WiFi.RSSI(i));
      Serial.print(")");
      Serial.println((WiFi.encryptionType(i) == WIFI_AUTH_OPEN)?" ":"*");
      delay(10);
    }
      
  }

  Serial.println("Starting Server");
if(wifiMulti.run() != WL_CONNECTED) {
  Serial.println("WiFi not connected!");
  delay(1000);
}

  while (WiFi.status() != WL_CONNECTED) {
    delay(500);
    Serial.print(".");
  }
  Serial.println("");
  Serial.print("Connecting To: " );
  Serial.print(WiFi.SSID());
  Serial.println("");
  Serial.print("Connected! IP address: ");
  String ipAddress = WiFi.localIP().toString();;
  Serial.println(ipAddress);

  server.on("/", SendWebsite);
  server.on("/xml", SXML);
  server.on("/upacket", upacket);

  server.begin();
}

void loop() {

     if(Serial2.available()){
    Serial2.write(packet);
    delay(10);
  }
  
    while (Serial2.available()) {
    temp = Serial2.read();
    UXML();   
  }

  blink();
  delay(50);
  server.handleClient();
}

void SendWebsite(){
  server.send(200, "text/html", PAGE_MAIN);//sends the client the HTML + JS file
}
void SXML(){//creates a displayable XML file for the webpage
  strcpy(XML, "<?xml version = '1.0'?>\n<Data>\n");
  sprintf(buf, "<temp>%d</temp>\n", temp);
  strcat(XML, buf);
  sprintf(buf, "<packet>%d</packet>\n", packet);
  strcat(XML, buf);
  strcat(XML, "</Data>\n");
  server.send(200, "text/xml", XML);
}

void upacket(){
  //this function gets called when the server sends a packet update from the users input
  String t_state = server.arg("VALUE");
  packet = t_state.toInt();
  
 

  Serial.print("Packet Info :"); Serial.println(packet);

  server.send(200, "text/plain", buf);
}

void blink() {//makes the blue LED of the esp blink for each loop it completes
  a = not a;
  if (a)
    digitalWrite(ledpin, HIGH);
  else
    digitalWrite(ledpin, LOW);
}
