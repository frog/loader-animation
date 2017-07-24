class Node {
  PVector center;
  PVector position;
  float angle;
  float radius;
  float speed;
  float edgeLength;
  boolean direction;
  boolean reverse;
  
  Node(PVector c, float a, float r, float s, float e, boolean d, boolean b) {
    center = c;
    angle = a;
    radius = r;
    speed = s;
    edgeLength = e;
    direction = d;
    reverse = b;
    getPosition();
  }
  
  void getPosition() {
    float b = reverse?-1:1;
    if(direction) {
      position = new PVector(center.x + sin(angle)*radius, center.y + b * sin(angle*2)*radius*0.4);
    }
    else {
      position = new PVector(center.x + b * sin(angle*2)*radius*0.4, center.y + sin(angle)*radius);
    }
  }
  
  void update() {
    angle += speed;
    getPosition();
  }
  
  ArrayList<float[]> neighbors(ArrayList<Node> nodes) {
    ArrayList<float[]> edges = new ArrayList<float[]>();
    for( int i=0; i < nodes.size(); i++ ) {
      float d = PVector.dist(nodes.get(i).position, this.position);
      if( d > 0 && d < edgeLength ) {
        float[] array = new float[5];
        array[0] = this.position.x;
        array[1] = this.position.y;
        array[2] = nodes.get(i).position.x;
        array[3] = nodes.get(i).position.y;
        array[4] = d;
        edges.add(array);
      }
    }
    return edges;
  }
}