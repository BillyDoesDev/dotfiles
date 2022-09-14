## ~/.local/share/fonts

The fonts you'll find here are some of the custom stuff I use that I've accumulated from various sources, and so this place serves as a common reserve of sorts for these fonts so I don't need to go hunt for them again...
#
To quickly download the stuff in this folder, do:
```sh
git clone \
  --depth 1  \
  --filter=blob:none  \
  --sparse \
  https://github.com/BillyDoesDev/dotfiles/ \
;
cd dotfiles
git sparse-checkout set fonts
```

#
Whilst programming, I normally use the Nerd-Font variants of **FiraCode** and **Hack**, both of which can be downloaded from https://www.nerdfonts.com/font-downloads</br></br>
And.. I use [Roboto](https://fonts.google.com/specimen/Roboto) as my main system font
#
To list all the available fonts on your system, do:
```sh
fc-list
```
#
>**NOTE:**</br>
Sometimes, the shell might not support emojis by default. I use [noto-fonts-emoji](https://archlinux.org/packages/extra/any/noto-fonts-emoji/) *(make sure this is installed)* as my primary emoji font. To make sure that the shell uses this font while dealing with emojis, edit `~/.config/fontconfig/fonts.conf` accordingly.</br>
If you want my `fonts.conf`, you can get it [here](https://raw.githubusercontent.com/BillyDoesDev/dotfiles/main/fonts/fonts.conf).

