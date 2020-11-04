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

HD_PWD='/home/connor/Documents/Programs/Vivado/4305/Lab8-PotCtrlLeds/sampler_fpro_system/sampler_fpro_system.runs/synth_1'
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

EAStep vivado -log mcs_top_sampler.vds -m64 -product Vivado -mode batch -messageDb vivado.pb -notrace -source mcs_top_sampler.tcl
