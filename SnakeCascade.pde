//Integer that controls the size of the square
int sqrsize;
//Boolean variable to control game over
boolean gameOver = false;
//boolean variable to control splash screens
boolean splashScreen = true;
//Opening boolean Variable
boolean opening = true;
//This controls the speed without controlling the size of the snake
int inc = 1;
//FIXES BUG// The bug involved moving in on yourself
boolean moveCount = true;

//Importing the minim library
import ddf.minim.*;

void setup()
{
  size(500, 500);
  
  //Setting the size of the squares
  sqrsize = 20;
  //This if controls the first splash screen, these don't run if the title screen is on
  //Then set up is called again to begin the game
  if( splashScreen == false)
  {
    //Sets up the falling objects
    setupFall();
  //Sets up the snake
  setupsnake();
  //Calls a setup for the food
  setupfood();
  }


  //Setting the stroke to the background colour
    stroke(115, 216, 129);
    //Sets up the splash screens and the song
    setupScreens();
    setUpSound();
   
}

void draw()
{
  //Background colour
  background(115, 216, 129);
  //Setting the speed of the game
  snake.speed = (snake.len + speedup) + inc;
  
  //If the splash screens are not being called and you haven't died
  if ( gameOver == false && splashScreen == false)
  {
    //Controls the speed of the snake based on it's length and what food was eaten by you and other falling bricks
    frameRate(snake.speed);

    
    if(splashScreen == false)
    {
      
      // ** TEST OUT CORRECT ORDER PLEASE ** //
      
      testTouchFalling();
      
      moveSnake();
      testTouchSelf();
      testTouchWall();
     // testTouchFalling();
     // testGameOver();
      drawSnake();
      testFood();
      drawFood();
      drawScore();
      testTouchFalling();
     // testTouchSelf();  
      testGameOver();
      //This is so initial score = 0
      score = snake.len + inc - 4;
    }

    //If you have eaten food and your power up is not the slow down power up
    if ( snake.len > 3 && slow == false)
    {
      drawFall();
      moveFall();
    }
    //If you have eaten food and you have eaten the slow down power up
    else if( snake.len > 3 && slow == true)
    {
      
      //Increases a count, and for 60 frames, everything but you is half speed
      count++;
      drawFall();
      if(frameCount % 2 == 0)
      {
        moveFall();
      }
      
      if(count == 60)
      {
        count = 0;
        slow = false;
      }
    }
  }
  //If a splash screen is called, call a function to determine which one is called
  if(splashScreen == true)
  {
    whichScreen();
  }
}
  

