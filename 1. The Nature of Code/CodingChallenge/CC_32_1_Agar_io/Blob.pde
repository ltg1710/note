class Blob {
  PVector pos;
  PVector vel = new PVector(0,0);
  float x;
  float y;
  float r;
  
  Blob(float x, float y, float r_) {
    pos = new PVector(x, y);
    r = r_;
  }
  
  void update() {
    PVector v = new PVector(mouseX-width/2, mouseY-height/2);
    v.setMag(3);
    vel.lerp(v, 0.1);
    pos.add(vel);
  }
  
  boolean eats(Blob o) {
    float d = dist(pos.x, pos.y, o.pos.x, o.pos.y);
    if(d < this.r + o.r) {
      float sum = PI*(r*r+o.r*o.r);
      this.r = sqrt(sum/PI);
      return true;
    } else {
      return false;
    }
  }
  
  void show() {
    fill(255);
    ellipse(pos.x, pos.y, r*2, r*2);
  }
};
