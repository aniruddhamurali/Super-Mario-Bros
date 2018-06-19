/** Super Mario Bros
 * User gets to play a game of Super Mario Bros!
 *
 * @author Aniruddha Murali
 */


import ddf.minim.spi.*;
import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.ugens.*;
import ddf.minim.effects.*;

Minim minim;
AudioPlayer overworldMusic;
AudioPlayer hurryOverworldMusic;
AudioPlayer coinMusic;
AudioPlayer oneUpMusic;
AudioPlayer powerUpAppearsMusic;
AudioPlayer powerUpMusic;
AudioPlayer levelClearMusic;
AudioPlayer gameOverMusic;

Mario mario;
Flag levelFlag;
Castle levelCastle;


int screen = 1;           // switches screen according to value
float levelTime = 400;    // the time given to complete the level is 400
int score = 0;            // tracks score
int coins = 0;            // counts coins
int coinFrame = 1;        // used to give animated effect for the coin at the top of the screen
int lives = 1;            // Mario gets 3 lives
float ground;             // lowest surface of the level
boolean allowKey = true;  // allows Mario to be controlled at certain times; when Mario touches the flag, he can't be controlled
boolean liveTemp = false; // makes sure that Mario can only lose one live at once
float gameOverTime;

ArrayList<Brick> bricks = new ArrayList<Brick>();
ArrayList<Pipe> pipes = new ArrayList<Pipe>();
ArrayList<Fireball> fireballs = new ArrayList<Fireball>();
ArrayList<Goomba> goombas = new ArrayList<Goomba>();
ArrayList<Scene> scenes = new ArrayList<Scene>();
ArrayList<Pit> pits = new ArrayList<Pit>();

Button playButton = new Button((7168/9)/3 - 30, 448*2/3, 140, 60, "Play");
Button controlsButton = new Button((7168/9)*2/3 - 90, 448*2/3, 140, 60, "Controls");
Button backButton = new Button((7168/9)/2 - 80, 448*4/5, 160, 60, "Back");

PFont f;


/** setup()
 * This method sets up the program
 *
 * @param none
 * @return none
 */
void setup() {
  //7168/9
  size(796,448);
  f = createFont("Emulogic.vlw", 30);
  
  images();
  level1();
  
  // open music files
  minim = new Minim(this);
  overworldMusic = minim.loadFile("OverworldTheme.mp3");
  hurryOverworldMusic = minim.loadFile("hurry-overworld.mp3");
  coinMusic = minim.loadFile("coin.wav");
  oneUpMusic = minim.loadFile("1-up.mp3");
  powerUpAppearsMusic = minim.loadFile("power-up_appears.wav");
  powerUpMusic = minim.loadFile("power-up.wav");
  levelClearMusic = minim.loadFile("level-complete.mp3");
  gameOverMusic = minim.loadFile("game-over.mp3");
  
  // set the volume of each music file - reduces sound of overworld music compared to the other music files
  overworldMusic.setVolume(0.1);
  coinMusic.setVolume(0.5);
  oneUpMusic.setVolume(0.5);
  powerUpAppearsMusic.setVolume(0.5);
  powerUpMusic.setVolume(0.5);
  
  overworldMusic.play();
  overworldMusic.loop();
  
  imageMode(CORNER);
}



/** draw()
 * This method is the main method that executes the whole program
 *
 * @param none
 * @return none
 */
