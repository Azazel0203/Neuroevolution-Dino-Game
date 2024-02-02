/**
 * Bird class represents the birds in the game.
 */
class Bird {
  // Dimensions of the bird
  float w = 60;
  float h = 50;
  
  // Bird position
  float posX;
  float posY;
  
  // Counter for bird flapping animation
  int flapCount = 0;
  
  // Type of bird (0: flying low, 1: flying middle, 2: flying high)
  int typeOfBird;

  //------------------------------------------------------------------------------------
  // Constructor for Bird class
  Bird(int type) {
    posX = width;
    typeOfBird = type;
    // Set initial Y position based on bird type
    switch(type) {
      case 0:
        posY = 10 + h/2; // flying low
        break;
      case 1:
        posY = 100;      // flying middle
        break;
      case 2:
        posY = 180;      // flying high
        break;
    }
  }

  //------------------------------------------------------------------------------------
  // Display the bird
  void show() {
    flapCount++;
    // Flap the bird based on the flapCount
    if (flapCount < 0) {
      image(bird, posX - bird.width/2, height - groundHeight - (posY + bird.height - 20));
    } else {
      image(bird1, posX - bird1.width/2, height - groundHeight - (posY + bird1.height - 20));
    }
    // Reset flapCount to create a flapping animation
    if (flapCount > 15) {
      flapCount = -15;
    }
  }

  //------------------------------------------------------------------------------------
  // Move the bird
  void move(float speed) {
    posX -= speed;
  }

  //------------------------------------------------------------------------------------
  // Check if the bird collides with the player
  boolean collided(float playerX, float playerY, float playerWidth, float playerHeight) {
    float playerLeft = playerX - playerWidth/2;
    float playerRight = playerX + playerWidth/2;
    float thisLeft = posX - w/2;
    float thisRight = posX + w/2;

    if ((playerLeft <= thisRight && playerRight >= thisLeft) || (thisLeft <= playerRight && thisRight >= playerLeft)) {
      float playerUp = playerY + playerHeight/2;
      float playerDown = playerY - playerHeight/2;
      float thisUp = posY + h/2;
      float thisDown = posY - h/2;
      // Check if the player and bird overlap in the Y-axis
      if (playerDown <= thisUp && playerUp >= thisDown) {
        return true; // Collision occurred
      }
    }
    return false; // No collision
  }
}
