//////////////////////////////////////////////////////////////////////////////////////////////////////////
// sample simple processing / processing.js file from Andy Johnson - CS 422 - Spring 2017

// one current issue is dealing with sounds between Processing and Processing.js
// without compiler directives its hard to easily comment in and out the two different versions

// the external sound library (Sketch / Import Library / Sound) will work in processing but not in processing.js
// uncomment these two lines to get audio in Processing
//import processing.sound.*;
//SoundFile beepSound;

// here is a processing.js solution from http://aaron-sherwood.com/processingjs/circleSound.html
// uncomment this line to get audio in Processing.js
//Audio beepSound = new Audio();

// also note the soundfile needs to be in the data folder for processing and outside that folder for Processing.js
// sounds are also a bit slowerer to start up in Processing.js


//https://processing.org/examples/multipleconstructors.html
//https://d30y9cdsu7xlg0.cloudfront.net/png/8159-200.png
//https://cdn1.iconfinder.com/data/icons/complete-medical-healthcare-icons-for-apps-and-web/128/thermometer-512.png
//https://cdn0.iconfinder.com/data/icons/travel-line-icons-vol-1/48/025-512.png
//https://cdn1.iconfinder.com/data/icons/material-core/20/check-circle-outline-512.png


// placeholder for future image
PImage img;
PImage toaster;
PImage homescreen;
PImage toast;
PImage modepage;
PImage temperature;
PImage time;
PImage cooking;
PImage check;
PImage thermometer;
PImage numpad;

int screen;
// some buttons
int[][] buttons = { {50, 100}, {50, 200}, {50, 300}};
int buttonX = 100;
int buttonY = 75;

//on button
float bx;
float by;

//preset picture array


int rad = 60;
int boxSize = 75;
int red=255;
int green=255;
int blue =255;
boolean overBox = false;
boolean locked = false;
float xOffset = 0.0;
float yOffset = 0.0;
int temp = 0;
int redTemp = 0;
int cookTime = 0;
String banana = "";
int[] numArr = new int[3];
int cookingTemperature = 0;
int cookingTime = 0;


// no buttons / mode currently selected
int selectedOne = -1;

int currentTime;

PFont f;
Text t1;
Text timer;
Text buttonText;
Text number;
Text timeSelected;
Text tempSelected;

boolean bDisplayMessage;
int startTime;
final int DISPLAY_DURATION = 5000; // 1 second

String cookMode = "";

//flags for stages
boolean on = false;
boolean menuHover = false;
boolean bakeHover = false;
boolean broilHover = false;
boolean toastHover = false;
boolean temperatureHover = false;
boolean checkHover = false;
boolean cookSetHover = false;
boolean zerohover = false;
boolean onehover = false;
boolean twohover = false;
boolean threehover = false;
boolean fourhover = false;
boolean fivehover = false;
boolean sixhover = false;
boolean sevenhover = false;
boolean eighthover = false;
boolean ninehover = false;

boolean menuClicked = false;
boolean bakeClicked = false;
boolean broilClicked = false;
boolean toastClicked = false;
boolean temperatureClicked = false;
boolean checkClicked = false;
boolean cookSet = false;


boolean zeroClicked = false;
boolean oneClicked = false;
boolean twoClicked = false;
boolean threeClicked = false;
boolean fourClicked = false;
boolean fiveClicked = false;
boolean sixClicked = false;
boolean sevenClicked = false;
boolean eightClicked = false;
boolean nineClicked = false;

/////////////////////////////////////////////////////

void loadSounds(){
  // beep soundfile shortened from http://soundbible.com/2158-Text-Message-Alert-5.html
  //Processing load sound
  //beepSound = new SoundFile(this, "bing.mp3");
  
  // processing.js load sound
  //beepSound.setAttribute("src","bing.mp3");
}

void playBeep() {
  // play audio in processing or processing.js
  //beepSound.play();
}

/////////////////////////////////////////////////////

