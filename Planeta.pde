class Planeta{
  float x, y;
  float size;
  float xmax, ymax;
  int r, g, b;
  String text;
  PImage txt;
  boolean pas;
  Planeta(float _x, float _y, float _size, float _xmax, float _ymax, int _r, int _g, int _b, String _text, PImage _txt, boolean _pas){
    x = _x;
    y = _y;
    size = _size;
    xmax = _xmax;
    ymax = _ymax;
    r = _r;
    g = _g;
    b = _b;
    text = _text; 
    txt = _txt;
    pas = _pas;
  }
   void rysuj(float masa, float i){
    fill(25, 255, 120);
    text(text + nf(masa, 2, 2) + "kg", x+sin(i/(xmax/70))*xmax+size+5, y+cos(i/(xmax/70))*ymax+size+5);
    pushMatrix();
      fill(r, g, b);
      translate(x+sin(i/(xmax/70))*xmax, y+cos(i/(xmax/70))*ymax, 0);
      textureSphere(size, size, size, txt);
      if(pas){
      fill(255,255);
      strokeWeight(1.0);
      rotateX(28);
      for(int j=0; j<=8; j+=2.5)
        ellipse(0, 0, 32+j, 32+j);
      }
    popMatrix();
    fill(0,0);
    stroke(255);
    strokeWeight(1.0);
    ellipse(x, y, xmax*2, ymax*2);
    noStroke();
   }
}

Planeta Pmerkury;
Planeta Pwenus;
Planeta Pziemia;
Planeta Pmars;
Planeta Pjowisz;
Planeta Psaturn;
Planeta Puran;
Planeta Pneptun;