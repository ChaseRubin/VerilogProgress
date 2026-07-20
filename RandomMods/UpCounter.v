`timescale 1ns/1ps

module upcounter(
    
input clk,
input en,
input rst,

output reg [3:0] count
);


always @(posedge clk or posedge rst)begin


if (rst)begin
    count <= 4'b0000;
    
end else if(en)begin

count <= count + 4'b0001;

end 



end 

endmodule

module upcounter_tb;

reg clk;
reg en;
reg rst;

wire [3:0] count;


upcounter U0 (
.clk(clk),
.en(en),
.count(count),
.rst(rst)

);

always #5 clk = ~clk;

initial begin
clk = 0;
en = 0;
rst = 1;

#5;

en = 1;
rst = 0;

#10 $display("count = %b", count);
#10 $display("count = %b", count);
#10 $display("count = %b", count);
#10 $display("count = %b", count);
#10 $display("count = %b", count);
#10 $display("count = %b", count);

rst = 1;

#10 $display("count = %b", count);



$finish;



end

endmodule