

module baseClamp(){
    union(){
        difference(){
            cube([baseWidth,baseDepth,45], center=true);
            
            //can
            //translate([(baseWidth/2), (baseDepth/2), -10]){
                //can
                cylinder(200,canRadius, canRadius, center=true);
                //lip
                translate([0,0,18])
                cylinder(4,canRadius+canLip, canRadius+canLip, center=true);
            //}
            
            //clamp cuts
            translate([(baseWidth/2), 0, -5])
                cube([(baseWidth/2)+10, 10, (baseWidth/2)], center=true);
            //hinge
            translate([(baseWidth/4)-canRadius-10, 0, -5])
                union(){    
                    cube([(baseWidth/2), 10, (baseWidth/2)], center=true);
                    hull(){
                        translate([-(baseWidth/4), 0, 45])
                            sphere(d=10);
                        translate([-(baseWidth/4), 0, -45])
                            sphere(d=10);
                    }
                }
                //}
            
            //bolt
            translate([canRadius+10, 0, 0])
                rotate([90,0,0])
                    cylinder(baseDepth+20, 3, 3, center=true);
            
        }
    }
}
