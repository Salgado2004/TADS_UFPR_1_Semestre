#Feito pelo professor

# a = 0;
# b = 5;
# if (a == 10) {
#   a = a + 1;
# }
# else {
#   a = a + 2;
#}
# b = b + 1

#       a = 0;
#       b = 5;
#       if (a != 10) GOTO SENAO 
#       a = a + 1;
#       GOTO FIM
#SENAO: a = a + 2;
#FIM: b = b + 1;

	add $s0, $zero, $zero # a
	addi $s1, $zero, 5    # b
	addi $t0, $zero, 0 
	bne $s0, $t0, SENAO
	addi $s0, $s0, 1
	j FIM
SENAO:  addi $s0, $s0, 2
FIM:    addi $s1, $s1, 1
