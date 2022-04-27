class enemy {
  float x;
  float y;
  int d;
  float speed;
  color enemyC;
  boolean isCrash = false;
    boolean isTouching;
  
  //constructor function
  enemy(float startX, float startY,color startC, float startS){
    x=startX;
    y=startY;
    speed=startS;
    enemyC=startC;

  }
  
  //show on screen
  void render(){
  
  image(car4,x,y,80,150);
  }
  
  //function to move bubbles up
  void rise(){
    y=y+speed;
  }
  
  void wallDetect() {

    if (y-75 >= height) {
      speed = abs(speed);
    }
    //bottom detection
    if (y+75 >= height) {
      y=0;
      x=random(150,750);
    }
  }
  void collision(player car){
      if(x+80>=car.x && x<= car.x +car.s){
        if(y+150>=car.y && y<= car.y + car.s ){
        println("hit/game over");
        isCrash=true;
        crash.amp(1);
        if(crash.isPlaying()){
        crash.stop();
      }
      car.lives = car.lives - 1;
      crash.play();
      car.x=450;
      car.y=800;
      println(car.lives);
      y=0;
        
      }
    }
}
void collisions(bullet aBullet){
      if(x+80>=aBullet.x && x<= aBullet.x + aBullet.d/2){
        if(y+150>=aBullet.y &&y<= aBullet.y + aBullet.d/2 ){
        println("point");      
        explode.amp(1);
        if(explode.isPlaying()){
        explode.stop();
      }
      score=score+1;
      explode.play();
      x=random(150,750);
      y=-400;
        
      }
    }
}
  
  void restart(){
    y=0;
    car.y=800;
    car.x=600;
  }

}