void draw() {
  
  if (screen == 1) homeScreen();  // home screen
  else if (screen == 2) controlsScreen();  // screen with list of controls
  
  // play screen
  else if (screen == 3) {
    background(107,140,255);
    translate(-mario.x + 150, 0);
    imageMode(CORNER);
    //image(overworld, 0, 0, 6784, 448);
    pushMatrix();
    translate(mario.x - 150, 0);
    popMatrix();
    
    println(lives);
    
    if (mario.inAir == true) mario.fall();  // if mario is in the air, he should fall
    
    // displays each scene (clouds and hills)
    for (Scene s: scenes) {
      s.display(); 
    }
    
    // check for each brick:
    for (int i = 0; i < bricks.size(); i++) {
      Brick b = bricks.get(i);
      b.display();
      b.checkCollision(mario);
      
      // if the brick is a block, it is hit, and mario is larger than small size, the brick breaks
      if (b.type == "block" && b.hit == true && (mario.size == "medium" || mario.size == "fire medium")) { 
        stroke(107, 140, 255);
        fill(107,140,255); 
        rect(b.x - 1, b.y - 1, 33, 33);
        if (b.hitTemp == false) mario.dy *= -1; // reverses mario's y direction
        b.hitTemp = true; 
        bricks.remove(b);
      }
      else if (b.type == "block" && mario.size == "small" && b.hit == true) {
        b.hit = false;
        mario.dy += 2;
      }
      
      else if (b.hit == true && b.hitTemp == true && mario.y <= b.y + b.h + 5 && mario.y > b.y && mario.x + mario.w > b.x && mario.x < b.x + b.w) mario.dy += 2;
      
      // if the block is a mystery block and it is hit, show that it is hit, and display the item
      else if ((b.type == "mystery" || b.type == "invisible") && b.hit == true && b.visible == true) {
        image(hitBrick, b.x, b.y, b.w, b.h); 
        if (b.hitTemp == false) mario.dy *= -1;
        b.itemDisplay();
        b.hitTemp = true;
      }
      
      
      // if mario is on top of a brick, keep him up there, else drop mario
      if (mario.y + mario.h < b.y + 10 && mario.y + mario.h >= b.y && abs(b.x - mario.x) < b.w && b.visible == true) {
        mario.inAir = false;  
        mario.y = b.y - mario.h; // mario's y is always set to the y value of the bricks on the ground
        if (keyPressed == true) {
          if (keyCode == UP && allowKey == true) mario.jump();
        }
        else if (!keyPressed) mario.dy = 0;
      }
      else if (mario.y + mario.h == ground) { mario.dy = 0; mario.inAir = false;}  // >= to actually land on ground
      else if (mario.y + mario.h < b.y - 10 || mario.y > b.y + b.h) mario.inAir = true;
      
      
      if (b.type == "step") {
        if (mario.y + 32 >= b.y + 8 && mario.x + 16 >= b.x && mario.x + 16 <= b.x + 8) mario.x = b.x - 17;
        else if (mario.y + 32 >= b.y + 8 && mario.x <= b.x + 16 && mario.x >= b.x + 8) mario.x = b.x + 15;
      }
      
    }
    
    
    
    // check each pipe:
    for (Pipe p: pipes) {
      p.display();
      
      // if mario is on top of the pipe, keep him up there
      if (mario.y + mario.h <= p.y  && mario.y >= p.y - mario.h - 3 && abs(p.x + p.w/2 - mario.x) < p.w/2 - 2) {
        mario.dy = 0; 
        mario.inAir = false; 
      }
      
      if (mario.x > p.x && mario.x < p.x + p.w && mario.y + mario.h > p.y) mario.inAir = false;
      if (abs(p.x + 8 - mario.x) <= mario.w && mario.y + mario.h > p.y + 8) mario.x = p.x - mario.w;
      else if (mario.x - p.x <= p.w && mario.x - p.x > 0 && mario.y + mario.h > p.y + 8) { mario.dx = 0; mario.x = p.x + p.w;}
      
    }
    
    
    
    // if objects are in or over pit, make them fall
    for (Pit s: pits) {
      s.checkIntersection(mario);
      
      for (int i = 0; i < goombas.size(); i++) {
        Goomba g = goombas.get(i);
        s.checkIntersection(g);
      }
    }
    
    
    // check each fireball
    for (int i = 0; i < fireballs.size(); i++) {
      Fireball f = fireballs.get(i);
      f.display();
      
      // fireballs stop when they hit a pipe
      for (int j = 0; j < pipes.size(); j++) {
        Pipe p = pipes.get(j);
        
        if (p.x - f.x <= 16 && f.x < p.x && f.dx > 0) fireballs.remove(f);
        else if (f.x - p.x <= 64 && f.x > p.x && f.dx < 0) fireballs.remove(f);

      }
    }
    
    
    for (int i = 0; i < goombas.size(); i++) {
      Goomba g = goombas.get(i);
      g.display();
      
      if (g.goombaHit == false) g.checkCollision();  // check if Mario collided with the goomba
      
      // if the goomba was hit
      else if (g.goombaHit == true) {
        g.dx = 0;
        if (g.bounceTemp == false) { mario.y -= 15; score += 100; if (millis() - g.goombaTime >= 100) g.bounceTemp = true; } // bounces mario off the goomba
        if (millis() - g.goombaTime <= 500) image(goombaSquashed, g.x, g.y + g.h/2, g.w, g.h/2); // goomba is squashed
        else goombas.remove(g);
      }
      
      
      // goombas change direction when they hit a pipe
      for (int j = 0; j < pipes.size(); j++) {
        Pipe p = pipes.get(j);
        
        if (p.x - g.x <= 32 && g.x < p.x && g.dx > 0) g.xForward = false;
        else if (g.x - p.x <= 64 && g.x > p.x && g.dx < 0) g.xForward = true;
      }
      
      
      // if fireball hits goomba, get rid of both the goomba and the fireball
      for (int k = 0; k < fireballs.size(); k++) {
        Fireball f = fireballs.get(k);
        
        if (f.x + f.w > g.x && f.x < g.x + g.w && f.y >= g.y && f.y + f.h <= g.y + g.w) {
          score += 600;
          goombas.remove(g);
          fireballs.remove(f); 
        } 
      }
      
      
      for (int z = 0; z < bricks.size(); z++) {
        Brick b = bricks.get(z);
        
        if (g.y < b.y && g.y > (b.y - g.h - 10) && b.type != "ground" && abs(b.y - g.y) <= 5) {
          if (b.x - g.x <= 32 && g.x < b.x && g.dx > 0) g.xForward = false;
          else if (g.x - b.x <= 32 && g.x > b.x && g.dx < 0) g.xForward = true;
        }
      }
      
    }
    
    
    levelFlag.checkCollision(mario);
    levelCastle.checkCollision(mario);
    levelFlag.display();
    levelCastle.display();
    if (levelCastle.touched == false) mario.display();
    
    // if the flag at the end of the level was touched;
    if (levelFlag.touched == true) { 
      mario.slide = true;
      mario.move = false;
      mario.dx = 0; 
      allowKey = false; 
      overworldMusic.mute();
      hurryOverworldMusic.mute();
      levelClearMusic.play();
      if (levelClearMusic.position() >= levelClearMusic.length()) {
        levelClearMusic.mute();
        image(firework1, random(width/4 + levelCastle.x, width*3/4 + levelCastle.x), random(height/8, height/2), 24, 28);
      }
    }
    
    playScreen();
  }
  
  else if (screen == 4) gameOverScreen();  // game over screen
  
}



