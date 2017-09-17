Blob blob;
ArrayList<Blob> blobs;
boolean done = false;
float zoom = 1;

void setup() {
  size(600, 600);
  blob = new Blob(0, 0, 64);
  blobs=new ArrayList<Blob>();
  for(int i = 0; i < 50; i++) {
    blobs.add(new Blob(random(-width, width), random(-height, height), 16));
  }
}

void draw() {
  background(0);
  
  translate(width/2, height/2);
  float newzoom = 64/blob.r;
  zoom = lerp(zoom, newzoom, 0.1);
  scale(zoom);
  translate(-blob.pos.x, -blob.pos.y);
  
  for(int i = blobs.size()-1; i >=0; i--) {
    Blob b = blobs.get(i);
    b.show();
    if(blob.eats(b)) {
      blobs.remove(b);
    }
  }
  
  if(!done && blobs.size() == 0) {
    println("done");
    done = true;
  }
  
  blob.show();
  blob.update();
}
