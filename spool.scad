$fn = 200;

module spool(){
    shaftRad    = 6/2 - .025;
    spoolRad    = 7.5;
    shaftDrad   = .5 + (5.45 - (shaftRad/2))/2;
    spoolHeight = 18;
    cutSize     = 1.10; //size of winding nylon
    
    difference(){
    
        //spool
        linear_extrude(spoolHeight)
        circle(spoolRad);
        
        //cut
        translate([0,0,-5])
        linear_extrude(spoolHeight+10)
        difference(){
            union(){
                circle(shaftRad);
                translate([-20,-(cutSize/2)])
                    square([20, cutSize]);
				translate([-2.5,0,-(cutSize/2)])
				circle(1);
            }
            translate([shaftDrad, -5]){
                square(10,10);
            }
			
        }
        
        //screw holes
        //translate([-spoolRad/2-1.5, 0, spoolHeight/2])
        //    rotate([90,0,0])
        //        cylinder(spoolHeight, 1, 1, center=true);
        
		//screw head void
        //translate([-spoolRad/2-1.5, shaftRad+spoolHeight/2+1, spoolHeight/2])
        //    rotate([90,0,0])
        //        cylinder(spoolHeight, 2.5, 2.5, center=true);
		
		//safety wire method
		hull(){
		translate([-spoolRad/2-2.5, shaftRad+spoolHeight/2+1, spoolHeight-5])
            rotate([90,0,0])
                cylinder(spoolHeight, 2.4, 2.4, center=true);
		translate([-spoolRad/2-2.5, shaftRad+spoolHeight/2+1, 5])
            rotate([90,0,0])
                cylinder(spoolHeight, 2.4, 2.4, center=true);
		}
		
		//shaft room for lack of slot
		translate([0,0,18-3.7])
			cylinder(10, shaftRad, shaftRad);
    }
    
}
    
spool();