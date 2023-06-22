#Dado o conjunto de instruções visto nas aulas), mostre uma linguagem de montagem para os seguintes segmentos de código

#i = 5
#j = 10
#enquanto (i < j) faça:
#f = g + h;
#i = i + 1;
#fim-enquanto

addi $s0, $zero, 5 # i
addi $s1, $zero, 10 # j

add $t1, $zero, $zero # f
addi $t2, $zero, 2 # g
addi $t3, $zero, 3 # h

LOOP: slt $t0, $s1, $s0
bnez $t0, FIMLOOP
add $t1, $t2, $t3
addi $s0, $s0, 1
j LOOP
FIMLOOP:
