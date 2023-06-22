#Dado o conjunto de instruções visto nas aulas), mostre uma linguagem de montagem para os seguintes segmentos de código

#i = 10
#j = 5
#k = 8
#enquanto (i > j) faça:
#if (i > k) então
#i = i + 1;
#fim-se
#i = i – 2;
#fim-enquanto

addi $s0, $zero, 10 # i
addi $s1, $zero, 5 # j
addi $s2, $zero, 8 # k

LOOP: slt $t0, $s0, $s1
bnez $t0, FIMLOOP
slt $t1, $s0, $s2
bnez $t1, FIMSE
addi $s0, $s0, 1
FIMSE: subi $s0, $s0, 2
j LOOP
FIMLOOP:
