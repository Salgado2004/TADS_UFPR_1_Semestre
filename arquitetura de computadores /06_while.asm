#Feito pelo professor

# a = 0;
# b = 0;
# while (a <= 10) {
#   a = a + 1;
# }
#b = b + 1;


#      a = 0;
#      b = 0;
#LOOP: if (a > 10) goto FIML
#      a = a + 1;
#      goto LOOP;
#
#FIML: b = b + 1;

	addi $s0, $zero, 0 # a
	addi $s1, $zero, 0 # b
	addi $t0, $zero, 10
LOOP: 	slt $t1, $t0, $s0
	bne $t1, $zero, FIML
	addi $s0, $s0, 1
	j LOOP
FIML: addi $s1, $zero, 1
