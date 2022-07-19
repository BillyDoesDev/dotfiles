## Getting started with virtualization on Linux

After doing a lot of VM-hopping, from QEMU to VirtualBox and whatnot, I finally decided to stick to VMware Player (not sponsored btw) to use as my go to hyperviser. Granted, its paid counterpart or even its other open source counterparts might have more features to offer, but I decided to stick to ease of use and reliability. For some reason, VirtualBox just dies when KDE is run on it, and QEMU tends to pose a lot of display scaling issues sometimes. I'm not saying that VMware is always perfect either, but it's still more usable, in my opinion. So I put together a small guide to set stuff up as easily as possible on an Arch/Arch-based machine.

### Prerequisites
- Virtualization enabled in the BIOS

> Note: This tutorial is focussed on Arch based distros. The steps should be the same on just about anything else; however, the name of the packages might differ.

## Installation
Install [vmware-workstation](https://aur.archlinux.org/packages/vmware-workstation). It is also necessary to install the appropriate header package(s) for your installed kernel(s): for example [linux-headers](https://archlinux.org/packages/?name=linux-headers) or [linux-lts-headers](https://archlinux.org/packages/?name=linux-lts-headers).
```sh
yay -Sy vmware-workstation
```
Then, as desired, `enable` some of the following services:
- `vmware-networks.service` for guest network access (otherwise you will get an error `could not connect 'ethernet 0' to virtual network` and you will not be able to use *vmware-netcfg*)
- `vmware-usbarbitrator.service` for connecting USB devices to guest. </br>


To list all the available services on your system, do
```sh
sudo systemctl list-unit-files --type=service
```
Lastly, load the VMware modules:
```sh
sudo modprobe -a vmw_vmci vmmon
```
To list all available modules on your system, do:
```
find -L /lib/modules/$(uname -r)/ | grep -i <name_of_module>
```

Launch your application with
```sh
vmplayer
```
> Optionally, **reboot** your system before launching the application to ensure all of the previously enabled services start up.

## Enabling UEFI BIOS
By default, the systems you go on to install won't have a UEFI BIOS. To fix that, simply navigate to the directory of your VM and then find the file `<VM_Name>.vmx`, and add in the line `firmware = "efi"` to the file.</br>
This is what it should look like:
```sh
#!/usr/bin/vmware
.encoding = "UTF-8"
firmware = "efi"
config.version = "8"
virtualHW.version = "19"

...
```

## Setting up an Arch guest
Install the system like you would normally. Once done, do the following (on the guest, obviously)
```sh
## Install tools and drivers necessary for a seamless experience between the host and the guest OS
sudo pacman -Sy open-vm-tools gtkmm3 gtkmm gtk2 xf86-video-vmware xf86-input-vmmouse
## Enable the required services
sudo systemctl enable vmtoolsd.service
sudo systemctl enable vmware-vmblock-fuse.service
sudo systemctl enable vmtoolsd
```
> At this stage, feel free to **reboot** your system to let the changes take effect.

You may add the following line
```sh
vmware-user
```
to `/etc/profile` to enable the bidirectional clipboard as soon as the guest OS boots up.</br></br>
**Enjoy!**
