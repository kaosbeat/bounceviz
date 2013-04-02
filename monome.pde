import oscP5.*;
import netP5.*;

class Monome {
  int dimX,dimY;
  OscP5 oscP5;
  NetAddress monomeIn, serverIn;
  
  void init(){

  }
  

  Monome(){
    /////OSC-monome ///use bonjour-browser to discover the port values or find them as described here http://monome.org/docs/app:serialosc:zeroconf#session_data
    this.oscP5 = new OscP5(this,21339);  ///OSClistener port
    //  oscServer = new OscP5(this,12436);  ///OSClistener port
    this.monomeIn = new NetAddress("127.0.0.1", 21339); ///monome input port
    this.serverIn = new NetAddress("127.0.0.1", 12436); ///serialOSC input port
    this.dimX=16;
    this.dimY=8;  
  }
  
  Monome(int dimX, int dimY){
    
    
  }
  
  void oscEvent(OscMessage theOscMessage) {
  /* print the address pattern and the typetag of the received OscMessage */
  print("### received an osc message.");
  print(" addrpattern: "+theOscMessage.addrPattern());
  println(" typetag: "+theOscMessage.typetag());
}
}
