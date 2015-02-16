//Images for the screens and the boolean to control which option you are choosing on the game over screen
PImage title;
PImage over;
PImage select;
boolean toggle = true;
PImage controls;

//Function to set up the splash screens screens
void setupScreens()
{
  title = loadImage("Title.png");
  over = loadImage("GameOver.png");
  select = loadImage("Selector.png");
  controls = loadImage("WASD.png");
}

//Gets which screen is being used right now
void whichScreen()
{
  if(opening == true)
  {
    openingScreen();
  }
  if( gameOver == true)
  {
    gameOverScreen();
  }
}

//The screen for the opening title screen of the game
void openingScreen()
{
  //Sets the frame rate so that the flashing Press Enter to Start is legible
  frameRate(10);
  //Drawing the title screen
  image(title, 0, 0);
  
  //Makes a flashing set of images that shows the controls and the way to play
  if(frameCount % 3 != 0 && frameCount % 6 != 0)
  {
    //  textSize(20);
      textAlign(CENTER, CENTER);
      fill(0);
      text("Enter to Start", width/2, height/2);
      image(controls, 0, height/2 + 20);
      fill(0);
      text("Power up with these guys", width-100, height-140);
      text("Avoid these guys", width-100, height-90);
      text("EAT THE FOOD", width-100, height-40);
      rect(width/2 + 20, height-100, sqrsize, sqrsize);
      fill(255);
      rect(width/2 + 20, height-150, sqrsize, sqrsize);
      fill(125);
      rect (width/2 + 20, height-50, sqrsize, sqrsize);
  } 
}

//Prints game over and  // ** PRINT SCORES ** //
void gameOverScreen()
{
  player.mute();
//  drawScore();
  frameRate(2);
  imageMode(CENTER);
  image(over, width/2, height/2);
  textSize(30);
  textAlign(CENTER);
  fill(0);
  text(score,(width/2) - 45, (height/2) + 123);
  text(oldHighScore, (width/2) + 200, (height/2) + 123);
  if(toggle == true)
  {
    image(select, 150, 300);
  }
  else
  {
    image(select, width - 140, 300);
    fill(0);
    textAlign(CENTER);
  }
}

//This prints a no message because joke
void printNo()
{

  textAlign(CENTER);
  fill(0);
    textSize(10);
    text("I'd rather you didn't", width/2, height - 50);
    
}






