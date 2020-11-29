//Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2019.2.1 (lin64) Build 2729669 Thu Dec  5 04:48:12 MST 2019
//Date        : Sat Nov 28 16:03:10 2020
//Host        : connors-workstation running 64-bit Ubuntu 18.04.5 LTS
//Command     : generate_target debug_cpu_v2_wrapper.bd
//Design      : debug_cpu_v2_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module debug_cpu_v2_wrapper
   (Clk,
    Reset,
    UART_rxd,
    UART_txd);
  input Clk;
  input Reset;
  input UART_rxd;
  output UART_txd;

  wire Clk;
  wire Reset;
  wire UART_rxd;
  wire UART_txd;

  debug_cpu_v2 debug_cpu_v2_i
       (.Clk(Clk),
        .Reset(Reset),
        .UART_rxd(UART_rxd),
        .UART_txd(UART_txd));
endmodule
