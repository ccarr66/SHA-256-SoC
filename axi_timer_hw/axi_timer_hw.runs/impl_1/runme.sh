#!/bin/sh

# 
# Vivado(TM)
# runme.sh: a Vivado-generated Runs Script for UNIX
# Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
# 

if [ -z "$PATH" ]; then
  PATH=/home/connor/Tools/Xilinx/Vitis/2019.2/bin:/home/connor/Tools/Xilinx/Vivado/2019.2/ids_lite/ISE/bin/lin64:/home/connor/Tools/Xilinx/Vivado/2019.2/bin
else
  PATH=/home/connor/Tools/Xilinx/Vitis/2019.2/bin:/home/connor/Tools/Xilinx/Vivado/2019.2/ids_lite/ISE/bin/lin64:/home/connor/Tools/Xilinx/Vivado/2019.2/bin:$PATH
fi
export PATH

if [ -z "$LD_LIBRARY_PATH" ]; then
  LD_LIBRARY_PATH=
else
  LD_LIBRARY_PATH=:$LD_LIBRARY_PATH
fi
export LD_LIBRARY_PATH

HD_PWD='/home/connor/Documents/Programs/Vivado/4300/SHA-256-SoC/axi_timer_hw/axi_timer_hw.runs/impl_1'
cd "$HD_PWD"

HD_LOG=runme.log
/bin/touch $HD_LOG

ISEStep="./ISEWrap.sh"
EAStep()
{
     $ISEStep $HD_LOG "$@" >> $HD_LOG 2>&1
     if [ $? -ne 0 ]
     then
         exit
     fi
}

# pre-commands:
/bin/touch .init_design.begin.rst
EAStep vivado -log axi_cpu_wrapper.vdi -applog -m64 -product Vivado -messageDb vivado.pb -mode batch -source axi_cpu_wrapper.tcl -notrace


