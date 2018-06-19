/** Castle class
 * class for castles at the end of each level
 *
 * @author Aniruddha Murali
 */
 
 
class Castle {
  float x, y, w, h;
  float dy;
  boolean touched = false;
  String size;
  int frame = 1;
  
  
  /** Castle()
   * This is the constructor method for the castle
   *
   * @param ix(float) - the initial x coordinate of the castle
   * @param iy(float) - the initial y coordinate of the castle
   * @return none
   */
  Castle(float ix, float iy) {
    x = ix;
    y = iy;
    w = 160;
    h = 160;
    dy = 0;
  }
  
  
  
  /** display()
   * This method displays the castle according to its size
   *
   * @param none
   * @return none
   */
  void display() {
    imageMode(CORNER);
    
    if (size == "small") {
      image(castleFlag, x+36, y + h/3, 26, 28);
      image(castle, x, y, w, h); 
      
      if (touched == true) {
        image(castle, x, y, w, h); 
        image(castleFlag, x+68, y-24 + dy, 26, 28); 
        mario.dx = 0;
        if (y <= 224) dy = 0;
        if (keyPressed && allowKey == true) { mario.x = mario.x; }
      }
    }
    
    else if (size == "large") {
      // no large castle in world 1-1, so this conditional is empty
    }
    
  }
  
  
  
  /** checkCollision()
   * This method checks the collision between mario and the castle
   *
   * @param m(Mario) - mario of Mario class
   * @return none
   */
  void checkCollision(Mario m) {
    if (size == "small" && levelFlag.touched == true) {
      if (m.x > x+64 && m.x+m.w < x+w-32) touched = true;
    }
  }
  
}
