module gate_array(
input [3:0] a,
input [3:0] b,
input [3:0] c,

output d,
output e,
output f
);

assign d = &a;

assign e = |b;

assign f = ^c;

endmodule

module gate_array_tb;

reg [3:0] a;
reg [3:0] b;
reg [3:0] c;

wire d;
wire e;
wire f;

gate_array U0(

    .a(a),
    .b(b),
    .c(c),
    .d(d),
    .e(e),
    .f(f)
);

initial begin
    
  a = 4'b1111; //and

  b = 4'b0100; //or

  c = 4'b1010; //xor

#10; 

$display ("Time: %0t | d=%b, e=%b, f=%b", $time, d, e, f);



end



endmodule
