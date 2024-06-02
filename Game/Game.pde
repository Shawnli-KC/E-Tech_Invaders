/* Game Class Starter File
 * Authors: Zachary Zhuo & Sheanleigh Ken Cajote
 * Last Edit: 5/20/2024
 */

//import processing.sound.*;

//------------------ GAME VARIABLES --------------------//

//Title Bar
String titleText = "Minecraft Shoota";
String extraText = "Are You Ready?";

//VARIABLES: Whole Game
AnimatedSprite runningHorse;
boolean doAnimation;

//Splash Screen 
Screen splashScreen;
PImage splashBg;
String splashBgFile = "images/MC.png";

//Music


//Level1 
Grid level1Grid;
PImage level1Bg;
String level1BgFile = "images/L1.png";

//Player
PImage player1;   //Use PImage to display the image in a GridLocation
String player1File = "images/Steve.png";
int player1Row = 5;
int player1Col = 0;
int health = 10;

//Enemy
PImage enemy1;
String enemyFile1 = "images/Creeper.png";

//Button
Button b1 = new Button("rect", 780, 780, 100, 100, "Go To Level 2");

//Level2 Pixel-based-Screen Variables
Grid level2Grid;
PImage level2Bg;
String level2BgFile = "images/L2.png";

PImage player2;   //Use PImage to display the image in a GridLocation
String player2File = "images/Steve.png";
int player2Row = 5;
int player2Col = 0;

Button b2 = new Button("rect", 780, 780, 100, 100, "Go To Level 3");


// Sprite player2;   //Use PImage to display the image in a GridLocation
// String player2File = "images/zapdos.png";
// int player2startX = 50;
// int player2startY = 300;

//Level 3
Grid level3Grid;
PImage level3Bg;
String level3BgFile = "images/L3.png";

PImage player3;   //Use PImage to display the image in a GridLocation
String player3File = "images/Steve.png";
int player3Row = 5;
int player3Col = 0;

Button b3 = new Button("rect", 780, 780, 100, 100, "Go To Level 4");

//Level 4
Grid level4World;
PImage level4Bg;
String level4BgFile = "images/L4.png";

PImage player4;   //Use PImage to display the image in a GridLocation
String player4File = "images/Steve.png";
int player4Row = 5;
int player4Col = 0;

Button b4 = new Button("rect", 780, 780, 100, 100, "Go To Level 5");

//Level 5
Grid level5World;
PImage level5Bg;
String level5BgFile = "images/L5.png";

PImage player5;   //Use PImage to display the image in a GridLocation
String player5File = "images/Steve.png";
int player5Row = 5;
int player5Col = 0;

Button b5 = new Button("rect", 780, 780, 100, 100, "Go To Level 6");

//Level 6
Grid level6World;
PImage level6Bg;
String level6BgFile = "images/L6.png";

PImage player6;   //Use PImage to display the image in a GridLocation
String player6File = "images/Steve.png";
int player6Row = 5;
int player6Col = 0;

Button b6 = new Button("rect", 780, 780, 100, 100, "Go To Level 7");

//Level 7
Grid level7World;
PImage level7Bg;
String level7BgFile = "images/L7.png";

PImage player7;   //Use PImage to display the image in a GridLocation
String player7File = "images/Steve.png";
int player7Row = 5;
int player7Col = 0;

Button b7 = new Button("rect", 780, 780, 100, 100, "Congrats!");

//Ending Screen
World endScreen;
PImage endBg;
String endBgFile = "images/JAB.png";


//VARIABLES: Tracking the current Screen being displayed
Screen currentScreen;
World currentWorld;
Grid currentGrid;
private int msElapsed = 0;


//------------------ REQUIRED PROCESSING METHODS --------------------//

