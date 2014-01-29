Table table; //Main file
Bar[] bars; 
Bar[] bars2;
Bar[] bars3;

PGraphics canvas;
PImage mainMap;
PImage canvasMap;
PImage bronxMap;
PImage brooklynMap;
PImage manhattanMap;
PImage queensMap;
PImage statenMap;



void setup() {

  size(1200, 800);
  rectMode(CENTER);
  // DATA...ASSEMMMMBBBBLLLLLEE
  //main file
  table = loadTable("ICM_Data.csv", "header");
  println(table.getRowCount() + " total rows in table");
  bars = new Bar[table.getRowCount()];  //Background bars
  bars2 = new Bar[table.getRowCount()];  //Trash bars
  bars3 = new Bar[table.getRowCount()];  //Recycle bars
  int index = 0;

  for (TableRow row : table.rows()) {
    String month = row.getString("Month");
    String borough = row.getString("Borough");
    int district = row.getInt("CommunityDistrict");
    int refuse = row.getInt("RefuseTonsCollected");
    int paper = row.getInt("PaperTonsCollected");
    int mgp = row.getInt("MGPTonsCollected");
    int totaled = row.getInt("Totaled");

    float bottom = height + 50;
    float total = bottom-totaled/15;
    float trash = bottom-refuse/15;
    float pap = bottom-paper/15;
    float met = bottom-mgp/15;
    // float rec = bottom-(paper/15+mgp/15);
    //float rec = (bottom-refuse/15) + ((bottom-paper/15)+(bottom-mgp/15));
    float rec = bottom-refuse/15;

    bars[index] = new Bar(index*18, total, borough);  //Data bars
    bars2[index] = new Bar(index*18, trash, borough);
    bars3[index] = new Bar(index*18, total, borough);
    index++;

    //Next, make canvas.  all of draw.  whole thing.  trigger pics in b.borough functions
  }







  int screenX = 1200;
  int screenY = 800;
  canvas = createGraphics(screenX, screenY);

  mainMap = loadImage("BoroughMapBW.png");
  canvasMap = loadImage("BoroughMapColor.png");
  bronxMap = loadImage("Bronxmap.png");
  brooklynMap = loadImage("Brooklynmap.png");
  manhattanMap = loadImage("Manhattanmap.png");
  queensMap = loadImage("Queensmap.png");
  statenMap = loadImage("SImap.png");
}


void mousePressed() {
  for (Bar b : bars) {
    b.expand = true;
  }
}

void draw() {


  background (mainMap);
  canvas.beginDraw();
  canvas.background(canvasMap);
  canvas.endDraw();

  //background(75);

  pushMatrix();
  translate(50, -50);

  //Font data
  PFont font;
  font = loadFont("Helvetica-48.vlw");
  float fontx = 650;
  float fontx2 = 675;
  float fonty = 110;
  float fonty2 = 150;
  float fonty3 = 190;
  

  //Axis data
  stroke(255);
  strokeWeight(1);
  line(-20, 275, -20, height+5);
  textFont(font, 20);
  text("8000 tons", -15, 280);
  textFont(font, 20);
  text("Data organized by borough, by district.", width/2-230, height+30);



  //Key Data
  strokeWeight(16);
  stroke(50);
  point(-20, 100);
  textFont(font, 15);
  text("Total Collection", -6, 105);
  
  stroke(200, 0, 0);
  point(-20, 130);
  textFont(font, 15);
  text("Trash", -6, 135);
  
  stroke(0, 200, 0);
  point(-20, 160);
  textFont(font, 15);
  text("Recycling", -6, 165);


  //Map Color Code
  color brx = color(255, 255, 0);
  color bk = color(0, 0, 255);
  color mhn = color(0, 255, 255);
  color qn = color(0, 255, 0);
  color sni = color(255, 0, 255);

  int fontL = 54;
  int fontS = 30;


  for (Bar b : bars) {

    b.display();

    b.move();
  }

  //*****BRONX
  if (canvas.get(mouseX, mouseY)==brx) {
    for (Bar r : bars3) {
      if (r.borough.equals("Bronx")) {
        r.moveTrash();
        r.rec();
        textFont(font, 48);
        text("Bronx", fontx, fonty);
        textFont(font, fontS);
        text("48,109 tons of trash", fontx2, fonty2);
        text("10,041 tons of recycling", fontx2, fonty3);
      }
    }

    for (Bar t : bars2) {
      if (t.borough.equals("Bronx")) {
        t.moveTrash();
        t.trash();
      } 
      else {
        //b.resetHome();
      }
    }
  }


  //*****BROOKLYN
  if (canvas.get(mouseX, mouseY)==bk) {
    for (Bar r : bars3) {
      if (r.borough.equals("Brooklyn")) {
        r.moveTrash();
        r.rec();
        textFont(font, 48);
        text("Brooklyn", fontx, fonty);
        textFont(font, fontS);
        text("42,691 tons of trash", fontx2, fonty2);
        text("4,963 tons of recycling", fontx2, fonty3);
      }
    }

    for (Bar t : bars2) {
      if (t.borough.equals("Brooklyn")) {
        t.moveTrash();
        t.trash();
      } 
      else {
        //b.resetHome();
      }
    }
  }



  //*****MANHATTAN
  if (canvas.get(mouseX, mouseY)==mhn) {
    for (Bar r : bars3) {
      if (r.borough.equals("Manhattan")) {
        r.moveTrash();
        r.rec();
        textFont(font, 48);
        text("Manhattan", fontx, fonty);
        textFont(font, fontS);
        text("84,046 tons of trash", fontx2, fonty2);
        text("12,978 tons of recycling", fontx2, fonty3);
      }
    }

    for (Bar t : bars2) {
      if (t.borough.equals("Manhattan")) {
        t.moveTrash();
        t.trash();
      } 
      else {
        //b.resetHome();
      }
    }
  }


  //*****QUEENS
  if (canvas.get(mouseX, mouseY)==qn) {
    for (Bar r : bars3) {
      if (r.borough.equals("Queens")) {
        r.moveTrash();
        r.rec();
        textFont(font, 48);
        text("Queens", fontx, fonty);
        textFont(font, fontS);
        text("77,098 tons of trash", fontx2, fonty2);
        text("12,732 tons of recycling", fontx2, fonty3);
      }
    }

    for (Bar t : bars2) {
      if (t.borough.equals("Queens")) {
        t.moveTrash();
        t.trash();
      } 
      else {
        //t.resetHome();
      }
    }
  }


  //*****STATEN ISLAND
  if (canvas.get(mouseX, mouseY)==sni) {
    for (Bar r : bars3) {
      if (r.borough.equals("Staten Island")) {
        r.moveTrash();
        r.rec();
        textFont(font, 48);
        text("Staten Island", fontx, fonty);
        textFont(font, fontS);
        text("21,811 tons of trash", fontx2, fonty2);
        text("3,926 tons of recycling", fontx2, fonty3);
      }
    }

    for (Bar t : bars2) {
      if (t.borough.equals("Staten Island")) {
        t.moveTrash();
        t.trash();
      } 
      else {
        //b.resetHome();
      }
    }
  }


  popMatrix();

    int m = millis();
    if (m<8000) {
      textFont(font, 30);
      text("In one month, the Department of Sanitation collects 274,000 tons of refuse.", width/10, height/2+100);
      textFont(font, 35);
      text("How much does each borough throw out?", width/4, height/2+160);
      textFont(font,25);
      text("(Click to see)",width/2-75,height/2+210);
    }
    else {
      noStroke();
      noFill();
    }
} //here

