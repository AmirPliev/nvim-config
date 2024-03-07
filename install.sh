#!/bin/bash
cat << EOF
-----------------------------------------------------------------

NOTE: This is going to delete your current installation of NeoVim
and move this whole folder to: ~/.config/nvim/

If you don't what this to happen, quit this process now!"

-----------------------------------------------------------------
EOF

read -p "Press ENTER to continue..."  result


echo "---- Installing prerequisites -----"

# Check if NeoVim is installed, if not, install it
if ! command -v nvim &> /dev/null
then
    echo "NeoVim is not installed. I'll install it first:"
    sudo apt-get install curl

    curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
    sudo chmod u+x nvim.appimage
    sudo mv nvim.appimage /usr/local/bin/nvim
    sudo chmod +x /usr/local/bin/nvim
fi 

# Check if correct fonts are installed
if ! command -v fc-list | grep "NerdFont" &> /dev/null
then
    echo "There is no NerdFont installed. I'll install it first:"   
    sudo apt-get install curl
    curl -LO https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.1/JetBrainsMono.zip

    sudo mkdir -p /usr/local/share/fonts/JetBrainsNerdFont
    sudo apt-get install unzip

    unzip JetBrainsMono.zip -d /usr/local/share/fonts/JetBrainsNerdFont

    sudo apt-get install fontconfig
    sudo fc-cache -fv

    rm JetBrainsMono.zip
fi

sudo apt-get install ripgrep sshfs -y

# Check if node is installed, if not, install it
if which node > /dev/null
    then
        echo "node is installed, huzzah..."
    else
      echo "node is not installed. I'll install it first:"
      curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh | bash
      nvm install node
fi


echo "---- Deleting Current NeoVim configurations -----"
sudo rm -rf ~/.local/share/nvim/
sudo rm -rf ~/.config/nvim/

echo "------ INSTALL VnChad ----"
git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1 

cp -r $PWD/* ~/.config/nvim/lua/
cp -r .git/ ~/.config/nvim/lua/
cp -r .gitignore ~/.config/nvim/lua/

echo ""
echo "IMPORTANT: "
echo "Installation Should have been completed."

echo "From now on you can go to ~/.config/nvim/lua/ and perform ./update.sh in order
      to do updates."
read -p "Press ENTER to continue..."  result

nvim
