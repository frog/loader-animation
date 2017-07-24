import controlP5.*;

ControlP5 cp5;

ArrayList<Node> nodes;
float edgeLength = 60;
int nodeSize = 4;

float oneAngle = 0.5;
float oneSpeed = 0.03;
boolean oneDirection = true;
boolean oneReverse = true;

float twoAngle = 0.5;
float twoSpeed = 0.01;
boolean twoDirection = true;
boolean twoReverse = false;

float threeAngle = 0.5;
float threeSpeed = 0.03;
boolean threeDirection = false;
boolean threeReverse = false;

float fourAngle = 0.5;
float fourSpeed = 0.01;
boolean fourDirection = false;
boolean fourReverse = true;

void setup() {
  size(400,400);
  noStroke();
  
  cp5 = new ControlP5(this);
  
  cp5.addButton("update")
     .setPosition(225,50)
     .setSize(50,20);
  
  int px = 20;
  int py = 20;
  cp5.addSlider("oneAngle") //<>//
     .setPosition(px,py)
     .setSize(100,10)
     .setRange(0, TWO_PI);
  cp5.addSlider("oneSpeed")
     .setPosition(px,py+20)
     .setSize(100,10)
     .setRange(0, 0.2);
  cp5.addToggle("oneDirection")
     .setPosition(px,py+40)
     .setSize(20,20);
  cp5.addToggle("oneReverse")
     .setPosition(px+40,py+40)
     .setSize(20,20);
  
  px = 20;
  py = 100;
  cp5.addSlider("twoAngle")
     .setPosition(px,py)
     .setSize(100,10)
     .setRange(0, TWO_PI);
  cp5.addSlider("twoSpeed")
     .setPosition(px,py+20)
     .setSize(100,10)
     .setRange(0, 0.2);
  cp5.addToggle("twoDirection")
     .setPosition(px,py+40)
     .setSize(20,20);
  cp5.addToggle("twoReverse")
     .setPosition(px+40,py+40)
     .setSize(20,20);
     
  px = 20;
  py = 180;
  cp5.addSlider("threeAngle")
     .setPosition(px,py)
     .setSize(100,10)
     .setRange(0, TWO_PI);
  cp5.addSlider("threeSpeed")
     .setPosition(px,py+20)
     .setSize(100,10)
     .setRange(0, 0.2);
  cp5.addToggle("threeDirection")
     .setPosition(px,py+40)
     .setSize(20,20);
  cp5.addToggle("threeReverse")
     .setPosition(px+40,py+40)
     .setSize(20,20);
     
  px = 20;
  py = 260;
  cp5.addSlider("fourAngle")
     .setPosition(px,py)
     .setSize(100,10)
     .setRange(0, TWO_PI);
  cp5.addSlider("fourSpeed")
     .setPosition(px,py+20)
     .setSize(100,10)
     .setRange(0, 0.2);
  cp5.addToggle("fourDirection")
     .setPosition(px,py+40)
     .setSize(20,20);
  cp5.addToggle("fourReverse")
     .setPosition(px+40,py+40)
     .setSize(20,20);
     
  nodes = new ArrayList<Node>();
  addNodes();
}

void draw() {
  //fill(sliderValue);
  //rect(0,0,width,100);
  
  background(255);
  
  for( int i=0; i<nodeSize; i++ ){
    Node one = nodes.get(i);
    one.update();
    fill(162, 144, 96);
    ellipse(one.position.x, one.position.y, 3, 3);
    ArrayList<float[]> edges = one.neighbors(nodes); 
    for( int j=0; j<edges.size(); j++) {
      float[] e = edges.get(j);
      float alpha = (edgeLength * 0.8 - e[4]) / edgeLength;
      stroke(162, 144, 96, alpha * 255);
      line(e[0], e[1], e[2], e[3]);
    }
  }
}

void addNodes() {
  nodes.clear();
  PVector center = new PVector(250, height/2);
  float radius = edgeLength * 0.4;
  nodes.add(new Node(center, oneAngle, radius, oneSpeed, edgeLength, oneDirection, oneReverse));
  nodes.add(new Node(center, twoAngle, radius, twoSpeed, edgeLength, twoDirection, twoReverse));
  nodes.add(new Node(center, threeAngle, radius, threeSpeed, edgeLength, threeDirection, threeReverse));
  nodes.add(new Node(center, fourAngle, radius, fourSpeed, edgeLength, fourDirection, fourReverse));
}

public void controlEvent(ControlEvent theEvent) {
  if( theEvent.getController().getName() == "update" ){
    addNodes();
  }
}

void keyPressed() {
  if (key == ' ') {
    addNodes();
  }
}