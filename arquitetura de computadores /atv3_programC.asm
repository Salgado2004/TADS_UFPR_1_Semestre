#Dado o conjunto de instruções visto nas aulas), mostre uma linguagem de montagem para os seguintes segmentos de código

#se (i < j) então
#i = i + j;
#senão
#i = i – j;
#fim-se

addi $s0, $zero, 2 #i
addi $s1, $zero, 3 #j
slt $t0, $s1, $s0
bnez $t0, ELSE
add $s0, $s0, $s1
j FIM
ELSE: sub $s0, $s0, $s1
FIM:
