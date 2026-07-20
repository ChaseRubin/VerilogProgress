`timescale 1ns/1ps


module JohnsonCounter( 
    input clk, 
    input init, 
    output reg [3:0] state 
); 
    reg ones; 
    reg twos; 

    always @(posedge clk) begin 
        if (init) begin 
            state <= 4'b0001; 
            ones <= 1'b1; 
            twos <= 1'b0; 
        end else if (ones && state != 4'b1111) begin 
            state <= {state[2:0], 1'b1}; // Shift and shift-in 1
            ones <= 1'b1; 
            twos <= 1'b0;
        end else if (twos || state == 4'b1111) begin 
            ones <= 1'b0; 
            twos <= 1'b1; 
            state <= {state[2:0], 1'b0}; // Shift and shift-in 0
        end 
    end 
endmodule 

module JohnsonCounter_tb;
reg clk;
reg init;

wire [3:0] state;

JohnsonCounter U0 (
.clk(clk),
.init(init),
.state(state)
);

always #5 clk = ~clk;

initial begin
clk = 0;
init = 0;
#10;

init = 1;

#10 $display("state = %b", state);
init = 0;

#10 $display("state = %b", state);
#10 $display("state = %b", state);
#10 $display("state = %b", state);
#10 $display("state = %b", state);
#10 $display("state = %b", state);
#10 $display("state = %b", state);
#10 $display("state = %b", state);
#10 $display("state = %b", state);
#10 $display("state = %b", state);
#10 $display("state = %b", state);
#10 $display("state = %b", state);
#10 $display("state = %b", state);

$finish;

end

endmodule