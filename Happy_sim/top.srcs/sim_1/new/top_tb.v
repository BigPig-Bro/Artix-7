`timescale 1ns / 1ps

module top_tb(
  );
  
 reg clk;
 wire [15:0] data;
 top top_m0(
    .clk    (clk    ),
    
    .data   (data   )
 );
 
 initial #0 clk = 0;
 
 always #5 clk = !clk;
 
endmodule
