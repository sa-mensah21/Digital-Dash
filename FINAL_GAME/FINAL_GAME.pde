
import processing.sound.*;
player car; //player class
SoundFile backgroundSong;
SoundFile crash;
SoundFile drift;
SoundFile pew;
SoundFile explode;
PImage car1;
PImage car2;
PImage car3;
PImage car4;
PImage car5;
PImage car6;
PImage background;
PImage selectedCar;
PImage cone;
PImage cop;
PImage controls;
PImage spacebar;
//variables for the obstacles and the background/ road
int score=0;
ArrayList<obstacles> obstacleListL;
ArrayList<obstacles> obstacleListR;
ArrayList<enemy> enemyListL;
ArrayList<enemy> enemyListR;
ArrayList<bullet> bullets;
float obstacleStartX;
float obstacleStartY;
int obstacleSize;
float obstacleSpeed;
int startTimeRoad;
int endTimeRoad;
int intervalRoad = 150;
boolean isState1 = true;
int c1=color(0);
int c2=color(255);
boolean dash = true;
boolean otherDash = true;
int firstDash;
int secondDash;

//timers
int coneTimerStart;
int coneTimerEnd;
int coneInterval = 30000;
int lifeInterval=20000;
int lifeTimerEnd;
int lifeTimerStart;
int scoreInterval = 15000;
int extraC=0;
int timer;
int timerEnd;
int scoreTime;
int scoreEnd;

int switchVal = 0;
boolean start;
boolean restart;
boolean menu;
boolean carSelect;
boolean cs1;
boolean cs2;
boolean cs3;
boolean cs4;
boolean cs5;
boolean shot;


