DESKTOP_FILE=TopHat.desktop
GAME_DIR=`pwd`

# remove existing TopHat desktop entry file
rm $DESKTOP_FILE

# download TopHat icon from github if necessary
if [ -f "TopHat.png" ]
then
  echo "TopHat.png exists already. Skipping download."
else
  echo "TopHat.png doesn't exist. Attempting to download it.."
  wget "https://raw.githubusercontent.com/RandomStrangers/ClassiCube-TopHat/master/misc/CCicon.png"
fi

# create TopHat desktop entry
echo 'Creating TopHat.desktop..'
cat >> $DESKTOP_FILE << EOF
[Desktop Entry]
Type=Application
Comment=Minecraft Classic inspired sandbox game
Name=TopHat
Exec=$GAME_DIR/TopHat
Icon=$GAME_DIR/TopHat.png
Path=$GAME_DIR
Terminal=false
Categories=Game
EOF
chmod +x $DESKTOP_FILE

echo 'Installing TopHat.desktop..'
# install ClassiCube desktop entry into the system
sudo desktop-file-install --dir=/usr/share/applications TopHat.desktop
sudo update-desktop-database /usr/share/applications