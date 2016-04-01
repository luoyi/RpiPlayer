include <RpiPlayer.scad>



module RpiPlayer_Main() {
    difference () {
    round_cube(out_x,out_y,all_z,all_r);    
    translate([0,(f_width-b_width)/2,bottom_h]) round_cube(out_x-2*lr_width,out_y-f_width-b_width,all_z,all_r);
    color([1,0,0])    
    translate([0, (out_y - b_width)/2 + all_r, 2])
    gong_bang(gb_x, gb_sx, gb_mw, gb_sy, all_z);
    translate([0, out_y/2, bottom_h])    
        cube([gb_x-gb_sx-4, out_y, all_z], center=true);
    }
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