void setup() {
  // set the canvas size
  size(1280, 800);
  
  width = 1280;
  height = 800;
  bx = width/2.0;
  by = height/2.0;
  ellipseMode(RADIUS);
  
  // grab an image to use later
  // as with sounds Processing likes files in the data directory, Processing.js outside that directory
  img = loadImage("toast.jpg", "jpg");
  toast = loadImage("toast.jpg", "jpg");
  toaster = loadImage("toaster.jpg", "jpg");
  homescreen = loadImage("homescreen.jpg","jpg");
  modepage = loadImage("modepage.jpg","jpg");
  temperature = loadImage("temperature.jpg","jpg");
  time = loadImage("time.jpg","jpg");
  cooking = loadImage("cooking.jpg","jpg");
  check = loadImage("check.png","png");
  thermometer = loadImage("thermometer.png","png");
  numpad = loadImage("numpad.png","png");
  
  img.loadPixels();
  toaster.loadPixels();
  toast.loadPixels();
  homescreen.loadPixels();
  modepage.loadPixels();
  temperature.loadPixels();
  time.loadPixels();
  cooking.loadPixels();
  check.loadPixels();
  thermometer.loadPixels();
  numpad.loadPixels();
  
  f = createFont("Arial",24,true);
  
  t1 = new Text(color(51),100,425,36,"hi");
  timer = new Text(color(51),100,425,36,str(floor(currentTime/1000)));
  number = new Text(color(255),(width/2)-30,200,50,str(temp));
  timeSelected = new Text(color(255),(width/2)-30,200,50,str(cookTime));
  tempSelected = new Text(color(255),(width/2)-30,200,50,"");
  
  loadSounds();
}

/////////////////////////////////////////////////////

