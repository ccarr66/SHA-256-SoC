//Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2019.2.1 (lin64) Build 2729669 Thu Dec  5 04:48:12 MST 2019
//Date        : Fri Nov 27 09:21:40 2020
//Host        : connors-workstation running 64-bit Ubuntu 18.04.5 LTS
//Command     : generate_target debug_cpu.bd
//Design      : debug_cpu
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CORE_GENERATION_INFO = "debug_cpu,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=debug_cpu,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=1,numReposBlks=1,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=0,numPkgbdBlks=0,bdsource=USER,da_board_cnt=6,synth_mode=OOC_per_IP}" *) (* HW_HANDOFF = "debug_cpu.hwdef" *) 
module debug_cpu
   (reset,
    sys_clock,
    usb_uart_rxd,
    usb_uart_txd);
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 RST.RESET RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME RST.RESET, INSERT_VIP 0, POLARITY ACTIVE_LOW" *) input reset;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.SYS_CLOCK CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.SYS_CLOCK, CLK_DOMAIN debug_cpu_sys_clock, FREQ_HZ 100000000, INSERT_VIP 0, PHASE 0.000" *) input sys_clock;
  (* X_INTERFACE_INFO = "xilinx.com:interface:uart:1.0 usb_uart RxD" *) input usb_uart_rxd;
  (* X_INTERFACE_INFO = "xilinx.com:interface:uart:1.0 usb_uart TxD" *) output usb_uart_txd;

  wire microblaze_mcs_0_UART_RxD;
  wire microblaze_mcs_0_UART_TxD;
  wire reset_1;
  wire sys_clock_1;

  assign microblaze_mcs_0_UART_RxD = usb_uart_rxd;
  assign reset_1 = reset;
  assign sys_clock_1 = sys_clock;
  assign usb_uart_txd = microblaze_mcs_0_UART_TxD;
  debug_cpu_microblaze_mcs_0_0 microblaze_mcs_0
       (.Clk(sys_clock_1),
        .Reset(reset_1),
        .UART_rxd(microblaze_mcs_0_UART_RxD),
        .UART_txd(microblaze_mcs_0_UART_TxD));
endmodule
