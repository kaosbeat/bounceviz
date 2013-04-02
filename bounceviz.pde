/**
 * Keyboard. 
 * 
 * Click on the image to give it focus and press the letter keys 
 * to create forms in time and space. Each key has a unique identifying 
 * number. These numbers can be used to position shapes in space. 
 */
PImage boem;
int rectWidth;
int size = 1;


Graphicle gpx;
Graphicle[] gpxs;

void setup() {
  ///general
  frameRate(600);
  size(1000, 500, P3D);
  noStroke();
  background(0);
  rectWidth = width/4;
  //boem = loadImage("boem.gif");
  
  /////OSC-monome
  oscP5 = new OscP5(this,21339);  ///OSClistener port
//  oscServer = new OscP5(this,12436);  ///OSClistener port
  monomeIn = new NetAddress("127.0.0.1", 21339); ///monome input port
  serverIn = new NetAddress("127.0.0.1", 12436); ///serialOSC input port
  ///////images
  gpxs = new Graphicle[8];
  gpxs[0] = new Graphicle(100, 100, 100, 0,0,0,1, "1up.png");
  gpxs[1] = new Graphicle(200, 100, 100, 0,0,0,1, "coin.png");
  gpxs[2] = new Graphicle(300, 100, 100, 0,0,0,1, "contra.gif");
  gpxs[3] = new Graphicle(400, 100, 100, 0,0,0,1, "question.png");
  gpxs[4] = new Graphicle(500, 100, 100, 0,0,0,1, "samus.gif");
  gpxs[5] = new Graphicle(600, 100, 100, 0,0,0,1, "star.png");
  gpxs[6] = new Graphicle(700, 100, 100, 0,0,0,1, "boem.gif");
  gpxs[7] = new Graphicle(800, 100, 100, 0,0,0,1, "1up.png");
  ortho();
//  OscMessage msg = new OscMessage("/grid/led/all");
//  msg.add(1);
//  monomeOut.send(msg, monomeIn);

}

void draw() { 
  // keep draw() here to continue looping while waiting for keys
  background(255);
  size = size+40;
  if(size > 2000) {size=100;}
   for (Graphicle gpx:gpxs){
//    gpx.scale = int(random(size)/200);
    gpx.scale = 1;
    gpx.rotX = random(PI/8); 
    gpx.render();
   }


}

void keyPressed() {
    OscMessage msg = new OscMessage("/sys/info");
//    msg.add(1);
    oscP5.send(msg, serverIn);
  int keyIndex = -1;
  if (key >= 'A' && key <= 'Z') {
    keyIndex = key - 'A';
  } else if (key >= 'a' && key <= 'z') {
    keyIndex = key - 'a';
  }
  if (keyIndex == -1) {
    // If it's not a letter key, clear the screen
    background(0);
  } else { 
    // It's a letter key, fill a rectangle
    fill(millis() % 255);
    float x = map(keyIndex, 0, 25, 0, width - rectWidth);
    rect(x, 0, rectWidth, height);
  }
  

  
}

void oscEvent(OscMessage theOscMessage) {
  /* print the address pattern and the typetag of the received OscMessage */
  print("### received an osc message.");
  print(" addrpattern: "+theOscMessage.addrPattern());
  println(" typetag: "+theOscMessage.typetag());
}
