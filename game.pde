//Mark machle 
//alien invaders esque game. 
//The ships will be coming down, and the person must shoot them before they reach the planet!
//2/26/21

//This is the code starting the array, and defining it.
//I have arrays for postion, speed, looks, and stars.
float[] x= new float [100];
float[] y= new float [100];
float[]speedX= new float [100];
float[]speedY= new float [100];
float[]speedX1=new float [100];
float[]speedY1=new float [100];
float[] look1= new float[100];
float[] look2= new float[100];
float[] look3= new float[100];
float[] starsX=new float[1000];
float[] starsY=new float[1000];
float[] scoreB=new float[1];
int score1=0;
int screenstate = 0;
PFont font;
int w=255;
int z=200;
int life=3;
int L= 700;
int L2=703;
int D=700;
int D2=703;
int F=700;
int F2=703;
int O=255;
int O2=255;
int O3=255;
void setup() {
  size(1000, 1000);
  noCursor();
  for (int i=0; i<100; i++) {
    x[i]= random(10, 990);
    y[i]= random(-10, -100);
    speedY[i]=random(0, 2);
    speedX1[i]=random(0, 2);
    speedY1[i]=random(0, 2);
    look1[i]= random(0, 255);
    look2[i]= random(0, 255);
    look3[i]= random(0, 255);
    starsX[i]=random(0, 1000);
    starsY[i]=random(0, 1000);
    //these define all the arrays, and populate them , they all have random coordinates, to make them random everywhere
  }
}

