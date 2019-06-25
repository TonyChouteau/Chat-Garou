
UI ui;

//==================
// Setup
//==================
  
void setup()
{
  size(displayWidth, displayHeight);
  orientation(PORTRAIT);
  
  ui = new UI();
}

//==================
// Main loop
//==================
  
void draw()
{
  ui.display();
} 

//==================
// Input Handler
//==================
  
void touchStarted() 
{
  Global.touchX = mouseX;
  Global.touchY = mouseY;
}
