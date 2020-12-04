#!/usr/bin/tclsh

set ch_addr 0xd98
set maj_addr 0xde8
set bsig0_addr 0xe3c
set bsig1_addr 0xec8
set ssig0_addr 0xf54
set ssig1_addr 0xfe0
set memcpy_addr 0x3e8
set memmove_addr 0x584
set memset_addr 0x7ac
set procworkvar_addr 0x15d0
set prepmsched_addr 0x1448

set performhash_addr 0x17c4
set performhash_exit_addr 0x1954

set sha_enter_addr 0x195c
set sha_exit_addr 0x1b88

rst
bpremove -all
bpadd -target-id all $sha_enter_addr
bpadd -target-id all $sha_exit_addr
bpenable -all

con

set exit "false"
set counter 0
set saveCount 0
while {$exit == "false"} {

        stpi
        set counter [expr $counter+1]
        set pc [string trimleft [string trimright [rrd -no-bits pc]] "pc: "]
        scan $pc "%8x" pc

        if {$sha_exit_addr == $pc} {
                set exit "true"

                set pclog [open "pc.log" "a+"]
                puts $pclog $counter
                close $pclog
        } elseif {$ch_addr_pattern == $pc} {
                set counter [expr $counter + 11]
                stpout
        } elseif {$maj_addr_pattern == $pc} {
                set counter [expr $counter + 12]
                stpout
        } elseif {$bsig0_addr_pattern == $pc} {
                set counter [expr $counter + 293]
                stpout
        } elseif {$bsig1_addr_pattern == $pc} {
                set counter [expr $counter + 293]
                stpout
        } elseif {$ssig0_addr_pattern == $pc} {
                set counter [expr $counter + 226]
                stpout
        } elseif {$ssig1_addr_pattern == $pc} {
                set counter [expr $counter + 240]
                stpout
        } elseif {$memcpy_addr == $pc} {
                set counter [expr $counter + 670]
                stpout
        } elseif {$memmove_addr == $pc} {
                set counter [expr $counter + 128]
                stpout
        } elseif {$memset_addr == $pc} {
                set counter [expr $counter + 191]
                stpout
        } elseif {$procworkvar_addr == $pc} {
                set counter [expr $counter + 747]
                stpout
        } elseif {$prepmsched_addr == $pc} {
                set counter [expr $counter + 26251]
                set saveCount [expr $saveCount+26]
                stpout
        } elseif {$performhash_addr == $pc} {
                set counter [expr $counter + 77129]
                set saveCount [expr $saveCount+77]
                stpout
        }

        if {$counter > [expr $saveCount * 1000]} {
                set saveCount [expr $saveCount+1]

                set pclog [open "pc.log" "a+"]
                puts $pclog $counter
                close $pclog
        }
}