//Required Processing method that gets run once
void setup() {

  //Match the screen size to the background image size
  size(900,900);
  
  //SETUP: Set the title on the title bar
  surface.setTitle(titleText);

  //SETUP: Load BG images used in all screens
  splashBg = loadImage(splashBgFile);
  splashBg.resize(900,900);
  level1Bg = loadImage(level1BgFile);
  level1Bg.resize(900,900);
  level2Bg = loadImage(level2BgFile);
  level2Bg.resize(900,900);
  endBg = loadImage(endBgFile);
  endBg.resize(900,900);  //------------------ OTHER GRID METHODS --------------------//

  //SETUP: Screens, Worlds, Grids
  splashScreen = new Screen("splash", splashBg);
  level1Grid = new Grid("Plains", level1Bg, 10, 10);
  level2Grid = new Grid("Forest", level2Bg, 10, 10);   //simple World construtor
  //level3Grid = new Grid("Desert", level3Bg, 10, 10);
  //level4Grid = new Grid("Ocean", level4Bg, 10, 10);
  //level5Grid = new Grid("Artic", level5Bg, 10, 10);
  //level6Grid = new Grid("Nether", level6Bg, 10, 10);
  //level7Grid = new Grid("End", level7Bg, 10, 10);
  endScreen = new World("Ending", endBg);
  currentScreen = splashScreen;

  //SETUP: All Game objects
  runningHorse = new AnimatedSprite("sprites/horse_run.png", "sprites/horse_run.json", 50.0, 75.0, 10.0);

  //SETUP: Level 1
  player1 = loadImage(player1File);
  player1.resize(level1Grid.getTileWidthPixels(),level1Grid.getTileHeightPixels());

  //Adding pixel-based Animated Sprites to the world
  // level1Grid.addSpriteCopyTo(exampleSprite);
  //enemy1 = loadImage(enemyFile1);
  //enemy1.resize(level1Grid.getTileWidth(),level1Grid.getTileHeight());
  //walkingChick = new AnimatedSprite("sprites/chick_walk.png", "sprites/chick_walk.json", 0.0, 0.0, 5.0);
  //level1Grid.setTileSprite(new GridLocation (5,5), walkingChick);
  //level1Grid.printSprites();
  System.out.println("Done adding sprites to level 1..");
  
  //SETUP: Level 2
  // player2 = new Sprite(player2File, 0.25);
  //player2.moveTo(player2startX, player2startY);
  // level2World.addSpriteCopyTo(runningHorse, 100, 200);  //example Sprite added to a World at a location, with a speed
  // level2World.printWorldSprites();
  System.out.println("Done loading Level 2 ...");
  
  //SETUP: Sound
  // Load a soundfile from the /data folder of the sketch and play it back
  // song = new SoundFile(this, "sounds/Lenny_Kravitz_Fly_Away.mp3");
  // song.play();
  
  println("Game started...");

} //end setup()


//Required Processing method that automatically loops
//(Anything drawn on the screen should be called from here)
void draw() {

  updateTitleBar();
  updateScreen();

  //simple timing handling
  if (msElapsed % 300 == 0) {
    //sprite handling
    populateSprites();
    moveSprites();
  }
  msElapsed +=100;
  currentScreen.pause(100);

  //check for end of game
  if(isGameOver()){
    endGame();
  }

} //end draw()

//------------------ USER INPUT METHODS --------------------//


//Known Processing method that automatically will run whenever a key is pressed
void keyPressed(){

  //check what key was pressed
  System.out.println("\nKey pressed: " + keyCode); //key gives you a character for the key pressed

  //What to do when a key is pressed?
  
  //KEYS FOR LEVEL1
  if(currentScreen == level1Grid){

    //set [W] key to move the player1 up & avoid Out-of-Bounds errors
    if(keyCode == 87){
    
      //Store old GridLocation
      GridLocation oldLoc = new GridLocation(player1Row, player1Col);

      //Erase image from previous location
      

      //change the field for player1Row
      player1Row--;
    }



  }

  //CHANGING SCREENS BASED ON KEYS
  //change to level1 if 1 key pressed, level2 if 2 key is pressed
  if(key == '1'){
    currentScreen = level1Grid;
  } else if(key == '2'){
    currentScreen = level2Grid;
  }


}

//Known Processing method that automatically will run when a mouse click triggers it
void mouseClicked(){
  
  //check if click was successful
  System.out.println("\nMouse was clicked at (" + mouseX + "," + mouseY + ")");
  if(currentGrid != null){
    System.out.println("Grid location: " + currentGrid.getGridLocation());
  }

  //what to do if clicked? (Make player1 jump back?)
  


  //Toggle the animation on & off
  doAnimation = !doAnimation;
  System.out.println("doAnimation: " + doAnimation);
  if(currentGrid != null){
    currentGrid.setMark("X",currentGrid.getGridLocation());
  }

}



