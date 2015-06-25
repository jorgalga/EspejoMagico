/** ESPEJO MÁGICO v1.0- Developed by Jorge Gálvez Gabarda @jorgalga for Expografic */

import processing.video.*;

int size_x;
int size_y;
int pixelsImage;


Capture cam;

PImage background0;
PImage background1;
PImage background3;
PImage background4;
PImage background7;

PImage text1;
PImage text2;
PImage text3A,text3B,text3C;
PImage text4A,text4B,text4C;
PImage text5A,text5B,text5C;
PImage text6A,text6B,text6C;
PImage text7A,text7B,text7C;

PImage leyenda;
PImage Selector_btn;
PImage Start_btn;

PImage Captura,Captura2;
PImage LeftP;
PImage RightP;

int timer;
int swaper1,swaper2;
int timeout;
Boolean frameNotSaved;
Boolean LangSelected;

int screen;
int angle;

int Curr_angle;

int alfaspeed;

int alfa1;
int alfa2;
int alfa3;
int alfaT;

PFont f,f2;  

int size_font1;
int size_font2;
int size_font3;
int offset;



String version;
int direction;
int language_selected;


void setup() {
  size_x = 1920;
  size_y = 1080;
  pixelsImage = size_x * size_y;
  
  size(size_x, size_y);
  frameRate(30);
  
  //Fonts
  size_font1 = 35;
  size_font2 = 20;
  size_font3 = 10;
  f  = createFont("Abadi",size_font1,true); //  Create Font
  f2 = createFont("Arial",size_font2,true); //  Create Font  
  offset = 100;
  
  timer = 0;
  
  swaper1 = 60;
  swaper2 = swaper1*4;
  LangSelected = false;
  
  screen = 1; // First screen index
  frameNotSaved = true;
  angle = -45;
  Curr_angle = -45;
  
  alfaspeed = 15;
  alfa1 = 255;
  alfa2 = 55;
  alfa3 = 55;
  
  alfaT = 255;
  
  leyenda = loadImage("ley_Idiomas.png");
  Selector_btn = loadImage("selector.png");
  Start_btn = loadImage("start.png");
  
  background0 = loadImage("background.png");
  background1 = loadImage("fondo-01.jpg");
  background3 = loadImage("fondo-03b.png");
  background4 = loadImage("fondo-04.png");
  background7 = loadImage("fondo-07.png");
  
  text1 = loadImage("text1.png");
  text2 = loadImage("text2.png");
  
  text3A = loadImage("text_3A.png");
  text3B = loadImage("text_3B.png");
  text3C = loadImage("text_3C.png");
  
  text4A = loadImage("text_4A.png");
  text4B = loadImage("text_4B.png");
  text4C = loadImage("text_4C.png");
  
  text5A = loadImage("text_5A.png");
  text5B = loadImage("text_5B.png");
  text5C = loadImage("text_5C.png");
 
  text6A = loadImage("text_6A.png");
  text6B = loadImage("text_6B.png");
  text6C = loadImage("text_6C.png");
 
  text7A = loadImage("text_7A.png");
  text7B = loadImage("text_7B.png");
  text7C = loadImage("text_7C.png");
 
  language_selected = 1; // No Language is selected
  direction = 1; // Movement of the selector (1 is clock && -1 is against clock)
  
  version = "Espejo Mágico v1.0";
  
  
  // Camera Setup
  String[] cameras = Capture.list();
   
  if (cameras.length == 0) {
    println("There are no cameras available for capture.");
    exit();
  } 
  else {
    println("Available cameras:");
    for (int i = 0; i < cameras.length; i++) {
      println(i + " " +cameras[i]);
    }
    // The camera can be initialized directly using an 
    // element from the array returned by list():
    cam = new Capture(this, cameras[0]);
    //cam.start();     
  }      
}

