connect -url tcp:127.0.0.1:3121
targets -set -filter {jtag_cable_name =~ "Digilent Nexys4DDR 210292A8AE9FA" && level==0} -index 0
fpga -file /home/connor/Documents/Programs/Vivado/4300/SHA-256-SoC/debug_workspace/debug_hw/_ide/bitstream/download.bit
configparams mdm-detect-bscan-mask 2
targets -set -nocase -filter {name =~ "*microblaze*#0" && bscan=="USER2" }
rst -system
after 3000
targets -set -nocase -filter {name =~ "*microblaze*#0" && bscan=="USER2" }
dow /home/connor/Documents/Programs/Vivado/4300/SHA-256-SoC/debug_workspace/debug_hw/Debug/debug_hw.elf
targets -set -nocase -filter {name =~ "*microblaze*#0" && bscan=="USER2" }
con
