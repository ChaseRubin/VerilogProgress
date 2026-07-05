`timescale 1ns/1ps

module reg4 (

input wire [3:0] in,
input en,
output reg[3:0] out
);

always @(*)begin

if (en)begin
out <= in;

end

end

endmodule


module reg4_tb;
reg [3:0] in;
reg en;
wire [3:0] out;

reg4 U0 (
.in(in),
.en(en),
.out(out)
);

initial begin
en = 0;
in = 4'b1010;
#5 $display("in=%b | en=%b | out=%b", in, en,out);

en = 1;
in = 4'b1010;
#5 $display("in=%b | en=%b | out=%b", in, en,out);

en = 1;
in = 4'b0000;
#5 $display("in=%b | en=%b | out=%b", in, en,out);

en = 1;
in = 4'b0001;
#5 $display("in=%b | en=%b | out=%b", in, en,out);

end




endmodule