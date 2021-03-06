use <..\Configuration.scad>
include <servo.scad>
use <Pivot.scad>

padW =	16;
padD =	78;
padH =	4;

pivotW = 12;
pivotR = 12/2;
pivotH = 13.8;
pivotD = 28.85;

pivotSpaceD = 9.7;
pivotSpaceOff = 9.6;
pivotBarR=4/2;
pivotStartOff = 2.5;
servoOffset =  (pivotD*2)-(1/2*pivotD)+4;


mirror([1,0,0]){
difference(){
	union(){
		translate([0,pivotStartOff,padH])
		difference(){
			hull(){
				translate([0,0,pivotH-pivotR]) rotate([270,0,0]) cylinder(r=pivotR,h=pivotD,$fn=30);
				translate([-pivotR,0,0]) cube([pivotR*2,pivotD,1]);
			}
			translate([-pivotR-.1,pivotSpaceOff,-.1]) cube([pivotR*2+.2,pivotSpaceD,pivotH+.1]);
			translate([0,-.1,pivotH-pivotR]) rotate([270,0,0])cylinder(r=pivotBarR,h=pivotD+.2,$fn=20);
		}
		
		translate([-padW/2,0,0])cube([padW,padD,padH]);

		difference(){
			translate([-padW/2-4+.5,servoOffset-2,0])cube([servoW+4,servoD+4,6]);
			translate([-servoDriver,servoOffset,(-servoH/2)+pivotH-pivotR+padH])servo();
		}
	}


	
	union(){
		
		translate([0,50,-1.9]){
		zipBoomCut();
		}	
		translate([0,74,-1.9]){
		zipBoomCut();
		}
		translate([-servoDriver,56.7,1.9]){
		zipCut();
		}
		translate([-servoDriver,63.2,1.9]){
		zipCut();
		}
		translate([-servoDriver,69.7,1.9]){
		zipCut();
		}
		translate([0,(pivotSpaceOff+pivotStartOff)/2,0]){
			arch();
		}
		translate([0,(pivotSpaceOff+pivotStartOff)*2+.5,0]){
			arch();
		}
	}	
}
}

module zipCut(){
			difference(){
				translate([-servoW/2-2,0,-2])cube([servoW+4.1,3,6.2]);
				translate([-servoW/2+.05,-1,-1])cube([servoW-.1,5,6]);
			}
			}
			
module zipBoomCut(){
boomW=13;
			difference(){
				translate([(-boomW/2)-1,0,0])cube([boomW+2,3,6]);
				translate([-(boomW-4)/2,-1,-1])cube([boomW-4,5,6]);
			}
}

module arch() {
	difference(){
		hull(){
			translate([0,0,pivotH-pivotR+4]) rotate([270,0,0]) cylinder(r=pivotR+.5,h=3,$fn=30);
			translate([-pivotR-.5,0,-.2]) cube([pivotR*2+1.2,3,1]);
		}
		hull(){
			translate([0,-.1,pivotH-pivotR+3.9]) rotate([270,0,0]) cylinder(r=pivotR-2,h=3.2,$fn=30);
			translate([-pivotR+2,-.1,-1]) cube([pivotR*2-4,3.2,1]);
		}

	}
}


%translate([0,pivotSpaceD+pivotStartOff,(padH*2)+pivotH-pivotR+3.35])mirror([0,0,1])pivot();
mirror(1,0,1){
%translate([-servoDriver,servoOffset,(-servoH/2)+pivotH-pivotR+padH])servo();
}
