class player{
  boolean crashed = false;
  float x=600;
  int y=800;
  int s=80;
  int xSpeed=5;
  int ySpeed=5;
  boolean right;
  boolean left;
  boolean up;
  boolean down;
  float pBottom = y+s, pTop = y;
  float pRight =x+s, pLeft=x;
  int lives= 5;

  
  player() {
    x=575;
    y=800;
    s=80;
  }
 
  void move(){
    if(x>=100 && x+s<=900){ 
    if(keyPressed == true){
      if(up==true){
       y=y-ySpeed;
    }
    
    if (down==true){
        y=y+ySpeed;
    }
    
    if(left==true){ 
        x=x-xSpeed;
    }

    if(right==true){
        x=x+xSpeed;
    }
    }
   }
  }
  

  
//for the sound assignment I dont have my cases set up
//but the user will have 3 lives and after loosing one spawns in the 
//middle again. I dont have the life counter yet.
  void crash(){
    if(x>=820 || x<=100 || y+s/2>height ||y+s/2<=0){
      println("crash");
      x=600;
      y=800;
      if(crash.isPlaying()){
        crash.stop();
      }
      crash.play();
      lives=lives-1;
      
    }
  }
    
  void render(PImage wImage){
    strokeWeight(0);
    fill(255);
    image(wImage,x,y,80,150);
  }
  }
