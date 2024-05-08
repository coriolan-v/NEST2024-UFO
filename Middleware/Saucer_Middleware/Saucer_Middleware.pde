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

String debugMessage = "Started";
int debugMessageIndex = 0;

void setup() {
  size(400,400);
  textSize(14);
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
ArrayList<String> messages = new ArrayList<String>();

void draw() {
  
  background(0);
  fill(255);
  for (int i = 0; i < messages.size(); i++) {
    text(messages.get(i), 10, 20 + i * 20);
  }
  text("Current time: " + hour() + ":" + minute() + ":" + second(), 10, 220);

  if (mode[0] > 0 && mode[1] > 0)
  {
    if (sendMessageOnce == false) {
      sendMessageOnce = true;
      println("both rfid detected at the same time");
    }
  }
  
}

String[] messageSplit;

void receive( byte[] data, String ip, int port ) {  // <-- extended handler

  // get the "real" message =
  // forget the ";\n" at the end <-- !!! only for a communication with Pd !!!
  data = subset(data, 0, data.length);
  String message = new String( data );

  debugMessage = hour() + ":" + minute() + ":" + second() + " " + message;
   addMessage(debugMessage);

  // print the result
  println( "receive: \""+message+"\" from "+ip+" on port "+port );
  
 // debugMessageIndex++;
  

  try {
    messageSplit = splitTokens(message, "/"); 
  } catch (Exception e) {
    println("ERROR");
  }
  
  

  if (messageSplit.length > 1 ) {
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


void addMessage(String message) {
  // Add the new message to the list
  messages.add(message);
  
  // If the list has more than 10 messages, remove the oldest one
  if (messages.size() > 10) {
    messages.remove(0);
  }
}
