//The rate at which things spawn and fall, 5 at a time, it is the maximum number of things that fall
int spawnrate = 5;

//variable to increase speed but not length in the event
//the falling blocks eat the food
int speedup = 0;

class fallOb
{
  PVector position;
  int accel;
  boolean powerup;
  int behaviour;
}

// FULL FALL SETUP //

fallOb falling[] = new fallOb[spawnrate];

void setupFall()
{
  //Initialising all the falling stuff and then randomises their position
  for (int i = 0; i < spawnrate; i++)
  {
    falling[i] = new fallOb();
    falling[i].position = new PVector(sqrsize, sqrsize);
    falling[i].accel = sqrsize;
    randomiseFall(i);
  }
}

//Randomises their falling poisitions
void randomiseFall(int i)
{

  //This do while is to ensure that the randomised position is within the grid of snake
  do {
    falling[i].position.x = (int)random(0, width-sqrsize);
    falling[i].position.y = sqrsize - ((i + 1) * sqrsize);
    //Decided if this particular object is a power up based on rarity // RARITY IS IN THE POWER UP TAB //
    if ( (random(0, rarity) < 2) )
    {
      falling[i].powerup = true;
    } else
    {
      falling[i].powerup = false;
    }

    falling[i].behaviour = (int)random(0, 4);
  }
  while (falling[i].position.x % sqrsize != 0);
}

//Drawing falling objects
void drawFall()
{

  //Draws each object, and depending on if it's a powerup or not, decides if the colour is black or white
  for (int i = 0; i < spawnrate; i++)
  {
    if (falling[i].powerup == true)
    { 
      fill(255);
    } else
    {
      fill(0);
    }
    rect(falling[i].position.x, falling[i].position.y, sqrsize, sqrsize);
  }
}

//Increments their y by the size of a square and then if it's greater than the height, re randomises it
void moveFall()
{
  for (int i = 0; i < spawnrate; i++)
  {
    //This is to ensure snake behaviour doesn't change until you hit a certain length
    if (snake.len > 8)
    {
      if (falling[i].behaviour == 1)
      {
        //Moves backwards sometimes
        if (frameCount%7 == 0)
        {
          falling[i].position.y = (falling[i].position.y) - (sqrsize * 2);
        }
      }
      if (falling[i].behaviour == 2)
      {
        //Moves left sometimes
        if (frameCount%10 == 0)
        {
          falling[i].position.x = falling[i].position.x - (sqrsize);
        }
      }
      //Moves twice as fast
      if (falling[i].behaviour == 3)
      {
        if (frameCount%2 == 0)
        {
          falling[i].position.y += falling[i].accel;
        }
      }
    }
    falling[i].position.y += falling[i].accel;

    if (falling[i].position.y > height)
    {
      randomiseFall(i);
    }
  }
}









