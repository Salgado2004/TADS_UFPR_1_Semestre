#Feito pelo professor	
	
# A[0] = 1;
# A[1] = 2;
# A[2] = 3;
# 
# g = 0;
# h = 3;
# i = 0;
# 
# do {
#   g = g + A[i];
#   i = i + 1
# } while(i != h); # --> if (i != h) goto LOOP 

.data
A: .word  0

.text
la   $s5, A 

addi $t0, $zero, 1
addi $t1, $zero, 2
addi $t2, $zero, 3

sw $t0, 0($s5)
sw $t1, 4($s5)
sw $t2, 8($s5)

add  $s0,$zero,$zero #g
addi $s1,$zero,3    #h
addi $s2,$zero,0    #i

Loop: 	add $t1, $s2, $s2 # i + i
	add $t1, $t1, $t1 # i + i 
	add $t1, $t1, $s5 # i*4 + A
	lw $t0, 0($t1) # A[i] em $t0
	add $s0, $s0, $t0 # soma com g
	addi $s2, $s2, 1 # i = i + 1
	bne $s2, $s1, Loop 
