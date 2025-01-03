.PHONY: check_equal
check_equal:
	iverilog check_equal*.sv
	./a.out
	gtkwave dump.vcd

.PHONY: seven_seg_encoder
seven_seg_encoder:
	iverilog seven_seg_encoder*.sv
	./a.out
	gtkwave dump.vcd

.PHONY: bin_to_bcd
bin_to_bcd:
	iverilog bin_to_bcd*.sv
	./a.out
	gtkwave dump.vcd

.PHONY: lfsr
lfsr:
	iverilog lfsr*.sv
	./a.out
	gtkwave dump.vcd

.PHONY: clock_divider
clock_divider:
	iverilog clock_divider*.sv
	./a.out
	gtkwave dump.vcd

.PHONY: clean
clean:
	rm -f a.out dump.vcd
