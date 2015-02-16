import ddf.minim.*;

AudioPlayer player;
Minim minim;

void setup(){
  size(700,700, P2D);
  background(201,200,200);
  
  minim = new Minim(this);
  
 // player = minim.loadFile("/Users/alexfrench/Desktop/Proc/08 Warning Sign.mp3", 2048);
 //player = minim.loadFile("/Users/alexfrench/Desktop/Proc/Spitfire _Original Mix_ - Porter Robinson _HD_.mp3", 2048);
  player = minim.loadFile("/Users/alexfrench/Desktop/Proc/Disco Science.mp3", 2048);
 //  player = minim.loadFile("/Users/alexfrench/Desktop/Proc/Tick Tock (feat. P. Diddy).mp3", 2048);
  // player = minim.loadFile("/Users/alexfrench/Desktop/Proc/362 One More Time.mp3", 2048);
//  player = minim.loadFile("/Users/alexfrench/Desktop/proc/01 Be Ok.mp3", 2048);
 // player = minim.loadFile("/Users/alexfrench/Desktop/proc/Stars.mp3", 2048);
  
  player.play();
}

  float x = 0;
  float y = 0;
  float z = 2 * PI;
  float c = .006956525;
  float z2 = 0;
  float z3 = PI/100;
  float r = 59;
  float BPM = 104;
  float calc2 = BPM / 4;
  float calc3 = calc2 / 2;
  float c2 = 0;
  
  
//Azure -- Paul Kalkbrenner = 123 BPM? Maybe 
//Replica -- Original Mix by Afrojack
//Changed program into 4 revs/minute
//105 BPM for Disco Science by Mirwais
//Don't forget, c = .006956525;
void draw(){
  x = x + c;
  y = y + c;
  
  for(int i = 0; i < player.left.size()-1; i++)
  {
  line(height / 2, width / 2,
       height/2 + ((exp (player.left.get(i))*200) * cos(x)),
       width/2 + ((exp (player.right.get(i))*200) * sin(y)));
  }
  
  if (x > z){
//    c2 += 1;
//        if (c2 % 2 == 1){
//       stroke(75,75,75);
//         c2 -= 2;
//        } 
//    if (c2 % 2 == 0){
//      stroke(0,0,0);
//      }
    background(201,200,200);
       z = z + 2 * PI;
  }
  
//Colored!
  if (x > z2){
    z2 = z2 + PI/calc3;
    stroke(random(0,100),random(0,75),random(0,150));
    r = random(100, 250);
  }
  
  if (x > z3){
    z3 = z3 + PI/calc3;
    stroke(0,0,0);
    r = 100;
  }
  
}

void keyPressed(){
  if (key == 's'){
    saveFrame("####.png");
  }
}

void stop()
{
  player.close();
  minim.stop();
  
  super.stop();
}

//128 BPM.
//4 cycles per minute
//8 beats per cycle at this point (with PI/4)
//Thus, beats per cycle should be double the denom of PI
//27.5 BPC needed for 110 BPM; PI/13.75
//32 BPC needed for 128 BPM; PI/16 should work.
//34.5 BPC needed for 138 BPM; PI/17.25
//35 BPC needed for 140; PI/17.5
//Holy crap, there are a lot of songs that have 128 as their BPM!!!
