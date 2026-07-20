`timescale 1ns/1ps


module RingCounter4 (
input init,
input clk,

output reg [3:0] state

);

always @(posedge clk)begin

    if (init)begin 
        state <= 4'b0001;

    end

else if (state == 4'b1000)begin

    state <= 4'b0001;

end else begin

state <= state << 1;
end 

end

endmodule

module RingCounter4_tb;
reg init;
reg clk;

wire [3:0] state;

RingCounter4 U0 (
.init(init),
.clk(clk),
.state(state)

);

always #5 clk = ~clk; 


initial begin

init = 0;
clk = 0;
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
$finish;


end 

endmodule