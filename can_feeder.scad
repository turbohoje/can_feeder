//assuming an import of 1unit = 1mm
$fn=50;

$baseWidth = 120;
$baseDepth = $baseWidth;

$canRadius = 42;
$canLip = 2;

translate([-($baseWidth/2), -($baseDepth/2),0]){
    difference(){
        cube([$baseWidth,$baseDepth,45]);
        
        //can
        translate([($baseWidth/2), ($baseDepth/2), -10]){
            //can
            cylinder(200,$canRadius, $canRadius);
            //lip
            translate([0,0,38+10])
            cylinder(4,$canRadius+$canLip, $canRadius+$canLip);
        }
        
        //clamp cuts
        translate([($baseWidth/2), ($baseDepth/2)-5, -5])
            cube([($baseWidth/2)+10, 10, ($baseWidth/2)]);
        //hinge
        translate([($baseWidth/2)-$canRadius-10, ($baseDepth/2), -5])
            minkowski(){
                cube([($baseWidth/2)-10, .01, ($baseWidth/2)]);
                sphere(5);
            }
        
        //bolt
        translate([$canRadius+$baseWidth/2 + 5,$baseDepth+10,24])
            rotate([90,0,0])
                #cylinder($baseDepth+20, 3, 3);
        
    }
}