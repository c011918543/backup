import ddf.minim.*;

Minim minim;
AudioPlayer player1, player2;
int kick_size, snare_size;

void setup(){
  
  size(640, 360);
  frameRate(120);
  smooth();
  background(0);
  minim = new Minim(this);
  player1 = minim.loadFile("kick.wav");
  player2 = minim.loadFile("snare.wav");
  kick_size = 0;
  snare_size = 0;
}

void draw(){
  
  background(0);
  regular();
  
  if (snare_size >= 0) {
    push();
    translate(width/2, height/2);
    rotate(frameCount/3);
    fill(255);
    rect(-snare_size/2,-snare_size/2,snare_size,snare_size);
    pop();

    if (keyPressed == false){
      snare_size -= 12;
    }
  }
  
  fill(0,0,0);
  noStroke();
  ellipse(width/2,height/2,108,108);
  if (kick_size >= 0){
    fill(255,255,255);
    ellipse(width/2,height/2,kick_size,kick_size);
    
    if (keyPressed == false){
      kick_size -= 6;
    }
  }

}

void keyPressed(){
  
  if (key == TAB){
    snare();
  }
}

void kick(){
    kick_size = 100;
    player1.rewind();
    player1.play();
}

void snare(){
  
    snare_size = 128;
    player2.rewind();
    player2.play();
}

//0.5秒に1回kick
void regular(){

  if(frameCount / 2 % 30 == 0 )
  {
    kick();
  }
}

void stop(){
  
  player1.close();
  player2.close();
  minim.stop();
  super.stop();
}
