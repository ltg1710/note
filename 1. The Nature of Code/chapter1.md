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
