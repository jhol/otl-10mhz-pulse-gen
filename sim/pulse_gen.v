/*
 * Copyright (c) 2020 Joel Holdsworth <joel@airwebreathe.org.uk>
 */

`timescale 10ns/10ns

module test;
parameter ClkFreq = 10000000; // Hz

reg rst_n = 1;
reg start = 0;
initial begin
  $dumpfile("pulse_gen.vcd");
  $dumpvars(0, test);

  #20 rst_n = 0;
  #20 rst_n = 1;
  #100000000 $finish;
end

reg clk = 0;
always #5 clk = !clk;

wire op;

pulse_gen pg(clk, rst_n, op);

endmodule
