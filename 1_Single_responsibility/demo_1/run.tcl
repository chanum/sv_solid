# Author: Marcelo Pouso
# Mail: mapouso86@gmail.com
#

set RTL        ../rtl
set TB         .

quit -sim
catch {file delete -force work}

# create and map lib
vlib work
vmap dut work

# Compile DUT

vlog -sv \
    "${RTL}/alu_pkg.sv"

vlog -sv \
    "${RTL}/alu.sv"

vlog -sv \
    "${RTL}/alu_if.sv"

# Compile TB
vlog -sv \
    -timescale 1ns/1ps \
    +incdir+${RTL} \
    +incdir+${TB} \
    "${TB}/alu_tb_pkg.sv" \
    "${TB}/tb_top.sv" 

# Run Simulation
vsim -debugdb -suppress 3999 \
    -do "log -r /*; run -all" \
    tb_top
