module round_cube(size_x, size_y, size_z, r) {
union() {
cube([size_x + 2*r, size_y, size_z], center=true);
cube([size_x , size_y + 2*r, size_z], center=true);
translate([-size_x/2, -size_y/2, 0]) cylinder(h=size_z, r=r, center=true);
translate([size_x/2, -size_y/2, 0]) cylinder(h=size_z, r=r, center=true);
translate([size_x/2, size_y/2, 0]) cylinder(h=size_z, r=r, center=true);
translate([-size_x/2, size_y/2, 0]) cylinder(h=size_z, r=r, center=true);
}

}

module gong_bang(all_x, side_x, mid_w, side_y, h) {
    cube([all_x, mid_w, h], center=true);
    translate([(all_x-side_x)/2, 0,0]) cube([side_x, side_y, h], center=true);
    translate([-(all_x-side_x)/2, 0,0]) cube([side_x, side_y, h], center=true);
}

gong_bang(80, 2, 2, 10, 40);


/*
color([0.5,0.5,0.99]) 
difference () {
round_cube(80+6,60+6,40,4);    
translate([0,-2,3]) round_cube(80,58,40,4);
//translate([0,20,3]) round_cube(70,3,20,4);
translate([0,33.5,2]) cube([70,3,40],center=true);
}
*/

