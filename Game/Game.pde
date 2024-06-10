/* Game Class Starter File
 * Authors: Sheanleigh Ken Cajote & Zachary Zhuo
 * Last Edit: 6/9/24
 * Modified for AnimatedSprites
 */

//import processing.sound.*;

//------------------ GAME VARIABLES --------------------//

//VARIABLES: Title Bar
String titleText = "Minecraft Charger";
String extraText = "Are You Ready?";

//VARIABLES: Whole Game
AnimatedSprite runningHorse;
boolean doAnimation;

//VARIABLES: Splash Screen
Screen splashScreen;
PImage splashBg;
String splashBgFile = "images/MC.png";

//SoundFile song;

//Level 1
Grid level1Grid;
PImage level1Bg;
String level1BgFile = "images/L1.png";

//Player
PImage player1;   //Use PImage to display the image in a GridLocation
String player1File = "images/Steve.png";
int player1Row = 10;
int player1Col = 0;

//Pressure Plate
PImage p1;   
String p1File = "images/Gold.png";
int p1Row = 5;
int p1Col = 6;

//Enemy
PImage enemy;
String enemyFile = "images/Creeper.png";
AnimatedSprite walkingChick;

//Button
Button b1 = new Button("rect", 1800, 925, 100, 100, "Go To Level 2");

//Level 2 
Grid level2Grid;
PImage level2Bg;
String level2BgFile = "images/L6.png";

PImage player2; 
String player2File = "images/Steve.png";
int player2Row = 10;
int player2Col = 0;

PImage p2;   
String p2File = "images/Gold.png";
int p2Row = 15;
int p2Col = 13;

PImage enemy2;
String enemyFile2 = "images/Wither.png";

Button b2 = new Button("rect", 1800, 925, 100, 100, "Go To Level 3");

//Level 3
Grid level3Grid;
PImage level3Bg;
String level3BgFile = "images/L7.png";

PImage player3;   
String player3File = "images/Steve.png";
int player3Row = 10;
int player3Col = 0;

PImage p3;   
String p3File = "images/Gold.png";
int p3Row = 18;
int p3Col = 19;

PImage enemy3;
String enemyFile3 = "images/Wither.png";

Button b3 = new Button("rect", 1800, 925, 100, 100, "Go To The End!");

//VARIABLES: EndScreen
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

  //SETUP: Match the screen size to the background image size
  size(1920,1080);  //these will automatically be saved as width & height
  imageMode(CORNER);    //Set Images to read coordinates at corners
  //fullScreen();   //only use if not using a specfic bg image
  
  //SETUP: Set the title on the title bar
  surface.setTitle(titleText);

  //SETUP: Load BG images used in all screens
  splashBg = loadImage(splashBgFile);
  splashBg.resize(width, height);
  level1Bg = loadImage(level1BgFile);
  level1Bg.resize(width, height);
  level2Bg = loadImage(level2BgFile);
  level2Bg.resize(width, height);
  level3Bg = loadImage(level3BgFile);
  level3Bg.resize(width, height);
  endBg = loadImage(endBgFile);
  endBg.resize(width, height);  

  //SETUP: Screens, Worlds, Grids
  splashScreen = new Screen("splash", splashBg);
  level1Grid = new Grid("Plains", level1Bg, 20, 20);
  level2Grid = new Grid("Nether", level2Bg, 20, 20);   
  level3Grid = new Grid("The End", level3Bg, 20, 20);
  endScreen = new World("end", endBg);
  currentScreen = splashScreen;

  //SETUP: All Game objects
  runningHorse = new AnimatedSprite("sprites/horse_run.png", "sprites/horse_run.json", 50.0, 75.0, 10.0);

  //SETUP: Level 1
  player1 = loadImage(player1File);
  player1.resize(level1Grid.getTileWidth(),level1Grid.getTileHeight());
  enemy = loadImage(enemyFile);
  enemy.resize(level1Grid.getTileWidth(),level1Grid.getTileHeight());
  System.out.println("Done loading Level 1 ...");
  
  //SETUP: Level 2
  player2 = loadImage(player2File);
  player2.resize(level2Grid.getTileWidth(),level2Grid.getTileHeight());
  enemy2 = loadImage(enemyFile2);
  enemy2.resize(level3Grid.getTileWidth(),level2Grid.getTileHeight());
  System.out.println("Done loading Level 2 ...");
  
  //Level 3
  player3 = loadImage(player3File);
  player3.resize(level3Grid.getTileWidth(),level3Grid.getTileHeight());
  enemy3 = loadImage(enemyFile3);
  enemy3.resize(level3Grid.getTileWidth(),level3Grid.getTileHeight());
  System.out.println("Done loading Level 3 ...");
  
  //SETUP: Sound
  //song = new SoundFile(this, "AM.mp3");
  //song.play();
  
  println("Game started...");

} //end setup()


