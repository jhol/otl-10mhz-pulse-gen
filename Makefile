#
# Copyright (c) 2020 Joel Holdsworth <joel@airwebreathe.org.uk>
#

src=\
	src/pulse_gen.v

synthesize: pulse_gen.json

pulse_gen.json: $(src) \
  syn/top.v \
  synth_74.ys
	yosys \
	  -q \
	  -s synth_74.ys \
	  -p "write_json pulse_gen.json; show" \
	  $(src) \
	  syn/top.v

synth_74.ys: 74xx-liberty/synth_74.ys
	sed 's/\.\./74xx-liberty/g' $< > $@

simulate: pulse_gen.vcd
	gtkwave $< >/dev/null 2>/dev/null &

pulse_gen-sim: $(src) \
  sim/pulse_gen.v
	iverilog -o $@ $^

%.vcd: %-sim
	cd $(dir $<); ./$(notdir $<)

.PHONY:  \
	simulate \
	sythesize
