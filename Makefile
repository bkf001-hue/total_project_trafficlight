# ==================================================
# Traffic Light Controller Simulation Makefile
# ==================================================
SRC = ./src
SIM = ./sim

all:
	iverilog -o traffic_light \
	$(SRC)/clock_divider.v \
	$(SRC)/traffic_fsm.v \
	$(SRC)/timer.v \
	$(SRC)/seven_segment.v \
	$(SRC)/top_module.v \
	$(SIM)/testbench.v
	vvp traffic_light
	gtkwave traffic_light.vcd

clean:
	rm -f traffic_light traffic_light.vcd
