#include <Arduino.h>
#include <WiFi.h>
#include <FirebaseESP32.h>

// Change to your Firebase RTDB project ID e.g. Your_Project_ID.firebaseio.com
#define FIREBASE_HOST "alteratutorial-default-rtdb.europe-west1.firebasedatabase.app"
// Change to your Firebase RTDB secret password
#define FIREBASE_AUTH "9U5cGGnuLfcHWckDeVCA5hvMSf1Ki55yUNlVU6BQ"

// What WIFI we are using to send and receive.
#define WIFI_SSID "ORYAM"
#define WIFI_PASSWORD "10203040"

// legs of ESP that we receive and transmit
#define RXD2 16
#define TXD2 17

#define ledpin 2

// Define Firebase Data objects
FirebaseData fbdo;
int rx0;
// integers of the firebase
int motors, temperature, leds, packet, ServoMotors;

//Boolean which allows the LED to "breath"
bool a = false;
/*  ------------- functions declaration---------------------*/
void blink();
/*-----------------------------------------------------------*/

void setup()
{
    //Serial - used for printing data, speed of reading from terminal
  Serial.begin(115200);
    //Serial2 - sending and recieving data variable (bps, type of data, RX, TX)
  Serial2.begin(9600, SERIAL_8N1, RXD2, TXD2);

  //define the leg of output on the LED
  pinMode(ledpin, OUTPUT);

  //defines frequency of reading and writing from ALTERA
  WiFi.begin(WIFI_SSID, WIFI_PASSWORD);
    // Connects to wifi
  Serial.print("Connecting to Wi-Fi");

  // while WIFI is not connected print "." every 300ms
  while (WiFi.status() != WL_CONNECTED)
  {
    Serial.print(".");
    delay(300);
  }
  Serial.println("Connected with IP: ");
  Serial.print(WiFi.localIP());

  //connects with Firebase, basically stores Firebase's legacy authentication credentials
  Firebase.begin(FIREBASE_HOST, FIREBASE_AUTH);
  Serial.println("Firebase Connected");
    //reconnects WIFI if the connection is lost
  Firebase.reconnectWiFi(true);
}

// Always runs when the system is on
void loop()
{
   while (Serial2.available())
  {
    temperature = Serial2.read();
  }

  // When firebase is ready to recieve data
  if (Firebase.ready())
  {
       Firebase.setInt(fbdo, "messages/temperature", temperature);
       
      //Firebase reads the integer in the firebase database(the realtime console) and then fbdo = firebase data object
      if (Firebase.getInt(fbdo, "messages/motors"))
      {
      // motors in here is the motors on the Firebase database
       motors = fbdo.intData();
      }

      if (Firebase.getInt(fbdo, "messages/leds"))
      {
        leds = fbdo.intData();
      }
      
      if (Firebase.getInt(fbdo, "messages/ServoMotors"))
      {
        ServoMotors = fbdo.intData();
      }


   
  }
  
  //delay for the ESP so its not getting seizure (overload)
  delay(10);

  // gets the stored bytes from the serial port that are available for reading
  if (Serial2.available())
  {
    //packet is the 8 bit_vector when sending data, the first 4 bits are for the motors, the fifth is for the leds, and the last 3 are for the Servo motors
    packet = leds * 16 + motors + ServoMotors;
    //Serial.Write() Prints data to the serial port as human-readable ASCII text and this converts FromFB to binary
    Serial2.write(packet);
    delay(10);
  }

  fbdo.clear();
  //LED blink to check if the loop worked
  blink();
}

// if a is false then a is changed to true and them runs a loop once and turns back to false and that causes the LED to "breath" or turn on and off a lot
void blink()
{
  a = not a;
  if (a)
    digitalWrite(ledpin, HIGH);
  else
    digitalWrite(ledpin, LOW);
}