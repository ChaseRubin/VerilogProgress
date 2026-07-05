module FA (

input a,
input b,
input cin,

output sum,
output carry

);

wire xor1_out;
wire and1_out;
wire and2_out;


//Half adder 1
xor(xor1_out, a, b);
and(and1_out, a, b);

//Half adder 2
and(and2_out, cin, xor1_out);
xor(sum, cin, xor1_out);


//or
or(carry, and1_out, and2_out);

endmodule

module FA_tb;

reg a, b, cin;
wire sum, carry;

 FA uut (
        .a(a), 
        .b(b), 
        .cin(cin), 
        .sum(sum), 
        .carry(carry)
    );


initial begin



end


endmodule