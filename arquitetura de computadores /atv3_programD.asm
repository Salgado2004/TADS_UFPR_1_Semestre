#Dado o conjunto de instruções visto nas aulas), mostre uma linguagem de montagem para os seguintes segmentos de código

#se (i == j) então
#f = g + h;
#senão se (i > j) então
#f = g – h;
#senão se (i < j) então
#f = g – 10;
#fim-se

add $s0, $zero, $zero # i
add $s1, $zero, $zero # j

addi $t0, $zero, 3 # g
addi $t1, $zero, 5 # h
add $t2, $zero, $zero # f

bne $s0, $s1, ELSE1
add $t2, $t0, $t1
j FIM
ELSE1: slt $t7, $s0, $s1
bnez $t7, ELSE2
sub $t2, $t0, $t1
j FIM
ELSE2: subi $t2, $t0, 10
FIM:
