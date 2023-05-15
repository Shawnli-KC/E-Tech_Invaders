/* autogenerated by Processing revision 1286 on 2023-05-15 */
import processing.core.*;
import processing.data.*;
import processing.event.*;
import processing.opengl.*;

import java.util.HashMap;
import java.util.ArrayList;
import java.io.File;
import java.io.BufferedReader;
import java.io.PrintWriter;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.IOException;

public class Game extends PApplet {

/* Game Class Starter File
 * Last Edit: 12/13/2022
 * Authors: _____________________
 */

//GAME VARIABLES
Grid grid = new Grid(6,8);
PImage bg;
PImage player1;
PImage endScreen;
String titleText = "HorseChess";
String extraText = "Who's Turn?";
AnimatedSprite exampleSprite;
boolean doAnimation;


//Required Processing method that gets run once
 public void setup() {

  //Match the screen size to the background image size
  /* size commented out by preprocessor */;

  //Set the title on the title bar
  surface.setTitle(titleText);

  //Load images used
  bg = loadImage("images/chess.jpg");
  player1 = loadImage("images/x_wood.png");
  player1.resize(100,100);
  endScreen = loadImage("images/youwin.png");
  
  //Animation & Sprite setup
  exampleAnimationSetup();


  println("Game started...");

  //fullScreen();   //only use if not using a specfic bg image
}

//Required Processing method that automatically loops
//(Anything drawn on the screen should be called from here)
 public void draw() {

  updateTitleBar();
  
  updateScreen();

  populateSprites();
  moveSprites();

  checkExampleAnimation();
  
  if(isGameOver()){
    endGame();
  }

}


//Known Processing method that automatically will run when a mouse click triggers it
 public void mouseClicked(){
  
  //check if click was successful
  System.out.println("Mouse was clicked at (" + mouseX + "," + mouseY + ")");
  System.out.println("Grid location: " + grid.getGridLocation());

  //what to do if clicked?
  doAnimation = !doAnimation;
  System.out.println("doAnimation: " + doAnimation);
  grid.setMark("X",grid.getGridLocation());
  
}

//Known Processing method that automatically will run whenever a key is pressed
 public void keyPressed(){

  //check what key was pressed
  System.out.println("Key pressed: " + key); //keyCode gives you an integer for the key

  //What to do when a key is pressed

  

}



//------------------ CUSTOM  METHODS --------------------//

//method to update the Title Bar of the Game
public void updateTitleBar(){

  if(!isGameOver()) {

    //set the title each loop
    surface.setTitle(titleText + "    " + extraText);

    //adjust the extra text as desired
    

  }

}

//method to update what is drawn on the screen each frame
public void updateScreen(){

  //update the background
  background(bg);
  
  //update other screen elements
  image(player1,100,100); //draws the player1 image at coordinates 100,100


}

//Method to populate enemies or other sprites on the screen
public void populateSprites(){

}

//Method to move around the enemies/sprites on the screen
public void moveSprites(){


}

//Method to handle the collisions between Sprites on the Screen
public void handleCollisions(){


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
    image(endScreen, 100,100);

}

//example method that creates 5 horses along the screen
public void exampleAnimationSetup(){  
  int i = 2;
  exampleSprite = new AnimatedSprite("sprites/horse_run.png", 50.0f, i*75.0f, "sprites/horse_run.json");
}

//example method that animates the horse Sprites
public void checkExampleAnimation(){
  if(doAnimation){
    exampleSprite.animateVertical(1.0f, 0.1f, true);
  }
}
// Revised from Daniel Shiffman's p5js Animated Sprite tutorial
// Expects .json spritesheet from TexturePack software

// https://editor.p5js.org/codingtrain/sketches/vhnFx1mml
// http://youtube.com/thecodingtrain
// https://thecodingtrain.com/CodingChallenges/111-animated-sprite.html

// Example Horse Spritesheet from
// https://opengameart.org/content/2d-platformer-art-assets-from-horse-of-spring

// Example Animated Sprite
// https://youtu.be/3noMeuufLZY

public class AnimatedSprite extends Sprite{
  
    private ArrayList<PImage> animation;
    private int w;
    private int h;
    private int len;
    private int index;

    JSONObject spriteData;
    PImage spriteSheet;

  // Constructor for AnimatedSprite with Spritesheet (Must use the TexturePacker to make the JSON)
  // https://www.codeandweb.com/texturepacker
  public AnimatedSprite(String png, float x, float y, String json) {
    super("none", x, y, 1.0f, true);

    this.animation = new ArrayList<PImage>();
 
    spriteData = loadJSONObject(json);
    spriteSheet = loadImage(png);
    JSONArray frames = spriteData.getJSONArray("frames");
    
    for(int i=0; i<frames.size(); i++){

      JSONObject frame = frames.getJSONObject(i);
      //System.out.println(i + ": " + frame + "\n");
      JSONObject fr = frame.getJSONObject("frame");
      //System.out.println("ss: " + fr + "\n");

      int sX = fr.getInt("x");
      int sY = fr.getInt("y");
      int sW = fr.getInt("w");
      int sH = fr.getInt("h");
      System.out.println(i + ":\t sX:" + sX + ":\t sY:" + sY + ":\t sW:" + sW + ":\t sH:" + sH);
      PImage img = spriteSheet.get(sX, sY, sW, sH);
      animation.add(img);

      this.w = this.animation.get(0).width;
      this.h = this.animation.get(0).height;
      this.len = this.animation.size();
      this.index = 0;
    }
  }


