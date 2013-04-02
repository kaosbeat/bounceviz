import oscP5.*;
import netP5.*;

class Monome {
  
  int dimX,dimY;

  
  void init(){

  }
  

  Monome(){
    this.dimX=16;
    this.dimY=8;  
  }
  
  Monome(int dimX, int dimY){
    
    
  }
  


  public void setValue(int x, int y, int value) {
    OscMessage msg = new OscMessage("/monome/grid/led/set");
    msg.add(x);
    msg.add(y);
    msg.add(value);
    oscP5.send(msg, serverIn);
  }



}
