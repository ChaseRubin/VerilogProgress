module mux(
    
input a,b,c,d,
input [1:0] sel,

output reg y
);


always @(*) begin

case (sel)

    2'b00: y = a;

    2'b01: y = b;

    2'b10: y = c;

    2'b11: y = d;

    default : $display("error");

endcase end endmodule

module mux_tb;

reg a, b, c, d;

reg [1:0] sel;

wire y;

mux U1 (
.a(a),
.b(b),
.c(c),
.d(d),
.sel(sel),
.y(y)

);

initial begin
        a = 1; b = 0; c = 1; d = 0; 
        sel = 2'b00; 
        
        #1 $display("Time=%0t | sel=%b | y=%b", $time, sel, y); 
        
        sel = 2'b01; #5 $display("Time=%0t | sel=%b | y=%b", $time, sel, y); 
        sel = 2'b10; #5 $display("Time=%0t | sel=%b | y=%b", $time, sel, y); 
        sel = 2'b11; #5 $display("Time=%0t | sel=%b | y=%b", $time, sel, y);
end
endmodule