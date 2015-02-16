//Ran when keys are pressed
void keyPressed()
{
  
  // MENU CONTROLS //
  
  if(key == 'a' || key == 'd')
  {
    if(gameOver == true)
    {
      toggle = !toggle;
    }
  }
  if(keyCode == ENTER)
  {
    if(opening == true)
    {
      //Turns off the splash screens
      splashScreen = false;
      opening = false;
      //Plays music
      playSound();
      //Recalls setup to start drawing stuff
      setup();
    } 
    //If you choose exit
    if((toggle == false) && gameOver == true)
    {
      closeSound();
      writeToFile();
    }
    //If you choose to continue, Bare in mind you are not allowed
    else if((toggle == true) && (gameOver == true))
    {
      for (int i = 0; i < spawnrate; i++)
      {   
          randomiseFall(i);
      }
      for(int i = 0; i < snake.len; i++)
      {
        xPos[i] = -20;
        yPos[i] = -20;
      }
      snake.len = 3;
      score = 0;
      inc = 1;
      speedup = 0;
      oldKey = ' ';
      snake.position.x = sqrsize;
      snake.position.y = sqrsize;
      setUpSound();
      randomise();
      gameOver = false;
      splashScreen = false;
      
      
      
    }
  }


  
  
  
  //Ensures this only happens when gameOver isn't true
  if (gameOver == false && moveCount == true)
  {
    //Checks if key d or s is pressed, if so then aceeleration rate is
    //One square
    if ((oldKey != 'a') )
    {
      if ( key == 'd')
      {
        oldKey = key;
        snake.accel = sqrsize;
      }
    }
    if (oldKey != 'w')
    {
      if (key == 's')
      {
        oldKey = key;
        snake.accel = sqrsize;
      }
    }
    //Checks if w or a was presed, if so acceleration rate is
    //-One square
    if (oldKey != 's')
    {
      if (key == 'w')
      {
        oldKey = key;
        snake.accel = -sqrsize;
      }
    }
    if (oldKey != 'd')
    {
      if ( key == 'a')
      {
        oldKey = key;
        snake.accel = -sqrsize;
      }
    }
    moveCount = false;
  }
}


