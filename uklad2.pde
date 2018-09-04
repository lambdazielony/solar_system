import processing.serial.*;

Serial myPort;
String portName;

float i = 25;

PImage tlo;
PImage sun;
PImage merkury;
PImage wenus;
PImage ziemia;
PImage mars;
PImage jowisz;
PImage saturn;
PImage uran;
PImage neptun;

boolean opening = true;

void setup() {
  fullScreen(P3D);
  //size(1280, 1024, P3D);
  textSize(17);
  //String portName = Serial.list()[1];
  //myPort = new Serial(this, portName, 9600);
  tlo = loadImage("textures/space.jpg");
  sun = loadImage("textures/sun.png");
  merkury = loadImage("textures/merkury.jpg");
  wenus = loadImage("textures/wenus.jpg");
  ziemia = loadImage("textures/ziemia.jpg");
  mars = loadImage("textures/mars.jpg");
  jowisz = loadImage("textures/jowisz.jpg");
  saturn = loadImage("textures/saturn.jpg");
  uran = loadImage("textures/uran.jpg");
  neptun = loadImage("textures/neptun.jpg");
  noStroke();
  ptsW = 60;
  ptsH = 60;
  // Parameters below are the number of vertices around the width and height
  initializeSphere(ptsW, ptsH);
  //frameRate(120);
}

void draw() {
  background(0);
  if (opening) {
    fill(128);
    rect(width/3+20, height/8, 400, 400, 20);
    fill(255);
    textSize(30);
    text("Wybierz odpowiedni port", width/3+20+15, height/8+50);
    textSize(20);
    for (int i = 0; i < Serial.list().length; i++) {
      fill(255);
      text(i + 1 + ") " + Serial.list()[i].toString(), width/3+20+20, height/8+100 + i * 25);
    }
  }
  if (!opening) {
    lights();
    camera(width / 2.0, height + 200 * i * 0.0005/**mouseY*/, (height / 2.0) / tan(PI * 30.0 / 180.0), width / 2.0, height / 2.0 + (width / 10 + 10), 0, 0, 1, 0);
    //camera(width/2.0, height-200*i*0.0005, (height/2.0) / tan(PI*30.0 / 180.0), width/2.0, height/2.0+(width/10+10), 0, 0, 1, 0);
    if (i == 25) {
      Pmerkury = new Planeta(width / 2, height / 2, 3.5, 70.0, 70.0, 255, 255, 255, "Twój ciężar na Merkurym: ", merkury, false);
      Pwenus = new Planeta(width / 2, height / 2, 7.0, 135, 135, 255, 255, 255, "Twój ciężar na Wenus: ", wenus, false);
      Pziemia = new Planeta(width / 2, height / 2, 8.0, 220, 220, 255, 255, 255, "Twój ciężar na Ziemii: ", ziemia, false);
      Pmars = new Planeta(width / 2, height / 2, 4.0, 310, 310, 255, 255, 255, "Twój ciężar Marsie: ", mars, false);
      Pjowisz = new Planeta(width / 2, height / 2, 15.0, 390, 390, 255, 255, 255, "Twój ciężar na Jowiszu: ", jowisz, false);
      Psaturn = new Planeta(width / 2, height / 2, 13.0, 460, 460, 255, 255, 255, "Twój ciężar na Saturnie: ", saturn, true);
      Puran = new Planeta(width / 2, height / 2, 9.5, 530, 530, 255, 255, 255, "Twój ciężar Uranie: ", uran, false);
      Pneptun = new Planeta(width / 2, height / 2, 8.5, 600, 600, 255, 255, 255, "Twój ciężar na Neptunie: ", neptun, false);
    }
    przeliczanieMas();
    pushMatrix();
    fill(255, 255, 0);
    translate(width / 2, height / 2, 0);
    sphere(30);
    popMatrix();
    Pmerkury.rysuj(wagaMerkury, i);
    Pwenus.rysuj(wagaWenus, i);
    Pziemia.rysuj(wagaZiemia, i);
    Pmars.rysuj(wagaMars, i);
    Pjowisz.rysuj(wagaJowisz, i);
    Psaturn.rysuj(wagaSaturn, i);
    Puran.rysuj(wagaUran, i);
    Pneptun.rysuj(wagaNeptun, i);
    i += 0.14;
  }
}

void keyPressed() {
  if (opening) {
    for (int i = 0; i < Serial.list().length; i++) {
      if (keyCode == '0' + i + 1) {
        fill(255);
        textSize(25);
        text("Wybrałes port: " + Serial.list()[i].toString(), width/3+20+55, height/2);
        textSize(20);
        portName = Serial.list()[i];
        myPort = new Serial(this, portName, 9600);
        opening = false;
      }
    }
  }
}
