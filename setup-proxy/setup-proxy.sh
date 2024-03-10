#!/bin/bash

# Ask user if ClashVPN is installed
read -p "Do you have ClashVPN installed on your system? (Y/N): " clash_installed
case "$clash_installed" in 
  y|Y ) 
    echo "ClashVPN is installed on your system."
    ;;
  n|N ) 
    echo "ClashVPN is not installed on your machine. Please download and set up ClashVPN before running this script."
    echo "You can download ClashVPN from here: https://archive.org/download/clash_for_windows_pkg"
    exit 1
    ;;
  * ) 
    echo "Invalid choice. Please enter Y for Yes or N for No."
    exit 1
    ;;
esac

# Add proxy configurations to /etc/environment
echo "Adding proxy configurations to /etc/environment..."
sudo bash -c 'echo -e "\n# Proxy configurations for ClashVPN\nexport http_proxy=\"http://127.0.0.1:7890\"\nexport https_proxy=\"http://127.0.0.1:7890\"\nexport no_proxy=\"localhost,127.0.0.1\"" >> /etc/environment'
echo "Proxy configurations added to /etc/environment."

# Enable proxy for sudo operations
echo "Enabling proxy for sudo operations..."
sudo bash -c 'echo "Defaults env_keep+=\"http_proxy https_proxy no_proxy\"" >> /etc/sudoers'
echo "Proxy enabled for sudo operations."

# Ask user if they want to reboot
read -p "Do you want to reboot your machine to apply changes? (Y/N): " choice
case "$choice" in 
  y|Y ) 
    echo "Rebooting your machine..."
    sudo reboot
    ;;
  n|N ) 
    echo "Changes have been made. Please reboot your machine later to apply the changes."
    ;;
  * ) 
    echo "Invalid choice. Changes have been made. Please reboot your machine later to apply the changes."
    ;;
esac

# Print license information
echo "This script is created by jadu101 and is subject to copyright."
echo "You can find the script at: https://github.com/jadu101/clash-on-kali"
