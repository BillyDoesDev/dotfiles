## Fix mirrors
```bash
# This mostly just applies to Manjaro users only
sudo pacman-mirrors --country all --api --protocols all && sudo pacman -Syyu
```

## Initial setup:

Widgets (optional):
- latte separater
- latte spacer
- event calender

window management > window behaviour > advanced > window placement: Cascaded</br>
window management > KWin scripts > get new scripts > *install `Force Blur` by esjeon and `Shake` by zzag*</br>
workspace behaviour > desktop effects > blur (both light & noise at 50%); dim screen for admin mode; scale (under open/close animation)</br>
workspace behaviour > disable everything except the top left corner one.. and keep that at default</br>
search > krunner > position at center</br>

> See [this](https://youtu.be/zfOe1Kfb4WE?t=317) if you wanna mess around with the compositor settings. (I keep mine at default)

## Theming
```bash
sudo pacman -Sy wget git
git clone https://github.com/vinceliuice/Orchis-kde
cd Orchis-kde;sudo sh ./install.sh;cd .. 
git clone https://github.com/vinceliuice/Orchis-theme
cd Orchis-theme;sudo sh ./install.sh;cd .. 
wget -qO- https://git.io/papirus-icon-theme-install | sh
```

## Theme manager
###### This is completely optional
```bash
sudo pacman -S kvantum
```

open kvantum > change and edit theme > select orchis dark

## Applying themes
 appearance > global theme > application style > kvantum dark (apply), then go to gnome/gtk application style... > choose orchis dark</br>
 choose orchis in sddm as well</br>

 install the Robotto font.. and use it as global font</br>
 use aritim dark as the konsole profile</br>
> ...or just use a custom one like [this](https://github.com/BillyDoesDev/dotfiles/blob/main/Tokyo%20Night.colorscheme)</br>
> simply paste in the file at `~/.local/share/konsole/`, and then select it from the appropriate menu

**Also**
```bash
# This is to add support for Japanese and other Asian fonts
sudo pacman -S noto-fonts-emoji
sudo pacman -S noto-fonts-cjk
```

---

Replacing default bless icon...

```
$ pwd
/usr/share/icons/Papirus-Dark
```

```bash
sudo cp ~/hex.svg 16x16/apps/bless.svg
sudo cp ~/hex.svg 22x22/apps/bless.svg
sudo cp ~/hex.svg 22x22@2x/apps/bless.svg
sudo cp ~/hex.svg 128x128/apps/bless.svg
sudo cp ~/hex.svg 64x64@2x/apps/bless.svg
sudo cp ~/hex.svg 96x96/apps/bless.svg
sudo cp ~/hex.svg 48x48/apps/bless.svg
sudo cp ~/hex.svg 48x48@2x/apps/bless.svg
sudo cp ~/hex.svg 24x24@2x/apps/bless.svg
sudo cp ~/hex.svg 16x16@2x/apps/bless.svg
sudo cp ~/hex.svg 32x32@2x/apps/bless.svg
sudo cp ~/hex.svg 32x32/apps/bless.svg
sudo cp ~/hex.svg 24x24/apps/bless.svg
sudo cp ~/hex.svg 64x64/apps/bless.svg
```

File: `~/hex.svg`
```html
<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><g fill="#26a69a"><path d="m14.552 11.422-1.666 1.642 2.5 2.46-2.5 2.462 1.666 1.64 2.502-2.461 2.5 2.46 1.665-1.64-2.5-2.46 2.5-2.461-1.666-1.642-2.5 2.461zM5.77 4.374c-1.644 0-2.989 1.36-2.989 3.023v9.065c0 1.678 1.345 3.023 2.988 3.023h2.989c1.658 0 2.988-1.345 2.988-3.023V7.397c0-1.663-1.33-3.023-2.988-3.023zm0 3.023h2.988v9.065H5.769z"/></g></svg>
```
