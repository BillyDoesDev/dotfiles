## sup y'all!
After years of using KDE Plasma, and finally getting sick of the new updates bricking stuff up, making designs inconsistent, here, I'll put the stuff for my latest gnome config!!


<img src="https://cdn.discordapp.com/attachments/1246431376769548349/1247625897410822164/image.png?ex=66640169&is=6662afe9&hm=5ebb64452cfeae1aa58a3eb2c1854f6a84e8681a4bd17ca9d4e02f74418cbfcf&" />

## The Essentials

Install `yay`
```sh
git config --global init.defaultBranch main
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
yay --noconfirm -Syyuu
yay -S google-chrome
```

For Gnome:
```sh
yay -S google-chrome gdm-settings
sudo pacman -S gnome-browser-connector gnome-tweaks power-profiles-daemon network-manager-applet networkmanager-openvpn
```

## The Theme

First, get hold of the icon theme
```sh
git clone https://github.com/vinceliuice/Tela-circle-icon-theme.git
cd Tela-circle-icon-theme
sh ./install.sh standard nord
```

```sh
sudo pacman -S gnome-themes-extra gtk-engine-murrine sassc
git clone https://github.com/vinceliuice/Graphite-gtk-theme.git
cd Graphite-gtk-theme
sh install.sh --tweaks nord darker rimless colorful float
# and optionally, install the GDM theme
# sudo sh ./install.sh -g

# I've provided the necessary CSS files to spice things up a bit, later in this directory
```
In order to follow along with this config, you'll have to abuse the generated css file at `~/.themes/Graphite-Dark-nord/gnome-shell/gnome-shell.css`</br>
You'll also need a few specific assets, which are provied inside this directory.

You can also patch up the gdm install script to throw in your own background. After cloning, 
```
mv ./Graphite-gtk-theme/src/assets/gnome-shell/background-Dark.png ./Graphite-gtk-theme/src/assets/gnome-shell/background-Dark.bak.png
cp ./your/image.png ./Graphite-gtk-theme/src/assets/gnome-shell/background-Dark.png
```
~~Next up, install `gdm-settings` to further customise gdm. Also do not forget to install `gnome-tweaks` and `gnome-shell-extensions`.~~

## The Cursor
```sh
yay -Sy bibata-cursor-theme-bin
```
> [!TIP]
> - icons and cursors go to `~/.local/share/icons`
> - shell and application themes go to `~/.themes`
> - fonts go to `~/.local/share/fonts`, and you can list them via `fc-list`


## mpv
The config file is at `~/.config/mpv/input.conf`

```sh
Ctrl+Alt+. cycle_values video-rotate 90 180 270 0
Ctrl+Alt+, cycle_values video-rotate 270 180 90 0
Ctrl+m af toggle "lavfi=[pan=1c|c0=0.5*c0+0.5*c1]" ; show-text "Audio mix Mono Toggled."
```

## Alacritty and tmux
`~/.config/alacritty/alacritty.toml`</br>
This uses the catppuccin mocha theme, so make sure you have that
```sh
curl -LO --output-dir ~/.config/alacritty https://github.com/catppuccin/alacritty/raw/main/catppuccin-mocha.toml
```
<hr>

Install `tpm`
```sh
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```
And then, edit the `~/.config/tmux/tmux.conf` file accordingly.</br>

> [!CAUTION]
> Be sure to install your tmux plugins for changes to take place. (it's `prefix` + `I`)


## Tips and Tricks
- In order to get nautilus to show thumbnails, make sure you have the necessary preferences toggled. (https://wiki.archlinux.org/title/GNOME/Files#Thumbnails)</br>
  Also, do:
  ```sh
  sudo pacman -Sy ffmpegthumbnailer gst-libav gst-plugins-ugly
  rm -rf ~/.cache/thumbnails/fail
  ```
- https://wiki.archlinux.org/title/GNOME#Configuration
- Got messed up/straight up missing application menus?</br>
  Head over to `~/.config/gtk-3.0/settings.ini`, and you might wanna consider setting `gtk-shell-shows-menubar=0`


