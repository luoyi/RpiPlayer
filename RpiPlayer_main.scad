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

module RpiPlayer_Main() {
    difference () {
    round_cube(out_x,out_y,all_z,all_r);
    color([0,0.5,0.5])
    translate([0,0,bottom_h]) round_cube(out_x-2*lr_width,out_y-2*f_width,all_z,all_r);
    translate([hdmi_x_pos, -(all_y - f_width)/2, -hdmi_z_pos])        hdmi_port();
    translate([usb_x_pos, -(all_y - f_width)/2, -usb_z_pos])        microusb_port();
    translate([(all_x - f_width)/2,0,0])        side_port();
    color([1.0,0,0]) translate([-uart_x_pos, (all_y-uart_y)/2+0.1, -(all_z/6)]) UART_port();
        
    }
    
}



translate([hdmi_x_pos, -all_y/2-0.1,hdmi_z_pos/2]) scale([1.5,0.6,1.0]) LetterBlock("HDMI","Liberation Mono", 2);
translate([usb_x_pos, -all_y/2-0.1,usb_z_pos/2-1]) LetterBlock("\uf011","FontAwesome", 3);


RpiPlayer_Main();

color([1.0,0,0]) translate([-uart_x_pos, (all_y-uart_y)/2-0.1, -(all_z/6+uart_z)]) UART_port();
translate([-uart_x_pos, (all_y)/2-0.1, -(all_z/6-uart_z)]) rotate([0,0,180]) LetterBlock("GND RX DX VCC","Liberation Mono", 1);






    