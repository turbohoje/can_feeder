$fn=50;



module baseClamp(){
    union(){
        lipSize =3;
        difference(){
            union(){
                cube([$baseWidth,$baseDepth,45], center=true);
                
                //top lip
                //translate([0,0,45/2])
                //linear_extrude(3)
                //    circle($canRadius-lipSize+10, $fn=500);
                
            }
            
            //can
                //can
			translate([0,0,-8])
			 cylinder(50,$canRadius, $canRadius, center=true);
			//lip
			translate([0,0,16])
				cylinder(4,$canRadius+$canLip, $canRadius+$canLip, center=true);
			//smaller top lip
			cylinder(60,$canRadius-lipSize, $canRadius-lipSize, $fn=300, center=true);
			//printing upside down, dont want to scaffold, this cone is for cleanlyness
			translate([0,0,12.01])
				cylinder(4,$canRadius, $canRadius+$canLip, center=true);
            
            //clamp cuts
            translate([($baseWidth/2), 0, -1])
                cube([($baseWidth/2)+10, 10, ($baseWidth/2)], center=true);
            //hinge
            translate([($baseWidth/4)-$canRadius-10, 0, -1])
                union(){    
                    cube([($baseWidth/2), 10, ($baseWidth/2)], center=true);
                    hull(){
                        translate([-($baseWidth/4), 0, 45])
                            sphere(d=10);
                        translate([-($baseWidth/4), 0, -45])
                            sphere(d=10);
                    }
                }
                //}
            
            //bolt
//            translate([$baseWidth/2+12, 0, 0])
//                rotate([90,0,0])
//                    cylinder($baseDepth+20, 3, 3, center=true);
                
            //peg holes, slight taper for captivity 6.35/2 is .25"
            xy_radius = $baseWidth/2-6;
            for($x = [-1,1]){
                for($y = [-1,1]){
                translate([$x*xy_radius, $y*xy_radius, 12])
                    cylinder(45, 6/2, 6.6/2, center=true);
				#translate([$x*xy_radius, $y*xy_radius, -11.5])	
					cylinder(2, 0, 6/2, center=true);
                }
            }
			
			//cutaway for snap
			standoff=5;
			yattach=25;
            
			tighten = -1;
			innes	= 3;
			
			translate([0,0,-45/2-.5])
			linear_extrude(46)
				polygon(points=[
					[$baseWidth/2+standoff-innes, -yattach-tighten-2],
					[$baseWidth/2-standoff-innes, -yattach-tighten],
					[$baseWidth/2+2*standoff-innes, -yattach-(2*standoff)-tighten],
				]);
        }
		
		//add the snap
		standoff=4;
		yattach=25;
		
		translate([0,0,-45/2])
		linear_extrude(45){
			polygon(points=[
				[$baseWidth/2, yattach],
				//thin part
				[$baseWidth/2+standoff + (standoff/2), yattach],
				[$baseWidth/2+standoff + (standoff/2), yattach-10],
			
				[$baseWidth/2+standoff, -yattach-1.5],
				[$baseWidth/2-standoff, -yattach],
				[$baseWidth/2+2*standoff, -yattach-(2*standoff)],
				[$baseWidth/2+2*standoff, yattach+standoff*2],
				[$baseWidth/2, yattach+ 2*standoff],
		
			]);
		}
		
		
    }
}

module defaults(){
    
    $baseWidth = 120;
    $baseDepth = $baseWidth;
    $clampHeight = 45;

    $canRadius = 42.65;
	$canLip = 3;  
        
    difference(){
		baseClamp();
		
		translate([0,$baseWidth/2+.1, 0])
			rotate([0,0,180])
				scale([1.01,1.01,1.01])
				cleat();
	}
		
	translate([0,-$baseWidth/2, 0])
		rotate([0,0,180])
			cleat();
}

module cleat(){
	cleatThickness 	= 10;
	cleatAngle		= 45;
	cleatWidth		= 20;
	cleatHeight		= 45;
	shrink			= .7;
	
	translate([0,0,-cleatHeight/2])
		hull(){
			linear_extrude(1) //tricks hull
			polygon(points=[
				[cleatWidth, 0],
				[cleatWidth + cleatThickness * sin(cleatAngle), cleatThickness * cos(cleatAngle)],
				[-cleatWidth - cleatThickness * sin(cleatAngle), cleatThickness * cos(cleatAngle)],
				[-cleatWidth, 0],
		
			]);
			translate([0,0,cleatHeight])
			linear_extrude(.001)
			polygon(points=[
				[shrink*cleatWidth, 0],
				[shrink*cleatWidth + cleatThickness * sin(cleatAngle), cleatThickness * cos(cleatAngle)],
				[shrink*-cleatWidth - cleatThickness * sin(cleatAngle), cleatThickness * cos(cleatAngle)],
				[shrink*-cleatWidth, 0],
		
			]);
		}
		
}


defaults();
