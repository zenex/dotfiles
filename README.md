# [XENOBYTE.XYZ Dotfiles](https://xenobyte.xyz/projects/?nav=dotfiles)
These configuration files turn a vanilla UNIX setup into the official XENOBYTE development environment.
Though they are primarily used and developed for the arch distribution they are compatible with all UNIX systems and even Windows machines with a few, simple tweaks. Note that this setup emphasizes performance and flexibility over flashiness and secondary features such as desktop effects.

This workstation aims to provide the most basic toolset required to develop all other XENOBYTE projects and a solid foundation for general desktop use. 

**AS OF VER 1.6 (2020-07-24) THE EMACS CONFIGURATION HAS BEEN MOVED TO IT'S OWN REPO [HERE](https://xenobyte.xyz/projects/?nav=hexmacs).**

**AS OF VER 2.6 (2021-01-28) THE REPO HAS BEEN RESET TO REMOVE DEPRECATED FILES**

## System Requirements

Any UNIX system will do, the newer the better. Most configurations work with Windows if their respective software runs on it. However, it is primarily built in and for arch based systems to keep the main branch as updated as the software dependencies.

## Previews

* VER 2.33
<p align="center"><img src="https://i.imgur.com/xuDG0tx.jpg" style="max-width: 720px;"/></p>

* VER 2.0
<p align="center"><img src="https://i.imgur.com/LXxXJkB.jpg" style="max-width: 720px;"/></p>


## Installation
Check the installation guide at [HERE](https://xenobyte.xyz.localhost/projects/?nav=dotfiles)
   
   
   
## F.A.Q. & Troubleshooting

**The AwesomeWM volume widget isn't working.**

There are probably multiple audio devices available and AwesomeWM isn't loading the appropriate one. To change your default audio interface ID:

1. List the available audio interfaces
```sh
aplay --list-devices
```

2. Edit your /etc/asound.conf file and replace the following settings with the desired ID 
```sh
defaults.pcm.card ID#
defaults.ctl.card ID#
```

3. Restart AwesomeWM by pressing Shift + Super + R


**Bitmap fonts aren't working / square fonts error.**

If your system uses pango to render text, know that starting with ver 1.44 bitmap fonts are no longer supported. Rolling back to ver 1.43 is an easy enough solution but beware that bleeding-edge distros like Arch may require newer version to work.


**Audio works but some applications (e.g. MPD) can't set volume.**

If you're using pulseaudio you need to allow autospawn in /etc/pulse/client.conf.


**Are multiple monitors supported?**

Yes, the awesome/rc.lua file calls a series of scripts at startup, among them "~/.screenlayout/monitors.sh". Simply use a program like arandr to generate the proper xrandr calls and restart the AwesomeWM process.


**What is the project's license? Do I have to pay or credit you in any way?**

The project is MIT licensed and free. 

