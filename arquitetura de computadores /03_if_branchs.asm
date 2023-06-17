#Feito pelo professor

# a = 0;
# b = 10;
# if (a == b) {
#   a = a + 1;
# }
#b = b + 1;

#     a = 0;
#     b = 10;
#     if (a != b) GOTO FIM 
#     a = a + 1;
#FIM: b = b + 1;

	add $s0, $zero, $zero # a
	addi $s1, $zero, 10  # b
	bne $s0, $s1, FIM
	addi $s0, $s0, 1
FIM: addi $s1, $s1, 1


