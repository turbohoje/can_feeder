//assuming an import of 1unit = 1mm
$fn=50;

baseWidth = 120;
baseDepth = baseWidth;
clampHeight = 45;

canRadius = 42.5;
canLip = 2;

include <baseClamp.scad>;

%baseClamp();

module riser(){
    difference(){
        translate([-10, baseDepth/2 + 5, 0])
        rotate([90,0,0])
        linear_extrude(height=10)
        difference(){
            offset(5)
            polygon(points=[
                [baseWidth/2, -clampHeight/2], 
                [-baseWidth/2+10, -clampHeight/2], 
                [-baseWidth/2+10, clampHeight/2],
                [0, clampHeight + clampHeight*4/3],
                [20, clampHeight + clampHeight*4/3]
                ]
            );
            translate([10, clampHeight + clampHeight*4/3 -10, 0])
                circle(r=5);
            //#translate([baseWidth/2 + 3, 0, 0])
             //   circle(r=10);
        }
    
        baseClamp();
    }
}

riser();
mirror([0, 1, 0])
riser();