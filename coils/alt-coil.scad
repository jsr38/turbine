
use <MCAD/polyholes.scad>;

$fn=100;

flange_r = 28.0;
core_r  =  18.5;
core_wall_thickness = 4.5;
shaft_hole_r = 7.0;
flange_thickness = 4.5;
bobbin_length = 29.0;

mount_bolt_d = 6.25;
mount_bolt_offset = 18.5 + 5.0;
//(flange_r - (core_r + core_wall_thickness)) / 2.0 + core_r + core_wall_thickness;

// core
difference() {
    union() {
        difference() {
            cylinder(r= core_r, h= bobbin_length);
            cylinder(r = core_r - core_wall_thickness, h=bobbin_length);
        }
        
        cylinder(r= flange_r, h= flange_thickness);
        translate([0, 0, bobbin_length - flange_thickness]) cylinder(r= flange_r, h= flange_thickness);
    }
    
    // shaft hole
    cylinder(r = shaft_hole_r, h=bobbin_length);
    // mount holes
    translate([mount_bolt_offset, 0, 0]) polyhole(d=mount_bolt_d, h= flange_thickness);
    rotate([0,0,120]) translate([mount_bolt_offset, 0, 0]) polyhole(d=mount_bolt_d, h= flange_thickness);
    rotate([0,0,-120]) translate([mount_bolt_offset, 0, 0]) polyhole(d=mount_bolt_d, h= flange_thickness);
    translate([-flange_r, -flange_r, bobbin_length / 2.0]) cube([flange_r * 2.0, flange_r * 2.0, bobbin_length / 2.0]);
}
