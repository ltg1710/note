# 用代码描述自然

标签（空格分隔）： 读书笔记 processing

---

# 介绍
## 自由漫步
三个目标
* 时常复习我们的编程中心思想---**面向对象**
* 时常思考两个问题：“我们如何定义管理对象的行为规则”，然后，“我们如何在处理实现这些规则？”
* 在整本书中，需要我们周期性的加强对随机、柏林噪音的理解。我们将会在自由漫步中演示这几个关键点，并应用它。

## 对象：自由漫步者
``` java
class Walker {
    Walker(){
        x = width/2;
        y = height/2;
    }
    void display(){
        stroke(0);
        point(x,y);
    }
    void step() {
        int choice=int(random(4));
        if (choice == 0) {
            x++;
        } else if (choice == 1) {
            x--;
        } else if (choice == 2) {
            y++;
        } else {
            y--;
        }
    }
    int x;
    int y;
}
Walker w;
void setup() {
    size(640,360);
    w = new Walker();
    background(255);
}
void draw() {
    w.step();
    w.display();
}

```

``` java
int[] randomCounts;
void setup() {
    size(640,240);
    randomCounts = new int[20];
}
void draw() {
    background(255);
    int index = int(random(randomCounts.length));
    randomCounts[index]++;
    stroke(0);
    fill(175);
    int w = width/randomCounts.length;
    for (int x = 0; x < randomCounts.length; x++) {
        rect(x*w,height-randomCounts[x],w-1,randomCounts[x]);
    }
}
```
> **伪随机数**
> 从random函数得到的随机数并不是真正的随机数；因此被称为伪随机。这是用数学函数模拟随机的结果。这个函数随时间推移产生一串数字，但是这段时间对我们来说很长，所以他和纯随机一样的好。
## 右移倾向的漫步者
``` java
class Walker {
    Walker(){
        x = width/2;
        y = height/2;
    }
    void display(){
        stroke(0);
        point(x,y);
    }
    void step() {
        float r = random(1);
        if (r < 0.4) {
            x++;
        } else if (r < 0.6) {
            x--;
        } else if (r < 0.8) {
            y++;
        } else {
            y--;
        }
    }
    int x;
    int y;
}
Walker w;
void setup() {
    size(640,360);
    w = new Walker();
    background(255);
}
void draw() {
    w.step();
    w.display();
}
```
## 正态分布的随机数

### 高斯分布
```java
import java.util.Random;
Random generator;
void setup() {
    size(640,360);
    generator = new Random();
}
void draw() {
    float num = (float) generator.nextGaussian();
    float sd = 60;
    float mean = 320;
    
    float x = sd * num + mean;
    noStroke();
    fill(255,10);
    ellipse(x,180,16,16);
}
```
> Exercise I.4

```java
 import java.util.Random;
 Random generator;
 void setup() {
    size(640,640);
    generator = new Random();
    background(255,128,0);
 }
 void draw() {
     float gx = (float) generator.nextGaussian();
     float gy = (float) generator.nextGaussian();
     float sd = 60;
     float mean = 320;
     float r = sqrt(gx*gx+gy*gy);
     
     float x = sd * gx + mean;
     float y = sd * gy + mean;
     noStroke();
     fill(255 - Math.abs(int(60*r)));
     ellipse(x,y,16,16);
 }
```

> Exercise I.5

``` java
import java.util.Random;
class Walker {
    Walker(){
        x = width/6;
        y = height/2;
        r = new Random();
    }
    void display(){
        noStroke();
        fill(0);
        ellipse(x,y,8,8);
    }
    void step() {
        float s = (float)r.nextGaussian();
        float r = random(1);
        s = s * 2 + 8;
        if (r < 0.4) {
            x +=s;
        } else if (r < 0.6) {
            x -=s;
        } else if (r < 0.8) {
            y +=s;
        } else {
            y -=s;
        }
    }
    int x;
    int y;
    Random r;
}
Walker w;
void setup() {
    size(640,360);
    w = new Walker();
    background(255);
}
void draw() {
    w.step();
    w.display();
}
```

## 自定义随机分布
* levy flight

## 柏林噪音

``` java
void draw() {
  loadPixels();
  for (int x = 0; x < width; x++) {
    for (int y = 0; y < height; y++) {
      float bright = random(255);
      pixels[x+y*width] = color(bright);
    }
  }
  updatePixels();
}

void setup() {
    size(640,360);
}
```

``` java
void draw() {
  loadPixels();
  float xoff = 0.0;
  for (int x = 0; x < width; x++) {
    float yoff = 0.0;
    for (int y = 0; y < height; y++) {
      float bright = map(noise(xoff,yoff),0,1,0,255);
      pixels[x+y*width] = color(bright);
      yoff += 0.01;
    }
    xoff += 0.01;
  }
  updatePixels();
}

void setup() {
    size(640,360);
}
```

> Exercise I.8

```java
float noiseVal;
float noiseScale=0.02;
void draw() {
  for (int y = 0; y < height; y++) {
    for (int x = 0; x < width/2; x++) {
      noiseDetail(3,0.5);
      noiseVal = noise((mouseX+x) * noiseScale, (mouseY+y) * noiseScale);
      stroke(noiseVal*255);
      point(x,y);
      noiseDetail(8,0.65);
      noiseVal = noise((mouseX + x + width/2) * noiseScale, 
                       (mouseY + y) * noiseScale);
      stroke(noiseVal * 255);
      point(x + width/2, y);
    }
  }
}

void setup() {
    size(640,360);
}
```