//------------------ CUSTOM  GAME METHODS --------------------//

//method to update the Title Bar of the Game
public void updateTitleBar(){

  if(!isGameOver()) {
    //set the title each loop
    surface.setTitle(titleText + "    " + extraText + " " + health);

    //adjust the extra text as desired
  
  }
}

//method to update what is drawn on the screen each frame
public void updateScreen(){

  //UPDATE: Background of the current Screen
  if(currentScreen.getBg() != null){
    background(currentScreen.getBg());
  }

  //UPDATE: splashScreen
  if(currentScreen == splashScreen && splashScreen.getScreenTime() > 3000 && splashScreen.getScreenTime() < 5000){
    System.out.print("s");
    currentScreen = level1Grid;
  }

  //UPDATE: level1Grid Screen
  if(currentScreen == level1Grid){
    System.out.print("1");
    currentGrid = level1Grid;

    //Display the Player1 image
    GridLocation player1Loc = new GridLocation(player1Row,0);
    level1Grid.setTileImage(player1Loc, player1);
    
    //update other screen elements
    level1Grid.showGridImages();
    level1Grid.showGridSprites();
    level1Grid.showWorldSprites();

    //move to next level based on a button click
    b1.show();
    if(b1.isClicked()){
      currentScreen = level2Grid;
    }
  
  }

  //level2Grid Updates
  else if(currentScreen == level2Grid){
    currentWorld = level2Grid;
    
    level2Grid.moveBgXY(-3.0, 0);
    level2Grid.show();

    // player2.show();

    level2World.showWorldSprites();

  }

  //UPDATE: End Screen
  // if(currentScreen == endScreen){

  // }

  //UPDATE: Any Screen
  if(doAnimation){
    runningHorse.animateHorizontal(5.0, 10.0, true);
  }


}

//Update Screen
if(doAnimation){
    runningHorse.animateHorizontal(5.0, 10.0, true);
  }


}

//Update Screen
if(doAnimation){
    runningHorse.animateHorizontal(5.0, 10.0, true);
  }


}

//Method to populate enemies or other sprites on the screen
public void populateSprites(){

  //What is the index for the last column?
  int lastCol = level1Grid.getNumCols() -1; 

  //Loop through all the rows in the last column
  for(int r=0; r<level1Grid.getNumRows(); r++){

    GridLocation loc = new GridLocation(r, lastCol);

    //Generate a random number
    double rando = Math.random();

    //10% of the time, decide to add an enemy image to a Tile
    if(rando < 0.1){
      level1Grid.setTileImage(loc, enemy1);
      System.out.println("Adding Creeper to " + loc);
    }

  }

}
    
//Method to move around the enemies/sprites on the screen
public void moveSprites(){

//Loop through all of the rows & cols in the grid
for(int r=0; r<level1Grid.getNumRows(); r++){
  for(int c=0; c<level1Grid.getNumCols(); c++){

    GridLocation loc = new GridLocation(r,c);

    //check for enemy creeper at the loc
    if(level1Grid.getTileImage(loc) == enemy1 ){

      //erase creeper from current loc
      level1Grid.clearTileImage(loc);
      
      //only move if it's a legal col
      if( c >= 1){
        //add creeper to loc to left
        GridLocation leftLoc = new GridLocation(r, c-1);
        level1Grid.setTileImage(leftLoc, enemy1);
        //System.out.println("moving creeper");
      }
    }
  }

}

//Method to check if there is a collision between Sprites on the Screen
public boolean checkCollision(GridLocation loc, GridLocation nextLoc){

  //Check what image/sprite is stored in the CURRENT location
  // PImage image = grid.getTileImage(loc);
  // AnimatedSprite sprite = grid.getTileSprite(loc);

  //if empty --> no collision

  //Check what image/sprite is stored in the NEXT location

  //if empty --> no collision

  //check if enemy runs into player

    //clear out the enemy if it hits the player (using cleartTileImage() or clearTileSprite() from Grid class)

    //Update status variable

  //check if a player collides into enemy

  return false; //<--default return
}

//method to indicate when the main game is over
public boolean isGameOver(){
  
  return false; //by default, the game is never over
}

//method to describe what happens after the game is over
public void endGame(){
    System.out.println("Game Over!");

    //Update the title bar

    //Show any end imagery
    currentScreen = endScreen;

}
