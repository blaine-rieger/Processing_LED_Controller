// this is a test
// this is one big yeet

import g4p_controls.*;
import processing.serial.*;

Serial myPort;
String serialList[];
String ports;

public int R1 = 255;
public int G1 = 255;
public int B1 = 255;

public byte[] serial_data = {};

public void setup() {

  size(480, 320, JAVA2D);

  gatherPortDetails();

  myPort=new Serial(this, "COM7", 9600);  //se the name of our communication port (Arduino COM port)

  createGUI();
  customGUI();
  // Place your setup code here
}

public void draw() {
  background(255/4);
  fill(R1, G1, B1);

  rect(392, 108, 72, 68, 10, 10, 10, 10);
}

// Use this method to add additional statements
// to customise the GUI controls
public void customGUI() {
}

void gatherPortDetails() {
  serialList= Serial.list();
  for (int i = 0; i< serialList.length; i++) {
    if (i == 0) {
      ports = serialList[i] + "\n";
    } else {
      ports= ports + serialList[i] + "\n";
    }
  }
  String[] port_list_to_file = split(ports, ' ');
  saveStrings("/data/ports.txt", port_list_to_file);
}
