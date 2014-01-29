class Bar {

  float xpos;
  float ypos;
  String borough;
  float txpos;
  float typos;
  float trashpos;
  float c = 0;

  boolean expand = false;


  Bar (float xpos_, float ypos_, String borough_) {

    xpos = width/2-50;
    ypos = height;
    borough = borough_;
    txpos = xpos_;
    typos = ypos_;
  }


  //Initial display at central point
  void display() {
    strokeWeight(18);
    float d = map(noise(c), 0, 1, 25, 70);
    stroke(d);
    c = c+0.01;
    line(xpos, height, xpos, ypos);
  }

  void display2() {
    strokeWeight(18);
    float d = map(noise(c), 0, 1, 25, 70);
    stroke(0, 255, 0);
    c = c+0.01;
    line(xpos, height, xpos, ypos);
  }

  //Expand background bar array
  void move() {
    if (expand) {
      xpos = lerp(xpos, txpos, 0.05);
      ypos = lerp(ypos, typos, 0.05);
    }
  }

  void moveRec() {
    xpos = txpos;
    ypos = typos;
  }

  //Expand Trash data points
  void moveTrash() {
    xpos = lerp(xpos, txpos, 0.4);
    ypos = lerp(ypos, typos, 0.4);
  }

  //Expand Recycling data points
  void rec() {
    strokeWeight(14);
    stroke(0, 200, 0);
    line(xpos, height, xpos, ypos);
    //line(xpos,height,xpos,ypos);
  }

  //Trash  highlighting
  void trash() {  
    strokeWeight(14);
    stroke(200, 0, 0);
    line(xpos, height, xpos, ypos);
  }

  void resetHome() {
    txpos = lerp(txpos,xpos,0.4);
   typos = lerp(typos,ypos,0.4);
  }
}

