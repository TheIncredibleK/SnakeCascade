//the game object class (just food)
class gameOb
{
  PVector position;
  int accel;
}

//Initialises the food object, the image
gameOb food = new gameOb();
PImage foodimage;

void setupfood()
{
  //Initialises variables
  food.position = new PVector(sqrsize, sqrsize);
  //THIS VARIABLE IS DEFINITELY NEVER USED :D
  food.accel = 0;
  //calls a function to randomise x and y values of food
  randomise();
  foodimage = loadImage("FoodImage.png");

}

//Draws the food
void drawFood()
{
  //The fill colour of the square that is acting as a hitbox is the background colour, same with stroke
  fill(125);
  //stroke(115, 216, 129);
  
  //Draws the food and the hitbox
  rect(food.position.x, food.position.y, sqrsize, sqrsize);
  println(food.position.x, food.position.y);
  //image(foodimage, food.position.x, food.position.y);
   println(food.position.x, food.position.y);
}

//randomises the position of the food
void randomise()
{
  
  //These do while loops continue to kep the food within the grid 
  do
  {
    food.position.x = (int)random(0,width-sqrsize);
  }while(food.position.x % sqrsize != 0);
  do
  {
    food.position.y = (int)random(sqrsize * 4, height-sqrsize);
  }while(food.position.y % sqrsize != 0);
  
  //Ensures that the food does not spawn on the snake
  for(int i = 0; i < snake.len; i++)
  {
    if(food.position.x == xPos[i])
    {
      if(food.position.y == yPos[i])
      {
        randomise();
      }
    }
  }
}
