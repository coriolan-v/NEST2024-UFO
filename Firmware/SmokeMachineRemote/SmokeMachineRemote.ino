#include <ArtnetEther.h>

#define SMOKE_ON_PIN A0
#define SMOKE_OFF_PIN 11
#define LIGHT_OFF_PIN 12

byte mac[] = {
  0xDE, 0xAD, 0xBE, 0xEF, 0xFE, 0xAA
};
IPAddress ip(10, 0, 0, 9);

ArtnetReceiver artnet;
uint16_t universe1 = 0;  // 0 - 32767

void setup() {
  // put your setup code here, to run once:
  pinMode(SMOKE_ON_PIN, INPUT);
  pinMode(SMOKE_OFF_PIN, INPUT);
  pinMode(LIGHT_OFF_PIN, OUTPUT);
  digitalWrite(LIGHT_OFF_PIN, LOW);
  delay(100);
  pinMode(LIGHT_OFF_PIN, INPUT);

  Serial.begin(115200);

  Ethernet.begin(mac, ip);

  //Check for Ethernet hardware present
  if (Ethernet.hardwareStatus() == EthernetNoHardware) {
    Serial.println("Ethernet shield was not found.  Sorry, can't run without hardware. :(");
    while (true) {
      delay(1);  // do nothing, no point running without Ethernet hardware
    }
  } else {
    Serial.println("Ethernet ok");
  }

  if (Ethernet.linkStatus() == LinkOFF) {
    Serial.println("Ethernet cable is not connected.");
  } else {
    Serial.println("cable ok");
  }

  artnet.begin();

  // artnet.subscribeArtDmxUniverse(10, [&](const uint8_t *data, uint16_t size, const ArtDmxMetadata &metadata, const ArtNetRemoteInfo &remote) {
  //       // if Artnet packet comes to this universe(0-15), this function is called

  //       for (size_t i = 0; i < size; ++i) {
  //   Serial.print(data[i]);
  //   Serial.print(",");
  // }
  // Serial.println();
  //   });

  artnet.subscribeArtDmxUniverse(universe1, callback);
}

void loop() {
  artnet.parse();  // check if artnet packet has come and execute callback

}

void callback(const uint8_t *data, uint16_t size, const ArtDmxMetadata &metadata, const ArtNetRemoteInfo &remote) {
  // you can also use pre-defined callbacks

  // for(int i = 0; i < 512; i++){
  //   Serial.print(data[i]);
  //   Serial.print("/");
    
  //   if(data[i] == 255){
  //     Serial.print("it;s: "); Serial.print(i);
  //   }
  // }
 // Serial.println();
  if(data[282] == 255){
    //Serial.println("ON");

    pinMode(SMOKE_ON_PIN, OUTPUT);
    digitalWrite(SMOKE_ON_PIN, LOW);

  } else if(data[282] < 200){
    //Serial.println("OFF");

    pinMode(SMOKE_ON_PIN, INPUT);
  }
}
