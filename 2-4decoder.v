//takes input of 2 bits and outputs the single corrosponding drive line

module decoder(

input [1:0] in,

output reg a,b,c,d

);

always @(*) begin

a = 0;
b = 0;
c = 0;
d = 0;

case(in)

2'b00: a = 1;
2'b01: b = 1;
2'b10: c = 1;
2'b11: d = 1;

default: $display("error");

endcase
end

endmodule

module decoder_tb;

reg [1:0] in;

wire a, b, c, d;

decoder U1(
.in(in),
.a(a),
.b(b),
.c(c),
.d(d)

);

initial begin
    in = 2'b00;
    #5;
    $display ("in=%b | a=%b, b=%b, c=%b, d=%b", in, a, b, c, d);
    
    in = 2'b01;
    #5;
    $display ("in=%b | a=%b, b=%b, c=%b, d=%b", in, a, b, c, d);

    
    in = 2'b10;
    #5;
    $display ("in=%b | a=%b, b=%b, c=%b, d=%b", in, a, b, c, d);

    
    in = 2'b11;
    #5;
    $display ("in=%b | a=%b, b=%b, c=%b, d=%b", in, a, b, c, d);



end 



endmodule