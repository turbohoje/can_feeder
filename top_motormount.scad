$fn = 50;


$baseWidth = 120;
$baseDepth = $baseWidth;
$clampHeight = 45;
$canRadius = 42.5;
$canLip = 2;

use <baseClamp.scad>;
use <gear_motor.scad>;

$lidHeight = 30;
module topMotorMount(){
	difference(){
		union(){
			cube([$baseWidth,$baseDepth,$lidHeight], center=true);
			
			//clamp
			translate([0,-27,7])
				rotate([90,0,0])
				cylinder(25, 6+37/2, 6+37/2, center=true);
			translate([-20,-27,10])
			cube([25,25,25], center=true);
		}
		
		//clampCuts
		translate([-20,-27,16.5])
			cube([26,26,3], center=true);
		translate([-25,-26,20])
			rotate([0,0,0])
			cylinder(15, 1, 1, center=true);
		#translate([-25,-26,22])
			rotate([0,0,0])
			cylinder(11, 2, 2, center=true);
		
		//peg holes, slight taper for captivity 6.35/2 is .25"
		xy_radius = $baseWidth/2-6;
		for($x = [-1,1]){
			for($y = [-1,1]){
			translate([$x*xy_radius, $y*xy_radius, -$lidHeight/2 ])
				cylinder($lidHeight*(.8), 6.4/2, 6/2, center=true);
			}
		}
		
		//center cutout
		translate([0,0,-2])
		cube([20, 20, $lidHeight +5], center=true);
		
		//motor cut
		minkowski(){
			translate([0,21-$baseWidth/2,7]){
				rotate([0,90,90])
				motor();
			}
			sphere(.75);
		}
		
		//reliefs
		relief();
		rotate([0,0,180])
			relief();
		rotate([0,0,-90])
			relief();
	}
}

module relief(){
	inset = 5;
	innersq = 50;
	
	translate([0,0,-($lidHeight+5)/2])
	linear_extrude($lidHeight+5){
		difference(){
			polygon(points=[
				[-$baseWidth/2-inset, -$baseDepth/2+inset],
				[-$baseWidth/2-inset, $baseDepth/2-inset],
				[0,0]
			]);
			square([$baseWidth-innersq,$baseDepth-innersq], center=true);
		}
	}
}


topMotorMount();


%translate([0,0,-100])
baseClamp();

