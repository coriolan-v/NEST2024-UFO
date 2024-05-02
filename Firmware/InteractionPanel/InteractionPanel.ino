#define COPILOT


#include "UIDs.h"
#include <DFRobot_PN532.h>
#include <Ethernet.h>
#include <EthernetUdp.h>
#include <SPI.h>

EthernetUDP Udp;

IPAddress pcIP(10, 0, 0, 1);
//IPAddress pcIP(127, 0, 0, 0);
const unsigned int pcPort = 5001;
const unsigned int arduinoPort = 8888;

#ifdef PILOT
IPAddress ip(10, 0, 0, 4);
byte mac[] = {
  0xDE, 0xAD, 0xBE, 0xEF, 0xFE, 0xED
};  // you can find this written on the board of some Arduino Ethernets or shields
#endif

#ifdef COPILOT
IPAddress ip(10, 0, 0, 5);
byte mac[] = {
  0xDE, 0xAD, 0xBE, 0xEF, 0xFE, 0xEF
};  // you can find this written on the board of some Arduino Ethernets or shields
#endif

#define BLOCK_SIZE 16
#define PN532_IRQ (2)
#define INTERRUPT (1)
#define POLLING (0)
// Use this line for a breakout or shield with an I2C connection
// Check the card by polling
DFRobot_PN532_IIC nfc(PN532_IRQ, POLLING);
DFRobot_PN532::sCard_t NFCcard;

unsigned long stampMillis;
String udpmessage = "";

void setup() {
  Serial.begin(115200);

  Ethernet.begin(mac, ip);
  Udp.begin(arduinoPort);
  Udp.setTimeout(1);

  Serial.print("My ip: ");
  Serial.println(ip);

  //Initialize the NFC module
  while (!nfc.begin()) {
    Serial.println("NFC init failure");
//     Udp.beginPacket(pcIP, pcPort);
// #ifdef PILOT
//     Udp.write("PILOT NFC init failure");  // send the bytes to the SLIP stream
// #endif
// #ifdef COPILOT
//     Udp.write("COPILOT NFC init failure");  // send the bytes to the SLIP stream
// #endif
//     Udp.endPacket();  // mark the end of the OSC Packet
    delay(1000);
  }

//   Udp.beginPacket(pcIP, pcPort);
//   Serial.println("Successfully init NFC module");
// #ifdef PILOT
//   Udp.write("PILOT Successfully NFC init ");  // send the bytes to the SLIP stream
// #endif
// #ifdef COPILOT
//   Udp.write("COPILOT Successfully NFC init ");  // send the bytes to the SLIP stream
// #endif
//   Udp.endPacket();  // mark the end of the OSC Packet
}

bool cardPresent = false;

//String old_cardUID = "1";
uint8_t new_cardUID[4];
uint8_t compare_cardUID[4];

