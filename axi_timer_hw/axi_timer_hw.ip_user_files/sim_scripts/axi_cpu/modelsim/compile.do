vlib modelsim_lib/work
vlib modelsim_lib/msim

vlib modelsim_lib/msim/xpm
vlib modelsim_lib/msim/microblaze_v11_0_2
vlib modelsim_lib/msim/xil_defaultlib
vlib modelsim_lib/msim/lmb_v10_v3_0_10
vlib modelsim_lib/msim/lmb_bram_if_cntlr_v4_0_17
vlib modelsim_lib/msim/blk_mem_gen_v8_4_4
vlib modelsim_lib/msim/axi_lite_ipif_v3_0_4
vlib modelsim_lib/msim/mdm_v3_2_17
vlib modelsim_lib/msim/lib_cdc_v1_0_2
vlib modelsim_lib/msim/proc_sys_reset_v5_0_13
vlib modelsim_lib/msim/generic_baseblocks_v2_1_0
vlib modelsim_lib/msim/axi_infrastructure_v1_1_0
vlib modelsim_lib/msim/axi_register_slice_v2_1_20
vlib modelsim_lib/msim/fifo_generator_v13_2_5
vlib modelsim_lib/msim/axi_data_fifo_v2_1_19
vlib modelsim_lib/msim/axi_crossbar_v2_1_21
vlib modelsim_lib/msim/lib_pkg_v1_0_2
vlib modelsim_lib/msim/axi_timer_v2_0_22
vlib modelsim_lib/msim/lib_srl_fifo_v1_0_2
vlib modelsim_lib/msim/axi_uartlite_v2_0_24

vmap xpm modelsim_lib/msim/xpm
vmap microblaze_v11_0_2 modelsim_lib/msim/microblaze_v11_0_2
vmap xil_defaultlib modelsim_lib/msim/xil_defaultlib
vmap lmb_v10_v3_0_10 modelsim_lib/msim/lmb_v10_v3_0_10
vmap lmb_bram_if_cntlr_v4_0_17 modelsim_lib/msim/lmb_bram_if_cntlr_v4_0_17
vmap blk_mem_gen_v8_4_4 modelsim_lib/msim/blk_mem_gen_v8_4_4
vmap axi_lite_ipif_v3_0_4 modelsim_lib/msim/axi_lite_ipif_v3_0_4
vmap mdm_v3_2_17 modelsim_lib/msim/mdm_v3_2_17
vmap lib_cdc_v1_0_2 modelsim_lib/msim/lib_cdc_v1_0_2
vmap proc_sys_reset_v5_0_13 modelsim_lib/msim/proc_sys_reset_v5_0_13
vmap generic_baseblocks_v2_1_0 modelsim_lib/msim/generic_baseblocks_v2_1_0
vmap axi_infrastructure_v1_1_0 modelsim_lib/msim/axi_infrastructure_v1_1_0
vmap axi_register_slice_v2_1_20 modelsim_lib/msim/axi_register_slice_v2_1_20
vmap fifo_generator_v13_2_5 modelsim_lib/msim/fifo_generator_v13_2_5
vmap axi_data_fifo_v2_1_19 modelsim_lib/msim/axi_data_fifo_v2_1_19
vmap axi_crossbar_v2_1_21 modelsim_lib/msim/axi_crossbar_v2_1_21
vmap lib_pkg_v1_0_2 modelsim_lib/msim/lib_pkg_v1_0_2
vmap axi_timer_v2_0_22 modelsim_lib/msim/axi_timer_v2_0_22
vmap lib_srl_fifo_v1_0_2 modelsim_lib/msim/lib_srl_fifo_v1_0_2
vmap axi_uartlite_v2_0_24 modelsim_lib/msim/axi_uartlite_v2_0_24

vlog -work xpm -64 -incr -sv "+incdir+../../../../axi_timer_hw.srcs/sources_1/bd/axi_cpu/ipshared/4fba" "+incdir+../../../../axi_timer_hw.srcs/sources_1/bd/axi_cpu/ipshared/ec67/hdl" \
"/home/connor/Tools/Xilinx/Vivado/2019.2/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
"/home/connor/Tools/Xilinx/Vivado/2019.2/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \

vcom -work xpm -64 -93 \
"/home/connor/Tools/Xilinx/Vivado/2019.2/data/ip/xpm/xpm_VCOMP.vhd" \

vcom -work microblaze_v11_0_2 -64 -93 \
"../../../../axi_timer_hw.srcs/sources_1/bd/axi_cpu/ipshared/f871/hdl/microblaze_v11_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -64 -93 \
"../../../bd/axi_cpu/ip/axi_cpu_microblaze_0_0/sim/axi_cpu_microblaze_0_0.vhd" \

