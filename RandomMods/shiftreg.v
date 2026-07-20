`timescale 1ns/1ps

module shift8(

input a,
input en,
input clk,
output reg [7:0] y

);

integer i;

always @(posedge clk)begin

if (en == 1) begin 
y[7] <= a;

for (i=0; i < 7; i = i +1)begin

    y[i] <= y[i + 1]; 


end end end

endmodule


module shift8_tb;

reg a;
reg en;
reg clk;
wire [7:0] y;

integer j;
integer k;

shift8 U0(
.a(a),
.en(en),
.y(y),
.clk(clk)

);

always #5 clk = !clk;

initial begin

clk = 0;

for (j=0; j < 8; j = j + 1)begin
    en = 1;
    a = 1;
    #10 $display("a = %b, en = %b, y = %b", a, en, y);

end

for (k=0; k < 8; k = k + 1)begin
    if (k % 2 == 0)begin
        en = 1;
        a = 0;
        #10 $display("a = %b, en = %b, y = %b", a, en, y);
    end else begin
        en = 1;
        a = 1;
        #10 $display("a = %b, en = %b, y = %b", a, en, y);
    end


    end

$finish;

end



endmodule