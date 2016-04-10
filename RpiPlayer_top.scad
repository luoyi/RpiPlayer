include <RpiPlayer.scad>



lcd_x = 73;
lcd_y = 44;

lcd_screw = 8;
lcd_sx = (lcd_x - lcd_screw)/2;
lcd_sy = (lcd_y - lcd_screw)/2;


module RpiPlayer_Top() {
    
    difference() {
    round_cube(out_x,out_y,bottom_h,all_r);
    translate([out_x/2, out_y/2, 0]) cylinder(h=bottom_h+1, d=2.1, center=true);
     translate([out_x/2, -out_y/2, 0]) cylinder(h=bottom_h+1, d=2.1, center=true);
    translate([-out_x/2, out_y/2, 0]) cylinder(h=bottom_h+1, d=2.1, center=true);
    translate([-out_x/2, -out_y/2, 0]) cylinder(h=bottom_h+1, d=2.1, center=true);
        cube([73, 44, bottom_h+1], center=true);
        
    translate([-25, (out_y/2-bottom_h), 0] )   cube([10,4,bottom_h+1], center=true);
        
        for (x=[-35:5:35]) {
            translate([x, -26, 0] )  cylinder(h=bottom_h+1, r=1.5, center=true);
            translate([x, -32, 0] )  cylinder(h=bottom_h+1, r=1.5, center=true);
            
            if ( x < -10 || x > 10 ) {
                translate([x, -39, 0] )  cylinder(h=bottom_h+1, r=1.5, center=true);
            //      translate([x, 39, 0] )  cylinder(h=bottom_h+1, r=1.5, center=true);
              
            }


            translate([x, 26, 0] )  cylinder(h=bottom_h+1, r=1.5, center=true);
            if ( x != -30 && x != -25 && x != -20 ) 
            translate([x, 32, 0] )  cylinder(h=bottom_h+1, r=1.5, center=true);


        }
    }    

}



RpiPlayer_Top();

color([1.0, 0,0]){
translate([lcd_sx, lcd_sy, -1.5/2]) cube([lcd_screw, lcd_screw, 1.5], center=true);
translate([lcd_sx, -lcd_sy, -1.5/2]) cube([lcd_screw, lcd_screw, 1.5], center=true);

translate([-lcd_sx, -lcd_sy, -1.5/2]) cube([lcd_screw, lcd_screw, 1.5], center=true);

translate([-lcd_sx, lcd_sy, -1.5/2]) cube([lcd_screw, lcd_screw, 1.5], center=true);
    
translate([-25,(out_y/2-bottom_h)-2-1, -6/2+0.2]) cube([10, 2, 6], center=true);
    

top_side_x = all_x/2 - bottom_h - 2/2-1.5;
top_side_y = all_y/2 - bottom_h - 2/2-1.5;
    
translate([top_side_x,0,-3]) rotate([0,0,90]) cube([20, 2, 3], center=true);
translate([-top_side_x,0,-3]) rotate([0,0,90]) cube([20, 2, 3], center=true);
    
translate([0,-top_side_y,-3])  cube([20, 2, 3], center=true);
translate([0,top_side_y,-3])  cube([20, 2, 3], center=true);
    
    





}

