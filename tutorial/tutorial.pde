ArrayList<Dot> dots = new ArrayList<Dot>();
 
void setup() {
  size(1920, 1080);
  frameRate(120);
  //カラーをHSBモードに
  colorMode(HSB, 360, 100, 100, 100);
}
 
void draw() {
  background(0);
  //1秒に1回追加
  if (frameCount % 60 == 0) {
    //Dotをリストに追加
    dots.add(new Dot());
  }
  //リストの数だけ繰り返し
  for (int i = 0; i < dots.size(); i++) {
    //もし透明度が0より小さかったら消去
    if (dots.get(i).alpha < 0) {
      dots.remove(i);
    }
    //円を描く
    dots.get(i).draw();
  }
}
 
class Dot {
  float x, y, diameter, speed, hue, alpha, alphaSpeed;
  Dot() {
    x = random(width);
    y = random(height);
    diameter = 0;
    hue = random(100, 200);
    alpha = 100;
    speed = random(0.2, 0.8);
    alphaSpeed = random(0.05, 0.1);
  }
 
  void draw() {
    noStroke();
    fill(hue, 80, 90, alpha);
    ellipse(x, y, diameter, diameter);
    diameter += speed;
    alpha -= alphaSpeed;
  }
}