/** keyPressed()
 * This method executes whenever a key is pressed and allowKey is true
 *
 * @param none
 * @return none
 */
void keyPressed() {
  if (allowKey == true) {
    if (keyCode == UP && mario.inAir == false) { mario.jump(); mario.inAir = true; }  // if the UP key is pressed, mario jumps
    
    // adds fireballs when mario has fire power
    if (mario.size == "fire medium" && key == 'f') {
      if (mario.dir == "right") fireballs.add(new Fireball(mario.x + mario.w, mario.y + mario.h/2)); 
      else if (mario.dir == "left") fireballs.add(new Fireball(mario.x, mario.y + mario.h/2));
    }
  }
}



/** playScreen()
 * This method does the following when the game is on:
 * Keeps track of score, coins, lives, and time
 * Also keeps track of whether or not the flag was touched 
 *
 * @param none
 * @return none
 */
void playScreen() {
  if (levelTime <= 100) { overworldMusic.mute(); hurryOverworldMusic.unmute(); hurryOverworldMusic.play(); }
  
  pushMatrix();
  translate(mario.x - 150, 0);
  if (frameCount % 5 == 0) coinFrame++;
  if (coinFrame > 4) coinFrame = 1;
    
  if (coinFrame == 1) image(coin1, width - 530, 20, 32, 32);
  else if (coinFrame == 2) image(coin2, width - 530, 20, 32, 32);
  else if (coinFrame == 3) image(coin3, width - 530, 20, 32, 32);
  else if (coinFrame == 4) image(coin4, width - 530, 20, 32, 32);
  
  textFont(f,27);
  textAlign(LEFT, TOP);
  fill(220);
  text(" x " + str(coins), width - 505, 20);
  text("MARIO", 75, 10);
  text(str(score), 75, 35);
  text("WORLD", width - 350, 10);
  text("1-1", width - 325, 35);
  text("TIME", width - 170, 10);
  text(str(int(levelTime)), width - 160, 35);
  popMatrix();
  
  if (keyPressed && key == 'r' && liveTemp == false) { lives -= 1; liveTemp = true; }
  
  if (levelFlag.touched == true) levelTime = levelTime;
  else if (frameCount % 30 == 0) levelTime -= 1;
  
  if (levelTime == 0 && liveTemp == false) { lives -= 1; liveTemp = true; }
  if (mario.y > height && liveTemp == false) { lives -= 1; liveTemp = true; }
  
  if (lives <= 0) {gameOverTime = millis(); gameOverMusic.rewind(); screen = 4; }
}



