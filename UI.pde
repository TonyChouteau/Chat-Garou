
class UI
{
  final int LOADING = -1;
  final int MENU = 0;
  final int SETTINGS = 1;
  final int IN_GAME = 2;

  PImage background;
  PFont titleFont;
  int size = displayHeight/10;

  float loadingAlpha;
  int menu;

  //==================
  // Constructor
  //==================
  
  public UI()
  {
    menu = -1;
    loadingAlpha = 0;

    loadRessources();
  }

  private void loadRessources()
  {
    background = loadImage("background.png");
    titleFont = createFont("beermoney.ttf", displayHeight/10);
    textFont(titleFont);
    while (textWidth("Werewolf Plus")>displayWidth-displayWidth/10)
    {
      size -= 10;
      titleFont = createFont("beermoney.ttf", size);
      textFont(titleFont);
    }
  }

  //==================
  // Main display
  //==================
  
  public void display()
  {
    image(background, 0, 0, displayWidth, displayHeight);
    
    if (menu != LOADING)
    {   
      textAlign(CENTER, TOP);
      textFont(titleFont);
      fill(0, 255);
      text("Werewolf Plus", displayWidth/2, size/3);
    }
    
    switch(menu)
    {
    case 0:
      displayMenu();
      checkTouchMenu();
      break;
    case 1:
      displaySettings();
      checkTouchSettings();
      break;
    case 2:
      displayGame();
      checkTouchGame();
      break;

    case -1:
      displayLoadingScreen();
      break;
    }
  }
  
  //==================
  // Menu
  //==================

  private void displayMenu()
  {
    textFont(titleFont);
    fill(0, 255);
    textAlign(CENTER, BOTTOM);
    text("Jouer", displayWidth/2, displayHeight-size-size*2/3);

    textAlign(CENTER, BOTTOM);
    text("Parametres", displayWidth/2, displayHeight-size/3);
  }
  
  private void checkTouchMenu()
  {
    //int x = Global.touchX;
    int y = Global.touchY;
    
    if (y >= displayHeight-size/3-size &&
        y <= displayHeight-size/3)
    {
      menu = SETTINGS;
      
      Global.touchY = -5;
      //Global.touchX = -5;
    }
    
    if (y >= displayHeight-size-size*2/3-size &&
        y <= displayHeight-size-size*2/3)
    {
      menu = IN_GAME;
      
      Global.touchY = -5;
      //Global.touchX = -5;
    }
  }

  //==================
  // Loading Screen
  //==================
  
  private void displayLoadingScreen()
  {
    textAlign(CENTER, CENTER);
    textFont(titleFont);
    fill(0, 0, 0, loadingAlpha++);
    text("Werewolf Plus", displayWidth/2, displayHeight/2);

    if (loadingAlpha >= 250)
    {
      loadingAlpha = 0;
      menu = MENU;
    } else
    {
      loadingAlpha+=5;
    }

    delay(50);
  }
  
  //==================
  // Settings
  //==================
  
  private void displaySettings()
  {
    textFont(titleFont);
    fill(0, 255);
    textAlign(CENTER, BOTTOM);
    text("Retour", displayWidth/2, displayHeight-size/3);
  }
  
  private void checkTouchSettings()
  {
    //int x = Global.touchX;
    int y = Global.touchY;
    
    if (y >= displayHeight-size/3-size &&
        y <= displayHeight-size/3)
    {
      menu = MENU;
      
      Global.touchY = -5;
      //Global.touchX = -5;
    }
  }
  
  //==================
  // Game
  //==================
  
  private void displayGame()
  {
    textFont(titleFont);
    fill(0, 255);
    textAlign(CENTER, BOTTOM);
    text("Retour", displayWidth/2, displayHeight-size/3);
  }
  
  private void checkTouchGame()
  {
    //int x = Global.touchX;
    int y = Global.touchY;
    
    if (y >= displayHeight-size/3-size &&
        y <= displayHeight-size/3)
    {
      menu = MENU;
      
      Global.touchY = -5;
      //Global.touchX = -5;
    }
  }
  
}
