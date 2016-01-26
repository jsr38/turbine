
use <MCAD/polyholes.scad>;

$fn=100;

flange_r = 25.0;
core_r  = 10.0;
core_wall_thickness = 2.0;

flange_thickness = 3.0;

bobbin_length = 60.0;

mount_bolt_d = 3.0;
mount_bolt_offset = (flange_r - (core_r + core_wall_thickness)) / 2.0 + core_r + core_wall_thickness;


// core
difference() {
    union() {
        cylinder(r= core_r + core_wall_thickness, h= bobbin_length);
        cylinder(r= flange_r, h= flange_thickness);
        translate([0, 0, bobbin_length - flange_thickness]) cylinder(r= flange_r, h= flange_thickness);
    }
    cylinder(r = core_r, h=bobbin_length);
    // mount holes
    translate([mount_bolt_offset, 0, 0]) polyhole(d=mount_bolt_d, h= flange_thickness);
    translate([-mount_bolt_offset, 0, 0]) polyhole(d=mount_bolt_d, h= flange_thickness);
}
