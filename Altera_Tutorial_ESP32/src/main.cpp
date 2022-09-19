#include <Arduino.h>
#include <WiFi.h>
#include <FirebaseESP32.h>

// Change to your Firebase RTDB project ID e.g. Your_Project_ID.firebaseio.com
#define FIREBASE_HOST "alteratutorial-default-rtdb.europe-west1.firebasedatabase.app"
// Change to your Firebase RTDB secret password
#define FIREBASE_AUTH "9U5cGGnuLfcHWckDeVCA5hvMSf1Ki55yUNlVU6BQ"

// What WIFI we are using to send and receive.
#define WIFI_SSID "upstairs"
#define WIFI_PASSWORD "10203040"

#define ledpin 2x
// legs of ESP that we recieve and transmit
#define RXD2 16
#define TXD2 17

#define ledpin 2
// Define Firebase Data objects
FirebaseData fbdo;
int rx0;
// integers of the firebase
int num, num2;
// boolean which allows the LED to "breath"
bool a = false;
void blink();
int espRX, espTX;

// Runs when you first power up the system
void setup()
{
  // defines frequency of reading and writing from ALTERA
  Serial2.begin(9600, SERIAL_8N1, RXD2, TXD2);
  // Connects to wifi
  WiFi.begin(WIFI_SSID, WIFI_PASSWORD);
  Serial.print("Connecting to Wi-Fi");
  // while WIFI is not connected print "." every 300ms
  while (WiFi.status() != WL_CONNECTED)
  {
    Serial.print(".");
    delay(300);
  }
  Serial.println();
  Serial.print("Connected with IP: ");
  Serial.println(WiFi.localIP());
  Serial.println();

  // connects with Firebase, basically stores Firebase's legacy authentication credentials
  Firebase.begin(FIREBASE_HOST, FIREBASE_AUTH);
  // reconnects WIFI if the connection is lost
  Firebase.reconnectWiFi(true);
}

// Always runs when the system is on
void loop()
{
  // Firebase reads the integer in the firebase database(the realtime console) and then fbdo = firebase data object
  if (Firebase.getInt(fbdo, "num"))
  {
    // LIGHT_R in here is the LIGHT_R on the Firebase database
    num = fbdo.intData();
  }
  // delay for the ESP so its not getting seizure (overload)
  delay(10);

  // gets the stored bytes from the serial port that are available for reading
  if (Serial2.available())
  {
    // Seiral.Write() Prints data to the serial port as human-readable ASCII text and this converts LIGHT_R to binary
    byte switchBit = -1;
    if (Serial2.available() == 1)
    {
      switchBit = Serial2.read();
      Serial2.println(switchBit);
    }

    Serial2.write(num);
  }
  delay(2);

  // LED blink to check if the loop worked
  delay(50);
  blink();
}

void blink()
{
  a = not a;
  if (a)
    digitalWrite(ledpin, HIGH);
  else
    digitalWrite(ledpin, LOW);
}