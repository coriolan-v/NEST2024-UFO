import netP5.*; // Need oscP5 0.9.9
import oscP5.*; // Need oscP5 0.9.9
import hypermedia.net.*; // Need UDP 0.1

int processingPort = 5000;

String pcIP = "127.0.0.1";
int pcPortELM = 9001;
//String pcIP = "10.0.0.1";

//String messageFromArduinoPilot;

String OSCmessage[] = new String[2];


String OSCmessage_pilot = "/elm/stages/PortalRingsPlan/live/media/1";
String OSCmessage_copilot = "/elm/stages/PortalRingsPlan/live/media/2";
OscMessage oscPilot = new OscMessage(OSCmessage_pilot);
OscMessage oscCopilot = new OscMessage(OSCmessage_copilot);

String Brightsign_Pilot_IP = "10.0.0.3";
String Brightsign_Copilot_IP = "10.0.0.6";
int BrightsignPort = 5000;

String BrightsignUDP_Pilot_1 = "PILOTBRI_S_1";
String BrightsignUDP_Pilot_2 = "PILOTBRI_S_2";
String BrightsignUDP_Copilot_1 = "COPILOTBRI_S_1";
String BrightsignUDP_Copilot_2 = "COPILOTBRI_S_2";

UDP udp;  // define the UDP object
OscP5 oscP5;
NetAddress PCIPAddress;

void setup() {
  frameRate(30);
  
  OSCmessage[0] = "/elm/stages/PortalRingsPlan/live/media/1";
  OSCmessage[1] = "/elm/stages/PortalRingsPlan/live/media/2";
  
  // Setup OSC for communication with ELM
  PCIPAddress = new NetAddress(pcIP,pcPortELM);
  oscP5 = new OscP5(this,pcPortELM);
 
  // Setup UDP to receive UDP from the arduinos
  udp = new UDP(this, processingPort);
  udp.listen( true );
}

void draw() {;}

void receive( byte[] data, String ip, int port ) {  // <-- extended handler
  
  // get the "real" message =
  // forget the ";\n" at the end <-- !!! only for a communication with Pd !!!
  data = subset(data, 0, data.length);
  String message = new String( data );
  
  // print the result
  println( "receive: \""+message+"\" from "+ip+" on port "+port );
  
  if(message.equals("PILOT")){
     println("PILOT KEY DETECTED");
     
     // Send the OSC message to ELM
    // myMessage = new OscMessage(OSCmessage_pilot);
     oscP5.send(oscPilot, PCIPAddress); 
     println("Sent OSC message %s", oscPilot);
     
     // Send the UDP message to the Brightsign
     udp.send(BrightsignUDP_Pilot_2, Brightsign_Pilot_IP, BrightsignPort);
      println("Sent UDP message %s", BrightsignUDP_Pilot_2);
  }
  
  if(message.equals("COPILOT")){
    println("COPILOT KEY DETECTED");
    //OscMessage myMessage = new OscMessage(OSCmessage_copilot);
    oscP5.send(oscCopilot, PCIPAddress); 
    println("Sent OSC message %s", oscCopilot);
    
    // Send the UDP message to the Brightsign
     udp.send(BrightsignUDP_Copilot_2, Brightsign_Copilot_IP, BrightsignPort);
     println("Sent UDP message %s", BrightsignUDP_Copilot_2);
  }
  
}
