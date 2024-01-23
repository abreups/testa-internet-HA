i#!/bin/bash

#
# versão 1: 03-jan-2024
#

# assume que a internet está fora
internet=0
contador=0

date >> /home/mirai/testa_internet.log

# inicia desativando ha
echo "parando container ha" >> /home/mirai/testa_internet.log
sudo docker stop ha

# fica no loop até que a internet fique disponível ou o
# contador for menor que 4 (5 min esperando)
#while [ $internet==0 && $contador<3 ]
while [ $internet -eq  0 ] && [ $contador -le 4 ]
do
    echo "pingando google dns"  >> /home/mirai/testa_internet.log
    ping -c 1 8.8.8.8 > /dev/null  	# testa o DNS server do Google
    if [ $? -eq 0 ]; then		# se o resultado do ping for 0 a acesso internet esta OK
        internet=1			# para sair do loop
	echo "iniciando container ha apos ping bem sucedido"  >> /home/mirai/testa_internet.log
        sudo docker start ha		# starta o container do home assistant
        break				# sai do loop while
    fi
    (( contador=contador+1 ))		# uso de parenteses mandatorio no bash
    sleep 60				#aguarda 1 min para repetir tudo novamente
done

# ao final, garanta que o ha vai estar ativo
echo "iniciando container ha no final do script" >> /home/mirai/testa_internet.log
sudo docker start ha

# FIM

