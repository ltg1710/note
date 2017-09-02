# 矢量
## 矢量，让你成为男人
``` java
float x = 100;
float y = 100;
float xspeed = 1;
float yspeed = 3.3;
void setup() {
  size(400,400);
  smooth();
  background(255);
}
void draw() {
  background(255);
  x = x + xspeed;
  y = y + yspeed;
  if ((x > width-8) || (x < 8)) {
    xspeed = xspeed * -1;
  }
  if ((y > height-8) || (y < 8)) {
    yspeed = yspeed * -1;
  }
  stroke(0);
  fill(175);
  ellipse(x,y,16,16);
}
```
## 程序员的向量
```java

```
