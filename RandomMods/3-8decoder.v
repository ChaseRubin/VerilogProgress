module decoder3(

input [2:0] in, //in[2] is the enable bit

output a,b,c,d,e,f,g,h

);

a = 0;
b = 0;
c = 0;
d = 0;
e = 0;
f = 0;
g = 0;
h = 0;

always @(*) begin
case(in)

3'b000: a = 1;
3'b001: b = 1;
3'b010: c = 1;
3'b011: d = 1;
3'b100: e = 1;
3'b101: f = 1;
3'b110: g = 1;
3'b111: h = 1;

default: $display("error");

endcase

end



endmodule