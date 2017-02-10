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
PImage toaster;
PImage homescreen;
PImage modepage;
PImage cooking;
PImage check;
PImage thermometer;
PImage numpad;

Audio beepSound = new Audio();

int screen;

int buttonX = 100;
int buttonY = 75;

//on button
float bx;
float by;

int c; //time
int cmin;
int csec;
int cmil;
int climit = 10; //10 min countdown


//preset picture array
PImage[] picArray;


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
Button cool;
Button light;
Button mute;

Button p0, p1, p2, p3;

Button d0, d1, d2, d3;

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
boolean soundP = false;

boolean co = false;
boolean l = false;
boolean m = false;

boolean ps0 = false;
boolean ps1 = false;
boolean ps2 = false;
boolean ps3 = false;

boolean pd0 = false;
boolean pd1 = false;
boolean pd2 = false;
boolean pd3 = false;

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
  toaster = loadImage("toaster.jpg", "jpg");
  homescreen = loadImage("homescreen.jpg","jpg");
  modepage = loadImage("modepage.jpg","jpg");
  cooking = loadImage("cooking.jpg","jpg");
  check = loadImage("check.png","png");
  thermometer = loadImage("thermometer.png","png");
  numpad = loadImage("numpad.png","png");
  
  f = createFont("Abel",32);
  textFont(f);
  
  picArray = new PImage[4];
  
  picArray[0] = loadImage("toast.png","png");
  picArray[1] = loadImage("bagel.png","png");
  picArray[2] = loadImage("pizza.png","png");
  picArray[3] = loadImage("waffle.png","png");
  
  toaster.loadPixels();
  homescreen.loadPixels();
  modepage.loadPixels();
  cooking.loadPixels();
  check.loadPixels();
  thermometer.loadPixels();
  numpad.loadPixels();
  
  picArray[0].loadPixels();
  picArray[1].loadPixels();
  picArray[2].loadPixels();
  picArray[3].loadPixels();
  
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
  
  p0 = new Button (color(20),100,height/2-100, 200,200, "0");
  p1 = new Button (color(20),400,height/2-100, 200,200, "1");
  p2 = new Button (color(20),700,height/2-100, 200,200, "2");
  p3 = new Button (color(20),1000,height/2-100, 200,200, "3");
  
  d0 = new Button (color(20),150,height/2-100, 100,100, "0");
  d1 = new Button (color(20),450,height/2-100, 100,100, "1");
  d2 = new Button (color(20),750,height/2-100, 100,100, "2");
  d3 = new Button (color(20),1050,height/2-100, 100,100, "3");
  
  beepSound.setAttribute("src","bing.mp3");
  
  cool = new Button (color(20),60,height-120, 100,50, "COOL");
  light = new Button (color(20),220,height-120, 100,50, "LIGHT");
  mute = new Button (color(20),350,height-120, 100,50, "MUTE/UNMUTE");
  
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
    for (int i = 0; i <4 ; i++) {
      picArray[i].resize(200,200);
    }
    image(picArray[0],100,height/2-100);
    image(picArray[1],400,height/2-100);
    image(picArray[2],700,height/2-100);
    image(picArray[3],1000,height/2-100);
  }
  
  if (ps0 || ps1 || ps2 || ps3) {
    background(toaster);
    fill(255);
    ellipse(200,height/2-50,50, 50);
    fill(200);
    ellipse(500,height/2-50,50, 50);
    fill(150);
    ellipse(800,height/2-50,50, 50);
    fill(100);
    ellipse(1100,height/2-50,50, 50);
  }
  
  if (pd0 || pd1 || pd2 || pd3) {
    background(cooking);
    if (pd0) {
      displayTemp = str(200);
      displayTime = str(1);
      cookFunction = "PRESET";
    }
    if (pd1) {
      displayTemp = str(250);
      displayTime = str(3);
      cookFunction = "PRESET";
    }
    if (pd2) {
      displayTemp = str(300);
      displayTime = str(5);
      cookFunction = "PRESET";
    }
    if (pd3) {
      displayTemp = str(400);
      displayTime = str(10);
      cookFunction = "PRESET";
    }
      if (co == true) {
      noStroke();
      fill(0,0,255, 80);
      rect(18, 42, 1246, 698);
    }
    
    if (l == true) {
      noStroke();
      fill(255, 80);
      rect(18, 42, 1246, 698);
    }
    
    fill(255);
    noFill();
    stroke(153);
    textSize(36);
    textAlign(LEFT);
    text(displayTemp + "  °F", 50,100);
    celsius = int(displayTemp);
    celsius = int((celsius-32)*(5/9));
    textSize(28);
    text(celsius + "  °C", 50,140);
    textSize(36);
    textAlign(RIGHT);
    text("MODE: " + cookFunction,width-30, 100);
    textAlign(RIGHT);
    text("COOL", 140, height-80);
    text("LIGHT", 300, height-80);
    text("MUTE", 450, height-80);
    
    climit = int(displayTime);
    c = climit*60*1000 - millis();
    cmin = (c/(60*1000));
    csec = (c/(1000));
    if (cmin >= 0 && csec >= 0) {
      String timeText = int(cmin) + ":" + int(csec)%60;
      textSize(42);
      textAlign(CENTER);
      text(timeText, width/2,100);
    }
    else {
      cmin = 0; csec = 0;
      if (soundP == false && m ==false) {
      beepSound.play();
      soundP = true;
      }
      text("Your Food is Ready!",width/2,height/2);
    }
    
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
    
     if (co == true) {
      noStroke();
      fill(0,0,255, 80);
      rect(18, 42, 1246, 698);
    }
    
    if (l == true) {
      noStroke();
      fill(255, 80);
      rect(18, 42, 1246, 698);
    }
    fill(255);
    noFill();
    stroke(153);
    textSize(36);
    textAlign(LEFT);
    text(displayTemp + "  °F", 50,100);
    celsius = int(displayTemp);
    celsius = int((celsius-32)*(5/9));
    textSize(28);
    text(celsius + "  °C", 50,140);
    textSize(36);
    textAlign(RIGHT);
    text("MODE: " + cookFunction,width-30, 100);
    
    text("COOL", 140, height-80);
    text("LIGHT", 300, height-80);
    text("MUTE", 450, height-80);
    
    climit = int(displayTime);
    c = climit*60*1000 - millis();
    cmin = (c/(60*1000));
    csec = (c/(1000));
    if (cmin >= 0 && csec >= 0) {
      String timeText = int(cmin) + ":" + int(csec)%60;
      textSize(42);
      textAlign(CENTER);
      text(timeText, width/2,100);
    }
    else {
      cmin = 0; csec = 0;
      if (soundP == false && m == false) {
      beepSound.play();
      soundP = true;
      }
      text("Your Food is Ready!",width/2,height/2);
    }
  }
  
  currentTime = millis();
}


void drawNumberScreen () {
  check.resize(100, 100);
  image(check, width-200, height-200);
  image(numpad, (width/2)-250, (height/2)-200);
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
  if (p0.checkIfHover()) {
    ps0 = true;
  }
  if (p1.checkIfHover()) {
    ps1 = true;
  }
  if (p2.checkIfHover()) {
    ps2 = true;
  }
  if (p3.checkIfHover()) {
    ps3 = true;
  }
  if (d0.checkIfHover()) {
    pd0 = true;
  }
  if (d1.checkIfHover()) {
    pd1 = true;
  }
  if (d2.checkIfHover()) {
    pd2 = true;
  }
  if (d3.checkIfHover()) {
    pd3 = true;
  }
  
  if (cool.checkIfHover()) {
    co=true;
  }
  if(light.checkIfHover()) {
    l=true;
  }
  if(mute.checkIfHover()) {
    m=true;
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