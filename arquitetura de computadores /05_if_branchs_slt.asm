#Feito pelo professor

# a = 0;
# b = 10;
# if (a >= b) {
#   a = a + 1;
# }
#b = b + 1;

#     a = 0;
#     b = 10;
#     if (a < b) GOTO FIM 
#     a = a + 1;
#FIM: b = b + 1;

	add $s0, $zero, $zero # a
	addi $s1, $zero, 10  # b
	slt $t0, $s0, $s1
	bne $t0, $zero, FIM
	addi $s0, $s0, 1
FIM: addi $s1, $s1, 1

# bge $t0, $t1, FIM
