.PHONY: slot_machine_top
slot_machine_top:
	iverilog -g2005-sv slot_machine_top.sv clock_divider.sv fsm.sv lfsr.sv check_equal.sv bin_to_bcd.sv seven_seg_encoder.sv four_bit_mux.sv
.PHONY: fsm
fsm:
	iverilog fsm*.sv
	./a.out
	gtkwave dump.vcd

.PHONY: four_bit_mux
four_bit_mux:
	iverilog four_bit_mux*.sv
	./a.out
	gtkwave dump.vcd

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
