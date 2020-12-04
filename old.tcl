#!/usr/bin/tclsh

set pc [string trim [rrd -no-bits pc] "pc: "]
while {[string match "00001978*" $pc] != 1} {
	set pc [string trim [rrd -no-bits pc] "pc: "]
	stp
}

puts "\n**\n**\n**\nReached sha func\n**\n**\n**"

set pclog [open "flog.txt" "a"]

set pc [string trim [rrd -no-bits pc] "pc: "]
puts $pclog $pc
puts $pc

while {[string match "00001b88*" $pc] != 1} {
	stp
	set pc [string trim [rrd -no-bits pc] "pc: "]
	puts $pc
	if {[string match "000003e8*" $pc] == 1} {
		stpout	
		puts "**************************************memcpy"
	}
	if {[string match "000007ac*" $pc] == 1} {
		stpout	
		puts "**************************************memset"
	}
	if {[string match "00000cc0*" $pc] == 1} {
		set counter 6
		while {[string match "00000d20*" $pc] != 1} {
			set counter [expr $counter+1]
			stpi
			set pc [string trim [rrd -no-bits pc] "pc: "] 		
		}
		set output "Rotr: "
		append output $counter			
		puts $pclog $output
		puts $output
	}
}

close $pclog