//Creates an audioplayer
AudioPlayer player;
Minim minim;

//Self explanatory
void setUpSound()
{
  minim = new Minim(this);
  player = minim.loadFile("PewPewPew.mp3");
}

//Plays the song and rewinds if it is over
void playSound()
{
  player.play();
  if(player.isPlaying() == false)
  {
    player.rewind();
  }
}
//Turns off and closes the sound player
void closeSound()
{
  player.close();
  minim.stop();
  
}
