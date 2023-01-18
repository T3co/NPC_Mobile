#include <Arduino.h>
#include <WiFi.h>
#include <FirebaseESP32.h>
#include <WiFiMulti.h>

#define FIREBASE_HOST "alteratutorial-default-rtdb.europe-west1.firebasedatabase.app"
#define FIREBASE_AUTH "9U5cGGnuLfcHWckDeVCA5hvMSf1Ki55yUNlVU6BQ"

// #define WIFI_SSID "ORYAM"
// #define WIFI_PASSWORD "12345678"

#define RXD2 16
#define TXD2 17

#define ledpin 2

WiFiMulti wifiMulti;

FirebaseData fbdo;
int rx0;
int motors, temperature, leds, packet, ServoMotors;

bool a = false;
void blink();

void setup() {
  Serial.begin(115200);
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

  // WiFi.begin(WIFI_SSID, WIFI_PASSWORD);
  // Serial.print("Connecting to Wi-Fi");

  // while (WiFi.status() != WL_CONNECTED) {
  //   Serial.print(".");
  //   delay(300);
  // }
  // Serial.println("Connected with IP: ");
  // Serial.print(WiFi.localIP());

  Firebase.begin(FIREBASE_HOST, FIREBASE_AUTH);
  Serial.println("Firebase Connected");
  Firebase.reconnectWiFi(true);
}

void loop() {
  while (Serial2.available()) {
    temperature = Serial2.read();
  }


  if (Firebase.ready()) {
    Firebase.setInt(fbdo, "kar98Info/temperature", temperature);

    if (Firebase.getInt(fbdo, "kar98Info/carControl")) {
      packet = fbdo.intData();
    }
  }
  delay(10);
  if (Serial2.available()) {
    Serial2.write(packet);
    delay(10);
  }

  fbdo.clear();
  blink();
}

void blink() {
  a = not a;
  if (a)
    digitalWrite(ledpin, HIGH);
  else
    digitalWrite(ledpin, LOW);
}