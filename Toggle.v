`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/14/2019 06:41:32 PM
// Design Name: 
// Module Name: Toggle
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


module Toggle(
    input wire clk, btn, reset,
    output wire led
    );
    reg temp, stateNext, stateReg;
    parameter off = 1'b0,
              on = 1'b1;
              
     always @(posedge clk, posedge reset)
           begin
                if(reset)
                    stateReg <=  0;
                else
                    stateReg <= stateNext;
           end
     always @*
        begin
            stateNext = stateReg;
            temp = 1'b0;
            case(stateReg)
            off:begin
                temp = 1'b0;
                if(btn)
                    stateNext = on;
                end
            on: begin
                temp = 1'b1;
                if(btn)
                    stateNext = off;
                end
            endcase
         end
    assign led = temp;
endmodule
