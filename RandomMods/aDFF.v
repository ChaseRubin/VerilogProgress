`timescale 1ns/1ps

module aDFF(
input D,
input clk,

output reg Q
);

always @(*) begin

Q <= D;

end
endmodule


module aDFF_tb;
reg D;
reg clk;
wire Q;

always #5 clk = !clk;

aDFF U0 (
.D(D),
.clk(clk),
.Q(Q)
);

initial begin 
D = 0;
clk = 0;
end

initial begin
#15 D = 1; // Change D to 1
        #10 D = 0; // Change D to 0
        #15 D = 1; // Change D to 1
        #10 $finish;

end

initial begin

$monitor("Time = %0t | clk = %b | D = %b | Q = %b", $time, clk, D, Q);

end


endmodule