`timescale 1ns/1ps

module alu(
input wire clk,
input wire [7:0] a,
input wire [7:0] b,
input wire [3:0] op,


output reg [8:0] result, //9 bits wide for an overflow detection bit
output reg zero,
output reg overflow,
output reg negative,
output reg carry_out

);


always @(posedge clk) begin

case(op)

    4'b0000: begin
        result <= a + b;
        carry_out <= (a + b) > 8'b11111111;      
        negative <= 0; 
        end
    4'b0001: begin
        result <= a - b;
        carry_out <= (a < b);
        negative <= (a < b);

    end
    default: ;

endcase



end

always @(*)begin

zero = (result[8:0] == 8'b00000000);
overflow = result[8];

end


endmodule



module alu_tb;

    reg clk;
    reg [7:0] a;
    reg [7:0] b;
    reg [3:0] op;

    wire [8:0] result;
    wire zero;
    wire overflow;
    wire negative;
    wire carry_out;

alu U0(

.clk(clk),
.a(a),
.b(b),
.op(op),

.result(result),
.zero(zero),
.overflow(overflow),
.negative(negative),
.carry_out(carry_out)

);

always #5 clk = !clk;

initial begin
clk = 0;
a = 0;
b = 0;
op = 0;

#10;
a = 8'b11111111;
b = 8'b11111111;
op = 4'b0000;

#10; 
a = 8'b000000001;
b = 8'b000000010;
op = 4'b0001;


end

always @(posedge clk) begin
    $display("a=%b | b=%b | result=%b | overflow=%b | zero=%b | overflow=%b | negative=%b | carry_out=%b", a, b, result, overflow, zero, overflow, negative, carry_out);
    
end

initial begin
    #200 $finish;
end


endmodule


