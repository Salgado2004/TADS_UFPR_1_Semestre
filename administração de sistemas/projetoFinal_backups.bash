                 
#!/bin/bash
#Feito por:
#Alisson Gabriel dos Santos
#Leonardo Felipe Salgado
#Raul Ferreira Bana

Principal(){
echo "Projeto Final - Sistema de Backup de Arquivos"
echo
locali=`pwd`
echo "Local: $locali"
user=`id -un`
echo `ls /home/$user`
echo "Selecione seus arquivos para fazer backup"
}

Principal

