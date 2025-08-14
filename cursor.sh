#!/usr/bin/env bash

if [[ $EUID -eq 0 ]]; then
    clear
    echo "                       !!! WARNING !!!"
    echo "              DO NOT run this script as root!"
    echo "              Press any key to exit..."
    read -s -n 1 -p " "
    exit
fi

# verifica se é uma distro baseada em debian
if [ -f /etc/debian_version ]; then
    echo "Debian-based distribution detected"
else
    echo "Non-Debian distribution detected"
    exit 1
fi

sudo apt update -y

if [ -f /usr/bin/pkcon ]; then
  sudo pkcon update -y
fi

sudo apt install libfuse2 fuse3 -y

CURSOR_API_URL="https://cursor.com/api/download?platform=linux-x64&releaseTrack=stable"
CURSOR_DOWNLOAD_INFO=$(curl -s "$CURSOR_API_URL")
CURSOR_DOWNLOAD_URL=$(echo "$CURSOR_DOWNLOAD_INFO" | grep -o '"downloadUrl":"[^"]*' | cut -d'"' -f4)
CURSOR_DEB_URL=$(echo "$CURSOR_DOWNLOAD_INFO" | grep -o '"debUrl":"[^"]*' | cut -d'"' -f4)
CURSOR_VERSION=$(echo "$CURSOR_DOWNLOAD_INFO" | grep -o '"version":"[^"]*' | cut -d'"' -f4)

if [ -n "$CURSOR_DOWNLOAD_URL" ] && [ -n "$CURSOR_DEB_URL" ]; then
    echo "Cursor $CURSOR_VERSION detected"
    echo ""
    echo "How would you like to install Cursor?"
    echo "1) Install .deb package (recommended - system integration)"
    echo "2) Use AppImage with GearLever (portable)"
    echo ""
    read -p "Enter your choice (1 or 2): " choice
    
    case $choice in
        1)
            echo "Installing Cursor .deb package..."
            
            # Remove previous installations
            if [ -d "$HOME/.local/share/cursor" ]; then
                echo "Removing previous Cursor installation..."
                rm -rf "$HOME/.local/share/cursor"
            fi
            
            if [ -f "$HOME/.local/share/applications/cursor.desktop" ]; then
                rm -f "$HOME/.local/share/applications/cursor.desktop"
            fi
            
            if [ -f "/usr/local/bin/cursor" ]; then
                sudo rm -f "/usr/local/bin/cursor"
            fi

            curl -fsSL https://chave.gpg.url | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/nome-da-chave.gpg > /dev/null
            sudo mv /etc/apt/trusted.gpg /etc/apt/trusted.gpg.bak
            sudo apt update -y
            
            # Download and install .deb package
            echo "Downloading Cursor .deb package..."
            wget -O "$HOME/Downloads/cursor_$CURSOR_VERSION.deb" "$CURSOR_DEB_URL"
            
            echo "Installing .deb package..."
            sudo dpkg -i "$HOME/Downloads/cursor_$CURSOR_VERSION.deb"
            
            # Fix any dependency issues
            sudo apt --fix-broken install -y
            
            # Clean up downloaded file
            rm -f "$HOME/Downloads/cursor_$CURSOR_VERSION.deb"
            
            echo "Cursor successfully installed via .deb package!"
            echo "You can now launch it from applications menu or run 'cursor' in terminal."
            ;;
        2)
            echo "Downloading Cursor AppImage..."
            wget -O "$HOME/Downloads/Cursor.AppImage" "$CURSOR_DOWNLOAD_URL"
            chmod +x "$HOME/Downloads/Cursor.AppImage"
            
            # Install GearLever
            echo "Installing GearLever..."
            sudo apt install flatpak -y
            flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo -y
            flatpak install flathub it.mijorus.gearlever -y

            flatpak run it.mijorus.gearlever "$HOME/Downloads/Cursor.AppImage"
            echo "Cursor downloaded and opened in GearLever!"
            ;;
        *)
            echo "Invalid choice. Installing .deb package by default..."
            
            # Remove previous installations
            if [ -d "$HOME/.local/share/cursor" ]; then
                echo "Removing previous Cursor installation..."
                rm -rf "$HOME/.local/share/cursor"
            fi
            
            if [ -f "$HOME/.local/share/applications/cursor.desktop" ]; then
                rm -f "$HOME/.local/share/applications/cursor.desktop"
            fi
            
            if [ -f "/usr/local/bin/cursor" ]; then
                sudo rm -f "/usr/local/bin/cursor"
            fi
            
            # Download and install .deb package
            echo "Downloading Cursor .deb package..."
            wget -O "$HOME/Downloads/cursor_$CURSOR_VERSION.deb" "$CURSOR_DEB_URL"
            
            echo "Installing .deb package..."
            sudo dpkg -i "$HOME/Downloads/cursor_$CURSOR_VERSION.deb"
            
            # Fix any dependency issues
            sudo apt --fix-broken install -y
            
            # Clean up downloaded file
            rm -f "$HOME/Downloads/cursor_$CURSOR_VERSION.deb"
            
            echo "Cursor successfully installed via .deb package!"
            echo "You can now launch it from applications menu or run 'cursor' in terminal."
            ;;
    esac
else
    echo "Error obtaining Cursor download information"
fi