void loop() {

  if (nfc.scan()) {

    if (cardPresent == false) {
      //if (new_cardUID != old_cardUID) {
      cardPresent = true;
      Serial.println("new card");

      //sendOSC(1);

      NFCcard = nfc.getInformation();

      //for (int i = 0; i < 4; i++) new_cardUID[i] = 0;

      //Serial.print("UID Lenght: ");
      //Serial.println(NFCcard.uidlenght);
      //Serial.print("UID: ");
      for (int i = 0; i < 4; i++) {
        //Serial.print(NFCcard.uid[i]);
        //Serial.print(" ");
        new_cardUID[i] = NFCcard.uid[i];
      }
      //
      //Serial.println();
      Serial.print("new_cardUID: ");
      for (int i = 0; i < 4; i++) {
        Serial.print(new_cardUID[i]);
        Serial.print(" ");
      }
      Serial.println();

      for (int i = 0; i < 50; i++) 
      {

        // for (int j = 0; j < 4; j++) 
        // {
        //   compare_cardUID[j] = 0;
        // }

        for (int j = 0; j < 4; j++){
        compare_cardUID[j] = cardUIDs[i][j];
        } 

        // Serial.print("cardUIDs: ");
        // for (int k = 0; k < 4; k++) {
        //   Serial.print(cardUIDs[i][k]);
        //   Serial.print(" ");
        // }

        // Serial.print("compare_cardUID: ");
        // for (int k = 0; k < 4; k++) {
        //   Serial.print(compare_cardUID[k]);
        //   Serial.print(" ");
        // }
        // Serial.println();


        if (areEqual(new_cardUID, compare_cardUID)) {
          if (i < 10) {
            Serial.println("Match group 1");
            sendOSC(1);
          } else if (i >= 10 && i < 20) {
            Serial.println("Match group 2");
            sendOSC(2);
          } else if (i >= 20 && i < 30) {
            Serial.println("Match group 3");
            sendOSC(3);
          } else if (i >= 30 && i < 30) {
            Serial.println("Match group 4");
            sendOSC(4);
          } else if (i >= 40) {
            Serial.println("Match group 5");
            sendOSC(5);
          } else {
            Serial.println("else Match group 5");
            sendOSC(5);
          }
        }
      }

      // for(int i = 0; i < 50; i++){
      //   if(new_cardUID == cardUIDs[i]){
      //     if(i < 10){
      //       Serial.println("Match group 1");
      //       sendOSC(1);
      //     } else if (i >= 10 && i < 20){
      //       Serial.println("Match group 2");
      //       sendOSC(2);
      //     } else if (i >= 20 && i < 30){
      //       Serial.println("Match group 3");
      //       sendOSC(3);
      //     }else if (i >= 30 && i < 30){
      //       Serial.println("Match group 4");
      //       sendOSC(4);
      //     }else if (i >= 40){
      //       Serial.println("Match group 5");
      //       sendOSC(5);
      //     }else{
      //       Serial.println("else - group 5");
      //       sendOSC(5);
      //     }
      //   }
      // }

      stampMillis = millis();
    }
  } else {
    if (cardPresent == true && millis() > stampMillis + 3000) {
      cardPresent = false;

      Serial.print("card removed ");
      sendOSC(0);
    }
  }
}


bool areEqual(uint8_t arr1[], uint8_t arr2[]) {
  for (int i = 0; i < 4; i++) {
    if (arr1[i] != arr2[i]) {
      return false;
    }
  }
  return true;
}

void sendOSC(int messageID) {
  //OSCMessage msg();

    Udp.beginPacket(pcIP, pcPort);

    if (messageID == 0) {
  #ifdef PILOT
      Udp.write("PILOT/0");  // send the bytes to the SLIP stream
      Serial.println("PILOT/0");
  #endif

  #ifdef COPILOT
      Udp.write("COPILOT/0");  // send the bytes to the SLIP stream
      Serial.println("COPILOT/0");
  #endif
    } else {
  #ifdef PILOT
      if(messageID == 1) Udp.write("PILOT/1");
      if(messageID == 2) Udp.write("PILOT/2");
      if(messageID == 3) Udp.write("PILOT/3");
      if(messageID == 4) Udp.write("PILOT/4");
      if(messageID == 5) Udp.write("PILOT/5");

      //Udp.write("PILOT/" + messageID);  // send the bytes to the SLIP stream
      Serial.println("PILOT/" + messageID);
  #endif
  #ifdef COPILOT
      if(messageID == 1) Udp.write("COPILOT/1");
      if(messageID == 2) Udp.write("COPILOT/2");
      if(messageID == 3) Udp.write("COPILOT/3");
      if(messageID == 4) Udp.write("COPILOT/4");
      if(messageID == 5) Udp.write("COPILOT/5");


      //Udp.write("COPILOT/" + messageID);  // send the bytes to the SLIP stream
      Serial.println("COPILOT/" + messageID);
  #endif
    }

    //msg.send(Udp);    // send the bytes to the SLIP stream
    Udp.endPacket();  // mark the end of the OSC Packet
    //msg.empty();      // free space occupied by message

    Serial.println("Sent UDP message!");
    //S//erial.println(messageToSend);
}

// void sendUDPmessage(String udpmessage)
// {
//   char charBuf[50];
//  udpmessage.toCharArray(charBuf, 50)


// Udp.beginPacket(pcIP, pcPort);

// #ifdef PILOT
//   //OSCMessage msg("PILOT");
//   Udp.write("PILOT");    // send the bytes to the SLIP stream
// #endif

// #ifdef COPILOT
//   //OSCMessage msg("COPILOT");
//   Udp.write("COPILOT");    // send the bytes to the SLIP stream
// #endif

//   Udp.endPacket();  // mark the end of the OSC Packet
//   //msg.empty();      // free space occupied by message

//   Serial.print("Sent OSC message :"); Serial.println(udpmessage);
// }
