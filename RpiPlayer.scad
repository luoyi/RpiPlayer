$fn=100;

out_x=64;
out_y=40;
all_z=36;
all_r=4;

all_y = out_y+2*all_r;
all_x = out_x+2*all_r;

hdmi_look_x = 12;
hdmi_look_y = 6;

usb_look_x = 6;
usb_look_y = 3;

side_look_x = 30;
side_look_y = 15;

hdmi_x_pos = 5;
hdmi_y_pos = 1;
hdmi_z_pos = 5;

usb_x_pos  = -15;
usb_z_pos  = 5;

uart_x=10;
uart_y=8;
uart_z=2;
    
uart_x_pos = 10;
uart_z_pos = 20;


lr_width=3;
f_width=3;
b_width=10;
bottom_h=3;

gb_x=out_x-2*all_r;
gb_sx=1;
gb_mw=2;
gb_sy=6;

top_z=bottom_h;




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
    translate([-(all_x-side_x)/2, side_y/2,0])
    cylinder(r=side_x, h=h, center=true);
    translate([-(all_x-side_x)/2, -side_y/2,0])
    cylinder(r=side_x, h=h, center=true);    
    translate([(all_x-side_x)/2, -side_y/2,0])
    cylinder(r=side_x, h=h, center=true);    
    translate([(all_x-side_x)/2, side_y/2,0])
    cylinder(r=side_x, h=h, center=true);    
}


shrink=0.1;
module gong_bang_shrink(all_x, side_x, mid_w, side_y, h) {
    gong_bang(all_x-shrink, side_x-shrink, mid_w-shrink, 
        side_y-shrink, h);
}