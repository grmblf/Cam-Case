/*
    Model by Curial Orrit - 2018
    All rights reserved
*/

//color("grey")
difference(){

// 1st go: SOLID BODY
resize([200,100,80], auto=true) {
    hull(){
        intersection(){
            translate([0,0,-100])
            rotate([0,80,0])
            cylinder(d=300, h=200, $fn=100, center=false);
            
            translate([0,-50,0])
            cube([100,100,180]);
        } // end intersect

        intersection(){
            translate([100,0,-80.13])
            rotate([0,90,0])
            cylinder(d=300, h=200, $fn=100, center=false);
            translate([100,-50,0])
            cube([100,100,180]);
        } // end intersect
    } // end hull
} // end resize

// 2nd go: HOLLOW
resize([190,90,70], auto=true) {
    hull(){
        intersection(){
            translate([0,0,-100])
            rotate([0,80,0])
            cylinder(d=300, h=200, $fn=100, center=false);
            
            translate([5,-50,5])
            cube([100,100,180]);
        } // end intersect

        intersection(){
            translate([100,0,-80.13])
            rotate([0,90,0])
            cylinder(d=300, h=200, $fn=100, center=false);
            translate([100,-50,5])
            cube([100,100,180]);
        } // end intersect
    } // end hull
} // end resize


// "finestra" frontal
translate([190,-35,15]) {
    minkowski(){
            cube([80,70,40]);
            sphere(5, center=true);
    }
}

// forat posterior
translate([-1,0,15])
rotate([0,90,0])
cylinder(r=5, h=10);

} // end difference



// suports
difference() {
    union(){
        hull(){ // 1st axis
            translate([50,60,2.5])
            cylinder(r=10, h=5, center=true);
            translate([50,-60,2.5])
            cylinder(r=10, h=5, center=true);
        }
        hull(){ // 2nd axis
            translate([150,60,2.5])
            cylinder(r=10, h=5, center=true);
            translate([150,-60,2.5])
            cylinder(r=10, h=5, center=true);
        }
    } // end union/color
    
    // holes
    for(i=[[50,60,0], [150,60,0], [50,-60,0], [150,-60,0]]){
        translate(i)
        cylinder(r=5, h=11, center=true);
    }    
} // end difference
