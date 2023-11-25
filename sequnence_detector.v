`timescale 1ns / 1ps
module sequnence_detector(
input din,
input clk,
input rst,
output reg dout
    );
    parameter idle = 0;
    parameter s0 = 1;
    parameter s1 = 2;
    parameter s2 = 3;
    parameter s3 = 4;
    reg [2:0] state = idle;
    always@(posedge clk) begin
    if (rst) 
    begin
    state <= idle;
    dout <= 0;
    end
    else 
    begin
    case(state) 
    idle: begin
    state <= s0;
    dout <= 0;
    end
   s0: begin
   if(din) begin
   dout <= 0;
   state <= s1;
   end
   else begin
   state <= s0;
   dout <= 0;
   end
   end
   s1:begin
   if (din) begin
   state <= s1;
   dout <= 0;
   end 
   else begin
   state <= s2;
   dout <= 0;
   end
   end
   s2: begin
   if (din) begin
   dout <= 0;
   state<= s1;
   end
   else begin
   state <= s3;
   dout <= 0;
   end
   end
   s3: begin
   if (din) begin
   dout <= 1;
   state <= s0;
   end
   else begin
   dout <= 0;
   state <= s0;
   end
   end
   default: begin
   state <= idle;
   dout <= 0;
   end
   endcase
   end
   end
endmodule
