$fn=50;



module baseClamp(){
    union(){
        lipSize =3;
        difference(){
            union(){
                cube([$baseWidth,$baseDepth,45], center=true);
                
                //top lip
                translate([0,0,45/2])
                linear_extrude(3)
                    circle($canRadius-lipSize+10);
                
                translate([$baseWidth/2, 0, 0])
                cube([40, 75, 45], center=true);
            }
            
            //can
            //translate([($baseWidth/2), ($baseDepth/2), -10]){
                //can
                translate([0,0,-8])
                 cylinder(50,$canRadius, $canRadius, center=true);
                //lip
                translate([0,0,16])
                cylinder(4,$canRadius+$canLip, $canRadius+$canLip, center=true);
                //smaller top lip
                #cylinder(60,$canRadius-lipSize, $canRadius-lipSize, $fn=300, center=true);
            //}
            
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
            translate([$baseWidth/2+12, 0, 0])
                rotate([90,0,0])
                    cylinder($baseDepth+20, 3, 3, center=true);
                
            //peg holes, slight taper for captivity 6.35/2 is .25"
            xy_radius = $baseWidth/2-6;
            for($x = [-1,1]){
                for($y = [-1,1]){
                translate([$x*xy_radius, $y*xy_radius, 12])
                    cylinder(45, 6/2, 6.4/2, center=true);
                }
            }
            
        }
    }
}

module defaults(){
    
    $baseWidth = 120;
    $baseDepth = $baseWidth;
    $clampHeight = 45;

    $canRadius = 42.7;
    $canLip = 3;  
        
    baseClamp();
}

defaults();
