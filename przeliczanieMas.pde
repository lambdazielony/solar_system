float val;

float pZiemskie = 1;
float pMerkurego = 0.38;
float pWenus = 0.91;
float pMars = 0.38;
float pJowisz = 2.54;
float pSaturn = 1.08;
float pUran = 0.91;
float pNeptun = 1.19;

float masa;

float wagaZiemia;
float wagaMerkury;
float wagaWenus;
float wagaMars;
float wagaJowisz;
float wagaSaturn;
float wagaUran;
float wagaNeptun;

void przeliczanieMas() {
  if (myPort.available() > 0) {
    String data = myPort.readStringUntil('\n');
    val = int(data.substring(0, 3));
  }
  masa = val * pZiemskie;
  wagaZiemia = masa * pZiemskie;
  wagaMerkury = masa * pMerkurego;
  wagaWenus = masa * pWenus;
  wagaMars = masa * pMars;
  wagaJowisz = masa * pJowisz;
  wagaSaturn = masa * pSaturn;
  wagaUran = masa * pUran;
  wagaNeptun = masa * pNeptun;
}