void draw() {
  String timeString;
  
  background(toaster);
  
  //t1.display();
  //timer.display();
  //timer.message = str(floor(currentTime/1000));
  //ON BUTTON
  if (mouseX > bx-rad && mouseX < bx+rad && mouseY > by-rad && mouseY < by+rad) {
    //fill(red,green,blue);
    overBox = true;
    if (!locked) {
      //fill(red,green,blue);
    }
  } else {
    //fill(red,green,blue);
    overBox = false;
  }
  
  //draw the ON BUTTON
  ellipse(bx,by,rad, rad);
  fill(red,green,blue);
  
  if (bDisplayMessage)
  {
    on = true;
  }
  
  if (on) {
    background(homescreen);
    //display the home screen which is the preheat button and the carousel with the presets
    Button newButton = new Button(color(100),(width/2)-150,(height-160),300,80,"MENU");
    //newButton.display();
    
    Button newButton1 = new Button(color(40),(width/2)-150,60,300,80,"PREHEAT");
    //newButton1.display();
    
    //Image newImage1 = new Image(width/2, height/2, 100,100, "toast.jpg", "jpg");
    //img.resize(300, 300);
    //image(img, 300, 100);
    //newImage1.display();
    //image(toast, 300, 100);
    
    if ((mouseX > (newButton.xpos)) && (mouseX < (newButton.xpos) + (newButton.width)) 
        && (mouseY > (newButton.ypos)) && (mouseY < (newButton.ypos) +(newButton.height))) {
    //fill(red,green,blue);
    //overBox = true;
    newButton.c = (color(40));
    //newButton.display();
    menuHover = true;
    
    
    
  }

    
  }
  
  if (menuClicked) {
    background(modepage);
    
    Button bake = new Button(color(100),30,280,380,240,"BAKE");
    //bake.display();
    
    Button broil = new Button(color(100),300,280,380,240,"BROIL");
    //broil.display();
    
    Button toast = new Button(color(100),30,280,380,240,"TOAST");
    //toast.display();
    
    if (checkIfHover(bake)) {
      bakeHover = true;
    }
    if (checkIfHover(broil)) {
      broilHover = true;
    }
    if (checkIfHover(toast)) {
      toastHover = true;
    }
  }
  
  
  if (bakeClicked) {
    background(toaster);
    /*fill(redTemp,0,0);
    rect (17, 32, 1248, 710);
    check.resize(100, 100);
    thermometer.resize(500,500);
    image(thermometer, ((width/2)-250), (height/2)-175);
    image(check, width-200, height-200);
    Button checkMark = new Button (color(100),width-200,height-200,100,100,"check");
    temperatureHover = true;
    //Text number = new Text(color(80),200,200,50,str(temp));
    number.message = str(temp);
    number.display();
    
    if ((mouseX > (checkMark.xpos)) && (mouseX < (checkMark.xpos) + (checkMark.width)) 
        && (mouseY > (checkMark.ypos)) && (mouseY < (checkMark.ypos) +(checkMark.height))) {
          
    //fill(red,green,blue);
    //overBox = true;
    //bake.c = (color(40));
    //bake.display();
    //menuHover = true;
    checkHover = true;
  }*/
  drawNumberScreen();
  textSize(36);
  fill(255);
    text(cookingTemperature,width/2,150);
    text("degrees",width/2+100,150);
    Button checkMark = new Button (color(100),width-200,height-200,100,100,"check");
    if (checkIfHover(checkMark)) {
      checkHover = true;
      
    }
  }
  
  if (broilClicked) {
    //background(temperature);
  }
  
  if (toastClicked) {
    //background(temperature);
  }
  
  if (checkClicked) {
  
    //temperatureClicked = false;
    background(toaster);
    drawNumberScreen();
    
    textSize(36);
    fill(255);
    text(cookingTime,width/2,150);
    text("minutes",width/2+100,150);
    //fill(redTemp,0,0);
    //rect (17, 32, 1248, 710);
    //check.resize(100, 100);
    //image(check, width-200, height-200);
    //image(numpad, width/2, height/2);
    Button checkMark1 = new Button (color(0),width-200,height-200,100,100,"check");
    //temperatureHover = true;
    //Text number = new Text(color(80),200,200,50,str(temp));
    //timeSelected.message = str(cookTime);
    //timeSelected.display();
    
    
    if (checkIfHover(checkMark1)) {
      cookSetHover = true;
      
    }
    
    
 /*   if ((mouseX > (checkMark1.xpos)) && (mouseX < (checkMark1.xpos) + (checkMark1.width)) 
        && (mouseY > (checkMark1.ypos)) && (mouseY < (checkMark1.ypos) +(checkMark1.height))) {
          
    //fill(red,green,blue);
    //overBox = true;
    //bake.c = (color(40));
    //bake.display();
    //menuHover = true;
    cookSetHover = true;
  }*/
  }
  
  if (cookSet) {
    //checkClicked = false;
    background(cooking);
    Text first = new Text(color(255),(width)-100,200,50,str(cookingTemperature));
    first.display();
    
    Text second = new Text(color(255),(width)-100,400,50,str(cookingTime));
    second.display();
  }
  for (int i = 0; i <3; i++) {
    
    if(oneClicked) {
      numArr[i] = 1;
      oneClicked = false;
    }
    else if(twoClicked) {
      numArr[i] = 2;
      twoClicked = false;
    }
    else if(threeClicked) {
      numArr[i] = 3;
      threeClicked = false;
    }
    else if(fourClicked) {
      numArr[i] = 4;
      fourClicked = false;
    }
    else if(fiveClicked) {
      numArr[i] = 5;
      fiveClicked = false;
    }
    else if(sixClicked) {
      numArr[i] = 6;
      sixClicked = false;
    }
    else if(sevenClicked) {
      numArr[i] = 7;
      sevenClicked = false;
    }
    else if(eightClicked) {
      numArr[i] = 8;
      eightClicked = false;
    }
    else if(nineClicked) {
      numArr[i] = 9;
      nineClicked = false;
    }
    else if(zeroClicked) {
      numArr[i] = 10;
      zeroClicked = false;
    } 
  }
  currentTime = millis();
  
  cookingTemperature=0;
  for (int i = 0; i < 3; i++)
    cookingTemperature = 10 * cookingTemperature + numArr[i];
    
    println(cookingTemperature);
    
    cookingTime=0;
  for (int i = 0; i < 3; i++)
    cookingTime = 10 * cookingTime + numArr[i];
    
    println(cookingTime);
  

   /* 
  // draw some buttons
  fill(127,127,127);
  for (int loopCounter=0; loopCounter < buttons.length; loopCounter++)
    rect(buttons[loopCounter][0], buttons[loopCounter][1], buttonX, buttonY, 10);
    
  // draw the active button in a different color
  fill(127,127,0);
  if (selectedOne >= 0)
    rect(buttons[selectedOne][0], buttons[selectedOne][1], buttonX, buttonY, 10);
    
    
  // draw the state of the thing that the buttons control
  if (selectedOne == 0){
    fill(127,0,0);
    rect (300, 100, 300, 300);
  }
  
  if (selectedOne == 1){
    fill(0,127,0);
    ellipse(450,250,300,300);
  }
  
  if (selectedOne == 2){
    img.resize(300, 300);
    image(img, 300, 100);
  }
  */
}

