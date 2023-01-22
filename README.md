IOT robot

using DE10-Lite, ESP32, ESP32-CAM ,LM75(temperature sensor) and LED lights

programing languages : c++,Java,VHDL



Car Design: 

![alt text](https://github.com/T3co/NPC_Mobile/blob/main/npcCar.png?raw=true)


Full Circut Design:

![alt text](https://github.com/T3co/NPC_Mobile/blob/main/fc.png?raw=true)

במעגל השלם המידע של ה – 8 סיביות מגיע מן האפליקציה בין אם זה שליטה ברכב (3 סיביות), שליטה בסרבו (3), שליטה בלייזר (סיבית 1)  ושליטה במהירות של הרכב (סיבית 1). מהאפליקציה זה נשלח באמצעות WIFI אל הפיירבייס ומהפיירבייס אל ה – ESP32 באמצעות WIFI. לאחר מכן ה – ESP32 שולח בעזרת TX,RX את המידע מהאפליקציה אל האלטרה וכך יש תקשורת בין האפליקציה לפיירביס, פיירבייס ל – ESP32, ומה – ESP32 לאלטרה. 
הטמפרטורה נשלחת דרך המשדר של האלטרה לקולט של ה- ESP32 ומשם אל הפיירבייס ואז לאפליקציה באמצעות WIFI.
המצלמה משדרת את הוידאו לשרת רשת שיש לו IP ומהשרת רשת זה משודר לתוך האפליקציה דרך קליטת ה- IP בקוד של האפליקציה.
