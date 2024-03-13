#!/bin/bash
cat << EOF
-----------------------------------------------------------------

NOTE: This is going to delete your current installation of NeoVim
and move this whole folder to: ~/.config/nvim/

If you don't what this to happen, quit this process now!"

-----------------------------------------------------------------
EOF

read -p "Press ENTER to continue..."  result

echo ""
echo ""
echo ""
echo "---- Checking prerequisites -----"
echo ""

command -v nvim >/dev/null

if [[ $? -ne 0 ]]; then
    echo "Nvim is not installed"
    exit 1
else
    nvim_version=$(nvim --version | head -1 | grep -o '[0-9]\.[0-9]')

    if (( $(echo "$nvim_version < 0.9 " |bc -l) )); then
            echo "Wrong version of Nvim is installed"
            exit 1
    else
        echo "Nvim version 0.9 or greater is installed"
    fi
fi


# Check if correct fonts are installed
if ! command -v fc-list | grep "NerdFont" &> /dev/null
then
    echo "There is no NerdFont installed. Make sure you install it or else everything will look weird"   
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

echo ""
echo ""
echo ""
echo "---- Deleting Current NeoVim configurations -----"
echo ""
sudo rm -rf ~/.local/share/nvim/
sudo rm -rf ~/.config/nvim/

echo ""
echo ""
echo ""
echo "------ INSTALL VnChad ----"
echo ""

mkdir -p ~/.config/nvim
cp -r $PWD/* ~/.config/nvim
cp -r .git/ ~/.config/nvim/lua/
cp -r .gitignore ~/.config/nvim/lua/

echo ""
echo "IMPORTANT: "
echo "Installation Should have been completed."

echo "From now on you can go to ~/.config/nvim/lua/ and perform ./update.sh in order
      to do updates."
read -p "Press ENTER to continue..."  result

nvim
