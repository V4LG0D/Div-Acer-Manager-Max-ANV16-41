#!/bin/bash
# DAMX Installer for ANV16-41 (Fedora/Generic)
INSTALL_DIR="/opt/damx"
SYSTEMD_DIR="/etc/systemd/system"

if [ "$EUID" -ne 0 ]; then 
  echo "Por favor, corre este script con sudo."; exit 1
fi

echo "--- Instalando Driver Linuwu-Sense ---"
cd Linuwu-Sense && make clean && make && make install && cd ..

echo "--- Instalando Daemon (Python) ---"
mkdir -p $INSTALL_DIR/daemon
cp -r DAMX-Daemon/* $INSTALL_DIR/daemon/
chmod +x $INSTALL_DIR/daemon/*.py

echo "--- Configurando Servicio Systemd ---"
cat > $SYSTEMD_DIR/damx-daemon.service << EOL
[Unit]
Description=DAMX Daemon for Acer Nitro V 16
After=network.target

[Service]
Type=simple
ExecStart=/usr/bin/python3 $INSTALL_DIR/daemon/DAMX-Daemon.py
Restart=on-failure
User=root

[Install]
WantedBy=multi-user.target
EOL

echo "--- Instalando GUI (C#) ---"
mkdir -p $INSTALL_DIR/gui
cd DAMX-GUI
dotnet publish -c Release -r linux-x64 --self-contained
cp -r bin/Release/net8.0/linux-x64/publish/* $INSTALL_DIR/gui/
chmod +x $INSTALL_DIR/gui/DivAcerManagerMax
cd ..

echo "--- Creando Lanzador ---"
rm -f /usr/local/bin/DAMX
ln -s $INSTALL_DIR/gui/DivAcerManagerMax /usr/local/bin/DAMX

systemctl daemon-reload
systemctl enable damx-daemon.service
systemctl restart damx-daemon.service

echo "¡Instalación completa! Ejecuta 'DAMX' para empezar."
