## Fix mirrors
```bash
sudo pacman-mirrors --country all --api --protocols all && sudo pacman -Syyu
```

## Initial setup:

Widgets:
- latte separater
- latte spacer
- event calender

window management > window behaviour > advanced > window placement: centered
window management > KWin scripts > get new scripts > *install force blur by esjeon*
workspace behaviour > desktop effects > blur (both light & noise at 50%); dim screen for admin mode; scale (under open/close animation)
workspace behaviour > disable everything except the top left corner one.. and keep that at default
search > krunner > position at center

> shit to do with window colors, etc (idk if it's really necessary)
https://youtu.be/zfOe1Kfb4WE?t=317

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
```bash
sudo pacman -S kvantum
```

open kvantum > change and edit theme > select orchis dark

## Applying themes
 appearance > global theme > application style > kvantum dark (apply), then go to gnome/gtk application style... > choose orchis dark
 choose orchis in sddm as well

 install the Robotto font.. and use it as global font
 use aritim dark as the konsole profile
> I use this theme called sweet KDE btw

**Also**
```bash
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
