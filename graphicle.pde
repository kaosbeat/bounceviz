class Graphicle {
  PImage img;
  int x,y,z;
  int scale;
  float rotX,rotY,rotZ;
  
  
  
  Graphicle(){
    this.img = loadImage("1up.png");
    this.x = 100;
    this.y = 100;
    this.z = 100;
    
  }
  
  
  Graphicle(int x, int y, int z, float rotX, int rotY, int rotZ, int scale,String img){
    this.img = loadImage(img);
    this.x = x;
    this.y = y;
    this.z = z;
    
    
  }
  
  void init() {
    
  
  }
  void render(){
    pushMatrix();
    translate(x,y,-z);
    scale(scale);
    rotateX(rotX);
    rotateY(rotY);
    rotateZ(rotZ);
    beginShape();
    texture(img);
    vertex(-img.width/2, -img.height/2, 0, 0,0);
    vertex( img.width/2, -img.height/2, 0, img.width, 0);
    vertex( img.width/2,  img.height/2, 0, img.width, img.height);
    vertex(-img.width/2,  img.height/2, 0, 0, img.height);
    endShape();
    popMatrix();
  }
}
