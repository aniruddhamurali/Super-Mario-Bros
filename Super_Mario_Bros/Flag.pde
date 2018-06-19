/** Flag class
 * class for flags at the end of each level
 *
 * @author Aniruddha Murali
 */
 
 
class Flag {
  float x, y, w, h;
  boolean touched = false;
  int frame = 1;
  
  
  /** Flag()
   * This is the constructor method for the flag
   *
   * @param ix(float) - the initial x coordinate of the flag
   * @param iy(float) - the initial y coordinate of the flag
   * @return none
   */
  Flag(float ix, float iy) {
    x = ix;
    y = iy;
    w = 48;
    h = 336;
  }
  
  
  
  /** display()
   * This method displays the flag
   *
   * @param none
   * @return none
   */
  void display() {
    imageMode(CORNER);
    
    if (touched == false) { image(flagpole, x, y, w, h); image(flag, x, y + 18, 32, 32);}
    
    else if (touched == true) {
      if (frameCount % 100 == 0) frame++;
      
      image(flagpole, x, 64, w, h);
      image(flag, x, y + 18, 32, 32);
    }
  }
  
  
  
  /** checkCollision()
   * This method checks the collision between Mario and the flag
   *
   * @param m(Mario) - mario of Mario class
   * @return none
   */
  void checkCollision(Mario m) {
    if (x - mario.x <= -4 && x - mario.x > -12 && mario.y + mario.h > y && mario.y < y + h) {
      touched = true;
    }
    
    if (touched == true) {
      mario.dir = "right";
      mario.dx = 0;
      mario.dy = 0;
      mario.y += 2;
      
      if ((y+32) < (64+h-48)) y += 2;
      else if (levelCastle.touched == true) mario.x += 0;
      else if (y+32 >= (64+h-48) && mario.y + mario.h >= ground - 32) mario.x += 1;
      else y = y;
    }
  }
  
}
