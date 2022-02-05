ArrayList <Smoke> smoke = new ArrayList<Smoke>();
ArrayList <Lava> lava = new ArrayList<Lava>();
boolean flag = false;

void setup() {
  size(400, 500);
  background(20);
  for (int i = 0; i < 50; i++)
    smoke.add(new Smoke(i));
  
  for (int i = 0; i < 300; i++) {
    lava.add(new Lava());
    lava.get(i).myAngle = ((2 * 3.14)) * (i/2) + 5;
  }
  
  sierpinski(27, 495, 350);
}

void draw() {
  if (flag) {
    for (int i = 0; i < 50; i++) {
      smoke.get(i).up();
      smoke.get(i).show();
    }
    for (int i = 0; i < 300; i++) {
      lava.get(i).move(lava.get(i).myAngle);
      lava.get(i).show();
    }
    sierpinski(27, 495, 350);
  }
}

void sierpinski(int x, int y, int len) {
  stroke(251, 86, 7);
  fill(255);
  if (len > 20) {
    sierpinski(x, y, len/2);
    sierpinski((x + len/2), y, len/2);
    sierpinski((x + len/4), (y-len/2), len/2);
  }
  else {
    triangle(x, y, (x + len/2), (y - len), (x + len), y);
  }
}

// --
void keyPressed() {
  if (key == ENTER)
    flag = true;
}

// --
class Smoke {
  private float x;
  private int y, o, s;
  private color c;
  
  public Smoke(int pos) {
    y = 150;
    c = (int) (Math.random() * 50) + 100;
    o = (int)(Math.random() * 3);
    s = (int) (Math.random() * 20) + 10;
    x = 100 + (pos+s+(2.3*s));
  }
  
  public void up() {
    if (y >= -20) {
      y -= (int) (Math.random() * 4) - 1;
      if (Math.random() > 0.5)
        x += (int) (Math.random() * 2);
      else if (Math.random() > 0.5)
        x -= (int) (Math.random() * 2);
    }
    else
      flag = false;
  }
  
  public void show() {
    noStroke();
    fill(c, c, c, o);
    ellipse(x, y, s, s);
  }
}

class Lava {
  private double myX, myY, myAngle, mySpeed, myO;
  
  public Lava() {
    myX = 200;
    myY = 150;
    mySpeed = (int)(Math.random() * 2);
    myAngle = 0;
    myO = (int)(Math.random() * 60) + 50;
  }
  
  public void move(double angle) {
    if (myY >= -1) {
      myX += Math.cos(angle) * mySpeed;
      myY += Math.sin(angle) * mySpeed;
    }
  }
  
  public void show() {
    noStroke();
    fill(255, 0, 0, (int)myO);
    ellipse((float)myX, (float)myY, 5, 5);
  }
}
