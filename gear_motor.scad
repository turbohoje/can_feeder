$fn=75;

module motor(){
    gearboxDia   = 37/2;
    gearboxDepth = 24.5;
    motorDia     = gearboxDia;//33/2;
    motorDepth   = 23;
    depth        = gearboxDepth + motorDepth;
    shaftBearing = 12/2;
    shaftBheight = 4.5;
    shaftDia     = 6/2;
    shaftLen     = 22;
    shaftOffset  = 10 - shaftDia;
    
    //gearbox
    linear_extrude(gearboxDepth)
        circle(gearboxDia);
    
    //motor
    translate([0,0,-motorDepth+.01])
    linear_extrude(motorDepth)
        circle(motorDia);
    
    //shaft bearing
    translate([shaftOffset,0,0+gearboxDepth])
    linear_extrude(shaftBheight)
        circle(shaftBearing);
    
    //shaft
    translate([shaftOffset,0,0+gearboxDepth])
    linear_extrude(shaftLen)
        circle(shaftDia);
}

motor();