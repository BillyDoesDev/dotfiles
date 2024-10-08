## sup y'all!
After years of using KDE Plasma, and finally getting sick of the new updates bricking stuff up, making designs inconsistent, here, I'll put the stuff for my latest gnome config!!

![image](https://github.com/BillyDoesDev/dotfiles/assets/64155209/0caa0533-1ddb-470f-b1fd-9cdd67907109)


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
sudo pacman -S gnome-browser-connector gnome-tweaks power-profiles-daemon network-manager-applet networkmanager-openvpn pavucontrol 
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
- New mount points/file paths open in vscode by default, and not nautilus? Try adding the following to your `~.config/mimeapps.list`:
  ```
  [Default Applications]
  ...
  inode/directory=org.gnome.Nautilus.desktop;code.desktop;
  ...
  ```
- Working with LaTeX:
  ```sh
  sudo pacman -S zathura zathura-djvu zathura-pdf-poppler
  sudo pacman -S texlive-basic texlive-latex texlive-latexrecommended texlive-latexextra texlive-fontsrecommended texlive-fontsextra texlive-bibtexextra texlive-mathscience texlive-binextra texlive-publishers
  ```
- Working with Qemu:
  ```sh
  sudo pacman -Sy qemu-desktop libvirt iptables-nft dnsmasq openbsd-netcat virt-manager edk2-ovmf vde2 bridge-utils
  sudo systemctl start libvirtd.service
  sudo systemctl start virtlogd.service
  sudo systemctl enable libvirtd.service
  sudo nano /etc/libvirt/libvirtd.conf
  
  # uncomment the following:
  #unix_sock_group = "libvirt"
  #unix_sock_ro_perms = "0777"  # set to 0770 to deny non-group libvirt users
  #unix_sock_rw_perms = "0770"
  
  sudo usermod -aG libvirt billy
  reboot
  ```



