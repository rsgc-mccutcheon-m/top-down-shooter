class Pickup {

  int ax;
  int ay;
  int px;
  int py;
  int arot;
  int prot;
  int check;
  boolean a = false;
  boolean pi = false;
  int lokx = -95;

  void run() {
    check += 1;
    if (check % 4000 == 0) {
      if (a == false && pi == true) {
        ax = int(random(width));
        ay = int(random(height - 100));
        for (int i = 0; i < walls.length; i++) {
          while (ax > walls[i].x - walls[i].wide/2 && ax < walls[i].x + walls[i].wide/2 && ay > walls[i].y - walls[i].high/2 && ay < walls[i].y + walls[i].high/2) {
            ax = int(random(width));
            ay = int(random(height - 100));
          }
        }
        a = true;
        arot = int(random(100));
      } else if (a == true && pi == false) {
        px = int(random(width));
        py = int(random(height - 100));
        for (int i = 0; i < walls.length; i++) {
          while (px > walls[i].x - walls[i].wide/2 && px < walls[i].x + walls[i].wide/2 && py > walls[i].y - walls[i].high/2 && py < walls[i].y + walls[i].high/2) {
            px = int(random(width));
            py = int(random(height - 100));
          }
        }
        pi = true;
        prot = int(random(100));
      } else if (a == false && pi == false) {
        if (int(random(10)) % 2 == 0) {
          ax = int(random(width));
          ay = int(random(height - 100));
          for (int i = 0; i < walls.length; i++) {
            while (ax > walls[i].x - walls[i].wide/2 && ax < walls[i].x + walls[i].wide/2 && ay > walls[i].y - walls[i].high/2 && ay < walls[i].y + walls[i].high/2) {
              ax = int(random(width));
              ay = int(random(height - 100));
            }
          }
          a = true;
          arot = int(random(100));
        } else {
          px = int(random(width));
          py = int(random(height - 100));
          for (int i = 0; i < walls.length; i++) {
            while (px > walls[i].x - walls[i].wide/2 && px < walls[i].x + walls[i].wide/2 && py > walls[i].y - walls[i].high/2 && py < walls[i].y + walls[i].high/2) {
              px = int(random(width));
              py = int(random(height - 100));
            }
          }
          pi = true;
          prot = int(random(100));
        }
      }
    }
  }

  void display() {
    if (dist(p.location.x, p.location.y, ax, ay) < 20 && a == true) {
      w.totmammo += 30;
      a = false;
      if(w.totmammo > 60) {
       w.totmammo = 60; 
      }
      a = false;
    }
    if (dist(p.location.x, p.location.y, px, py) < 30 && pi == true) {
      w.totpammo += 15;
      pi = false;
      if(w.totpammo > 30) {
        w.totpammo = 30;
      }
      pi = false;
    }
    if (pi == true) {
      pushMatrix();
      translate(px, py);
      rotate(prot);
      translate(-22, -15);
      scale(0.5, 0.5);
      fill(150);
      stroke(10);

      beginShape();
      vertex(16, 50);
      vertex(24, 28);
      vertex(21, 23);
      vertex(25, 14);
      vertex(84, 14);
      vertex(84, 20);
      vertex(81, 23);
      vertex(80, 25);
      vertex(45, 25);
      vertex(34, 52);
      endShape(CLOSE);
      line(23, 21, 83, 21);
      line(29, 14, 29, 21);
      line(31, 14, 31, 21);
      line(33, 14, 33, 21);
      line(35, 14, 35, 21);
      line(37, 14, 37, 21);
      line(39, 14, 39, 21);

      fill(115, 75, 25);

      beginShape();
      vertex(28, 25);
      vertex(41, 27);
      vertex(32, 50);
      vertex(20, 48);
      endShape(CLOSE);


      fill(70);

      ellipse(33, 32, 3, 3);
      ellipse(28, 46, 3, 3);

      popMatrix();
    }

    if (a == true) {

      pushMatrix();
      translate(ax, ay);
      rotate(arot);
      scale(0.5, 0.5);

      fill(165, 75, 15);
      strokeWeight(1);
      stroke(0);

      rect(123+lokx, 24, 22, 11);
      rect(114+lokx, 19, 40, 8);
      rect(70+lokx, 34, 9, 17);
      triangle(20+lokx, 23, 80+lokx, 17, 27+lokx, 44);
      fill(30);
      beginShape();
      vertex(120+lokx, 45);
      vertex(108+lokx, 48);
      vertex(94+lokx, 30); //**
      vertex(87+lokx, 23);
      vertex(100+lokx, 25);
      vertex(107+lokx, 38);
      endShape(CLOSE);
      rect(86+lokx, 22, 55, 10);
      rect(92+lokx, 17, 55, 8);
      rect(155+lokx, 26, 40, 3);
      triangle(152+lokx, 19, 158+lokx, 26, 164+lokx, 25);
      rect(145+lokx, 19, 20, 2);
      fill(0, 0);

      stroke(0);

      strokeWeight(2);
      rect(80+lokx, 30, 10, 6);

      popMatrix();
    }
  }
}
