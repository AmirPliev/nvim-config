#!/bin/bash

cat << EOF
-----------------------------------------------------------------

NOTE: This is going to delete your current installation of NeoVim
and move this whole folder to: ~/.config/nvim/

If you don't what this to happen, quit this process now!"

-----------------------------------------------------------------
EOF

read -p "Press ENTER to continue..."  result

echo "---- Deleting Current NeoVim configurations -----"
rm -rf ~/.local/share/nvim/
rm -rf ~/.config/nvim/

echo "------ INSTALL VnChad ----"
git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1 

cp -r $PWD/* ~/.config/nvim/lua/
cp -r .git/ ~/.config/nvim/lua/
cp -r .gitignore ~/.config/nvim/lua/

echo ""
echo "IMPORTANT: "
echo "Installation Should have been completed. I'm about to delete this folder."
echo "From now on you can go to ~/.config/nvim/lua/ and perform ./update.sh in order
      to do updates."
read -p "Press ENTER to continue..."  result

CURRENT_DIR=$PWD
cd ~/.config/nvim/lua
# rm -rf $CURRENT_DIR



nvim
