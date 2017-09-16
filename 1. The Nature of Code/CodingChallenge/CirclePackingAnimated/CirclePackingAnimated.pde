ArrayList<Circle> circles;
ArrayList<PVector> spots;
PImage img;
void setup()
{
  size(720, 280);
  background(0);
  img = loadImage("2017.png");
  img.loadPixels();
  circles = new ArrayList<Circle>();
  spots = new ArrayList<PVector>();
  for(int x=0; x<img.width;x++) {
    for(int y=0; y<img.height;y++) {
      int index = x+y*img.width;
      color c = img.pixels[index];
      float b = brightness(c);
      if(b>1) {
        spots.add(new PVector(x,y));
      }
    }
  }
  println(spots.size());
}

void draw()
{
  background(0);
  stroke(255);
  strokeWeight(2);
  noFill();
  newCircle();
  checkOverlap();
  for(Circle c : circles)
  {
    c.show();
  }
}

void newCircle() {
  float x = random(0, width);
  float y = random(0, height);
  boolean invalid = true;
  boolean spotted = false;
  
  for(Circle c : circles) {
    float d = dist(x, y, c.x, c.y);
    if(d < c.r) invalid = false;
  }
  
  if(!invalid)
    return;
  
  for(PVector p : spots) {
    if(abs(x-p.x) < 1  && abs(y -p.y) < 1) {
      spotted = true;
      break;
    }
  }
  
  if(spotted)
    circles.add(new Circle(x,y, color(255, 0,0)));
  else
    circles.add(new Circle(x,y, color(0, 255,0)));
}

void checkOverlap() {
  for(Circle c : circles) {
    if(c.growing) {
      if(c.edges()) {
        c.growing = false;
      } else {
        for(Circle o : circles) {
          if( c!=o){
            float d = dist(c.x, c.y, o.x, o.y);
            if(d-2<c.r+o.r) {
              c.growing = false;
              break;
            }
          }
        }
        
        if(c.c == color(0,255, 0))
        {
          for(PVector p : spots) {
            float d = dist(c.x, c.y, p.x, p.y);
            if(d-1<c.r) {
              c.growing = false;
              break;
            }
          }
        }
      }
    }
  }
}