void draw() {
    
  switch (screen)
  {
    // Init Screen - Language Selector
    case 1:{ 
      if(timer%swaper2==0){
        screen++;
        alfaT = 255;
      }
      if(timer%swaper1==0 && LangSelected == false){
        //println("change");
        if(direction == 1){
          switch(language_selected)
          {
            case 1:{goto2();}break;
            case 2:{goto3();}break;
            case 3:{goto2();direction = -1;}break;
          }    
        }
        else
        {
          switch(language_selected)
          {
            case 1:{direction = 1;goto2();}break;
            case 2:{goto1();}break;
            case 3:{goto2();}break;
          }
        }
      }
      
      // Background of the screen
      image(background0,0,0);
      
      
      // Language Selector
      pushMatrix();
        translate(1535+100,590+100);      
        rotate(radians(Curr_angle));      
        image(Selector_btn,-100,-100);     
      popMatrix();
      
      // Start button
      image(Start_btn,1550,315);
      
      //language icons
      image(leyenda,0,0);
         
      // Text Elements
      image(text1,0,0);
      
      // Selector Angle Animation
      if(LangSelected == false){
        if(Curr_angle != angle)
         {
          switch(language_selected){
            case 1:{Curr_angle = Curr_angle -5;}break;
            case 2:{
              if(Curr_angle < 0){
                Curr_angle = Curr_angle +5;
              }
              else
              {
                Curr_angle = Curr_angle -5;
              }         
            }break;
            case 3:{Curr_angle = Curr_angle +5;}break;
          }
        }
      }
      
      
      fill(255,255,255,alfaT);
      //rect(0,0,1920,1080);
      if(alfaT >0){alfaT = alfaT - 15;}else{alfaT = 0;}
      
    }break;
    
    // Instructions Screen - language Selection
    case 2:{
      if(timer%swaper2==0){
        screen--;
        alfaT = 255;
      }
      
      if(timer%swaper1==0 && LangSelected == false){
        
        if(direction == 1){
          switch(language_selected)
          {
            case 1:{goto2();}break;
            case 2:{goto3();}break;
            case 3:{goto2();direction = -1;}break;
          }    
        }
        else
        {
          switch(language_selected)
          {
            case 1:{direction = 1;goto2();}break;
            case 2:{goto1();}break;
            case 3:{goto2();}break;
          }
        }
      }
      
      
      
      // Background of the screen
      image(background0,0,0);
      
      
      // Language Selector
      pushMatrix();
        translate(1535+100,590+100);      
        rotate(radians(Curr_angle));      
        image(Selector_btn,-100,-100);     
      popMatrix();
      
      // Start button
      image(Start_btn,1550,315);
      
      //language icons
      image(leyenda,0,0);
         
      // Text Elements
      image(text2,0,0);
      
      // Selector Angle Animation
      if(LangSelected == false){
        if(Curr_angle != angle)
        {
          switch(language_selected){
            case 1:{Curr_angle = Curr_angle -5;}break;
            case 2:{
              if(Curr_angle < 0){
                Curr_angle = Curr_angle +5;
              }
              else
              {
                Curr_angle = Curr_angle -5;
              }         
            }break;
            case 3:{Curr_angle = Curr_angle +5;}break;
          }
        }
      }
      
      
      
      fill(255,255,255,alfaT);
      //rect(0,0,1920,1080);
      if(alfaT >0){alfaT = alfaT - 15;}else{alfaT = 0;}
    }break;
    
    // Take photo screen
    case 3:{   
      if (cam.available() == true) {
        cam.read();
      }
      pushMatrix();
        scale(-1,1);
        translate(-size_x, 0);
        image(cam, 0, 0,size_x,size_y);
      popMatrix();
   
  
  
      image(background3,0,0);
      
      switch(language_selected){
        case 1:{
          image(text3A,0,0); 
        }break;
        case 2:{
          image(text3B,0,0); 
        }break;
        case 3:{
          image(text3C,0,0); 
        }break;
      }
      fill(255,255,255,alfaT);
      rect(0,0,1920,1080);
      if(alfaT >0){alfaT = alfaT - 15;}else{alfaT = 0;}
    }break;
    
    // Showing taken photo screen
    case 4:{
      image(Captura,0,0);
      
      pushMatrix();
        scale(-1,1);
        translate(-size_x, 0);
        image(Captura, 0, 0,size_x,size_y);
      popMatrix();
      
      if(frameNotSaved == true)
      {
        frameNotSaved = false;
        saveFrame("capture.jpg");
        Captura2 = loadImage("capture.jpg");
        RightP = Captura2.get(640,270,640,540/2);
        LeftP = Captura2.get(640,540,640,540/2);
      }
      
      fill(0,0,0,alfaT);
      rect(0,0,1920,1080);
      if(alfaT >0){alfaT = alfaT - 15;}else{alfaT = 0;}
      image(background4,0,0);  
      
      switch(language_selected){
        case 1:{
          image(text4A,0,0); 
        }break;
        case 2:{
          image(text4B,0,0); 
        }break;
        case 3:{
          image(text4C,0,0); 
        }break; 
      }
    }break;
    
    //  Two left-sides photo screen
    case 5:{
      //simage(TwoLeft,0,0);
      
      
      pushMatrix();
        scale(1.0, -1.0);
        image(LeftP,640,-540);
      popMatrix();
      image(LeftP,640,540);
      
      image(background4,0,0);
      
      switch(language_selected){
        case 1:{
         image(text5A,0,0); 
        }break;
        case 2:{
         image(text5B,0,0); 
        }break;
        case 3:{
         image(text5C,0,0); 
        }break; 
      }
      
      
      fill(255,255,255,alfaT);
      rect(0,0,1920,1080);
      if(alfaT >0){alfaT = alfaT - 15;}else{alfaT = 0;}
      
    }break;
    
    // Two right-sides screen
    case 6:{
      pushMatrix();
        scale(1.0, -1.0);
        image(RightP,640,-810);
      popMatrix();
      
      image(RightP,640,270);
      
      image(background4,0,0);
      
      switch(language_selected){
        case 1:{
          image(text6A,0,0); 
        }break;
        case 2:{
          image(text6B,0,0); 
        }break;
        case 3:{
          image(text6C,0,0); 
        }break; 
      }
      
      
      fill(255,255,255,alfaT);
      rect(0,0,1920,1080);
      if(alfaT >0){alfaT = alfaT - 15;}else{alfaT = 0;}  
    }break;
      
    // tree faces screen
    case 7:{
      
      image(RightP,320,270);
      image(LeftP,320,540);
      
      image(RightP,960,135,480,405/2);
      pushMatrix();
        scale(1.0, -1.0);
        image(RightP,960,-135-405/2-405/2,480,405/2);
      popMatrix();
      pushMatrix();
        scale(1.0, -1.0);
        image(LeftP,960,-540 - 405/2 -1 ,480,405/2);
      popMatrix();
      image(LeftP,960,540+405/2,480,405/2);
      
      
      image(background7,0,0);
      
      switch(language_selected){
        case 1:{
          image(text7A,0,0); 
        }break;
        case 2:{
          image(text7B,0,0); 
        }break;
        case 3:{
          image(text7C,0,0); 
        }break; 
      }
      
       
      fill(255,255,255,alfaT);
      rect(0,0,1920,1080);
      if(alfaT >0){alfaT = alfaT - 15;}else{alfaT = 0;}
    }break;
  }
  //Version text
  textFont(f,size_font3);      // Specify font to be used
  fill(0);                     // Specify font color 
  text(version,10,size_y - (size_font3));
   
   //Timer counter
   timer ++;
   if(timer == 30*60 ){restart();}
}// End draw