vcom -work lmb_v10_v3_0_10 -64 -93 \
"../../../../axi_timer_hw.srcs/sources_1/bd/axi_cpu/ipshared/2e88/hdl/lmb_v10_v3_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -64 -93 \
"../../../bd/axi_cpu/ip/axi_cpu_dlmb_v10_0/sim/axi_cpu_dlmb_v10_0.vhd" \
"../../../bd/axi_cpu/ip/axi_cpu_ilmb_v10_0/sim/axi_cpu_ilmb_v10_0.vhd" \

vcom -work lmb_bram_if_cntlr_v4_0_17 -64 -93 \
"../../../../axi_timer_hw.srcs/sources_1/bd/axi_cpu/ipshared/db6f/hdl/lmb_bram_if_cntlr_v4_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -64 -93 \
"../../../bd/axi_cpu/ip/axi_cpu_dlmb_bram_if_cntlr_0/sim/axi_cpu_dlmb_bram_if_cntlr_0.vhd" \
"../../../bd/axi_cpu/ip/axi_cpu_ilmb_bram_if_cntlr_0/sim/axi_cpu_ilmb_bram_if_cntlr_0.vhd" \

vlog -work blk_mem_gen_v8_4_4 -64 -incr "+incdir+../../../../axi_timer_hw.srcs/sources_1/bd/axi_cpu/ipshared/4fba" "+incdir+../../../../axi_timer_hw.srcs/sources_1/bd/axi_cpu/ipshared/ec67/hdl" \
"../../../../axi_timer_hw.srcs/sources_1/bd/axi_cpu/ipshared/2985/simulation/blk_mem_gen_v8_4.v" \

vlog -work xil_defaultlib -64 -incr "+incdir+../../../../axi_timer_hw.srcs/sources_1/bd/axi_cpu/ipshared/4fba" "+incdir+../../../../axi_timer_hw.srcs/sources_1/bd/axi_cpu/ipshared/ec67/hdl" \
"../../../bd/axi_cpu/ip/axi_cpu_lmb_bram_0/sim/axi_cpu_lmb_bram_0.v" \

vcom -work axi_lite_ipif_v3_0_4 -64 -93 \
"../../../../axi_timer_hw.srcs/sources_1/bd/axi_cpu/ipshared/66ea/hdl/axi_lite_ipif_v3_0_vh_rfs.vhd" \

vcom -work mdm_v3_2_17 -64 -93 \
"../../../../axi_timer_hw.srcs/sources_1/bd/axi_cpu/ipshared/f9aa/hdl/mdm_v3_2_vh_rfs.vhd" \

vcom -work xil_defaultlib -64 -93 \
"../../../bd/axi_cpu/ip/axi_cpu_mdm_1_0/sim/axi_cpu_mdm_1_0.vhd" \

vlog -work xil_defaultlib -64 -incr "+incdir+../../../../axi_timer_hw.srcs/sources_1/bd/axi_cpu/ipshared/4fba" "+incdir+../../../../axi_timer_hw.srcs/sources_1/bd/axi_cpu/ipshared/ec67/hdl" \
"../../../bd/axi_cpu/ip/axi_cpu_clk_wiz_1_0/axi_cpu_clk_wiz_1_0_clk_wiz.v" \
"../../../bd/axi_cpu/ip/axi_cpu_clk_wiz_1_0/axi_cpu_clk_wiz_1_0.v" \

vcom -work lib_cdc_v1_0_2 -64 -93 \
"../../../../axi_timer_hw.srcs/sources_1/bd/axi_cpu/ipshared/ef1e/hdl/lib_cdc_v1_0_rfs.vhd" \

vcom -work proc_sys_reset_v5_0_13 -64 -93 \
"../../../../axi_timer_hw.srcs/sources_1/bd/axi_cpu/ipshared/8842/hdl/proc_sys_reset_v5_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -64 -93 \
"../../../bd/axi_cpu/ip/axi_cpu_rst_clk_wiz_1_100M_0/sim/axi_cpu_rst_clk_wiz_1_100M_0.vhd" \

vlog -work generic_baseblocks_v2_1_0 -64 -incr "+incdir+../../../../axi_timer_hw.srcs/sources_1/bd/axi_cpu/ipshared/4fba" "+incdir+../../../../axi_timer_hw.srcs/sources_1/bd/axi_cpu/ipshared/ec67/hdl" \
"../../../../axi_timer_hw.srcs/sources_1/bd/axi_cpu/ipshared/b752/hdl/generic_baseblocks_v2_1_vl_rfs.v" \

vlog -work axi_infrastructure_v1_1_0 -64 -incr "+incdir+../../../../axi_timer_hw.srcs/sources_1/bd/axi_cpu/ipshared/4fba" "+incdir+../../../../axi_timer_hw.srcs/sources_1/bd/axi_cpu/ipshared/ec67/hdl" \
"../../../../axi_timer_hw.srcs/sources_1/bd/axi_cpu/ipshared/ec67/hdl/axi_infrastructure_v1_1_vl_rfs.v" \

