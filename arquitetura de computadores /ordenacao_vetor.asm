#Ordenação de vetor
#feito para estudar lw e sw

#a[0] = 10
#a[4] = 5
#a[8] = 3
#a[12] = 9
#while(i < 10) do
#if (a[i] < a[i-1]) then
#j = a[i]
#a[i] = a[i-1]
#a[i-1] = j

.data
a: .word 0

.text
la $t0, a

addi $t1, $zero, 10
addi $t2, $zero, 5
addi $t3, $zero, 3
addi $t4, $zero, 9

sw $t1, 0($t0)
sw $t2, 4($t0)
sw $t3, 8($t0)
sw $t4, 12($t0)

addi $s0, $zero, 0
addi $s1, $zero, 10
LOOP: slt $t1, $s0, $s1
beqz $t1, FIMLOOP
add $s2, $zero, $s0
addi $s0, $s0, 1
sll $t2, $s0, 2
sll $t3, $s2, 2
add $t2, $t2, $t0
add $t3, $t3, $t0
lw $t4, 0($t2)
lw $t5, 0($t3)
slt $t6, $t4, $t5
beqz $t6, ELSE
sw $t4, 0($t3)
sw $t5, 0($t2)
ELSE: j LOOP
FIMLOOP:
