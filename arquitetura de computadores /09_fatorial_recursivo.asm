#Feito pelo professor

# int fact(int n) {
#	if (n < 1) return 1;
#  	else return (n * fact(n - 1));
#}
# fact(3) = 3 * fact(2)
# fact(2) = 2 * fact(1)
# fact(1) = 1 * fact(0)
# fact(0) = 1

addi	$a0, $zero, 4
jal	fact
add	$s0, $zero, $v0
j	FIM
fact: 	subi $sp, $sp, 8
	sw $ra, 4($sp)
	sw $a0, 0($sp)
	slti $t0, $a0, 1
	beq $t0, $zero, L1
	addi $v0, $zero, 1
	addi $sp, $sp, 8
	jr $ra
    L1:	subi $a0, $a0, 1
    	jal fact
    	lw $a0, 0($sp)
	lw $ra, 4($sp)
    	addi $sp, $sp, 8
    	mul $v0, $a0, $v0
    	jr $ra
FIM:
