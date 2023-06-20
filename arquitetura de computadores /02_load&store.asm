# A[0] = 15;
# A[1] = 15;
# A[2] = 15;
# A[3] = 15;
# A[4] = 15;
# A[100] = 15;

.data
meuV: .word  0xff

.text
la   $t0, meuV    
addi $t1, $zero, 15
sw $t1, 0($t0)
sw $t1, 4($t0)
sw $t1, 8($t0)
sw $t1, 12($t0)
sw $t1, 16($t0)
sw $t1, 400($t0)
lw $t2, 4($t0)