void keyPressed(){

    println("Button pressed");
    timer = 0; 
    switch(screen)
    {
      case 1:{
          println("Take photo screen");
          screen=3;
          cam.start();
          alfaT = 255;       
          if(key == 'a'){language_selected = 1;}
          if(key == 's'){language_selected = 2;}
          if(key == 'd'){language_selected = 3;}
        
      }break;
      case 2:{
        println("Take photo screen");
          screen=3;
          cam.start();
          alfaT = 255;       
          if(key == 'a'){language_selected = 1;}
          if(key == 's'){language_selected = 2;}
          if(key == 'd'){language_selected = 3;}
      }break;
      case 3:{
        println("Showing taken photo screen");
        screen ++;
        alfaT = 255;
        Captura = cam;
        cam.stop();
        if(key == 'a'){language_selected = 1;}
        if(key == 's'){language_selected = 2;}
        if(key == 'd'){language_selected = 3;}

      }break;
      case 4:{  
        screen ++;
        alfaT = 255;
        int counter =0;
        if(key == 'a'){language_selected = 1;}
        if(key == 's'){language_selected = 2;}
        if(key == 'd'){language_selected = 3;}
  
      }break;
      case 5:{
        screen ++;
        alfaT = 255;
        int counter =0;
        if(key == 'a'){language_selected = 1;}
        if(key == 's'){language_selected = 2;}
        if(key == 'd'){language_selected = 3;}
      }break;
      case 6:{screen ++;
        alfaT = 255;
        int counter =0;
        if(key == 'a'){language_selected = 1;}
        if(key == 's'){language_selected = 2;}
        if(key == 'd'){language_selected = 3;}
      }break;
      case 7:{
        if(key == 'a'){language_selected = 1;}
        if(key == 's'){language_selected = 2;}
        if(key == 'd'){language_selected = 3;}
        restart();
      }break;
    }
    
  
}


void restart()
{
  screen = 1;
  alfaT = 255;
  frameNotSaved = true;
  LangSelected = false;
}

void goto1(){
  println("goto1");
  language_selected = 1;
  angle = -45; 
}
void goto2(){
  println("goto2");
  language_selected = 2;
  angle = 0;
}
void goto3(){
  println("goto3");
  language_selected = 3;
  angle = 45;
}

void mousePressed() {
   //saveFrame("ImagenFinal.png");
   //cam.stop(); 
   //exit();
   println(1280%1280);
}
