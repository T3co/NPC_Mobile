#include <WiFi.h>
#include <WebServer.h>
#include "website.h"


#define LOCAL_SSID "upstairs"
#define LOCAL_PASSWORD "10203040"

WebServer server(80);
char XML[512];
char buf[32];

int temp = 20;
int car = 0;

void setup() {
  Serial.begin(9600);

  Serial.println("Starting Server");

  WiFi.begin(LOCAL_SSID, LOCAL_PASSWORD);
  Serial.println("Connecting To WiFi...");

  while(WiFi.status() != WL_CONNECTED)
  {
    delay(500);
    Serial.print(".");
  }

  Serial.println("IP address :"); Serial.print(WiFi.localIP());

  server.on("/", SendWebsite);
  server.on("/xml", SXML);

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
  strcat(XML, "</Data>\n");
  Serial.println(XML);
  server.send(200, "text/xml", XML);
}
