#!/usr/bin/tclsh

set rotr_fname "rotr.prof.log"
set rotr_out_str "Rotr: "
set rotr_addr 0xcc0
set rotr_exit_addr 0xd20

set shr_fname "shr.prof.log"
set shr_out_str "Shr: "
set shr_addr 0xd28
set shr_exit_addr 0xd74

set ch_fname "ch.prof.log"
set ch_out_str "Ch: "
set ch_addr 0xd98
set ch_exit_addr 0xdc4

set maj_fname "maj.prof.log"
set maj_out_str "Maj: "
set maj_addr 0xde8
set maj_exit_addr 0xe18

set bsig0_fname "bsig0.prof.log"
set bsig0_out_str "bsig0: "
set bsig0_addr 0xe3c
set bsig0_exit_addr 0xea4

set bsig1_fname "bsig1.prof.log"
set bsig1_out_str "bsig1: "
set bsig1_addr 0xec8
set bsig1_exit_addr 0xf30

set ssig0_fname "ssig0.prof.log"
set ssig0_out_str "ssig0: "
set ssig0_addr 0xf54
set ssig0_exit_addr 0xfbc

set ssig1_fname "ssig1.prof.log"
set ssig1_out_str "ssig1: "
set ssig1_addr 0xfc4
set ssig1_exit_addr 0x1048

set memcpy_fname "memcpy.prof.log"
set memcpy_out_str "memcpy: "
set memcpy_addr 0x3e8
set memcpy_exit_addr 0x57c

set memmove_fname "memmove.prof.log"
set memmove_out_str "memmove: "
set memmove_addr 0x584
set memmove_exit_addr 0x7a4

set memset_fname "memset.prof.log"
set memset_out_str "memset: "
set memset_addr 0x7ac
set memset_exit_addr 0x9fc

set procworkvar_fname "procworkvar.prof.log"
set procworkvar_out_str "procworkvar: "
set procworkvar_addr 0x15d0
set procworkvar_exit_addr 0x17a4

set prepmsched_fname "prepmsched.prof.log"
set prepmsched_out_str "prepmsched: "
set prepmsched_addr 0x1448
set prepmsched_exit_addr 0x15a4

set performhash_fname "performhash.prof.log"
set performhash_out_str "performhash: "
set performhash_addr 0x17c4
set performhash_exit_addr 0x1954

set targ_func_prof_fname $performhash_fname
set targ_func_out_str $performhash_out_str
set targ_func_addr $performhash_addr
set targ_func_exit_addr $performhash_exit_addr

set sha_exit_addr 0x1b88

set steplog [open "step_out.log.txt" "a"]
puts $steplog "Session reset"
close $steplog
rst
bpremove -all
#bpadd -target-id all $sha_exit_addr
bpadd -target-id all $targ_func_addr
bpenable -all

set exit "false"
while {$exit == "false"} {
	con

	set pc [string trimleft [string trimright [rrd -no-bits pc]] "pc: "]
	scan $pc "%8x" pc

	set steplog [open "step_out.log.txt" "a"]
	puts $steplog $pc
	close $steplog

	if {$sha_exit_addr == $pc} {
		#set exit "true"
	}

	if {$targ_func_addr == $pc} {
		set steplog [open "step_out.log.txt" "a"]
		puts -nonewline $steplog "\nREACHED FUNC: ${targ_func_out_str} ${pc}"
		close $steplog

		set pclog [open $targ_func_prof_fname "a"]
		
		set counter 0
		while {$targ_func_exit_addr != $pc} {

			stpi
			set counter [expr $counter+1]

			set pc [string trimleft [string trimright [rrd -no-bits pc]] "pc: "]
			scan $pc "%8x" pc 	

			#set steplog [open "step_out.log.txt" "a"]
			#puts -nonewline $steplog ",${pc}"
			#close $steplog

			if {$ch_addr_pattern == $pc} {
				set steplog [open "step_out.log.txt" "a"]
				puts -nonewline $steplog "\nREACHED FUNC: ${ch_out_str} ${pc}"
				close $steplog
                set counter [expr $counter + 11]
                stpout
			} elseif {$maj_addr == $pc} {
				set steplog [open "step_out.log.txt" "a"]
				puts -nonewline $steplog "\nREACHED FUNC: ${maj_out_str} ${pc}"
				close $steplog
				set counter [expr $counter + 12]
				stpout
			} elseif {$bsig0_addr == $pc} {
				set steplog [open "step_out.log.txt" "a"]
				puts -nonewline $steplog "\nREACHED FUNC: ${bsig0_out_str} ${pc}"
				close $steplog
				set counter [expr $counter + 293]
				stpout
			} elseif {$bsig1_addr == $pc} {
				set steplog [open "step_out.log.txt" "a"]
				puts -nonewline $steplog "\nREACHED FUNC: ${bsig1_out_str} ${pc}"
				close $steplog
				set counter [expr $counter + 293]
				stpout
			} elseif {$ssig0_addr == $pc} {
				set steplog [open "step_out.log.txt" "a"]
				puts -nonewline $steplog "\nREACHED FUNC: ${ssig0_out_str} ${pc}"
				close $steplog
				set counter [expr $counter + 226]
				stpout
			} elseif {$ssig1_addr == $pc} {
				set steplog [open "step_out.log.txt" "a"]
				puts -nonewline $steplog "\nREACHED FUNC: ${ssig1_out_str} ${pc}"
				close $steplog
				set counter [expr $counter + 240]
				stpout
			} elseif {$memcpy_addr == $pc} {
				set steplog [open "step_out.log.txt" "a"]
				puts -nonewline $steplog "\nREACHED FUNC: ${memcpy_out_str} ${pc}"
				close $steplog
				set counter [expr $counter + 670]
				stpout
			} elseif {$memmove_addr == $pc} {
				set steplog [open "step_out.log.txt" "a"]
				puts -nonewline $steplog "\nREACHED FUNC: ${memmove_out_str} ${pc}"
				close $steplog
				set counter [expr $counter + 128]
				stpout
			} elseif {$memset_addr == $pc} {
				set steplog [open "step_out.log.txt" "a"]
				puts -nonewline $steplog "\nREACHED FUNC: ${memset_out_str} ${pc}"
				close $steplog
				set counter [expr $counter + 191]
				stpout
			} elseif {$procworkvar_addr == $pc} {
				set steplog [open "step_out.log.txt" "a"]
				puts -nonewline $steplog "\nREACHED FUNC: ${procworkvar_out_str} ${pc}"
				close $steplog
				set counter [expr $counter + 747]
				stpout
			} elseif {$prepmsched_addr == $pc} {
                set steplog [open "step_out.log.txt" "a"]
				puts -nonewline $steplog "\nREACHED FUNC: ${prepmsched_out_str} ${pc}"
				close $steplog
				set counter [expr $counter + 26251]
                stpout
        	}
		}
		set output $targ_func_out_str
		append output $counter			
		puts $pclog $output
		
		close $pclog
	}
}