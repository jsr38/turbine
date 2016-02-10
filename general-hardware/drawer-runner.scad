

use <MCAD/polyholes.scad>;
// Draw runner

function sumv(v,i,s=0) = (i==s ? v[i] : v[i] + sumv(v,i-1,s));

runner_push_fit_d       =  7.00;
runner_push_fit_h       =  8.00;
runner_insert_x_pitches =  [ 96.0, 64.0, 96.0];

runner_length = sumv(runner_insert_x_pitches, len(runner_insert_x_pitches) - 1, 0) + runner_push_fit_d + 3.00;
runner_width  =  9.00;
runner_height =  7.10;


module hex_nut() {
    n = 6;  // hex nut
    cylinder(h = h, r = r / cos (180 / n), $fn = n);
}

difference() {
    union() {
        cube([runner_length, runner_width, runner_height]);
        translate([runner_push_fit_d / 2.0 + 1.50, runner_width / 2.0, runner_height]) cylinder(r = runner_push_fit_d / 2.0, h = runner_push_fit_h, $fn=20);
        for (x_idx = [0:len(runner_insert_x_pitches) - 1]) {
            translate([sumv(runner_insert_x_pitches, x_idx, 0) + runner_push_fit_d / 2.0 + 1.50, runner_width / 2.0, runner_height]) cylinder(r = runner_push_fit_d / 2.0, h = runner_push_fit_h, $fn=20);
        }
    }
}