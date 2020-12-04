-makelib xcelium_lib/xpm -sv \
  "/home/connor/Tools/Xilinx/Vivado/2019.2/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
  "/home/connor/Tools/Xilinx/Vivado/2019.2/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \
-endlib
-makelib xcelium_lib/xpm \
  "/home/connor/Tools/Xilinx/Vivado/2019.2/data/ip/xpm/xpm_VCOMP.vhd" \
-endlib
-makelib xcelium_lib/microblaze_v11_0_2 \
  "../../../../axi_timer_hw.srcs/sources_1/bd/axi_cpu/ipshared/f871/hdl/microblaze_v11_0_vh_rfs.vhd" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../bd/axi_cpu/ip/axi_cpu_microblaze_0_0/sim/axi_cpu_microblaze_0_0.vhd" \
-endlib
-makelib xcelium_lib/lmb_v10_v3_0_10 \
  "../../../../axi_timer_hw.srcs/sources_1/bd/axi_cpu/ipshared/2e88/hdl/lmb_v10_v3_0_vh_rfs.vhd" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../bd/axi_cpu/ip/axi_cpu_dlmb_v10_0/sim/axi_cpu_dlmb_v10_0.vhd" \
  "../../../bd/axi_cpu/ip/axi_cpu_ilmb_v10_0/sim/axi_cpu_ilmb_v10_0.vhd" \
-endlib
-makelib xcelium_lib/lmb_bram_if_cntlr_v4_0_17 \
  "../../../../axi_timer_hw.srcs/sources_1/bd/axi_cpu/ipshared/db6f/hdl/lmb_bram_if_cntlr_v4_0_vh_rfs.vhd" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../bd/axi_cpu/ip/axi_cpu_dlmb_bram_if_cntlr_0/sim/axi_cpu_dlmb_bram_if_cntlr_0.vhd" \
  "../../../bd/axi_cpu/ip/axi_cpu_ilmb_bram_if_cntlr_0/sim/axi_cpu_ilmb_bram_if_cntlr_0.vhd" \
-endlib
-makelib xcelium_lib/blk_mem_gen_v8_4_4 \
  "../../../../axi_timer_hw.srcs/sources_1/bd/axi_cpu/ipshared/2985/simulation/blk_mem_gen_v8_4.v" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../bd/axi_cpu/ip/axi_cpu_lmb_bram_0/sim/axi_cpu_lmb_bram_0.v" \
-endlib
-makelib xcelium_lib/axi_lite_ipif_v3_0_4 \
  "../../../../axi_timer_hw.srcs/sources_1/bd/axi_cpu/ipshared/66ea/hdl/axi_lite_ipif_v3_0_vh_rfs.vhd" \
-endlib
-makelib xcelium_lib/mdm_v3_2_17 \
  "../../../../axi_timer_hw.srcs/sources_1/bd/axi_cpu/ipshared/f9aa/hdl/mdm_v3_2_vh_rfs.vhd" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../bd/axi_cpu/ip/axi_cpu_mdm_1_0/sim/axi_cpu_mdm_1_0.vhd" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../bd/axi_cpu/ip/axi_cpu_clk_wiz_1_0/axi_cpu_clk_wiz_1_0_clk_wiz.v" \
  "../../../bd/axi_cpu/ip/axi_cpu_clk_wiz_1_0/axi_cpu_clk_wiz_1_0.v" \
-endlib
-makelib xcelium_lib/lib_cdc_v1_0_2 \
  "../../../../axi_timer_hw.srcs/sources_1/bd/axi_cpu/ipshared/ef1e/hdl/lib_cdc_v1_0_rfs.vhd" \
-endlib
-makelib xcelium_lib/proc_sys_reset_v5_0_13 \
  "../../../../axi_timer_hw.srcs/sources_1/bd/axi_cpu/ipshared/8842/hdl/proc_sys_reset_v5_0_vh_rfs.vhd" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../bd/axi_cpu/ip/axi_cpu_rst_clk_wiz_1_100M_0/sim/axi_cpu_rst_clk_wiz_1_100M_0.vhd" \
-endlib
-makelib xcelium_lib/generic_baseblocks_v2_1_0 \
  "../../../../axi_timer_hw.srcs/sources_1/bd/axi_cpu/ipshared/b752/hdl/generic_baseblocks_v2_1_vl_rfs.v" \
-endlib
-makelib xcelium_lib/axi_infrastructure_v1_1_0 \
  "../../../../axi_timer_hw.srcs/sources_1/bd/axi_cpu/ipshared/ec67/hdl/axi_infrastructure_v1_1_vl_rfs.v" \
-endlib
-makelib xcelium_lib/axi_register_slice_v2_1_20 \
  "../../../../axi_timer_hw.srcs/sources_1/bd/axi_cpu/ipshared/72d4/hdl/axi_register_slice_v2_1_vl_rfs.v" \
-endlib
-makelib xcelium_lib/fifo_generator_v13_2_5 \
  "../../../../axi_timer_hw.srcs/sources_1/bd/axi_cpu/ipshared/276e/simulation/fifo_generator_vlog_beh.v" \
-endlib
-makelib xcelium_lib/fifo_generator_v13_2_5 \
  "../../../../axi_timer_hw.srcs/sources_1/bd/axi_cpu/ipshared/276e/hdl/fifo_generator_v13_2_rfs.vhd" \
-endlib
-makelib xcelium_lib/fifo_generator_v13_2_5 \
  "../../../../axi_timer_hw.srcs/sources_1/bd/axi_cpu/ipshared/276e/hdl/fifo_generator_v13_2_rfs.v" \
-endlib
-makelib xcelium_lib/axi_data_fifo_v2_1_19 \
  "../../../../axi_timer_hw.srcs/sources_1/bd/axi_cpu/ipshared/60de/hdl/axi_data_fifo_v2_1_vl_rfs.v" \
-endlib
-makelib xcelium_lib/axi_crossbar_v2_1_21 \
  "../../../../axi_timer_hw.srcs/sources_1/bd/axi_cpu/ipshared/6b0d/hdl/axi_crossbar_v2_1_vl_rfs.v" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../bd/axi_cpu/ip/axi_cpu_xbar_0/sim/axi_cpu_xbar_0.v" \
-endlib
-makelib xcelium_lib/lib_pkg_v1_0_2 \
  "../../../../axi_timer_hw.srcs/sources_1/bd/axi_cpu/ipshared/0513/hdl/lib_pkg_v1_0_rfs.vhd" \
-endlib
-makelib xcelium_lib/axi_timer_v2_0_22 \
  "../../../../axi_timer_hw.srcs/sources_1/bd/axi_cpu/ipshared/a141/hdl/axi_timer_v2_0_vh_rfs.vhd" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../bd/axi_cpu/ip/axi_cpu_axi_timer_0_0/sim/axi_cpu_axi_timer_0_0.vhd" \
-endlib
-makelib xcelium_lib/lib_srl_fifo_v1_0_2 \
  "../../../../axi_timer_hw.srcs/sources_1/bd/axi_cpu/ipshared/51ce/hdl/lib_srl_fifo_v1_0_rfs.vhd" \
-endlib
-makelib xcelium_lib/axi_uartlite_v2_0_24 \
  "../../../../axi_timer_hw.srcs/sources_1/bd/axi_cpu/ipshared/d8db/hdl/axi_uartlite_v2_0_vh_rfs.vhd" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../bd/axi_cpu/ip/axi_cpu_axi_uartlite_0_0/sim/axi_cpu_axi_uartlite_0_0.vhd" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../bd/axi_cpu/sim/axi_cpu.v" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  glbl.v
-endlib

