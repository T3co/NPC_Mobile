#include <Arduino.h>
#include <WiFi.h>
#include <FirebaseESP32.h>
#include <WiFiMulti.h>

#define FIREBASE_HOST "alteratutorial-default-rtdb.europe-west1.firebasedatabase.app"
#define FIREBASE_AUTH "9U5cGGnuLfcHWckDeVCA5hvMSf1Ki55yUNlVU6BQ"

#define RX2 16
#define TX2 17
#define ledpin 2

WiFiMulti wifiMulti;
FirebaseData fbdo;
int temperature, packet;

bool a = false;
void blink();
void connectToWiFi();

void setup() {
  Serial.begin(115200);
  Serial2.begin(9600, SERIAL_8N1, RX2, TX2);

  pinMode(ledpin, OUTPUT);

  connectToWiFi();

  Firebase.begin(FIREBASE_HOST, FIREBASE_AUTH);
  Firebase.reconnectWiFi(true);
}

void connectToWiFi() {
  wifiMulti.addAP("Ams_2.4GHz", "0523993253A");
  wifiMulti.addAP("ORYAM", "12345678");
  wifiMulti.addAP("upstairs", "10203040");

  while (wifiMulti.run() != WL_CONNECTED) {
    Serial.println("WiFi not connected. Retrying...");
    delay(1000);
  }

  Serial.printf("Connected to %s\nIP address: %s\n", WiFi.SSID().c_str(),
                WiFi.localIP().toString().c_str());
}

const char* TEMPERATURE_PATH = "/kar98Info/temperature";
const char* CAR_CONTROL_PATH = "/kar98Info/carControl";

void loop() {
  readTemperature();
  checkCarControl();
  sendPacket();
  blink();
}

void readTemperature() {
  while (Serial2.available()) {
    temperature = Serial2.read();
  }
}

void checkCarControl() {
  if (Firebase.ready()) {
    if (Firebase.getInt(fbdo, CAR_CONTROL_PATH)) {
      packet = fbdo.intData();
      Serial.println(packet);
    }
    fbdo.clear();
  }
}

void sendPacket() {
  if (Serial2.available()) {
    Serial2.write(packet);
  }
}

void blink() {
  a = not a;
  if (a)
    digitalWrite(ledpin, HIGH);
  else
    digitalWrite(ledpin, LOW);
}