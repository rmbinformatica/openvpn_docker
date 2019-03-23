#!/bin/bash
read -p "Caminho para manter os arquivos de configuracao? (Ex.: /home/renato/vpn) " OVPN_DATA
read -p "Endereço público do servidor VPN? " ENDERECO
sudo docker run -v $OVPN_DATA:/etc/openvpn --log-driver=none --rm kylemanna/openvpn ovpn_genconfig -u udp://$ENDERECO
sudo docker run -v $OVPN_DATA:/etc/openvpn --log-driver=none --rm -it kylemanna/openvpn ovpn_initpki
echo "export OVPN_DATA=\"$OVPN_DATA\"" > caminho.local
./iniciar.sh
