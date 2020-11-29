// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2019.2.1 (lin64) Build 2729669 Thu Dec  5 04:48:12 MST 2019
// Date        : Fri Nov 27 09:15:49 2020
// Host        : connors-workstation running 64-bit Ubuntu 18.04.5 LTS
// Command     : write_verilog -force -mode synth_stub
//               /home/connor/Documents/Programs/Vivado/4300/SHA-256-SoC/debug_hw/debug_hw.srcs/sources_1/bd/debug_cpu/ip/debug_cpu_microblaze_mcs_0_0/debug_cpu_microblaze_mcs_0_0_stub.v
// Design      : debug_cpu_microblaze_mcs_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a100tcsg324-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "bd_6665,Vivado 2019.2.1" *)
module debug_cpu_microblaze_mcs_0_0(Clk, Reset, UART_rxd, UART_txd)
/* synthesis syn_black_box black_box_pad_pin="Clk,Reset,UART_rxd,UART_txd" */;
  input Clk;
  input Reset;
  input UART_rxd;
  output UART_txd;
endmodule
