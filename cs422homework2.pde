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
int clickFlag = 0;
int celsius = 0;
boolean overBox = false;
boolean locked = false;
float xOffset = 0.0;
float yOffset = 0.0;
int temp = 0;
int redTemp = 0;
int cookTime = 0;
String tempTracker = "";
String timeTracker = "";
String displayTemp = "";
String displayTime = "";
String valueToCompute;
String cookFunction = "";
float valueToComputeI;




int[] numArr = new int[3];
int cookingTemperature = 0;
int cookingTime = 0;

Button[] numberPad;
Button bake;
Button broil;
Button toastMode;
Button checkMark;
Button checkMark1;
Button newButton;

// no buttons / mode currently selected
int selectedOne = -1;

int currentTime;

PFont f;

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
boolean firstNum;
boolean recordingTime = false;
boolean recordingTemp = false; 
boolean menuClicked = false;
boolean bakeClicked = false;
boolean broilClicked = false;
boolean toastClicked = false;
boolean temperatureClicked = false;
boolean timeClicked = false;
boolean checkClicked = false;
boolean cookSet = false;
boolean first = false;
boolean second = false;

/////////////////////////////////////////////////////

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
  numberPad = new Button[10];
  
  bake = new Button(color(100),30,280,380,240,"BAKE");
  broil = new Button(color(100),300,280,380,240,"BROIL");
  toastMode = new Button(color(100),600,280,380,240,"TOAST");
  checkMark = new Button (color(100),width-200,height-200,100,100,"check");
  checkMark1 = new Button (color(100),width-200,height-200,100,100,"check");
  newButton = new Button(color(100),(width/2)-150,(height-160),300,80,"MENU");
  
  numberPad[0] = new Button (color(20), 520, 255,50,50,"1");  
  numberPad[1] = new Button (color(40), 625, 255,50,50,"2");
  numberPad[2] = new Button (color(60), 725, 255,50,50,"3");
  numberPad[3] = new Button (color(80), 520, 380,50,50,"4");
  numberPad[4] = new Button (color(100), 625, 380,50,50,"5");
  numberPad[5] = new Button (color(120), 725, 380,50,50,"6");
  numberPad[6] = new Button (color(140), 520, 500,50,50,"7");
  numberPad[7] = new Button (color(160), 625, 500,50,50,"8");
  numberPad[8] = new Button (color(180), 725, 500,50,50,"9");
  numberPad[9] = new Button (color(200), 580, 620,150,50,"0");
  
  firstNum = true;
}

/////////////////////////////////////////////////////

void draw() {
  String timeString;
  
  background(toaster);
  
  //ON BUTTON
  if (mouseX > bx-rad && mouseX < bx+rad && mouseY > by-rad && mouseY < by+rad) {
    overBox = true;
  } 
  else {
    overBox = false;
  }
  
  //draw the ON BUTTON
  noFill();
  stroke(255);
  strokeWeight(3);
  ellipse(bx,by,rad, rad);
  
  if (bDisplayMessage)
  {
    on = true;
  }
  
  if (on) {
    background(homescreen);
  }
  
  if (menuClicked) {
    background(modepage);
  }
  
  
  if (bakeClicked || broilClicked || toastClicked) {
    background(toaster);
    drawNumberScreen();
    recordingTemp = true;
    textSize(36);
    fill(255);
    noFill();
    rect(width/2-10,110,100,50);
    text("°F",width/2+100,150);
    text(tempTracker,width/2,150);
  
    if (bakeClicked) {
      cookFunction = "BAKE";
    }
    else if (broilClicked) {
      cookFunction = "BROIL";
    }
    else if (toastClicked) {
      cookFunction = "TOAST";
    }
    displayTemp = tempTracker;
  }
  
  if (temperatureClicked) {
    recordingTemp = false;
    recordingTime = true;
    background(toaster);
    //tempTracker = "";
    drawNumberScreen();
    checkMark1 = new Button (color(100),width-200,height-200,100,100,"timecheck");
    
    textSize(36);
    fill(255);
    //text(tempTracker,width/2,150);
    noFill();
    rect(width/2-10,110,100,50);
    text(timeTracker,width/2,150);
    text("minutes",width/2+100,150);
    displayTime = timeTracker;
  }
  
  if (checkClicked) {
    background(cooking);
    fill(255);
    noFill();
    rect(48,60,100,50);
    rect(48,120,100,50);
    text("°F", 160,100);
    text("°C", 160,150);
    stroke(153);
    textSize(36);
    text(displayTemp, 50,100);
    celsius = int(displayTemp);
    celsius = (celsius-32);
    text(celsius*5/9, 50,160);
    text(displayTime,50, 300);
    text(cookFunction,50, 400);
    println("temp" + displayTemp);
    println("time" + displayTime);
    
    
    
  }
  int timefart = int(displayTime);
  displayTime = str(max(timefart - 1000, 0));
    println(displayTime);
  
  if (cookSet) {
    background(cooking);
  }
  currentTime = millis();
}


void drawNumberScreen () {
  check.resize(100, 100);
  image(check, width-200, height-200);
  image(numpad, (width/2)-250, (height/2)-200);
  /*
  for (int i = 0; i<10; i++)
  {
    numberPad[i].display();
  }
  */
}

void mousePressed() {
  if (overBox) {
    locked = true;
    fill(red,green,blue);
  }
  else {
    locked = false;
  }
  if (newButton.checkIfHover()) {
    menuClicked = true;
  }
  if (menuClicked) {
    if (bake.checkIfHover()) {
      bakeClicked = true;
    }
    if (broil.checkIfHover()) {
      broilClicked = true;
    }
    if (toastMode.checkIfHover()) {
      toastClicked = true;
    }
  }
  if (checkMark.checkIfHover() && clickFlag == 0) {
    clickFlag = 1;
    temperatureClicked = true;
  }
  else if (checkMark1.checkIfHover() && clickFlag == 1) {
      timeClicked = true;
      checkClicked = true;
  }
  for (int i = 0; i < 10; i++) {
    if (numberPad[i].checkIfHover() == true && recordingTemp == true) {
        tempTracker += int(numberPad[i].message);
    }
  }
    for (int i = 0; i < 10; i++) {
      if (numberPad[i].checkIfHover() == true && recordingTemp == false && recordingTime == true) {
          timeTracker += int(numberPad[i].message);
      }
    }
}



void mouseDragged() {
  if (locked) {
    //expand circle
    rad+=2;
    
    //make the circle darker
    red-=3;
    green-=3;
    blue-=3;
    
    //this is to make the message display when the circle is completely black
    bDisplayMessage = red < 5;
    //startTime = millis();
    
    //this keeps the circle from expanding forever
    if (red < 5) {
      locked = false;
    }
  }
}

/////////////////////////////////////////////////////

// if the mouse button is released inside a known button keep track of which button was pressed
// and play a confirmation sound


/////////////////////////////////////////////////////
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
  
  boolean checkIfHover() {
  if ((mouseX > (this.xpos)) && (mouseX < (this.xpos) + (this.width)) 
        && (mouseY > (this.ypos)) && (mouseY < (this.ypos) +(this.height))) {
    return true;
  } 
  return false;
  }
  
  void display() {
    fill(c);
    rect (xpos, ypos, width, height);
  }
}