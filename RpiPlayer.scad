$fn=50;

out_x=86;
out_y=75;
all_z=50;
all_r=4;

all_y = out_y+2*all_r;
all_x = out_x+2*all_r;


b_screw_x = 29;
b_screw_y = 24.5;




lr_width=3;
f_width=3;
b_width=10;
bottom_h=3;

gb_x=out_x-2*all_r;
gb_sx=1;
gb_mw=2;
gb_sy=6;

top_z=bottom_h;


hdmi_look_x = 12;
hdmi_look_y = 5;
hdmi_x_pos = -(out_x/2 - 32);
hdmi_z_pos = all_z/2 - bottom_h - 11.5;


usb_look_x = 8;
usb_look_y = 4;
usb_x_pos  = -(out_x/2 - 10.6);
usb_z_pos = all_z/2 - bottom_h - 7;



side_look_x = 51;
side_look_y = 16;
side_z_pos = (all_z/2 - bottom_h - 15 );


uart_x=17;
uart_y=bottom_h+1;
uart_z=4;
    
uart_x_pos = 20;
uart_z_pos = (all_z/2 - bottom_h-uart_z/2);



rca1_x_pos  = -(out_x/2 - 15);
rca_z_pos = (all_z/2 - bottom_h - 27 );

rca2_x_pos  = -(out_x/2 - 35);

top_screw_h=8;




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