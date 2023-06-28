#Dado o conjunto de instruções visto nas aulas), mostre uma linguagem de montagem para os seguintes segmentos de código

#i = 10
#j = 5
#enquanto (i > j) faça:
#if (a[i] > 10) então
#a[i] = i + 10;
#senão
#a[i] = i + 20;
#i = i – 1;
#fim-enquanto

.data
a: .word  0

.text
la   $t0, a
addi $s0, $zero, 10 # i
addi $s1, $zero, 5 # j 
LOOP: slt $t1, $s1, $s0
beqz $t1, FIMLOOP
sll $s2, $s0, 2 # i*4
add $s2, $s2, $t0
lw $t3, 0($s2) #Lê a[i]
addi $t4, $zero, 10
slt $t5, $t4, $t3
beqz $t5, ELSE
addi $t3, $t3, 10
sw $t3, 0($s2)
j FIMIF
ELSE: addi $t3, $t3, 20
sw $t3, 0($s2)
FIMIF: subi $s0, $s0, 1
j LOOP
FIMLOOP:
