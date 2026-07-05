`timescale 1ns/1ps

module stopwatch (
input switch, //on off
input reset,
input clk,

output reg [7:0] current_time


);

parameter on = 1'b0;
parameter off = 1'b1;

reg current_state;
reg next_state;

always @(*)begin
    case(current_state)
        on : next_state = off;
        off : next_state = on;
        default : current_time <= current_time;

    endcase

end

always @(*)begin
    if(reset)begin
        current_time = 0;


    end

end

always @(posedge clk)begin
    case(current_state)
        on : current_time <= current_time + 1;
        off : current_time <= current_time;
        default : current_time <= current_time;
    endcase

    if(switch)begin
        current_state <= next_state;
    end

end

endmodule

module StopWatch_tb;
reg switch;
reg reset;
reg clk;
wire [7:0] current_time;

stopwatch U0(
.switch(switch),
.reset(reset),
.clk(clk),
.current_time(current_time)

);

always #5 clk = ~clk;

initial begin
    clk = 0;
    reset = 0;
    switch = 0;
    U0.current_time = 0;
    U0.current_state = 1'b0;

    #10 switch = 1;
    #20 switch = 0;
    #10 reset = 1;
    #1 reset = 0;

end

always @(posedge clk) begin
    $display("Time=%t, state=%b, watch time=%b", $time, U0.current_state, current_time);
    
end

initial begin
    #200 $finish;
end


endmodule