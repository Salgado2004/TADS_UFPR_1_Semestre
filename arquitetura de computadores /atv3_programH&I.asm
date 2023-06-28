#Dado o conjunto de instruções visto nas aulas), mostre uma linguagem de montagem para os seguintes segmentos de código

#h)
#restodadivisao (natural di, natural dv) {
#int r, q, a;
#q = di/dv
#a = q * dv
#r = di – a
#}

#i)
#a = 5
#b = 3
#se (a > b)
#c = mdc(a, b)
#d = c
#mdc (natural x, natural y) {
#se (y == 0) retorne x
#senao retorne mdc (y, restodadivisao (x, y))
#}

addi $s0, $zero, 45 # a
addi $s1, $zero, 60 # b
slt $t0, $s0, $s1
beqz $t0, ELSE
add $a2, $zero, $s0
add $a3, $zero, $s1
jal MDC
add $s2, $zero, $v1 # c
ELSE: add $s3, $zero, $s2 # d
j FIM


RESTO: 
div $t0, $a0, $a1
mul $t1, $t0, $a1
sub $v0, $a0, $t1
jr $ra

MDC: 
beqz $a3, RETORNEX
add $a0, $zero, $a2
add $a1, $zero, $a3
subi $sp, $sp, 4
sw $ra, 0($sp)
jal RESTO
lw $ra, 0($sp)
addi $sp, $sp, 4
add $a2, $zero, $a3
add $a3, $zero, $v0
subi $sp, $sp, 4
sw $ra, 0($sp)
jal MDC
lw $ra, 0($sp)
addi $sp, $sp, 4
j FIMDC
RETORNEX: add $v1, $zero, $a2
FIMDC: jr $ra

FIM:
