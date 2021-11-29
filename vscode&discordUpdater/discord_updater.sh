wget -O discord "https://discord.com/api/download?platform=linux&format=tar.gz"
tar --extract --overwrite --file=discord
rm discord
cd Di*/
rm *.desktop
sudo cp -r ./* /usr/share/discord/
cd ..
rm -rf Di*/