boolean checkIfHover(Button button1) {
  if ((mouseX > (button1.xpos)) && (mouseX < (button1.xpos) + (button1.width)) 
        && (mouseY > (button1.ypos)) && (mouseY < (button1.ypos) +(button1.height))) {   
    return true;
  } 
  return false;
}

void drawNumberScreen () {
  check.resize(100, 100);
  image(check, width-200, height-200);
  image(numpad, (width/2)-250, (height/2)-200);
  Button checkMark = new Button (color(100),width-200,height-200,100,100,"check");
  Button[] numberPad = new Button[10];
 
  numberPad[0] = new Button (color(255), 495, 235,70,70,"0");  
  numberPad[1] = new Button (color(255), 605, 235,70,70,"0");
  numberPad[2] = new Button (color(255), 715, 235,70,70,"0");
  numberPad[3] = new Button (color(255), 495, 360,70,70,"0");
  numberPad[4] = new Button (color(255), 605, 360,70,70,"0");
  numberPad[5] = new Button (color(255), 715, 360,70,70,"0");
  numberPad[6] = new Button (color(255), 495, 480,70,70,"0");
  numberPad[7] = new Button (color(255), 605, 480,70,70,"0");
  numberPad[8] = new Button (color(255), 715, 480,70,70,"0");
  numberPad[9] = new Button (color(255), 540, 600,210,70,"0");
  
  if (checkIfHover(numberPad[0])) {
    onehover = true;
  }
  if (checkIfHover(numberPad[1])) {
    twohover = true;
  }
  if (checkIfHover(numberPad[2])) {
    threehover = true;
  }
  if (checkIfHover(numberPad[3])) {
    fourhover = true;
  }
  if (checkIfHover(numberPad[4])) {
    fivehover = true;
  }
  if (checkIfHover(numberPad[5])) {
    sixhover = true;
  }
  if (checkIfHover(numberPad[6])) {
    sevenhover = true;
  }
  if (checkIfHover(numberPad[7])) {
    eighthover = true;
  }
  if (checkIfHover(numberPad[8])) {
    ninehover = true;
  }
  if (checkIfHover(numberPad[9])) {
    zerohover = true;
  } 
}

void mousePressed() {
  if (overBox) {
    locked = true;
    fill(red,green,blue);
  }
  else {
    locked = false;
  }
  xOffset = mouseX-bx;
  yOffset = mouseY-by;
  
  if (menuHover) {
    menuClicked = true;
  }
  if (bakeHover) {
    bakeClicked = true;
  }
  if (broilHover) {
    broilClicked = true;
  }
  if (toastHover) {
    toastClicked = true;
  }
  if (temperatureHover) {
    temperatureClicked = true;
  }
  if (checkHover) {
    checkClicked = true;
  }
  if (cookSetHover) {
    cookSet = true;
  }
  if (onehover) {
    oneClicked = true;
  }
  if (twohover) {
    twoClicked = true;
  }
  if (threehover) {
    threeClicked = true;
  }
  if (fourhover) {
    fourClicked = true;
  }
  if (fivehover) {
    fiveClicked = true;
  }
  if (sixhover) {
    sixClicked = true;
  }
  if (sevenhover) {
    sevenClicked = true;
  }
  if (eighthover) {
    eightClicked = true;
  }
  if (ninehover) {
    nineClicked = true;
  }
  if (zerohover) {
    zeroClicked = true;
  }
  
}



