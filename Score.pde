//Creates a file writer and reader, as well as astring to read the score, the score of the current player, and the high score saved
PrintWriter scoreWrite;
BufferedReader scoreReader;
String line;
int score;
int oldHighScore;
boolean once = false;


//Draws the score on the screen that you got
void drawScore()
{
  fill(255);
  textSize(10);
  text("Score: " + score, sqrsize + 10, sqrsize/2);
}

void setUpScore()
{
  //Sets up the reader and reads from the file, then the writer and writes to the file
  scoreReader = createReader("score.txt");
  readTheLine();
}
//This function checks if the current players score is greater than the high score and if so replaces, if it isn't, then it just puts the old high score back
void writeToFile()
{
    scoreWrite = createWriter("score.txt");
    println(oldHighScore, score);
    if(oldHighScore >= score)
    {
      scoreWrite.print(oldHighScore);
    }
    if(oldHighScore < score)
    {
      //tempScore = Integer.toString(score);
     scoreWrite.print(score);
    }
    endGame();
  
  
}

//Closes the files and then ends the game
void endGame()
{
    scoreWrite.flush();
    scoreWrite.close();
    exit();

}

//Reads in the high score into string and converts to int
void readTheLine()
{
  try
  {
    line = scoreReader.readLine();
    //println(scores[0]);
   // println(line);
  }
  catch (IOException e)
  {
    e.printStackTrace();
    line = null;
  }
  
  if(line != null)
  {
    oldHighScore = parseInt(line);
  //  println(oldHighScore, line);
  }
    
}
