noStroke();
// position of the car
var x = 10;

void setup()
{
  size(1000,500);
  background(125);
}


var Flower = function(x, y, height) {
    this.x = x;
    this.y = y;
    this.height = height;
};

Flower.prototype.growBy = function(amount) {
    this.height +=amount;    
    };
var Tulip = function(x,y,height){
    Flower.call(this, x, y, height);
};
Tulip.prototype = Object.create(Flower.prototype);
Tulip.prototype.draw = function() {
    noStroke();
    fill(16, 122, 12);
    rect(this.x, this.y, 10, -this.height);
    fill(255, 0, 0);
    // petals
    ellipse(this.x+5, this.y-this.height, 44, 44);
    triangle(this.x-16, this.y-this.height,
            this.x+20, this.y-this.height,
            this.x-20, this.y-this.height-31);
    triangle(this.x-14, this.y-this.height,
            this.x+24, this.y-this.height,
            this.x+3, this.y-this.height-39);
    triangle(this.x+-4, this.y-this.height,
            this.x+26, this.y-this.height,
            this.x+29, this.y-this.height-36);
};


/*********************
*Sunflower Object Type
**********************/
var Sunflower = function(x,y,height){
    Flower.call(this, x, y, height);
};
Sunflower.prototype = Object.create(Flower.prototype);
Sunflower.prototype.draw = function() {
    fill(16, 122, 12);

    rect(this.x, this.y, 10, -this.height);

    // petals
    stroke(0, 0, 0);
    fill(255, 221, 0);
    ellipse(this.x-10, this.y-this.height, 20, 18);
    ellipse(this.x+5, this.y-this.height-15, 20, 18);
    ellipse(this.x+5, this.y-this.height+15, 20, 18);
    ellipse(this.x+20, this.y-this.height, 20, 18);
    fill(20, 20, 20);
    ellipse(this.x+5, this.y-this.height, 20, 20);
};

/*********************
*Rose Object Type
**********************/
var Rose = function(x,y,height){
    Flower.call(this, x, y, height);
};
Rose.prototype = Object.create(Flower.prototype);
Rose.prototype.draw = function() {
    noStroke();
    fill(16, 122, 12);
    rect(this.x, this.y, 10, -this.height);
    fill(255, 0, 187);
    // petals
    ellipse(this.x-10, this.y-this.height, 20, 18);
    ellipse(this.x+5, this.y-this.height-15, 20, 18);
    ellipse(this.x+5, this.y-this.height+15, 20, 18);
    ellipse(this.x+20, this.y-this.height, 20, 18);
    fill(155,155,155);
    ellipse(this.x+5, this.y-this.height, 20, 20);
};


var sun_x = 1;
var sun = function(x){
    fill(255, 255, 0);
    ellipse(x, 60, 100, 100);
}   
var cloud_x = 1;
var cloud = function(cloud_x){
    
    fill(255, 255, 255);
    ellipse(cloud_x, 50, 126, 97);
    ellipse(cloud_x+62, 50, 70, 60);
    ellipse(cloud_x-62, 50, 70, 60);
}

background(219, 255, 255);

fill(174, 180, 214);
triangle(200, 26, 354, 151, 54, 150);

fill(255, 255, 255);
rect(60, 151, 292, 207);

fill(120, 80, 19);
rect(180, 280, 40, 77);

fill(186, 138, 138);
rect(86,183,55,64);
/**************
*MAIN PROGRAM
***************/

var maxflower = random(1,3);
var tulip_arr = [];
var sunflower_arr = [];
var rose_arr = [];
var x, y;
for ( var i = 0; i < maxflower; i++) {
    x = random(40, 350);
    y = 430;
    var tulip = new Tulip(x, y, 150);
    tulip_arr.push(tulip);
    var sunflower = new Sunflower(x+50, y, 150);
    sunflower_arr.push(sunflower);
    var rose = new Rose(x+100, y, 150);
    rose_arr.push(rose);
}
    
var drawScene = function() {
    background(207, 250, 255);
    
    for ( var i = 0; i < maxflower; i++) {
        tulip_arr[i].draw();
        sunflower_arr[i].draw();
        rose_arr[i].draw();
    } 
    
};

mouseClicked = function() {
    for ( var i = 0; i < maxflower; i++) {
        tulip_arr[i].growBy(30);
        sunflower_arr[i].growBy(40);
        rose_arr[i].growBy(70);
    } 
    
  // drawScene();
};
draw = function() {
    
    drawScene();
    noStroke();
    sun(1150 + sun_x);
    sun_x -=1;
    cloud(135 + cloud_x);
    cloud(450 + cloud_x);
    cloud_x +=1;
    fill(14, 240, 89);
    for(var glass_x = 10; glass_x <=900; glass_x +=100){
        rect(glass_x,480,70,60);
    }
    
   fill(174, 180, 214);
   triangle(600, 106, 754, 230, 454, 230);
    fill(255, 255, 0);
   rect(454,230,300,200 );
    fill(120, 80, 19);
    rect(570,351,60,77 );
    fill(186, 138, 138);
    rect(486,254,55,64);
    rect(656,254,55,64);
//    for(var i=0;i<50;i+=10){
//    line(386,i+498,440, i+498);
//
//}
    
}