  //Overriden method: Displays the correct frame of the Sprite image on the screen
  public void show() {
    int index = (int) Math.floor(Math.abs(this.index)) % this.len;
    image(animation.get(index), super.getX(), super.getY());
    //System.out.println("Pos: "+ super.getX() +"," + super.getY());
  } 

  //Method to cycle through the images of the animated sprite
  public void animate(float animationSpeed){
    index += (int) (animationSpeed * 10);
    show();
  }

  //animated method that makes the Sprite move to the right-left
  public void animateHorizontal(float horizontalSpeed, float animationSpeed, boolean wraparound) {

    //adjust speed & frames
    animate(animationSpeed);
    super.move( (int) (horizontalSpeed * 10), 0 );
  
    //wraparound sprite if goes off the right or left
    if(wraparound){
      wraparoundHorizontal();
    }

  }

  //animated method that makes the Sprite move down-up
  public void animateVertical(float verticalSpeed, float animationSpeed, boolean wraparound) {

    //adjust speed & frames
    animate(animationSpeed);
    super.move( 0, (int) (verticalSpeed * 10));
  
    //wraparound sprite if goes off the bottom or top
    if(wraparound){
      wraparoundVertical();
    }

  }


  //wraparound sprite if goes off the right-left
  private void wraparoundHorizontal(){
    if ( super.getX() > width ) {
      super.setX( -this.w );
    } else if ( super.getX() < -width ){
      super.setX( width );
    }
  }

  //wraparound sprite if goes off the top-bottom
  private void wraparoundVertical(){
    if ( super.getY() > height ) {
      super.setY( -this.h );
    } else if ( super.getY() < -height ){
      super.setY( height );
    }

  }



}


public class Grid{
  
  private int rows;
  private int cols;
  private GridTile[][] board;
  

  //Grid constructor that will create a Grid with the specified number of rows and cols
  public Grid(int rows, int cols){
    this.rows = rows;
    this.cols = cols;
    board = new GridTile[rows][cols];
    
    for(int r=0; r<rows; r++){
      for(int c=0; c<cols; c++){
         board[r][c] = new GridTile();
      }
    }
  }

  // Default Grid constructor that creates a 3x3 Grid  
  public Grid(){
     this(3,3);
  }

  // Method that Assigns a String mark to a location in the Grid.  
  // This mark is not necessarily visible, but can help in tracking
  // what you want recorded at each GridLocation.
  public void setMark(String mark, GridLocation loc){
    board[loc.getR()][loc.getC()].setNewMark(mark);
    printGrid();
  } 

  // Method that Assigns a String mark to a location in the Grid.  
  // This mark is not necessarily visible, but can help in tracking
  // what you want recorded at each GridLocation.  
  // Returns true if mark is correctly set (no previous mark) or false if not
  public boolean setNewMark(String mark, GridLocation loc){
    int row = loc.getR();
    int col = loc.getC();
    boolean isGoodClick = board[row][col].setNewMark(mark);
    printGrid();
    return isGoodClick;
  } 
  
  //Method that prints out the marks in the Grid to the console
  public void printGrid(){
   
    for(int r = 0; r<rows; r++){
      for(int c = 0; c<cols; c++){
         System.out.print(board[r][c]);
      }
      System.out.println();
    } 
  }
  
  //Method that returns the GridLocation of where the mouse is currently hovering over
  public GridLocation getGridLocation(){
      
    int row = mouseY/(pixelHeight/this.rows);
    int col = mouseX/(pixelWidth/this.cols);

    return new GridLocation(row, col);
  } 

  //Accessor method that provide the x-pixel value given a GridLocation loc
  public int getX(GridLocation loc){
    
    int widthOfOneTile = pixelWidth/this.cols;
 
    //calculate the center of the grid GridLocation
    int pixelX = (widthOfOneTile/2) + (widthOfOneTile * loc.getC()); 
    
    return pixelX;
  } 
  
  //Accessor method that provide the y-pixel value given a GridLocation loc
  public int getY(GridLocation loc){
    
    int heightOfOneTile = pixelHeight/this.rows;
 
    //calculate the center of the grid GridLocation
    int pixelY = (heightOfOneTile/2) + (heightOfOneTile * loc.getR()); 
    
    return pixelY;
  } 
  
  //Accessor method that returns the number of rows in the Grid
  public int getRows(){
    return rows;
  }
  
  //Accessor method that returns the number of cols in the Grid
  public int getCols(){
    return cols;
  }

  //Returns the GridTile object stored at a specified GridLocation
  public GridTile getTile(GridLocation loc){
    return board[loc.getR()][loc.getC()];
  }

  //Returns the GridTile object stored at a specified row and column
  public GridTile getTile(int r, int c){
    return board[r][c];
  }
  
}
public class GridLocation{
 
