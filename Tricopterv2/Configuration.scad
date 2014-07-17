in = 25.4;
tubeInWidth = 10.5;
tubeWall = 2.8;
tubeOutWidth = tubeInWidth+2*tubeWall;

boltHead = 8.5; 
boltR = 2;

filletRad = 5;

module fillet(){
	difference(){
		translate([0,0,-.5]) cube([filletRad+2,filletRad+2,height+1]);
		translate([0,0,-1])cylinder(r=filletRad, h=height+2, $fn=60);
	}
}

	plugWidth = 15.8;
	plugHeight = 8.8;
	plugDepth = 20.2;
	wall = 1.5;
	hole = 1.5;
