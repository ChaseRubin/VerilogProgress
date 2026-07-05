`include "FA.v"

module ripple(

input [3:0] a,
input [3:0] b,

output [4:0] y

);

wire carry0, carry1, carry2;

FA U0 (

.a(a[0]),
.b(b[0]),
.cin(1'b0),
.sum(y[0]),
.carry(carry0)

);

FA U1 (
    .a(a[1]),
    .b(b[1]),
    .cin(carry0),
    .sum(y[1]),
    .carry(carry1)
);

FA U2 (
    .a(a[2]),
    .b(b[2]),
    .cin(carry1),
    .sum(y[2]),
    .carry(carry2)
);

FA U3 (
    .a(a[3]),
    .b(b[3]),
    .cin(carry2),
    .sum(y[3]),
    .carry(y[4])
);

endmodule

module ripple_tb;

    reg [3:0] a;
    reg [3:0] b;
    reg cin;

    wire [4:0] y;

    ripple U0(
        .a(a),
        .b(b),
        .y(y)
    );

initial begin

a = 4'b1111;
b = 4'b1111;
#5;
$display("y=%b", y);

a = 4'b0001;
b = 4'b0001;
#5;
$display("y=%b", y);

end

endmodule