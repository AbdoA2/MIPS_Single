addi $t0, $0, 1
addi $s0, $0, 0
addi $t1, $0, 101
loop:
add $s0, $s0, $t0
addi $t0, $t0, 1
beq $t1, $t0, end
j loop
end:
sw $s0, 0($0)
lw $s1, 0($0)
add $s1, $s1, $t1
sw $s1, 4($0)