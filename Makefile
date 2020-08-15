#
# Copyright (c) 2020 Joel Holdsworth <joel@airwebreathe.org.uk>
#

src=\
	src/pulse_gen.v

simulate: pulse_gen.vcd
	gtkwave $< >/dev/null 2>/dev/null &

pulse_gen-sim: $(src) \
  sim/pulse_gen.v
	iverilog -o $@ $^

%.vcd: %-sim
	cd $(dir $<); ./$(notdir $<)

.PHONY:  \
	simulate