void draw() {

  //this is the homescreen code 
  if (screenstate ==0) {
    background(0);
    noStroke();

    for (int i=0; i<1000; i++) {
      fill(255);
      ellipse(starsX[i], starsY[i], 3, 3);
    }
    font = createFont("space_invaders.ttf", 40);
    textFont(font);
    text("Moon Defenders", 300, 100);

    textSize(15);
    text("Help save the Moon from getting overun by Aliens!", 270, 140);
    fill(255);

    for (int i=0; i<scoreB.length; i++) {
      //text(scoreB[i],450,z);
    }
    fill(255);
    printArray(scoreB);

    rect(445, 450, 100, 100);
    if (mousePressed == true) {
      if (mouseX>= 445 && mouseX<=545 && mouseY>=450 && mouseY<=550) {
        background(0);
        screenstate = 1;
        for (int i =0; i<100; i++) {
          y[i]= random(-10, -100);
          score1=0;
        }
      }
    }
    textSize(20);
    fill(255, 0, 0);
    text("Play", 465, 510);

    text("Instructions:", 410, 600);
    textSize(15);
    fill(255);
    text("Aliens are attacking the Moon! Using the cursor, shoot down the alien ships", 150, 620);
    text("If an alien reaches the moon, you lose", 330, 640);
    text("Use powerups as well!", 400, 660);
    text("There is also a hidden game breaking easter egg that auto wins!", 200, 680);

    //This is the cursor code 
    fill(0, 255, 255);
    stroke(0, 255, 255);
    strokeWeight(3);
    line(mouseX-10, mouseY, mouseX+10, mouseY);
    line(mouseX, mouseY-10, mouseX, mouseY+10);
    ellipse(mouseX, mouseY, 10, 10);
  }
  //this is the game screen code
  if (screenstate == 1) {
    background(0);
    life=3;
    O=255;
    O2=255;
    O3=255;
    for (int i=0; i<1000; i++) {
      noStroke();
      fill(w);
      ellipse(starsX[i], starsY[i], 3, 3);
      fill(255);
    }
    strokeWeight(1);
    stroke(0);
    for (int i=0; i<100; i++) {
      float x1 = x[i];
      float y1=y[i];
      //this is the ship
      noStroke();
      fill(look1[i], look2[i], look3[i]);
      triangle(x1-10, y1-10, x1+10, y1-10, x1, y1+15);
      triangle(x1-25, y1-12, x1+25, y1-12, x1, y1);
      strokeWeight(3);
      stroke(look1[i], look2[i], look3[i]);
      line(x1-10, y1-10, x1-10, y1+10);
      line(x1+10, y1-10, x1+10, y1+10);
      fill(0, 255, 255);
      rect(x1-4, y1-8, 8, 8);
      line(x1-20, y1-10, x1, y1);
      line(x1+20, y1-10, x1, y1);
      noStroke();
      fill(255, 0, 0);
      rect(x1-12, y1+7, 3, 5);
      rect(x1+9, y1+7, 3, 5);

      stroke(0, 0, 0); 
      fill(230, 230, 230);

      rect(0, 800, 1000, 200);
      fill(100, 100, 100);
      ellipse(50, 820, 40, 20);
      ellipse(150, 900, 30, 20);
      ellipse(480, 880, 50, 30);
      ellipse(300, 960, 55, 25);
      ellipse(700, 990, 60, 30);
      ellipse(900, 900, 50, 20);
      fill(255);
      text("Lives:", 20, 690);
      //lives
      fill(O, 0, 0);
      {
        noStroke();
        ellipse(20, L, 10, 10);
        ellipse(27, L, 10, 10);
        triangle(18, L2, 29, 703, 23.5, 710);
      }
      fill(O2, 0, 0);
      {
        ellipse(40, D, 10, 10);
        ellipse(47, D, 10, 10);
        triangle(38, D2, 49, 703, 43.5, 710);
      }
      fill(O3, 0, 0);
      {
        ellipse(60, F, 10, 10);
        ellipse(67, F, 10, 10);
        triangle(58, F2, 69, 703, 63.5, 710);
      }


      x[i] = x[i]+ speedX[i];
      y[i]=y[i]+ speedY[i];

      textSize(20);
      fill(255);
      text("score:", 4, 750);
      text(score1, 90, 750);
      //this makes the ships disapear, which is the center piece of the game
      if (mousePressed==true) {
        if (mouseX<=x1+20 && mouseX>=x1-20 && mouseY>=y1-20 && mouseY<=y1+20) { 
          y[i]=-15;
          score1++;

          //increase an integer by 1, which makes score increase as well
        }
      }

      if (score1>25) {
        fill(0);
        rect(20, 600, 105, 50);
        fill(255, 0, 0);
        textSize(1);
        text("POWERUP", 21, 625);
      }
      if (mousePressed==true) {
        if (mouseX<=125 && mouseX>=20 && mouseY<=650 && mouseY>=600) {
          y[i]=-15;
          score1=score1+100;
        }
      }
      if (y[i]>800) {
        life--;
      }
      if (life==2) {
        //L=2000;
        //L2=2000;
        O=0;
      }
      if (life==1) {
        //D=2000;
        //D2=2000;
        O2=0;
      }
      if (life==0) {
        O3=0;
        print(score1+"score1 is");
        scoreB= append(scoreB, score1);
        screenstate =2;
      }
    }
    noStroke();
    fill(255);
    fill(0, 255, 255);
    stroke(0, 255, 255);
    strokeWeight(3);
    line(mouseX-10, mouseY, mouseX+10, mouseY);
    line(mouseX, mouseY-10, mouseX, mouseY+10);
    ellipse(mouseX, mouseY, 10, 10);
  }
  //this is the game over screen
  if (screenstate == 2) {
    background(0);
    fill(255);
    textFont(font);
    textSize(50);
    text("Game Over", 360, 500);
    noStroke();
    rect(475, 800, 50, 50);
    fill(255, 0, 0);
    textSize(12);
    text("Home", 480, 820);
    if (mousePressed==true) {
      if (mouseX<=525 && mouseX>=475 && mouseY>=800 && mouseY<=850) { 
        screenstate =0;
      }
    }
    for (int i=0; i<1000; i++) {
      noStroke();
      fill(w);
      ellipse(starsX[i], starsY[i], 3, 3);
    }

    textSize(11);
    fill(255);
    rect(475, 300, 75, 50);
    fill(255, 0, 0);
    text("Play Again", 476, 320);
    //this restarts the game and lets them play again.
    if (mousePressed==true) {
      if (mouseX<=550 && mouseX>=475 && mouseY>=300 && mouseY<=350) { 
        screenstate =1;
        life=3;
        D=700;
        D2=703;
        L=700;
        L2=703;
        for (int i =0; i<100; i++) {
          y[i]= random(-10, -100);
          score1=0;
        }
      }
    }
    fill(0, 255, 255);
    stroke(0, 255, 255);
    strokeWeight(3);
    line(mouseX-10, mouseY, mouseX+10, mouseY);
    line(mouseX, mouseY-10, mouseX, mouseY+10);
    ellipse(mouseX, mouseY, 10, 10);
  }
}
