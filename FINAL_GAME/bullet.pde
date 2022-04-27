class bullet {
  
  float x;
  float y;
  int d = 10;
  int c = color(255);
  int speed;

  
  bullet(){
    x=car.x+45;
    y=car.y;
    speed = 4;
    
  }
  
 void render(){
   fill(255,0,0);
    circle(x,y,d);
  }
  void move(){
    y=y-speed;
  }
  
}
