# yes.

<!---![image](https://user-images.githubusercontent.com/64155209/147652622-ea27ccee-03a7-4846-ad0d-1e88e215cd8a.png)--->
![image](https://user-images.githubusercontent.com/64155209/167782972-710a59e5-96d1-4188-a292-7a0aad7b4403.png)
![image](https://user-images.githubusercontent.com/64155209/167783477-eaccf80d-2b74-4641-a312-d84937e58e22.png)

### haha looks sicc, right xD
The font used for the digital clock in the top panel is [Oswald](https://fonts.google.com/specimen/Oswald)


#
The gimp thingy is at
```sh
$HOME/.config/GIMP/2.10/
```

#
The zsh plugings are sicc and all.. clone them via:</br>
```sh
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git
```

```sh
git clone https://github.com/zsh-users/zsh-autosuggestions.git
```

#
Global Menu widget (default KDE one sucks)
```sh
git clone https://github.com/psifidotos/applet-window-appmenu
```

#
Cool stuff: 
- [ASCII Pokemon Sprites](https://gitlab.com/phoneybadger/pokemon-colorscripts)
- [API to get exact scene from an anime screenshot](https://soruly.github.io/trace.moe-api/)
> **Note:** The stuff above isn't mine, please give credit to the original authors.

#
Sometimes, nano might not have syntax highlighting by default</br>
In that case, make `~/.nanorc` or `~/.config/.nanorc` and fill with the file included in this repo</br></br>
Pacman can be non-colored too, smh..
edit `/etc/pacman.conf` and uncomment the line that says `Color`

# sicc SDDM config
Firstly, to enable NumLock when SDDM starts up, edit `/etc/sddm.conf` and put in these lines
```sh
[General]
Numlock=on
```
![image](https://user-images.githubusercontent.com/64155209/147652794-8ff09543-2c43-4dfe-81ea-28f694fd5a2c.png)
This is possible thanks to the [Sugar candy theme](https://www.pling.com/p/1312658)</br>
They happen to have awesome documentation as well.. here's my config file btw:
```properties
[General]
type=image

Background="Backgrounds/astronaut-right.jpg"

DimBackgroundImage="0.2"
## Double between 0 and 1 used for the alpha channel of a darkening overlay. Use to darken your background image on the fly.

ScreenWidth="1920"
ScreenHeight="1080"
## Adjust to your resolution to help SDDM speed up on calculations

## [Blur Settings]

FullBlur="false"
PartialBlur="true"
## Enable or disable the blur effect; if HaveFormBackground is set to true then PartialBlur will trigger the BackgroundColor of the form element to be partially transparent and blend with the blur.

BlurRadius="2"
## Set the strength of the blur effect. Anything above 100 is pretty strong and might slow down the rendering time. 0 is like setting false for any blur.

AccentColor="#334d55"
## Used for elements in focus/hover/pressed. Should be contrasting to the background and the MainColor to achieve the best effect.

# Font="Orbitron"
## If you want to choose a custom font it will have to be available to the X root user. See https://wiki.archlinux.org/index.php/fonts#Manual_installation



ForceHideCompletePassword="true"
## If you don't like to see any character at all not even while being entered set this to true.


## [Locale Settings]
HourFormat="h:mm AP"
DateFormat="dddd, MMMM d"

HeaderText="Welcome, Billy!"
```