/** homeScreen()
 * This method displays the home screen. From here you can play the game or see your controls
 *
 * @param none
 * @return none
 */
void homeScreen() {
  image(titleScreen, 0, 0, width, height);
  playButton.drawButton();
  controlsButton.drawButton();
  
  if (playButton.pressed() == true) screen = 3;
  else if (controlsButton.pressed() == true) screen = 2;
}



/** controlsScreen()
 * This method displays the screen the shows the controls for the game
 *
 * @param none
 * @return none
 */
void controlsScreen() {
  background(107, 140, 255);
  textAlign(CENTER, CENTER);
  textFont(f, 30);
  text("Left Arrow - Move left", width/2, 50);
  text("Right Arrow - Move Right", width/2, 90);
  text("Up Arrow - Jump", width/2, 130);
  text("Down Arrow - Crouch", width/2, 170);
  text("F - Shoots fireballs when you have fire power", width/2,210);
  text("Shift - Accelerate", width/2, 250);
  text("r - reset game, but lose one live", width/2, 290);
  
  backButton.drawButton();
  
  if (backButton.pressed() == true) screen = 1;
}



/** gameOverScreen()
 * This method displays the game over screen for 10 seconds
 *
 * @param none
 * @return none
 */
void gameOverScreen() {
  overworldMusic.mute();
  hurryOverworldMusic.mute();
  gameOverMusic.play();
  imageMode(CORNER);
  image(gameOverScreen, 0, 0, width, height); 
  if (frameCount % 5 == 0) coinFrame++;
  if (coinFrame > 4) coinFrame = 1;
    
  if (coinFrame == 1) image(coin1, width - 530, 20, 32, 32);
  else if (coinFrame == 2) image(coin2, width - 530, 20, 32, 32);
  else if (coinFrame == 3) image(coin3, width - 530, 20, 32, 32);
  else if (coinFrame == 4) image(coin4, width - 530, 20, 32, 32);
  
  textFont(f,27);
  textAlign(LEFT, TOP);
  fill(220);
  text(" x " + str(coins), width - 505, 20);
  text("MARIO", 75, 10);
  text(str(score), 75, 35);
  text("WORLD", width - 350, 10);
  text("1-1", width - 325, 35);
  text("TIME", width - 170, 10);
  text(str(int(levelTime)), width - 160, 35);
  
  if (millis() - gameOverTime >= 5000) { reset(); screen = 1; }
}



/** reset()
 * This method resets the game after all lives are lost
 *
 * @param none
 * @return none
 */
void reset() {
  mario.x = width/4;
  mario.y = 336;
  mario.size = "small";
  
  lives = 1;
  liveTemp = false;
  
  coins = 0;
  score = 0;
  overworldMusic.rewind();
  hurryOverworldMusic.rewind();
  overworldMusic.unmute();
  
  for (Brick b: bricks) {
    b.hit = false; 
    b.hitTemp = false;
    b.itemTemp = false; 
  }
  
  goombas.clear();
  for (Goomba g: goombas) {
    g.goombaHit = false;
    g.hitTemp = false;
    g.dy = 0; 
  }
  
  levelFlag.y = 64;
  levelTime = 400;
  
  level1();
}