include <RpiPlayer.scad>


module LetterBlock(letter, font = "Consolas", size=3) {
    rotate([90,0,0]) color([0.8,0.1,0.1])
            linear_extrude(height=2, convexity=4)
                text(letter, 
                     size=size,
                     font=font,
                     halign="center",
                     valign="center");
    
    
}

module hdmi_port() {
    
    // we'll rotate x and y, so swap them
    hdmi_x = hdmi_look_y;
    hdmi_y = hdmi_look_x;
    rotate([0,90,90]) color([0.5, 0.3, 0.1])
    round_cube(hdmi_x, hdmi_y, f_width+0.1, 2);
}

module microusb_port() {
    usb_x = usb_look_y;
    usb_y = usb_look_x;
    rotate([0,90,90]) color([0.5, 0.3, 0.1])
    round_cube(usb_x, usb_y, f_width+0.1, 2);
}

module side_port() {
    side_x = side_look_y;
    side_y = side_look_x;
    
    rotate([90,90,90]) color([0.5, 0.3, 0.1])
    round_cube(side_x, side_y, f_width+0.1, 2);
}

module UART_port() {

    cube([uart_x, uart_y, uart_z], center=true);
}

module RCA_port() {
    rotate([0,90,90]) color([0.5, 0.3, 0.1])
    cylinder(h=bottom_h+0.1, r=12/2, center=true);
}
module TopScrew() {
    difference() {
    cylinder(h=top_screw_h, r=4, center=true);
    cylinder(h=top_screw_h+1, d=2.1, center=true);
    }
} 
module side_ring() {
    
       difference() {
    cylinder(h=3, r=4, center=true);
    cylinder(h=3+1, r=3, center=true);
           translate([-3, 0,0]) cube([3,4, 5], center=true);
    } 
} 


module cross_cube() {
    rotate([90,0,0]) union() {
    cube([2, 8, bottom_h+1], center=true);
    rotate([0,0,90]) cube([2, 8, bottom_h+1], center=true);
    }
}


module sd_port() {
          round_cube(4, 15, 9, 2);
}

module RpiPlayer_Main() {
    difference () {
    round_cube(out_x,out_y,all_z,all_r);
    color([0,0.5,0.5])
    translate([0,0,bottom_h]) round_cube(out_x-2*lr_width,out_y-2*f_width,all_z,all_r);
        
   
    translate([hdmi_x_pos, -(all_y - f_width)/2, -hdmi_z_pos])        hdmi_port();
    
    translate([usb_x_pos, -(all_y - f_width)/2, -usb_z_pos])        microusb_port();
    translate([rca1_x_pos, -(all_y - f_width)/2, -rca_z_pos])        RCA_port();
    translate([rca2_x_pos, -(all_y - f_width)/2, -rca_z_pos])        RCA_port();
        
    
    translate([(all_x - f_width)/2,0,-side_z_pos])        side_port();
    
    color([1.0,0,0]) translate([-uart_x_pos, (all_y-uart_y)/2+0.1, -(uart_z_pos)]) UART_port();
        
    translate([-b_screw_x, -b_screw_y, -(all_z/2-bottom_h/2)]) cylinder(h=bottom_h+1, d=2.1, center=true);
    translate([-b_screw_x, -b_screw_y+49, -(all_z/2-bottom_h/2)]) cylinder(h=bottom_h+1, d=2.1, center=true);
    translate([-b_screw_x+58, -b_screw_y+49, -(all_z/2-bottom_h/2)]) cylinder(h=bottom_h+1, d=2.1, center=true);
    translate([-b_screw_x+58, -b_screw_y, -(all_z/2-bottom_h/2)]) cylinder(h=bottom_h+1, d=2.1, center=true);

    translate([-(all_x-4)/2, -b_screw_y+49/2,-usb_z_pos]) sd_port();
translate([-20, all_y/2-bottom_h/2, 10]) cross_cube();
translate([20, all_y/2-bottom_h/2, 10]) cross_cube();

      

    translate([out_x/2, out_y/2, (all_z-top_screw_h)/2]) cylinder(h=top_screw_h+1, d=2.1, center=true);
     translate([out_x/2, -out_y/2, (all_z-top_screw_h)/2]) cylinder(h=top_screw_h+1, d=2.1, center=true);
    translate([-out_x/2, out_y/2, (all_z-top_screw_h)/2]) cylinder(h=top_screw_h+1, d=2.1, center=true);
    translate([-out_x/2, -out_y/2, (all_z-top_screw_h)/2]) cylinder(h=top_screw_h+1, d=2.1, center=true);
    
translate([-uart_x_pos, (all_y)/2-0.1-0.8, -(uart_z_pos-3)]) rotate([0,0,180]) LetterBlock("GND RX DX VCC","Liberation Mono", 1);

translate([uart_x_pos-5, (all_y)/2-0.1-1, -(uart_z_pos-6)]) rotate([0,0,180]) LetterBlock("ES9023 RpiPlayer","Liberation Mono", 3);

}

    
}

RpiPlayer_Main();







translate([out_x/2, out_y/2, (all_z-top_screw_h)/2]) TopScrew();
translate([-out_x/2, -out_y/2, (all_z-top_screw_h)/2]) TopScrew();
translate([out_x/2, -out_y/2, (all_z-top_screw_h)/2]) TopScrew();
translate([-out_x/2, out_y/2, (all_z-top_screw_h)/2]) TopScrew();
translate([-all_x/2-2.4, -all_y/2+8, all_z/2-3]) side_ring();
translate([-all_x/2-2.4, -all_y/2+8, all_z/2-10]) side_ring();

translate([25, -all_y/2-3, all_z/2-3]) rotate([0,0,90]) side_ring();
translate([25, -all_y/2-3, all_z/2-10]) rotate([0,0,90]) side_ring();

     


//color([1.0,0.0, 0]) translate([-uart_x_pos, (out_y-6)/2+1.2, -(uart_z_pos)-uart_y/2-1]) cube([uart_x, 6, 2], center=true);

    