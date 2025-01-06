vsim -L altera_mf_ver -gui work.Lab7

add wave *

force Reset 0 @ 0, 1 @ 1
force Clock 0 @ 0, 1 @ 2 -r 4

force Bin 11 @ 0
force Rin 11 @ 0
force Gin 11 @ 0

run 30000