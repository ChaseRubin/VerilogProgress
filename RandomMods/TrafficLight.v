`timescale 1ns/1ps

//moore implementation (outputs only dependent on current state)

module TrafficLight(
input clk,
input rst,
output reg Bon,
output reg Aon
);

parameter [1:0] A = 2'b00;
parameter [1:0] B = 2'b01;

reg current_state = A;
reg next_state;
reg [2:0] timer;

always @(posedge clk)begin
    if (rst) begin 
        current_state <= A;
        timer <= 3'b000;
    end
    if (timer < 3'b111) begin
        timer <= timer + 1;
    end else begin
        timer <= 3'b000;
        current_state <= next_state;
    end
end

//comb section: next state logic
always @(*)begin
    case(current_state)

        A : next_state = B;
        B : next_state = A;

    endcase
end

always @(*)begin


    case(current_state)
        A: begin 
            Aon = 1;
            Bon = 0;
        end

        B: begin
            Aon = 0;
            Bon = 1;
        end


    endcase

end


endmodule

module TrafficLight_tb;
reg clk;
reg rst;
wire Aon;
wire Bon;

TrafficLight U0(
.clk(clk),
.rst(rst),
.Aon(Aon),
.Bon(Bon)

);


initial begin
    clk = 0;
    rst = 1;
    #10 rst = 0; // Release reset
end

always #5 clk = ~clk;

always @(posedge clk) begin
    $display("Time=%t | State=%b | Aon=%b | Bon=%b", $time, U0.current_state, Aon, Bon);
    
end

initial begin
    #200 $finish;
end

endmodule