  int row;
  int col;
  
  public GridLocation(int row, int col){
    this.row = row;
    this.col = col;
  }
  
  public int getR(){
    return row;
  }
  
  public int getC(){
    return col;
  }
  
  public String toString(){
    return row + "," + col;
  }
  
}
public class GridTile{
  
  private PImage pi;
  private String mark;
  final private static String noMark = " ";

  //Default GridTile constructor which puts an empty String mark in the GridTile
  public GridTile(){
    this(noMark);
  }

  //GridTile constructor which adds the specified String mark
  public GridTile(String mark){
    this.mark = mark;

  }
  
  // Accessor method that gets the mark in the GridTile
  public String getMark(){
    return mark;
  }
  
  // Mutator method that automatically changes the mark
  public void setMark(String mark){
    this.mark = mark;
  }

  // Mutator method sets a new mark in the GridTile 
  // if it does not already have a mark, 
  // returns true or false if successful
  public boolean setNewMark(String mark){
    if(this.mark.equals(noMark)){
      this.mark = mark;
      System.out.println("Successfully changed mark");
      return true;
    } else {
      System.out.println("That GridTile is already taken!");
      return false;
    }
  }
  
  // Mutator method that sets an new PImage in the GridTile
  public void setImage(PImage pi){
    this.pi = pi;
  }

  //Accessor method that returns the PImage stored in the GridTile
  public PImage getImage(){
    return pi;
  }
  
  public String toString(){
    return mark;
  }


}
public class Platform {//extends Sprite {

	//Platform defined by it's center-x and top-Y positions
	public Platform(float posXCenter, float posYTop, float platWidth, float platHeight, int clr) {

		//pass along the center-x and center-y to Sprite super
		//super(posXCenter, posYTop + (platHeight/2), clr);
		//System.out.println("PlatTopY: " + posYTop + "\tPlatCenterY: " + (posYTop + (platHeight/2)));
		// setWidth(platWidth);
		// setHeight(platHeight);
		//setColor(Color.black);
	}

	public Platform(float posXCenter, float posYTop, float platWidth, float platHeight) {
		//pass along the center-x and center-y to Sprite super
		this(posXCenter, posYTop, platWidth, platHeight, color(0,0,0));
	}

}
// Inspired by Daniel Shiffman's p5js Animated Sprite tutorial

public class Sprite {
  
    PImage spriteImg;
    private float center_x;
    private float center_y;
    private float speed_x;
    private float speed_y;
    private float w;
    private float h;
    private boolean isAnimated;


  // Main Constructor
  public Sprite(String spriteImgPath, float scale, float x, float y, boolean isAnimated) {
    this.center_x = x;
    this.center_y = y;
    this.speed_x = 0;
    this.speed_y = 0;
    this.isAnimated = isAnimated;
    if(!isAnimated){
      this.spriteImg = loadImage(spriteImgPath);
      w = spriteImg.width * scale;
      h = spriteImg.height * scale;
    }
  }

  // Simpler Constructor for Non-Animated Sprite
  public Sprite(String spriteImg, float x, float y) {
    this(spriteImg, 1.0f, x, y, false);
  }


  // method to display the Sprite image on the screen
  public void show() {
      image(spriteImg, this.center_x, this.center_y, w, h);
  }

  // method to move Sprite image on the screen to a specific coordinate
  public void moveTo(float x, float y){
    this.center_x = x;
    this.center_y = y;
  }

  // method to move Sprite image on the screen relative to current position
  public void move(float change_x, float change_y){
    this.center_x += change_x;
    this.center_y += change_y;
  }

  // method that automatically moves the Sprite based on its velocity
  public void update(){
    move(speed_x, speed_y);
  }


  // method to rotate Sprite image on the screen
  public void rotate(float degrees){

  }


  /*-- ACCESSOR METHODS --*/
  public float getX(){
    return center_x;
  }
  public float getY(){
    return center_y;
  }
  public PImage getImg(){
    return spriteImg;
  }
  public boolean getIsAnimated(){
    return isAnimated;
  }
  
  
  /*-- MUTATOR METHODS --*/
  public void setX(float x){
    this.center_x = x;
  }
  public void setY(float y){
    this.center_y=y;
  }
  public void setImg(PImage img){
    this.spriteImg = img;
  }
  public void setIsAnimated(boolean a){
    isAnimated = a;
  }


  /*-- SPRITE BOUNDARY METHODS --
    -- Used from Long Bao Nguyen
    -- https://longbaonguyen.github.io/courses/platformer/platformer.html
  */
   public void setLeft(float left){
    center_x = left + w/2;
  }
   public float getLeft(){
    return center_x - w/2;
  }
   public void setRight(float right){
    center_x = right - w/2;
  }
   public float getRight(){
    return center_x + w/2;
  }
   public void setTop(float top){
    center_y = top + h/2;
  }
   public float getTop(){
    return center_y - h/2;
  }
   public void setBottom(float bottom){
    center_y = bottom - h/2;
  }
   public float getBottom(){
    return center_y + h/2;
  }
  

}


  public void settings() { size(800, 600); }

  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "Game" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
