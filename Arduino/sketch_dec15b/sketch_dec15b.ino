#include <Arduino.h>
#include <WiFi.h>
#include <FirebaseESP32.h>

#define FIREBASE_HOST "alteratutorial-default-rtdb.europe-west1.firebasedatabase.app"
#define FIREBASE_AUTH "9U5cGGnuLfcHWckDeVCA5hvMSf1Ki55yUNlVU6BQ"

#define WIFI_SSID "upstairs"
#define WIFI_PASSWORD "10203040"

#define RXD2 16
#define TXD2 17

#define ledpin 2

FirebaseData fbdo;
int rx0;
int motors, temperature, leds, packet, ServoMotors;

bool a = false;
void blink();

void setup() {
  Serial.begin(115200);
  Serial2.begin(9600, SERIAL_8N1, RXD2, TXD2);

  pinMode(ledpin, OUTPUT);

  WiFi.begin(WIFI_SSID, WIFI_PASSWORD);
  Serial.print("Connecting to Wi-Fi");

  while (WiFi.status() != WL_CONNECTED) {
    Serial.print(".");
    delay(300);
  }
  Serial.println("Connected with IP: ");
  Serial.print(WiFi.localIP());

  Firebase.begin(FIREBASE_HOST, FIREBASE_AUTH);
  Serial.println("Firebase Connected");
  Firebase.reconnectWiFi(true);
}

void loop() {
  while (Serial2.available()) {
    temperature = Serial2.read();
  }


  if (Firebase.ready()) {
    Firebase.setInt(fbdo, "messages/temperature", temperature);

    if (Firebase.getInt(fbdo, "messages/motors")) {
      motors = fbdo.intData();
    }

    if (Firebase.getInt(fbdo, "messages/leds")) {
      leds = fbdo.intData();
    }

    if (Firebase.getInt(fbdo, "messages/ServoMotors")) {
      ServoMotors = fbdo.intData();
    }
  }
  delay(10);
  if (Serial2.available()) {
    ServoMotors *= 16;
    leds *= 256;
    packet = motors + ServoMotors + leds;
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