

// TFT display helper

width = 75.0;
height = 50.0;

wall_thickness = 1.5;
depth = 5.0 + wall_thickness;

cutout_width = 35.0;
cutout_height = 31.0;

bottom_left_x = 75.0 - 38.0 - 12.0;
bottom_left_y = (50.0 - (cutout_height + 2 * wall_thickness)) / 2;

// make the walls in the y direction additionally thick by this amount
wall_extension_left = 18.5;
wall_extension_right = 5.0;

difference () {
    
    union() {
        cube([width, height, wall_thickness]);
        translate([bottom_left_x, bottom_left_y, 0]) {
            cube([cutout_width + 2 *wall_thickness, wall_thickness, depth]);
            translate([0, cutout_height + wall_thickness, 0]) cube([cutout_width + 2 *wall_thickness, wall_thickness, depth]);
            translate([-wall_extension_left, 0, 0]) cube([wall_thickness + wall_extension_left, cutout_height + 2 *wall_thickness, depth]);
            translate([cutout_width + wall_thickness, 0, 0]) cube([wall_thickness + wall_extension_right, cutout_height + 2 * wall_thickness, depth]);
        }
    }
    translate([bottom_left_x + wall_thickness, bottom_left_y + wall_thickness, -1.0]) cube([cutout_width, cutout_height, wall_thickness + 2.0]);
}