vlog -work axi_register_slice_v2_1_20 -64 -incr "+incdir+../../../../axi_timer_hw.srcs/sources_1/bd/axi_cpu/ipshared/4fba" "+incdir+../../../../axi_timer_hw.srcs/sources_1/bd/axi_cpu/ipshared/ec67/hdl" \
"../../../../axi_timer_hw.srcs/sources_1/bd/axi_cpu/ipshared/72d4/hdl/axi_register_slice_v2_1_vl_rfs.v" \

vlog -work fifo_generator_v13_2_5 -64 -incr "+incdir+../../../../axi_timer_hw.srcs/sources_1/bd/axi_cpu/ipshared/4fba" "+incdir+../../../../axi_timer_hw.srcs/sources_1/bd/axi_cpu/ipshared/ec67/hdl" \
"../../../../axi_timer_hw.srcs/sources_1/bd/axi_cpu/ipshared/276e/simulation/fifo_generator_vlog_beh.v" \

vcom -work fifo_generator_v13_2_5 -64 -93 \
"../../../../axi_timer_hw.srcs/sources_1/bd/axi_cpu/ipshared/276e/hdl/fifo_generator_v13_2_rfs.vhd" \

vlog -work fifo_generator_v13_2_5 -64 -incr "+incdir+../../../../axi_timer_hw.srcs/sources_1/bd/axi_cpu/ipshared/4fba" "+incdir+../../../../axi_timer_hw.srcs/sources_1/bd/axi_cpu/ipshared/ec67/hdl" \
"../../../../axi_timer_hw.srcs/sources_1/bd/axi_cpu/ipshared/276e/hdl/fifo_generator_v13_2_rfs.v" \

vlog -work axi_data_fifo_v2_1_19 -64 -incr "+incdir+../../../../axi_timer_hw.srcs/sources_1/bd/axi_cpu/ipshared/4fba" "+incdir+../../../../axi_timer_hw.srcs/sources_1/bd/axi_cpu/ipshared/ec67/hdl" \
"../../../../axi_timer_hw.srcs/sources_1/bd/axi_cpu/ipshared/60de/hdl/axi_data_fifo_v2_1_vl_rfs.v" \

vlog -work axi_crossbar_v2_1_21 -64 -incr "+incdir+../../../../axi_timer_hw.srcs/sources_1/bd/axi_cpu/ipshared/4fba" "+incdir+../../../../axi_timer_hw.srcs/sources_1/bd/axi_cpu/ipshared/ec67/hdl" \
"../../../../axi_timer_hw.srcs/sources_1/bd/axi_cpu/ipshared/6b0d/hdl/axi_crossbar_v2_1_vl_rfs.v" \

vlog -work xil_defaultlib -64 -incr "+incdir+../../../../axi_timer_hw.srcs/sources_1/bd/axi_cpu/ipshared/4fba" "+incdir+../../../../axi_timer_hw.srcs/sources_1/bd/axi_cpu/ipshared/ec67/hdl" \
"../../../bd/axi_cpu/ip/axi_cpu_xbar_0/sim/axi_cpu_xbar_0.v" \

vcom -work lib_pkg_v1_0_2 -64 -93 \
"../../../../axi_timer_hw.srcs/sources_1/bd/axi_cpu/ipshared/0513/hdl/lib_pkg_v1_0_rfs.vhd" \

vcom -work axi_timer_v2_0_22 -64 -93 \
"../../../../axi_timer_hw.srcs/sources_1/bd/axi_cpu/ipshared/a141/hdl/axi_timer_v2_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -64 -93 \
"../../../bd/axi_cpu/ip/axi_cpu_axi_timer_0_0/sim/axi_cpu_axi_timer_0_0.vhd" \

vcom -work lib_srl_fifo_v1_0_2 -64 -93 \
"../../../../axi_timer_hw.srcs/sources_1/bd/axi_cpu/ipshared/51ce/hdl/lib_srl_fifo_v1_0_rfs.vhd" \

vcom -work axi_uartlite_v2_0_24 -64 -93 \
"../../../../axi_timer_hw.srcs/sources_1/bd/axi_cpu/ipshared/d8db/hdl/axi_uartlite_v2_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -64 -93 \
"../../../bd/axi_cpu/ip/axi_cpu_axi_uartlite_0_0/sim/axi_cpu_axi_uartlite_0_0.vhd" \

vlog -work xil_defaultlib -64 -incr "+incdir+../../../../axi_timer_hw.srcs/sources_1/bd/axi_cpu/ipshared/4fba" "+incdir+../../../../axi_timer_hw.srcs/sources_1/bd/axi_cpu/ipshared/ec67/hdl" \
"../../../bd/axi_cpu/sim/axi_cpu.v" \

vlog -work xil_defaultlib \
"glbl.v"

