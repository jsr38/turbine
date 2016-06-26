

// TFT display helper

width = 75.0;
height = 50.0;

wall_thickness = 1.5;
depth = 5.0 + wall_thickness;

cutout_width = 35.0;
cutout_height = 31.0;

bottom_left_x = 75.0 - 38.0 - 12.0;
bottom_left_y = (50.0 - (cutout_height + 2 * wall_thickness)) / 2;

difference () {
    union() {
        cube([width, height, wall_thickness]);
        translate([bottom_left_x, bottom_left_y, 0]) cube([cutout_width + 2 *wall_thickness, wall_thickness, depth]);
        translate([bottom_left_x, bottom_left_y + cutout_height + wall_thickness, 0]) cube([cutout_width + 2 *wall_thickness, wall_thickness, depth]);
        translate([bottom_left_x, bottom_left_y, 0]) cube([wall_thickness, cutout_height + wall_thickness, depth]);
        translate([bottom_left_x + cutout_width + wall_thickness, bottom_left_y, 0]) cube([wall_thickness, cutout_height + wall_thickness, depth]);
    }
    translate([bottom_left_x + wall_thickness, bottom_left_y + wall_thickness, -1.0]) cube([cutout_width, cutout_height, wall_thickness + 2.0]);
}
