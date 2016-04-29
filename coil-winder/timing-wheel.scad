
// Coil winder timing wheel

wheel_radius         = 25.0;
wheel_thickness      =  3.5;
wheel_centre_hole_r =  5.0;
wheel_slot_length    =  7.5;
//wheel_slot_width    =   1.0;
wheel_slot_n         = 60.0;
wheel_slot_width_outer = (PI / wheel_slot_n) * wheel_radius;
wheel_slot_width_inner = (PI / wheel_slot_n) * (wheel_radius - wheel_slot_length);

difference() {
    cylinder( r = wheel_radius, h = wheel_thickness, center = true, $fn = 100);
    cylinder( r = wheel_centre_hole_r, h = wheel_thickness + 2.0, center = true, $fn = 100);
    for (i = [ 0 : (360.0 / wheel_slot_n) : 360.0]) {
        rotate(a = i, v = [0,0,1]) {
            translate([- wheel_slot_width_inner / 2.0, wheel_radius - wheel_slot_length, -wheel_thickness / 2.0 - 1.0]) {
                //cube([wheel_slot_length, wheel_slot_width_inner, wheel_thickness], center = true);
                trapezoid(wheel_slot_width_inner, wheel_slot_width_outer, wheel_slot_length, wheel_thickness + 2.0);
            }
        }
    }
}

module trapezoid(width_base, width_top,height,thickness) {

  linear_extrude(height = thickness) polygon(points=[[0,0],[width_base,0],[width_base-(width_base-width_top)/2,height],[(width_base-width_top)/2,height]], paths=[[0,1,2,3]]); 
  
}