void setup() {
  if(switchVal==1){
  //coneTimerStart=millis();
  //timer=millis();
  }
  car1= loadImage("car1.jpg");
  car2= loadImage("car2.jpg");
  car3= loadImage("car3.jpg");
  car4= loadImage("car4.jpg");
  car5= loadImage("car5.jpg");
  car6= loadImage("car6_1.jpg");
  cone= loadImage("cone.jpg");
  cop= loadImage("cop.jpg");
  controls=loadImage("controls.jpg");
  background = loadImage("background.jpg");
  spacebar=loadImage("spacebar.jpg");
  selectedCar=car3;
  pew= new SoundFile(this, "pew.wav");
  crash= new SoundFile(this, "crash.wav");
  backgroundSong= new SoundFile(this, "sick.wav");
  explode= new SoundFile(this, "explode.wav");
  size(1000, 1000);
  background(0, 200, 100);  
  car= new player(); //creates the player  
  // obstacle list example
  obstacleListL = new ArrayList<obstacles>();
  obstacleListR= new ArrayList<obstacles>();
  enemyListL= new ArrayList<enemy>();
  enemyListR= new ArrayList<enemy>();
  bullets= new ArrayList<bullet>();
  obstacleListL.add(new obstacles( obstacleStartX =random(150, 420), obstacleStartY=random(-50, 10), obstacleSize= 50, color(255, 0, 0), obstacleSpeed= random(5, 9)));
  obstacleListR.add(new obstacles( obstacleStartX =random(525, 800), obstacleStartY=random(-50, 10), obstacleSize= 50, color(255, 0, 0), obstacleSpeed= random(5, 9)));
  enemyListL.add(new enemy( obstacleStartX =random(150, 420), obstacleStartY=random(-50, 0), color(0, 0, 255), obstacleSpeed= random(5, 7)));
  enemyListR.add(new enemy( obstacleStartX =random(525, 750), obstacleStartY=random(-50, 0), color(0, 0, 255), obstacleSpeed= random(5, 7)));
}
void draw() { 
  lifeTimerEnd=millis();
  if (!backgroundSong.isPlaying()) {
    backgroundSong.play();
  }
  backgroundSong.amp(.4);

  switch(switchVal) {
  case 0:
    background(0);
    image(background, 0, 0, width, height);
    fill(0);
    textSize(100);
    text("THE DIGITAL DASH!!", 0, 100);
    textSize(80);
    text("click 'c' for car select",100, 300);
    text("and controls",250,400);
    break;
  case 1:
  
   
  timerEnd=millis();
    //the background
    background(0, 255, 100);    
    fill(0);
    stroke(0);
    rect(100, 0, 800, 1000);  
    strokeWeight(10);
    stroke(240, 247, 35);
    line(490, 0, 490, 1000);
    line(510, 0, 510, 1000);
    endTimeRoad=millis();
    //creates dashed lines more background stuff
    if (endTimeRoad-startTimeRoad>=intervalRoad) {
      startTimeRoad=millis();
      isState1=!isState1;
    }
    if (isState1==true) {
      firstDash=c1;
      secondDash=c2;
    }
    if (isState1==false) {
      firstDash=c2;
      secondDash=c1;
    }
    // for loops to make the road look like its moving
    for (int l = 0; l < height; l+=50) {    
      if (dash == true) { 
        stroke(firstDash);
        dash= !dash;
      }
      if ( dash==false) {
        stroke(secondDash);
        dash= !dash;
      }
      line(300, l, 300, l+10);
      line(700, l, 700, l+10);
    }
    for (int w = 0; w < height; w+=100) {    
      if (otherDash == true) { 
        stroke(secondDash);
        otherDash= !otherDash;
      }
      if ( otherDash==false) {
        stroke(firstDash);
        otherDash= !otherDash;
      }
      line(300, w, 300, w+10);
      line(700, w, 700, w+10);
    }
    car.render(selectedCar);
    car.move();
    car.crash();
    coneTimerEnd=millis();
    if (coneTimerEnd-coneTimerStart>=coneInterval ) {    
    if(extraC<2){
     coneTimerStart=millis();
    obstacleListL.add(new obstacles( obstacleStartX =random(150, 420), obstacleStartY=random(-50, 10), obstacleSize= 50, color(255, 0, 0), obstacleSpeed= random(5, 9)));
    obstacleListR.add(new obstacles( obstacleStartX =random(525, 800), obstacleStartY=random(-50, 10), obstacleSize= 50, color(255, 0, 0), obstacleSpeed= random(5, 9)));
    extraC=extraC+1;
  }
   }

    for (obstacles anObstacles : obstacleListL) {
      anObstacles.render();
      anObstacles.rise();
      anObstacles.wallDetect(); 
      anObstacles.collision(car);
    }
    for (obstacles anObstacles : obstacleListR) {
      anObstacles.render();
      anObstacles.rise();
      anObstacles.wallDetect(); 
      anObstacles.collision(car);
    }
    for (enemy anEnemy : enemyListL) {
      anEnemy.render();
      anEnemy.rise();
      anEnemy.wallDetect(); 
      anEnemy.collision(car);
     
    }
    for (enemy anEnemy : enemyListR) {
      anEnemy.render();
      anEnemy.rise();
      anEnemy.wallDetect(); 
      anEnemy.collision(car);
      
    }
    fill(0);
    textSize(25);
    text("Lives", 25, 800);
    text(str(car.lives), 40, 850);
    text("Score",915,200);
    text(str(score),935,250);
    text("Time",20,200);
    text(str(timerEnd-timer),15,250);
    scoreEnd=millis();
    if(scoreEnd-scoreTime>=31000){
      score=score+5;
      scoreTime=millis();
    }
    //bullet stuff
    
    for(bullet aBullet : bullets){
      aBullet.render();
      aBullet.move();
      for (enemy anEnemy : enemyListR) {
      anEnemy.collisions(aBullet);

      }
      for (enemy anEnemy : enemyListL) {
      anEnemy.collisions(aBullet);
  
      }   
    }  

    break;
  case 2:
    background(0);
    fill(255, 0, 0);
    textSize(80);
    text("YOU CRASHED!!! :(", 150, 100);
    text("click 'r' restart", 200, 300);
    text("click 'm' for main menu", 50, 500);
    text("click 'c' for car select", 80, 700);
    text("your score: ", 180,800);
    text(str(score),700,800);
    break;
  case 3:
    background(0); 
    fill(255);
    image(car4, 550, 150, 80, 150);
    image(controls,50,50,200,200);
    image(spacebar,50,250,200,50);
    textSize(40);
    text("MOVE",300,200);
    text("SHOOT",300,275);
    text("ENEMY",700,230);
    textSize(28);
    fill(255,0,0);
    text("For Every Enemy Shot +1 Point",565,350);
    fill(255);
    textSize(50);
    text("Select the number of desired car", 150, 450);
    textSize(80);
    image(car1, 90, 500);
    text("1", 140, 700);
    image(car2, 290, 500, 75, 150);
    text("2", 340, 700);
    image(car3, 490, 500, 75, 150);
    text("3", 540, 700);
    image(car6, 690, 500,90,200);
    text("4", 740, 700);
    image(car5, 890, 500, 75, 150);
    text("5", 940, 700);
    textSize(50);
    text("then Press 'o' to Start",300,850);
  }
  if (restart==true) {
    car.lives=5;
    score=0;
    extraC=0;
    for (obstacles anObstacles : obstacleListL) {
      anObstacles.restart();
    }
    for (obstacles anObstacles : obstacleListR) {
      anObstacles.restart();
    }
    for (enemy anEnemy : enemyListL) {
      anEnemy.restart();
    }
    for (enemy anEnemy : enemyListR) {
      anEnemy.restart();
    }
    if(obstacleListL.size()>1){
    println(obstacleListL.size());
    obstacleListL.remove(0);
    }
    if(obstacleListR.size()>1){
    println(obstacleListR.size());
    obstacleListR.remove(0);
    }
    
    timer=millis();
    coneTimerStart=millis();
    scoreTime=millis();
    extraC=0;


    switchVal=1;
  }
    if (start==true) {
    car.lives =5;
    score=0;
    extraC=0;
    for (obstacles anObstacles : obstacleListL) {
      anObstacles.restart();
    }
    for (obstacles anObstacles : obstacleListR) {
      anObstacles.restart();
    }
    for (enemy anEnemy : enemyListL) {
      anEnemy.restart();
    }
    for (enemy anEnemy : enemyListR) {
      anEnemy.restart();
    }
     if(obstacleListL.size()>1){
    println(obstacleListL.size());
    obstacleListL.remove(0);
    }
    if(obstacleListR.size()>1){
    println(obstacleListR.size());
    obstacleListR.remove(0);
    }
    switchVal=1;
    timer=millis();
    coneTimerStart=millis();
    scoreTime=millis();
    extraC=0;
    
    }
  if (car.lives <=0) {
    switchVal=2;
    car.lives = 5;
  }
  if ( menu== true) {
    switchVal=0;
    car.lives = 5;
  }
  if (carSelect == true) {
    switchVal = 3;
  }
  strokeWeight(3);
  if (cs1==true) {
    selectedCar=car1;
    noFill();
    stroke(255);
    rect(80,500,110,210);
  }
  if (cs2==true) {
    selectedCar=car2;
    noFill();
    stroke(255);
    rect(280,500,110,210);
  }
  if (cs3==true) {
    selectedCar=car3;
    noFill();
    stroke(255);
    rect(480,500,110,210);
  }
  if (cs4==true) {
    selectedCar=car6;
    noFill();
    stroke(255);
    rect(680,500,110,210);
  }
  if (cs5==true) {
    selectedCar=car5;
    noFill();
    stroke(255);
    rect(880,500,110,210);
  }
  if (lifeTimerEnd-lifeTimerStart>=lifeInterval && car.lives<=8) {
    lifeTimerStart=millis();
    car.lives = car.lives +1;
  }

}

