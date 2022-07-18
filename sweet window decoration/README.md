## Custom window decoration for KDE

Window decoration files are stored at
```sh
~/.local/share/aurorae/themes/
```
To use this theme, make a new directory with the name of your choice, and `cd` into it
```
mkdir Sweet-Datk-transparent-remix
cd Sweet-Datk-transparent-remix
```
Then, put in the contents of this folder over there. </br>
To quickly get them downloaded, do:
```sh
git clone \
  --depth 1  \
  --filter=blob:none  \
  --sparse \
  https://github.com/BillyDoesDev/dotfiles/ \
;
cd dotfiles
git sparse-checkout set "sweet window decoration"

## Move this stuff to ../
# mv -r * ../
# cd ..
```
---
```sh
$ ls -l ~/.local/share/aurorae/themes/Sweet-Datk-transparent-remix
# Should be something like this:
total 248
-rw-r--r-- 1 billy users 20686 Mar 10 19:10 alldesktops.svg
-rw-r--r-- 1 billy users 20313 Apr 28 13:25 close_og.svg
-rwxrwxrwx 1 billy users 16596 Apr 28 13:26 close.svg
-rw-r--r-- 1 billy users 18620 Mar 10 19:10 decoration.svg
-rw-r--r-- 1 billy users 21144 Mar 10 19:10 keepabove.svg
-rw-r--r-- 1 billy users 20857 Mar 10 19:10 keepbelow.svg
-rw-r--r-- 1 billy users 18747 Mar 10 19:10 maximize_og.svg
-rwxrwxrwx 1 billy users 15057 Apr 28 13:27 maximize.svg
-rw-r--r-- 1 billy users   322 Mar 10 19:10 metadata.desktop
-rw-r--r-- 1 billy users 18773 Mar 10 19:10 minimize_og.svg
-rwxrwxrwx 1 billy users 15182 Apr 28 13:27 minimize.svg
-rw-r--r-- 1 billy users 18747 Mar 10 19:10 restore_og.svg
-rwxrwxrwx 1 billy users 15057 Apr 28 13:27 restore.svg
-rw-r--r-- 1 billy users   876 Mar 10 19:10 Sweet-Dark-transparentrc
```
