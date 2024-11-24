.PHONY: clock_divider
clock_divider:
	iverilog clock_divider*.sv
	./a.out
	gtkwave dump.vcd

.PHONY: clean
clean:
	rm -f a.out dump.vcd
