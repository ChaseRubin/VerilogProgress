// 6-20-26

module mux(
input a, b, sel,
output y
);

assign y = (sel) ? b : a;

endmodule

module mux_tb;
  reg a, b, sel;
  wire y;

  mux U0 ( 
    .a(a), 
    .b(b), 
    .sel(sel), 
    .y(y) 
  );

  initial begin 
    a = 0; 
    b = 1; 
    sel = 0; 
    #10; 
    $display("Time: %0t | a=%b, b=%b, sel=%b ==> y=%b", $time, a, b, sel, y);
    a = 1; 
    b = 1; 
    sel = 1; 
    #10; 
     $display("Time: %0t | a=%b, b=%b, sel=%b ==> y=%b", $time, a, b, sel, y);
    $finish; 
  end 
endmodule