//Required Processing method that automatically loops
//(Anything drawn on the screen should be called from here)
void draw() {

  updateTitleBar();

  //simple timing handling
  if (msElapsed % 300 == 0) {
    //sprite handling
    populateSprites();
    moveSprites();
  }

  updateScreen();

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



  } else if (currentScreen == level2Grid){

  //set [W] key to move the player1 down
    if(key == 'w'){
      //player2.move(0,-10);
    } else if (key == 's'){
      //player2.move(0,10);
    } else if (key == 'a'){
      //player2.move(-10,0);
    } else if (key == 'd'){
      //player2.move(10,0);
    }


  }

  //CHANGING SCREENS BASED ON KEYS
  //change to level1 if 1 key pressed, level2 if 2 key is pressed
  if(key == 's'){
    currentScreen = splashScreen;
  } else if(key == '1'){
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
    surface.setTitle(titleText + " " + extraText + " " );

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
      System.out.println("\nButton Clicked");
      currentScreen = level2Grid;
    }
  }
  
  //UPDATE: level2Grid Screen
  if(currentScreen == level2Grid){
    System.out.print("2");
    currentGrid = level2Grid;

    //Display the Player2 image
    GridLocation player2Loc = new GridLocation(player2Row,0);
    level2Grid.setTileImage(player2Loc, player2);
    
    //update other screen elements
    level2Grid.showGridImages();
    level2Grid.showGridSprites();
    level2Grid.showWorldSprites();

    //move to next level based on a button click

    b2.show();
    if(b2.isClicked()){
      System.out.println("\nButton Clicked");
      currentScreen = level3Grid;
    }
  }

    //UPDATE: level3Grid Screen
    if(currentScreen == level3Grid){
    System.out.print("3");
    currentGrid = level3Grid;

    //Display the Player2 image
    GridLocation player3Loc = new GridLocation(player3Row,0);
    level3Grid.setTileImage(player3Loc, player3);
    
    //update other screen elements
    level3Grid.showGridImages();
    level3Grid.showGridSprites();
    level3Grid.showWorldSprites();

    //move to next level based on a button click
    b3.show();
    if(b3.isClicked()){
      System.out.println("\nButton Clicked");
      currentScreen = endScreen;
    }
  }
  
  //UPDATE: End Screen
  if(currentScreen == endScreen){
    System.out.print("You Won!");
  }
}

//Method to populate enemies or other sprites on the screen
public void populateSprites(){

  if(currentScreen == level1Grid){
    //What is the index for the last column?
    int lastCol = level1Grid.getNumCols() -1; 

    //Loop through all the rows in the last column
    for(int r=0; r<level1Grid.getNumRows(); r++){

      GridLocation loc = new GridLocation(r, lastCol);

      //Generate a random number
      double rando = Math.random();

      //10% of the time, decide to add an enemy image to a Tile
      if(rando < 0.1){
        level1Grid.setTileImage(loc, enemy);
        System.out.println("Adding bomb to " + loc);
      }
    }
  }

  if(currentScreen == level2Grid){
    //What is the index for the last column?
    int lastCol2 = level2Grid.getNumCols() -1; 

    //Loop through all the rows in the last column
    for(int r=0; r<level2Grid.getNumRows(); r++){

      GridLocation loc2 = new GridLocation(r, lastCol2);

      //Generate a random number
      double rando2 = Math.random();

      //10% of the time, decide to add an enemy image to a Tile
      if(rando2 < 0.1){
        level2Grid.setTileImage(loc2, enemy2);
        System.out.println("Adding Wither to " + loc2);
      }
    }
  }

    if(currentScreen == level3Grid){

    //What is the index for the last column?
    int lastCol3 = level3Grid.getNumCols() -1; 

    //Loop through all the rows in the last column
    for(int r=0; r<level3Grid.getNumRows(); r++){

      GridLocation loc3 = new GridLocation(r, lastCol3);

      //Generate a random number
      double rando3 = Math.random();

      //10% of the time, decide to add an enemy image to a Tile
      if(rando3 < 0.1){
        level3Grid.setTileImage(loc3, enemy3);
        System.out.println("Adding Enderman to " + loc3);
      }
    }
  }
}

//Method to move around the enemies/sprites on the screen
public void moveSprites(){

//Loop through all of the rows & cols in the grid
for(int r=0; r<level1Grid.getNumRows(); r++){
  for(int c=0; c<level1Grid.getNumCols(); c++){

    GridLocation loc = new GridLocation(r,c);

    //check for enemy bomb at the loc
    if(level1Grid.getTileImage(loc) == enemy ){

      //erase bomb from current loc
      level1Grid.clearTileImage(loc);
      
      //only move if it's a legal col
      if( c >= 1){
        //add bomb to loc to left
        GridLocation leftLoc = new GridLocation(r, c-1);
        level1Grid.setTileImage(leftLoc, enemy);
        System.out.println("moving Creeper");
        }
      }
    }
  }

//Loop through all of the rows & cols in the grid
for(int r=0; r<level2Grid.getNumRows(); r++){
  for(int c=0; c<level2Grid.getNumCols(); c++){

    GridLocation loc2 = new GridLocation(r,c);

    //check for enemy bomb at the loc
    if(level2Grid.getTileImage(loc2) == enemy2 ){

      //erase bomb from current loc
      level2Grid.clearTileImage(loc2);
      
      //only move if it's a legal col
      if( c >= 1){
        //add bomb to loc to left
        GridLocation leftLoc2 = new GridLocation(r, c-1);
        level2Grid.setTileImage(leftLoc2, enemy2);
        System.out.println("moving Wither");
        }
      }
    }
  }

//Loop through all of the rows & cols in the grid
for(int r=0; r<level3Grid.getNumRows(); r++){
  for(int c=0; c<level3Grid.getNumCols(); c++){

    GridLocation loc3 = new GridLocation(r,c);

    //check for enemy bomb at the loc
    if(level3Grid.getTileImage(loc3) == enemy3 ){

      //erase bomb from current loc
      level3Grid.clearTileImage(loc3);
      
      //only move if it's a legal col
      if( c >= 1){
        //add bomb to loc to left
        GridLocation leftLoc3 = new GridLocation(r, c-1);
        level3Grid.setTileImage(leftLoc3, enemy3);
        System.out.println("moving Enderman");
        }
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