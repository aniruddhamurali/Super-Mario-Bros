/** Goomba class
 * class for all goombas
 *
 * @author Aniruddha Murali
 */
 
 
class Goomba {
  float x, y, w, h;
  float dx, dy;
  int frame = 1;
  boolean hitTemp = false;
  boolean bounceTemp = false;
  boolean goombaHit = false;
  boolean xForward = true;
  float goombaTime = millis();
  float time;
  
  
  /** Goomba()
   * This is the constructor class for the goomba
   *
   * @param ix(float) - the initial x coordinate of the goomba
   * @param iy(float) - the initial y coordinate of the goomba
   * @return none
   */
  Goomba(float ix, float iy) {
    x = ix;
    y = iy;
    w = 32;
    h = 32;
    dx = 2;
    dy = 0;
  }
  
  
  
  /** display()
   * This method displays the goomba
   *
   * @param none
   * @return none
   */
  void display() {
    if (frameCount % 5 == 0) frame++;
    if (frame > 2) frame = 1;
    
    if (goombaHit == false) {
      if (frame == 1) image(goomba1, x, y, w, h);
      else if (frame == 2) image(goomba2, x, y, w, h);
      
      if (xForward == false) dx = -2;
      else if (xForward == true) dx = 2;
    }
    
    x += dx;  
    y += dy;
  }
  
  
  /** checkCollision()
   * This method checks collision between Mario and the goomba
   *
   * @param none
   * @return none
   */
  void checkCollision() {
    // if mario stomped on the goomba
    if (mario.y + mario.h <= y && mario.y >= (y - mario.h - 10) && mario.x + mario.w >= x && mario.x <= x + w) {
       goombaHit = true;
       goombaTime = millis();
    }
    
    // else if the goomba hit mario
    else if (mario.x + mario.w >= x && mario.x <= x + w && mario.y + mario.h > y && mario.y < y + h && hitTemp == false) {
      if (mario.size == "small") lives -= 1;
      else if (mario.size == "medium" || mario.size == "fire medium") { mario.size = "small"; mario.y += 32; }
      hitTemp = true;
      time = millis();
    }
    
    if (millis() - time > 2500) hitTemp = false;
    
  }
  
}