void keyPressed() {
  if (key == 'w') {
    car.up = true;
  }
  if (key == 's') {
    car.down=true;
  }
  if (key == 'a') {
    car.left = true;
  }
  if (key == 'd') {
    car.right=true;
  }
  if (key == 'r') {
    restart=true;
  }
  if (key == 'm') {
    menu=true;
  }
  if (key == 'c') {
    carSelect=true;
  }
  if (key == '1') {
    cs1 = true;

  }
  if (key == '2') {
    cs2=true;
  }
  if (key == '3') {
    cs3=true;
  }
  if (key == '4') {
    cs4=true;
  }
  if (key == '5') {
    cs5=true;
  }
  if (key == ' ') {
    shot=true;
     bullets.add( new bullet());
      println("pew");
      if(pew.isPlaying()){
        pew.stop();
      }
      pew.play();
      
  }
  if (key == 'o') {
    start=true;
  }
}

void keyReleased() {
  if (key == 'w') {
    car.up = false;
  }
  if (key == 's') {
    car.down=false;
  }
  if (key == 'a') {
    car.left = false;
  }
  if (key == 'd') {
    car.right=false;
  }
  if (key == 'r') {
    restart=false;
  }
  if (key == 'm') {
    menu=false;
  }
  if (key == 'c') {
    carSelect=false;
  }
  if (key == '1') {
    cs1 = false;
  }
  if (key == '2') {
    cs2=false;
  }
  if (key == '3') {
    cs3=false;
  }
  if (key == '4') {
    cs4=false;
  }
  if (key == '5') {
    cs5=false;
  }
  if (key == ' ') {
    shot=false;
  }
    if (key == 'o') {
    start=false;
  }
}