void mouseDragged() {
  if (locked) {
    rad+=2;
    //make the circle darker
    red-=3;
    green-=3;
    blue-=3;
    
    //this is to make the message display when the circle is completely black
    bDisplayMessage = red < 5;
    startTime = millis();
    
    //this keeps the circle from expanding forever
    if (red < 5) {
      locked = false;
    }
    
    
    
    }
    
    if (temperatureClicked) {
      float dx = mouseX - pmouseX;
      if (dx >= 0 && temp < 500) {
        if (temp < 300) {
          temp+=2;
        }
        if (temp >= 300) {
          temp++;
        }
        if (redTemp <70) {
          redTemp++;
        }
      }
      else if (dx <= 0 && temp > 0 ) {
        temp--;
        redTemp--;
      }
      //tint(redTemp,0,0);
      //fill(redTemp,0,0);
      number.message = str(temp);
      number.display();
    }
    
   /* if (cookSet) {
      float dx = mouseX - pmouseX;
      if (dx >= 0 && cookTime < 500) {
        if (cookTime < 300) {
          cookTime+=2;
        }
        if (cookTime >= 300) {
          cookTime++;
        }
        if (redTemp <70) {
          redTemp++;
        }
      }
      else if (dx <= 0 && cookTime > 0 ) {
        cookTime--;
        redTemp--;
      }
      //tint(redTemp,0,0);
      //fill(redTemp,0,0);
      timeSelected.message = str(cookTime);
      timeSelected.display();
    }*/
}

/////////////////////////////////////////////////////

// if the mouse button is released inside a known button keep track of which button was pressed
// and play a confirmation sound

void mouseReleased() {
  
  locked = false;
  
  for (int loopCounter=0; loopCounter < buttons.length; loopCounter++){
      if ((mouseX > buttons[loopCounter][0]) && (mouseX < buttons[loopCounter][0]+buttonX)
      && (mouseY > buttons[loopCounter][1]) && (mouseY < buttons[loopCounter][1]+buttonY)){
        selectedOne = loopCounter;
        playBeep();
      }
  }
}

/////////////////////////////////////////////////////
class Text {
  color c;
  float xpos;
  float ypos;
  int textSize;
  String message;
  
  Text(color tempC, float tempXpos, float tempYpos, int tempSize, String tempMessage) {
    c = tempC;
    xpos = tempXpos;
    ypos = tempYpos;
    textSize = tempSize;
    message = tempMessage;
  }
  
  void display() {
    f = createFont("Arial",textSize,true);
    textFont(f);
    //textSize(textSize);
    fill(c);
    //textAlign(CENTER);
    text(message,xpos,ypos);
  }

}

class Button {
  color c;
  float xpos;
  float ypos;
  int width;
  int height;
  String message;
  
  Button(color tempC, float tempXpos, float tempYpos, int tempWidth, int tempHeight, String tempMessage) {
    c = tempC;
    xpos = tempXpos;
    ypos = tempYpos;
    width = tempWidth;
    height = tempHeight;
    message = tempMessage;
  }
  
  void display() {
    fill(c);
    rect (xpos, ypos, width, height);
    //I NEED TO FIGURE OUT THE OFFSET SO THAT I CAN PUSH THE TEXT TO BE INSIDE THE BUTTON
    //buttonText = new Text(color(80),(xpos+5),(ypos+40),(height/2),message);
    //buttonText.display();
  }
}

class Image {
  float xpos;
  float ypos;
  int width;
  int height;
  String imageName;
  String imageType;
  
  Image (float tempXpos, float tempYpos, int tempWidth, int tempHeight, String tempImageName, String tempImageType) {
    xpos = tempXpos;
    ypos = tempYpos;
    width = tempWidth;
    height = tempHeight;
    imageName = tempImageName;
    imageType = tempImageType;
  }
  
  void display(PImage img) {
    //img.resize(300, 300);
    image(img, xpos, ypos);
  }
  
}