#Dado o conjunto de instruções visto nas aulas), mostre uma linguagem de montagem para os seguintes segmentos de código

#se (i != 0) então
#i = i – 1;

addi $s0,$zero,2 # i
beqz  $s0, FIM
subi $s0, $s0, 1
FIM: 
