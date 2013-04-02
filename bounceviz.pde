int size = 1;
Monome m;
Graphicle gpx;
Graphicle[] gpxs;

void setup() {
  ///general environment
  frameRate(5);
  size(1000, 500, P3D);
  ortho();
  noStroke();
  background(0);
  
  //monomeconfig
  m = new Monome();
  
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
}

void draw() { 
  // keep draw() here to continue looping while waiting for keys
  background(255);
  size = size+40;
  if(size > 2000) {size=100;}
   for (Graphicle gpx:gpxs){
//    gpx.scale = int(random(size)/200);
    gpx.scale = 1;
    gpx.rotX = random(PI/2); 
    gpx.render();
   }
}

void keyPressed() {
//   OscMessage msg = new OscMessage("/sys/info");
//   m.oscP5.send(msg, m.serverIn);
   m.setValue(1,1,1);
}

  
