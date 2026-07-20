`include "DFF.v"

`timescale 1ns/1ps 

module uart(

input [7:0] data_in,
input wire clk,
input wire rst,

output reg tx;

);


reg baud_rate;


//clk divider, T=1ns means f = 1 Ghz, to get to 
DFF U0(
    .D(D),
    .clk(clk),
    .Q(Q)


);


endmodule