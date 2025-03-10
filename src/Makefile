# Makefile
# See https://docs.cocotb.org/en/stable/quickstart.html for more info

# defaults
SIM ?= icarus
TOPLEVEL_LANG ?= verilog

# normal simulation
ifneq ($(GATES),yes)

# this is the only part you should need to modify:
VERILOG_SOURCES += $(PWD)/adder_tree.v $(PWD)/decay_potential.v $(PWD)/full_adder.v $(PWD)/half_adder.v $(PWD)/mem_potential_acc.v $(PWD)/multiplier.v $(PWD)/multiplier_accumulator.v $(PWD)/multiplier_stage.v $(PWD)/nbit_adder.v $(PWD)/neuron.v $(PWD)/spike_generator.v $(PWD)/batch_normalization.v $(PWD)/tb.v $(PWD)/top.v
#VERILOG_SOURCES += $(PWD)/adder_tree.v $(PWD)/decay_potential.v $(PWD)/full_adder.v $(PWD)/half_adder.v $(PWD)/mem_potential_acc.v $(PWD)/multiplier.v $(PWD)/multiplier_accumulator.v $(PWD)/multiplier_stage.v $(PWD)/nbit_adder.v $(PWD)/neuron.v $(PWD)/spike_generator.v $(PWD)/batch_normalization.v $(PWD)/layer.v $(PWD)/neural_network.v $(PWD)/neuron_struct.v $(PWD)/reg_1b.v $(PWD)/reg_N.v $(PWD)/sipo.v $(PWD)/nn_system.v $(PWD)/tb.v $(PWD)/top.v

else

# gate level simulation requires some extra setup, you shouldn't need to touch this
COMPILE_ARGS    += -DGL_TEST
COMPILE_ARGS    += -DFUNCTIONAL
COMPILE_ARGS    += -DUSE_POWER_PINS
COMPILE_ARGS    += -DSIM
COMPILE_ARGS    += -DUNIT_DELAY=\#1
VERILOG_SOURCES += $(PDK_ROOT)/sky130A/libs.ref/sky130_fd_sc_hd/verilog/primitives.v
VERILOG_SOURCES += $(PDK_ROOT)/sky130A/libs.ref/sky130_fd_sc_hd/verilog/sky130_fd_sc_hd.v

# this gets copied in by the GDS action workflow
VERILOG_SOURCES += $(PWD)/tb.v $(PWD)/gate_level_netlist.v
endif

# TOPLEVEL is the name of the toplevel module in your Verilog or VHDL file
TOPLEVEL = tb

# MODULE is the basename of the Python test file
MODULE = test

# include cocotb's make rules to take care of the simulator setup
include $(shell cocotb-config --makefiles)/Makefile.sim
