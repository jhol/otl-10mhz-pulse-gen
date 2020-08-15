/*
 * Copyright (c) 2020 Joel Holdsworth <joel@airwebreathe.org.uk>
 */

module top(clk_10mhz, rst_n, op);
  input clk_10mhz;
  input rst_n;
  output op;

pulse_gen pg(clk_10mhz, rst_n, op);

endmodule
