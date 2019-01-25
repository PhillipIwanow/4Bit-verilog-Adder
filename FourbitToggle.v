`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/17/2019 01:23:34 PM
// Design Name: 
// Module Name: FourbitToggle
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module FourbitToggle(
    input wire clk, reset,
    input wire [3:0] btn,
    output wire [3:0] led
    );
    Toggle tg_0(.clk(clk), .reset(reset), .btn(btn[0]), .led(led[0]));
    Toggle tg_1(.clk(clk), .reset(reset), .btn(btn[1]), .led(led[1]));
    Toggle tg_2(.clk(clk), .reset(reset), .btn(btn[2]), .led(led[2]));
    Toggle tg_3(.clk(clk), .reset(reset), .btn(btn[3]), .led(led[3]));
    
endmodule
