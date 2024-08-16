#!/bin/bash

# Display menu for selecting an operation
echo "Please choose one of the following options:"
echo "1) Install Uptime Kuma"
echo "2) Uninstall Uptime Kuma"
echo "3) Start Uptime Kuma service"
echo "4) Stop Uptime Kuma service"
echo "5) Check Uptime Kuma service status"
read -p "Your choice: " choice

case $choice in
    1)
        # Install Uptime Kuma
        sudo apt update
        sudo apt install -y curl software-properties-common
        
        curl -fsSL https://deb.nodesource.com/setup_16.x | sudo -E bash -
        
        sudo apt install -y nodejs
        
        mkdir -p ~/uptime-kuma
        cd ~/uptime-kuma
        
        git clone https://github.com/louislam/uptime-kuma.git .
        
        npm install
        
        npm run build
        
        sudo bash -c 'cat <<EOF > /etc/systemd/system/uptime-kuma.service
[Unit]
Description=Uptime Kuma
After=network.target

[Service]
Type=simple
User=root
ExecStart=/usr/bin/npm start --prefix /root/uptime-kuma
Restart=on-failure

[Install]
WantedBy=multi-user.target
EOF'

        sudo systemctl daemon-reload
        sudo systemctl enable uptime-kuma
        sudo systemctl start uptime-kuma

        echo "Uptime Kuma has been installed and is running as a service."
        ;;
    2)
        # Uninstall Uptime Kuma
        sudo systemctl stop uptime-kuma
        sudo systemctl disable uptime-kuma
        sudo rm /etc/systemd/system/uptime-kuma.service
        sudo systemctl daemon-reload
        sudo systemctl reset-failed
        rm -rf ~/uptime-kuma
        echo "Uptime Kuma has been uninstalled."
        ;;
    3)
        # Start Uptime Kuma service
        sudo systemctl start uptime-kuma
        echo "Uptime Kuma service started."
        ;;
    4)
        # Stop Uptime Kuma service
        sudo systemctl stop uptime-kuma
        echo "Uptime Kuma service stopped."
        ;;
    5)
        # Check Uptime Kuma service status
        sudo systemctl status uptime-kuma
        ;;
    *)
        echo "Invalid option. Please select one of the available options."
        ;;
esac
