$fn=100;
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

//gong_bang(80, 2, 2, 10, 40);



out_x=46;
out_y=26;
all_z=20;
all_r=4;

lr_width=3;
f_width=3;
b_width=10;
bottom_h=3;

gb_x=out_x-2*all_r;
gb_sx=1;
gb_mw=2;
gb_sy=6;

top_z=bottom_h;




difference () {
round_cube(out_x,out_y,all_z,all_r);    
translate([0,(f_width-b_width)/2,bottom_h]) round_cube(out_x-2*lr_width,out_y-f_width-b_width,all_z,all_r);
color([1,0,0])    
translate([0, (out_y - b_width)/2 + all_r, 2])
gong_bang(gb_x, gb_sx, gb_mw, gb_sy, all_z);
translate([0, out_y/2, bottom_h])    
    cube([gb_x-gb_sx-4, out_y, all_z], center=true);
}


//union() {
//round_cube(out_x,out_y,top_z,bottom_h);   
translate([-100, 0,all_z])
union() {
round_cube(out_x,out_y,bottom_h,all_r);        
    translate([0,0,bottom_h])
    difference() {
color([1,0,0])        
translate([0,(f_width-b_width)/2,0]) round_cube(out_x-2*lr_width,out_y-f_width-b_width,bottom_h,all_r);    
translate([0,(f_width-b_width)/2,1]) round_cube(out_x-4*lr_width,out_y-f_width-b_width-4,bottom_h,all_r);            }
color([0,0,1])
translate([0, (out_y - b_width)/2 + all_r, all_z/2-1])
gong_bang(gb_x, gb_sx, gb_mw, gb_sy, all_z);
//color([0,1,0])         
//translate([0,(f_width-b_width)/2,-(top_z)]) round_cube(out_x-4*lr_width,out_y-f_width-b_width-10,bottom_h+1,all_r);            
    }
//}


