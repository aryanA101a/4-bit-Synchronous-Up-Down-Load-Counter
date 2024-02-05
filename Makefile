all: run_simulation

compile:
	iverilog fourBitSyncCounter_tb.v -o fourBitSyncCounter_tb.vvp

run_simulation: compile
	vvp fourBitSyncCounter_tb.vvp
	gtkwave fourBitSyncCounter.vcd

clean:
	rm -f fourBitSyncCounter_tb.vvp
	rm -f fourBitSyncCounter.vcd
