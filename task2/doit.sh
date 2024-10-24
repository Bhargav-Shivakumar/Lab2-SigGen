#!/bin/sh

~/Documents/iac/lab0-devtools/tools/attach_usb.sh

rm -rf obj_dir
rm -f sinegen.vcd

verilator -Wall --cc --trace sinegen.sv rom.sv counter.sv --exe sinegen.cpp

make -j -C obj_dir/ -f Vsinegen.mk Vsinegen

obj_dir/Vsinegen