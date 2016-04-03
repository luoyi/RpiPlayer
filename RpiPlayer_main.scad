include <RpiPlayer.scad>


module LetterBlock(letter, font = "Consolas", size=3) {
    rotate([90,0,0]) color([0.8,0.1,0.1])
            linear_extrude(height=1, convexity=4)
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
    cylinder(h=top_screw_h+1, r=2.8, center=true);
    }
} 

module RpiPlayer_Main() {
    difference () {
    round_cube(out_x,out_y,all_z,all_r);
    color([0,0.5,0.5])
    translate([0,0,bottom_h]) round_cube(out_x-2*lr_width,out_y-2*f_width,all_z,all_r);
    translate([hdmi_x_pos, -(all_y - f_width)/2, -hdmi_z_pos])        hdmi_port();
    translate([usb_x_pos, -(all_y - f_width)/2, -usb_z_pos])        microusb_port();
    translate([(all_x - f_width)/2,0,-side_z_pos])        side_port();
    color([1.0,0,0]) translate([-uart_x_pos, (all_y-uart_y)/2+0.1, -(uart_z_pos)]) UART_port();
        
    translate([-(out_x/2-3.5), -b_screw_y, -(all_z/2-bottom_h/2)]) cylinder(h=bottom_h+1, r=3, center=true);
    translate([58-(out_x/2-3.5), -b_screw_y, -(all_z/2-bottom_h/2)]) cylinder(h=bottom_h+1, r=3, center=true);
    translate([58-(out_x/2-3.5), b_screw_y, -(all_z/2-bottom_h/2)]) cylinder(h=bottom_h+1, r=3, center=true);
    translate([-(out_x/2-3.5), b_screw_y, -(all_z/2-bottom_h/2)]) cylinder(h=bottom_h+1, r=3, center=true);

    translate([rca1_x_pos, -(all_y - f_width)/2, -rca_z_pos])        RCA_port();
    translate([rca2_x_pos, -(all_y - f_width)/2, -rca_z_pos])        RCA_port();

    translate([out_x/2, out_y/2, (all_z-top_screw_h)/2]) cylinder(h=top_screw_h+1, r=3, center=true);
     translate([out_x/2, -out_y/2, (all_z-top_screw_h)/2]) cylinder(h=top_screw_h+1, r=3, center=true);
    translate([-out_x/2, out_y/2, (all_z-top_screw_h)/2]) cylinder(h=top_screw_h+1, r=3, center=true);
    translate([-out_x/2, -out_y/2, (all_z-top_screw_h)/2]) cylinder(h=top_screw_h+1, r=3, center=true);


    }
    
}



translate([hdmi_x_pos, -all_y/2-0.1,-(all_z/2 - hdmi_z_pos-hdmi_look_y-5)]) scale([1.5,0.6,1.0]) LetterBlock("HDMI","Liberation Mono", 2);
translate([usb_x_pos, -all_y/2-0.1,-(all_z/2 - usb_z_pos-usb_look_y+2)]) LetterBlock("\uf011","FontAwesome", 3);


RpiPlayer_Main();

color([1,0,0,0]) translate([-uart_x_pos, (all_y-uart_y)/2-0.1, -(uart_z_pos+uart_z)]) UART_port();
translate([-uart_x_pos, (all_y)/2-0.1, -(uart_z_pos-2)]) rotate([0,0,180]) LetterBlock("GND RX DX VCC","Liberation Mono", 1);


translate([out_x/2, out_y/2, (all_z-top_screw_h)/2]) TopScrew();
translate([-out_x/2, -out_y/2, (all_z-top_screw_h)/2]) TopScrew();
translate([out_x/2, -out_y/2, (all_z-top_screw_h)/2]) TopScrew();
translate([-out_x/2, out_y/2, (all_z-top_screw_h)/2]) TopScrew();







    