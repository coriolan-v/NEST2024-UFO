import netP5.*; // Need oscP5 0.9.9
import oscP5.*; // Need oscP5 0.9.9
import hypermedia.net.*; // Need UDP 0.1

int processingPort = 5001;

String pcIP = "127.0.0.1";
//String pcIP = "10.0.0.1";
int pcPortELM = 9001;

String OSCmessage_ELM = "/elm/stages/PortalPlan/live/media";
OscMessage oscMessage_ELM;
int mediaGroup[] = {100, 1, 2, 3, 4, 5};
int mediaDoubleInteraction = 6;

String Brightsign_Pilot_IP = "10.0.0.3";
String Brightsign_Copilot_IP = "10.0.0.6";
int BrightsignPort = 5000;

String BrightsignUDP_Pilot_1 = "PILOT1";
String BrightsignUDP_Pilot_2 = "PILOT2";
String BrightsignUDP_Copilot_1 = "COPILOT1";
String BrightsignUDP_Copilot_2 = "COPILOT2";

UDP udp;  // define the UDP object
OscP5 oscP5;
NetAddress PCIPAddress;

void setup() {
  frameRate(30);

  // Setup OSC for communication with ELM
  PCIPAddress = new NetAddress(pcIP, pcPortELM);
  oscP5 = new OscP5(this, 9002);

  // Setup UDP to receive UDP from the arduinos
  udp = new UDP(this, processingPort);
  udp.listen( true );

  // test
  oscMessage_ELM = new OscMessage(OSCmessage_ELM);
  oscMessage_ELM.add(mediaGroup[0]);
  oscP5.send(oscMessage_ELM, PCIPAddress);
}

int[] stamp = new int[2];
int[] mode = new int[2];
boolean sendMessageOnce = false;

void draw() {

  if (mode[0] > 0 && mode[1] > 0)
  {
    if (sendMessageOnce == false) {
      sendMessageOnce = true;
      println("both rfid detected at the same time");
    }
  }
  
}

void receive( byte[] data, String ip, int port ) {  // <-- extended handler

  // get the "real" message =
  // forget the ";\n" at the end <-- !!! only for a communication with Pd !!!
  data = subset(data, 0, data.length);
  String message = new String( data );

  // print the result
  println( "receive: \""+message+"\" from "+ip+" on port "+port );

  String[] messageSplit = splitTokens(message, "/");

  if (messageSplit.length > 0) {
    println( "parsed:" + messageSplit[0] + " and " + messageSplit[1]);

    // Send the OSC message to ELM
    oscMessage_ELM = new OscMessage(OSCmessage_ELM);
    oscMessage_ELM.add(mediaGroup[int(messageSplit[1])]);
    oscP5.send(oscMessage_ELM, PCIPAddress);

    // Send the UDP message to Brightsign
    if (messageSplit[0].equals("PILOT")) {

      mode[0] = int(messageSplit[1]);
      stamp[0] = millis();

      println("received from pilot " + mode[0]);

      if (mode[0] == 0) {
        sendMessageOnce = false;

        //println("Sending to Pilot");
        udp.send(BrightsignUDP_Pilot_1, Brightsign_Pilot_IP, BrightsignPort);
        println("Sent UDP message %s", BrightsignUDP_Pilot_1);
      } else {
        udp.send(BrightsignUDP_Pilot_2, Brightsign_Pilot_IP, BrightsignPort);
        println("Sent UDP message %s", BrightsignUDP_Pilot_2);
      }
    } else if (messageSplit[0].equals("COPILOT")) {
      //println("Detected Copilot");

      stamp[1] = millis();
      mode[1] = int(messageSplit[1]);

      println("received from copilot " + mode[1]);

      if (mode[1] == 0) {
        sendMessageOnce = false;

        //println("Sending to Pilot");
        udp.send(BrightsignUDP_Copilot_2, Brightsign_Pilot_IP, BrightsignPort);
        println("Sent UDP message %s", BrightsignUDP_Copilot_2);
      } else {
        udp.send(BrightsignUDP_Copilot_1, Brightsign_Pilot_IP, BrightsignPort);
        println("Sent UDP message %s", BrightsignUDP_Copilot_1);
      }
    }
  }
}
