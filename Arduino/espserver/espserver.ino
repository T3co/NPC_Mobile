#include <WiFi.h>
#include <WebServer.h>
#include <Arduino.h>
#include <WiFiMulti.h>
#include "website.h"

#define RXD2 16
#define TXD2 17

#define ledpin 2

#define LOCAL_SSID "upstairs"
#define LOCAL_PASSWORD "10203040"

WiFiMulti wifiMulti;


WebServer server(80);
char XML[512];
char buf[32];

int temp = 20;
int packet = 0;
bool a = false;



void setup() {

  Serial.begin(9600);
  Serial2.begin(9600, SERIAL_8N1, RXD2, TXD2);

  pinMode(ledpin, OUTPUT);

  wifiMulti.addAP("Ams_2.4GHz", "0523993253A");
  wifiMulti.addAP("ORYAM", "12345678");
  wifiMulti.addAP("upstairs", "10203040");
  wifiMulti.addAP("DARCA", "");

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


  Serial.println("IP address :"); Serial.print(WiFi.localIP());

  server.on("/", SendWebsite);
  server.on("/xml", SXML);
  server.on("/upacket", upacket);

  server.begin();
}

void loop() {
  server.handleClient();
}

void SendWebsite(){
  server.send(200, "text/html", PAGE_MAIN);
}
void SXML(){
  strcpy(XML, "<?xml version = '1.0'?>\n<Data>\n");
  sprintf(buf, "<temp>%d</temp>\n", temp);
  strcat(XML, buf);
  sprintf(buf, "<packet>%d</packet>\n", packet);
  strcat(XML, buf);
  strcat(XML, "</Data>\n");
  server.send(200, "text/xml", XML);
}

void upacket(){
  String t_state = server.arg("VALUE");
  Serial.println(t_state);
  packet = t_state.toInt();
  strcpy(XML, "<?xml version = '1.0'?>\n<Data>\n");
  sprintf(buf, "<temp>%d</temp>\n", temp);
  strcat(XML, buf);
  sprintf(buf, "<packet>%d</packet>\n", packet);
  strcat(XML, buf);
  strcat(XML, "</Data>\n");  
  server.send(200, "text/plain", buf);
}

void blink() {
  a = not a;
  if (a)
    digitalWrite(ledpin, HIGH);
  else
    digitalWrite(ledpin, LOW);
}
