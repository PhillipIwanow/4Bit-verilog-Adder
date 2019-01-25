`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/17/2019 02:11:45 PM
// Design Name: 
// Module Name: bin2bcd
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

module bin2bcd(
    input [7:0] bin,
    output reg [7:0] bcd
    
    );

    
    //input ports and their sizes
    
    //output ports and, their size

    //Internal variables
   integer i;
    always @(bin)
        begin
            
             if(bin <= 9)
                bcd = bin;
             else if(bin > 9)begin
                bcd = 0;
                for(i=0;i < 8; i = i + 1)
                    begin
                        bcd = {bcd[6:0], bin[7-i]};
                        if(i < 7 && bcd[3:0] > 4)
                            bcd[3:0] = bcd[3:0] + 3;
                        if(i < 7 && bcd[7:4] > 4)
                            bcd[7:4] = bcd[7:4] + 3;
                    end
               end
            if(bcd[7:4] == 3'b011)
                bcd[7:4] = 3'b100;
        end       
endmodule
              

