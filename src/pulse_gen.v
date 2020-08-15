/*
 * Copyright (c) 2020 Joel Holdsworth <joel@airwebreathe.org.uk>
 */

module pulse_gen(clk_10mhz, rst_n, op);
parameter Period = 1000000; // cycles

input clk_10mhz, rst_n;
output op;

reg op_enable;
reg [$clog2(Period/2)-1:0] counter;

assign op = clk_10mhz && op_enable;

always @(posedge clk_10mhz) begin
  if (!rst_n) begin
    op_enable <= 0;
    counter <= Period / 2 - 1;
  end else if (counter == 0) begin
    counter <= Period / 2 - 1;
    op_enable <= !op_enable;
  end else
    counter <= counter - 1;
end

endmodule
