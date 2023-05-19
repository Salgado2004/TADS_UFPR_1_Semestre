#!/bin/bash
echo "Você gosta de presunto? S/N"
read resposta

if [ $resposta = "S" ]; then
	echo "Você tem bom gosto"
else
	echo "Poxa :/"
fi
