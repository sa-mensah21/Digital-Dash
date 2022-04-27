class obstacles {
  float x;
  float y;
  int d;
  float speed;
  color obstacleC;
  float oBottom = y+d/2, oTop = y;
  float oRight =x+d/2, oLeft=x;
  boolean isCrash = false;
  
  
  //constructor function
  obstacles(float startX, float startY, int startD, color startC, float startS){
    x=startX;
    y=startY;
    d=startD;
    speed=startS;
    obstacleC=startC;
    oBottom = y+d/2;
    oTop = y;
    oRight =x+d/2;
    oLeft=x;
  }
  
  //show on screen
  void render(){
  fill(obstacleC);
  image(cone,x,y,d,d);
  }
  
  //function to move bubbles up
  void rise(){
    y=y+speed;
  }
  
  void wallDetect() {
    //bottom detection
    if (y+d/2 >= height) {
      y=0;
      x=random(150,850);
    }
  }
  void collision(player car){
      if(x+d>=car.x && x<= car.x +car.s){
        if(y+d>car.y && y<= car.y + car.s ){
        println("hit/game over");
        isCrash=true;
        crash.amp(1);
        if(crash.isPlaying()){
        crash.stop();
      }

      car.lives = car.lives - 1;
      crash.play();
      car.x=random(100,800);
      car.y=800;
      println(car.lives);
      y=0;
        
      }
    }
}
  void restart(){
    y=0;
    car.x=600;
    car.y=800;
  }

}
