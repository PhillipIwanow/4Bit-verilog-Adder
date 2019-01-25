module Adder(
    input wire clk,
    input wire [1:0] sw, 
    input wire [3:0] btn,
    output wire [2:0] led4, led5,
    output wire [3:0] led
    );
  
   wire[3:0] tgl;
   wire[7:0] Bcd_out;
   reg[2:0] stateNext, stateReg;
   reg[3:0] num1, num2,temp, temp2;
   reg[7:0] total, disp;
   integer i;
   parameter load1 = 3'b000,
             load2 = 3'b001,
             add = 3'b010;
   
   FourbitToggle(.clk(clk), .reset((btn[3] & btn[0])), .btn(btn), .led(tgl));
   bin2bcd(.bin(total), .bcd(Bcd_out));
   always @(posedge clk)
        begin
            stateReg <= stateNext;
         end 
    
    always @*
        begin
            stateNext = load1;
            num1 = 0; 
            num2 = 0; 
            disp = 0;
            case(stateReg)
                    load1:begin
                        num1 = tgl;
                        disp[3:0] = num1;
                        if(sw[0] & ~sw[1])
                            begin
                            stateNext = load2;
                            temp = num1;
                             
                            end
                        else
                            stateNext = load1;
                     end
                    load2:begin
                        num2 = tgl;
                        disp[3:0] = num2;
                        temp2 = num2;
                        if(sw[1] & sw[0])begin
                            stateNext = add;
                            
                             end
                        else
                            stateNext = load2;
                        end
                    add:
                        begin
                            total = temp + temp2;
                            disp = Bcd_out;
              
                           if(~sw[0] & ~sw[1])
                            begin
                            stateNext = load1;
                            total = 0;end
                        else
                            stateNext = add;
                        end
                  endcase
               end
       
           
    assign led = disp[3:0]; 
    assign led4 = disp[6:4] ;
    assign led5 = stateReg;
  
endmodule
