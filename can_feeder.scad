//assuming an import of 1unit = 1mm
$fn=50;

baseWidth = 120;
baseDepth = baseWidth;
clampHeight = 45;

canRadius = 42;
canLip = 2;

include <baseClamp.scad>;

//%baseClamp();

module riser(){
    difference(){
        translate([-10, baseDepth/2 + 5, 0])
        rotate([90,0,0])
        linear_extrude(height=10)
        difference(){
        polygon(points=[
            [baseWidth/2, -clampHeight/2], 
            [-baseWidth/2, -clampHeight/2], 
            [-baseWidth/2, clampHeight + clampHeight*4/3]
            ]
        );
        translate([-baseWidth/2 + 7, clampHeight + clampHeight*4/3 - 20, 0])
        circle(r=5);
        }
    
        baseClamp();
    }
}

riser();
mirror([0, 1, 0])
riser();