# Script para reiniciar o HA depois que a internet subir

Quando acontece falta de energia, o Home Assistant (seja em container ou Home Assistant OS) 
volta antes do router da operadora e isso faz com que os comandos da Alexa não funcionem 
(usando a integração emulated_hue). O objetivo deste script é esperar a internet voltar e 
dar um restart no container do Home Assistant para que ele seja iniciado depois da internet 
estar disponível).Ele foi pensado para o caso do Home Assistant estar rodando em container, 
pois assim tem-se acesso aos recursos do Debian.

## Passos:

- Coloque o arquivo testa_internet.sh no diretorio /etc/init.d/

- Torne o script executável: sudo chmod +x /etc/init.d/testa_internet.sh

- Coloque o arquivo testa_internet.service no diretório /etc/systemd/system/

- Ative o serviço: sudo systemctl enable testa_internet.service

## Testes

Quando o script é executado o arquivo de log /home/mirai/testa_internet.log
acumula as mensagens geradas ao longo da execução do script.


