/** Levels
 * Adds instances and declares values for each level
 *
 * @author Aniruddha Murali
 */
 
 
/** level1()
 * This method adds instances and sets some values for level 1
 *
 * @param none
 * @return none
 */
void level1() {
  
  // mystery bricks
  bricks.add(new Brick(512, 272, "mystery", "coin"));
  bricks.add(new Brick(704, 144, "mystery", "coin"));
  bricks.add(new Brick(672, 272, "mystery", "mushroom"));
  bricks.add(new Brick(736, 272, "mystery", "coin"));
  bricks.add(new Brick(2496, 272, "mystery", "coin"));
  bricks.add(new Brick(3008, 144, "mystery", "coin"));
  bricks.add(new Brick(3392, 272, "mystery", "poison mushroom"));
  bricks.add(new Brick(3488, 144, "mystery", "fire flower"));
  bricks.add(new Brick(3488, 272, "mystery", "coin"));
  bricks.add(new Brick(3584, 272, "mystery", "poison mushroom"));
  bricks.add(new Brick(4128, 144, "mystery", "coin"));
  bricks.add(new Brick(4160, 144, "mystery", "mushroom"));
  bricks.add(new Brick(5440, 272, "mystery", "coin"));
  
  
  // block bricks
  bricks.add(new Brick(640, 272, "block", "none"));
  bricks.add(new Brick(704, 272, "block", "none"));
  bricks.add(new Brick(768, 272, "block", "none"));
  bricks.add(new Brick(2464, 272, "block", "none"));
  bricks.add(new Brick(2528, 272, "block", "none"));
  for (int i = 0; i < 8; i++) { bricks.add(new Brick(2560+i*32, 144, "block", "none")); }
  bricks.add(new Brick(2912, 144, "block", "none"));
  bricks.add(new Brick(2944, 144, "block", "none"));
  bricks.add(new Brick(2976, 144, "block", "none"));
  bricks.add(new Brick(3008, 272, "block", "none"));
  bricks.add(new Brick(3200, 272, "block", "none"));
  bricks.add(new Brick(3232, 272, "block", "none"));
  bricks.add(new Brick(3776, 272, "block", "none"));
  bricks.add(new Brick(3872, 144, "block", "none"));
  bricks.add(new Brick(3904, 144, "block", "none"));
  bricks.add(new Brick(3936, 144, "block", "none"));
  bricks.add(new Brick(4096, 144, "block", "none"));
  bricks.add(new Brick(4128, 272, "block", "none"));
  bricks.add(new Brick(4160, 272, "block", "none"));
  bricks.add(new Brick(4192, 144, "block", "none"));
  bricks.add(new Brick(5376, 272, "block", "none"));
  bricks.add(new Brick(5408, 272, "block", "none"));
  bricks.add(new Brick(5472, 272, "block", "none"));
  
  
  // invisible bricks
  bricks.add(new Brick(2048, 272, "invisible", "1 Up"));
  bricks.add(new Brick(2144, 272, "invisible", "coin"));
  bricks.add(new Brick(2208, 272, "invisible", "coin"));
  bricks.add(new Brick(2752, 272, "invisible", "coin"));
  bricks.add(new Brick(3424, 16, "invisible", "coin"));
  bricks.add(new Brick(3456, 16, "invisible", "coin"));
  bricks.add(new Brick(3488, 16, "invisible", "coin"));
  bricks.add(new Brick(3520, 16, "invisible", "coin"));
  bricks.add(new Brick(3552, 16, "invisible", "coin"));
  bricks.add(new Brick(4416, height - 176, "invisible", "coin"));
  bricks.add(new Brick(4448, height - 176, "invisible", "coin"));
  bricks.add(new Brick(4416, 160, "invisible", "coin"));
  bricks.add(new Brick(4448, 160, "invisible", "coin"));
  bricks.add(new Brick(6080, height - 176, "invisible", "coin"));
  
  
  //step bricks
  bricks.add(new Brick(4288, height - 80, "step", "none"));
  bricks.add(new Brick(4320, height - 80, "step", "none"));
  bricks.add(new Brick(4320, height - 112, "step", "none"));
  bricks.add(new Brick(4352, height - 80, "step", "none"));
  bricks.add(new Brick(4352, height - 112, "step", "none"));
  bricks.add(new Brick(4352, height - 144, "step", "none"));
  bricks.add(new Brick(4384, height - 80, "step", "none"));
  bricks.add(new Brick(4384, height - 112, "step", "none"));
  bricks.add(new Brick(4384, height - 144, "step", "none"));
  bricks.add(new Brick(4384, height - 176, "step", "none"));
  
  bricks.add(new Brick(4480, height - 176, "step", "none"));
  bricks.add(new Brick(4480, height - 144, "step", "none"));
  bricks.add(new Brick(4480, height - 112, "step", "none"));
  bricks.add(new Brick(4480, height - 80, "step", "none"));
  bricks.add(new Brick(4512, height - 144, "step", "none"));
  bricks.add(new Brick(4512, height - 112, "step", "none"));
  bricks.add(new Brick(4512, height - 80, "step", "none"));
  bricks.add(new Brick(4544, height - 112, "step", "none"));
  bricks.add(new Brick(4544, height - 80, "step", "none"));
  bricks.add(new Brick(4576, height - 80, "step", "none"));
  
  bricks.add(new Brick(4736, height - 80, "step", "none"));
  bricks.add(new Brick(4768, height - 80, "step", "none"));
  bricks.add(new Brick(4768, height - 112, "step", "none"));
  bricks.add(new Brick(4800, height - 80, "step", "none"));
  bricks.add(new Brick(4800, height - 112, "step", "none"));
  bricks.add(new Brick(4800, height - 144, "step", "none"));
  bricks.add(new Brick(4832, height - 80, "step", "none"));
  bricks.add(new Brick(4832, height - 112, "step", "none"));
  bricks.add(new Brick(4832, height - 144, "step", "none"));
  bricks.add(new Brick(4832, height - 176, "step", "none"));
  bricks.add(new Brick(4864, height - 80, "step", "none"));
  bricks.add(new Brick(4864, height - 112, "step", "none"));
  bricks.add(new Brick(4864, height - 144, "step", "none"));
  bricks.add(new Brick(4864, height - 176, "step", "none"));
  
  bricks.add(new Brick(4960, height - 176, "step", "none"));
  bricks.add(new Brick(4960, height - 144, "step", "none"));
  bricks.add(new Brick(4960, height - 112, "step", "none"));
  bricks.add(new Brick(4960, height - 80, "step", "none"));
  bricks.add(new Brick(4992, height - 144, "step", "none"));
  bricks.add(new Brick(4992, height - 112, "step", "none"));
  bricks.add(new Brick(4992, height - 80, "step", "none"));
  bricks.add(new Brick(5024, height - 112, "step", "none"));
  bricks.add(new Brick(5024, height - 80, "step", "none"));
  bricks.add(new Brick(5056, height - 80, "step", "none"));
  
  bricks.add(new Brick(5792, height - 80, "step", "none"));
  bricks.add(new Brick(5824, height - 80, "step", "none"));
  bricks.add(new Brick(5824, height - 112, "step", "none"));
  bricks.add(new Brick(5856, height - 80, "step", "none"));
  bricks.add(new Brick(5856, height - 112, "step", "none"));
  bricks.add(new Brick(5856, height - 144, "step", "none"));
  bricks.add(new Brick(5888, height - 80, "step", "none"));
  bricks.add(new Brick(5888, height - 112, "step", "none"));
  bricks.add(new Brick(5888, height - 144, "step", "none"));
  bricks.add(new Brick(5888, height - 176, "step", "none"));
  bricks.add(new Brick(5920, height - 80, "step", "none"));
  bricks.add(new Brick(5920, height - 112, "step", "none"));
  bricks.add(new Brick(5920, height - 144, "step", "none"));
  bricks.add(new Brick(5920, height - 176, "step", "none"));
  bricks.add(new Brick(5920, height - 208, "step", "none"));
  bricks.add(new Brick(5952, height - 80, "step", "none"));
  bricks.add(new Brick(5952, height - 112, "step", "none"));
  bricks.add(new Brick(5952, height - 144, "step", "none"));
  bricks.add(new Brick(5952, height - 176, "step", "none"));
  bricks.add(new Brick(5952, height - 208, "step", "none"));
  bricks.add(new Brick(5952, height - 240, "step", "none"));
  bricks.add(new Brick(5984, height - 80, "step", "none"));
  bricks.add(new Brick(5984, height - 112, "step", "none"));
  bricks.add(new Brick(5984, height - 144, "step", "none"));
  bricks.add(new Brick(5984, height - 176, "step", "none"));
  bricks.add(new Brick(5984, height - 208, "step", "none"));
  bricks.add(new Brick(5984, height - 240, "step", "none"));
  bricks.add(new Brick(5984, height - 272, "step", "none"));
  bricks.add(new Brick(6016, height - 80, "step", "none"));
  bricks.add(new Brick(6016, height - 112, "step", "none"));
  bricks.add(new Brick(6016, height - 144, "step", "none"));
  bricks.add(new Brick(6016, height - 176, "step", "none"));
  bricks.add(new Brick(6016, height - 208, "step", "none"));
  bricks.add(new Brick(6016, height - 240, "step", "none"));
  bricks.add(new Brick(6016, height - 272, "step", "none"));
  bricks.add(new Brick(6016, height - 304, "step", "none"));
  bricks.add(new Brick(6048, height - 80, "step", "none"));
  bricks.add(new Brick(6048, height - 112, "step", "none"));
  bricks.add(new Brick(6048, height - 144, "step", "none"));
  bricks.add(new Brick(6048, height - 176, "step", "none"));
  bricks.add(new Brick(6048, height - 208, "step", "none"));
  bricks.add(new Brick(6048, height - 240, "step", "none"));
  bricks.add(new Brick(6048, height - 272, "step", "none"));
  bricks.add(new Brick(6048, height - 304, "step", "none"));
  
  bricks.add(new Brick(6336, height - 80, "step", "none"));

  
  //ground bricks
  for (int i = 0; i < 69; i++) {
    bricks.add(new Brick(i*32, height - 48, "ground", "none"));
    bricks.add(new Brick(i*32, height - 16, "ground", "none"));
  }
  
  for (int i = 0; i < 15; i++) {
    bricks.add(new Brick(2272+i*32, height - 48, "ground", "none"));
    bricks.add(new Brick(2272+i*32, height - 16, "ground", "none"));
  }
  
  for (int i = 0; i < 64; i++) {
    bricks.add(new Brick(2848+i*32, height - 48, "ground", "none"));
    bricks.add(new Brick(2848+i*32, height - 16, "ground", "none"));
  }
  
  for (int i = 0; i < 57; i++) {
    bricks.add(new Brick(4960+i*32, height - 48, "ground", "none"));
    bricks.add(new Brick(4960+i*32, height - 16, "ground", "none"));
  }
  
  
  // pipes
  pipes.add(new Pipe(896, 336, 1));
  pipes.add(new Pipe(1216, 304, 2));
  pipes.add(new Pipe(1472, 272, 3));
  pipes.add(new Pipe(1824, 272, 3));
  pipes.add(new Pipe(5216, 336, 1));
  pipes.add(new Pipe(5728, 336, 1));
  
  
  // enemies 
  goombas.add(new Goomba(700, height-80));
  goombas.add(new Goomba(800, height-80));
  goombas.add(new Goomba(1300, height-80));
  goombas.add(new Goomba(1400, height-80));
  goombas.add(new Goomba(1600, height-80));
  goombas.add(new Goomba(1700, height-80));
  goombas.add(new Goomba(3000, height-80));
  goombas.add(new Goomba(5300, height-80));
  goombas.add(new Goomba(5450, height-80));
  goombas.add(new Goomba(5600, height-80));
  
  
  // scenery
  scenes.add(new Scene(0, height - 118, "big hill"));
  scenes.add(new Scene(368, height - 80, "bush3"));
  scenes.add(new Scene(512, height - 86, "small hill"));
  scenes.add(new Scene(624, 48, "cloud1"));
  scenes.add(new Scene(752, height - 80, "bush1"));
  scenes.add(new Scene(880, 80, "cloud3"));
  scenes.add(new Scene(1168, 48, "cloud2"));
  scenes.add(new Scene(1296, height - 80, "bush3"));
  scenes.add(new Scene(1536, height - 118, "big hill"));
  scenes.add(new Scene(1808, 80, "cloud1"));
  scenes.add(new Scene(1904, height - 80, "bush3"));
  scenes.add(new Scene(2048, height - 86, "small hill"));
  scenes.add(new Scene(2160, 48, "cloud1"));
  scenes.add(new Scene(2288, height - 80, "bush1"));
  scenes.add(new Scene(2416, 80, "cloud3"));
  scenes.add(new Scene(2704, 48, "cloud2"));
  scenes.add(new Scene(2864, height - 80, "bush2"));
  scenes.add(new Scene(3072, height - 118, "big hill"));
  scenes.add(new Scene(3344, 80, "cloud1"));
  scenes.add(new Scene(3440, height - 80, "bush3"));
  scenes.add(new Scene(3582, height - 86, "small hill"));
  scenes.add(new Scene(3696, 48, "cloud1"));
  scenes.add(new Scene(3824, height - 80, "bush1"));
  scenes.add(new Scene(3952, 80, "cloud3"));
  scenes.add(new Scene(4240, 48, "cloud2"));
  scenes.add(new Scene(4400, height - 80, "bush2"));
  scenes.add(new Scene(4608, height - 118, "big hill"));
  scenes.add(new Scene(4880, 80, "cloud1"));
  scenes.add(new Scene(5040, height - 80, "bush1"));
  scenes.add(new Scene(5120, height - 86, "small hill"));
  scenes.add(new Scene(5232, 48, "cloud1"));
  scenes.add(new Scene(5360, height - 80, "bush1"));
  scenes.add(new Scene(5488, 80, "cloud3"));
  scenes.add(new Scene(5776, 48, "cloud2"));
  scenes.add(new Scene(6144, height - 118, "big hill"));
  scenes.add(new Scene(6416, 80, "cloud1"));
  scenes.add(new Scene(6576, height - 80, "bush1"));
  scenes.add(new Scene(6656, height - 86, "small hill"));
  
  
  // pits
  pits.add(new Pit(2208, height-48, 64, 48));
  pits.add(new Pit(2752, height - 48, 96, 48));
  pits.add(new Pit(4896, height - 48, 64, 48));
  pits.add(new Pit(-500, height - 48, 500, 48));
  pits.add(new Pit(6784, height - 48, 500, 48));
  
  
  ground = height - 48;
  mario = new Mario(width/4, 336); //2000
  levelFlag = new Flag(6320, 64);
  levelCastle = new Castle(6464, 240);
  levelCastle.size = "small";
  
  if (mario.size == "small") mario.y = 368;
  else if (mario.size != "small") mario.y = 336;
}