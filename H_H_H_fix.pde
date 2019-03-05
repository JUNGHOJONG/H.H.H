import java.util.*;
import KinectPV2.KJoint;
import KinectPV2.*;
import de.bezier.data.sql.*;


Log_in login;
Exercise_process exercise;
Handstate handstate;
Menu menu;
dbConnect connect;
MySQL msql;

boolean Click;
boolean id_pass;

String id_s;
String pw_s;

String user;
String pass;
String dbHost;
String database;





KinectPV2 kinect;


void setup() {

  size(600, 900, P3D);
  login= new Log_in();
  exercise= new Exercise_process();
  handstate= new Handstate();
  menu= new Menu();
  connect= new dbConnect();

  user = "smarthealth";
  pass = "smarthealth";
  dbHost = "smarthealth.cmyoepxrxtwp.us-east-2.rds.amazonaws.com";
  database = "smarthealth";


  msql = new MySQL(this, dbHost, database, user, pass);


  kinect = new KinectPV2(this);
  //kinect.enableDepthMaskImg(true);
  //kinect.enableSkeletonDepthMap(true);
  //kinect.enableSkeleton3DMap(true);

  kinect.enableSkeletonColorMap(true);
  kinect.enableColorImg(true);
  kinect.enableSkeleton3DMap(true);

  kinect.init();

  Click= false;

  id_pass= true;

  id_s = "";
  pw_s = "";
}

void draw() {

  background(0);

  //handstate.handState();

  login.display();
  login.move();

  login.move();

  menu.display();


  //println("X:"+mouseX+"Y:"+mouseY+"Click:"+Click+"Accel:"+Accelerate+"Yspeed:"+Yspeed);
}

void mousePressed() {

  ///////////////////////////////////////////////////////////////////////////revise essential

  if ((225< mouseX && mouseX <415) && (80< mouseY && mouseY <160)) {

    Click=true;
    if ((225< mouseX && mouseX <415) && (50< mouseY && mouseY <92)) {
      id_pass=false;
    } else if ((225< mouseX && mouseX <415) && (96< mouseY && mouseY <135)) {
      id_pass=true;
    }
  } else if (Click==true && (0< mouseY && mouseY< 150) && ((0< mouseX && mouseX<180) || (420<mouseX && mouseX<600))) {

    Click=false;
  } else if (Click==true &&(180<mouseX&&mouseX<420) && (0<mouseY && mouseY<48)) {
    Click=false;
  }
}
