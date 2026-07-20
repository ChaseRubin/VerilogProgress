module comp(

input [3:0] a,
input [3:0] b,

output reg [1:0] y
);

always @(*) begin

if (a > b) begin y = 4'b00; end 

else if (a < b) begin y = 4'b01; end 

else begin y = 4'b10; end

end

endmodule

module comp_tb;

reg [3:0] a;
reg [3:0] b; 

wire [1:0] y;

comp U1 (
.a(a),
.b(b),
.y(y)
);

initial begin

    a = 4'b11;
    b = 4'b01;
    #5;

$display ("y=%b", y);

    a = 4'b01;
    b = 4'b11;
    #5;

$display ("y=%b", y);

    a = 4'b11;
    b = 4'b11;
    #5

$display ("y=%b", y);
end 

endmodule
