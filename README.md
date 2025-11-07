## dwm - dynamic window manager - bread's build
![my build](bread_dwm.png)
comes with no guarantees or warranties <sub>(this means things may not work as expected, or at all)</sub> :^)

note: I'd highly recommend setting up your own build! using mine or anyone else's is a starting point, but patching dwm manually not only allows for precise customization, but it will also allow you to learn how your WM works.
a great way to test build changes without refreshing/restarting your running WM is with [Xephyr](https://wiki.archlinux.org/title/Xephyr), a nested X server that runs as an application.

## patches applied:
some occasional modification here and there;
* [bartoggle keybinds](https://dwm.suckless.org/patches/bartoggle/)
* [bulkill](https://dwm.suckless.org/patches/bulkill/)
* [colorbar](https://dwm.suckless.org/patches/colorbar/)
* [fixmultimon](https://dwm.suckless.org/patches/fixmultimon/)
* [focusfullscreen](https://dwm.suckless.org/patches/focusfullscreen/)
* [focusmaster-return](https://dwm.suckless.org/patches/focusmaster/)
* [focusmonmouse](https://dwm.suckless.org/patches/focusmonmouse/)
* [hide vacant tags](https://dwm.suckless.org/patches/hide_vacant_tags/)
* [preventfocusshift](https://dwm.suckless.org/patches/preventfocusshift/)
* [restartsig](https://dwm.suckless.org/patches/restartsig/)
* [spawntag](https://dwm.suckless.org/patches/spawntag/)
* [stacker](https://dwm.suckless.org/patches/stacker/)
* [statuscmd](https://dwm.suckless.org/patches/statuscmd/)
* [sticky](https://dwm.suckless.org/patches/sticky/)
* [swallow](https://dwm.suckless.org/patches/swallow/)
* [vanitygaps](https://dwm.suckless.org/patches/vanitygaps/)
* [xrdb](https://dwm.suckless.org/patches/xrdb/)


## installation, setup:
```
git clone https://github.com/BreadOnPenguins/dwm
cd dwm
sudo make clean install
```

* Basic ```~/.xinitrc``` requirement: ```exec dwm```

* Configure settings (fonts, bindings, gap pixels, etc) in **config.def.h** before compiling.
  - Mod key is bound to the Windows key by default

## Basic Keybinds
All keybinds use `Mod` (Windows key) unless otherwise specified.

| Keybind | Action |
|---------|--------|
| `Mod + Enter` | Open terminal |
| `Mod + P` | Launch dmenu |
| `Mod + Q` | Kill focused window |
| `Mod + Shift + Q` | Kill all windows except focused |
| `Mod + Shift + Backspace` | Exit dwm |
| `Mod + Ctrl + Shift + Q` | Refresh dwm (recompile and restart) |

### Navigation & Focus
| Keybind | Action |
|---------|--------|
| `Mod + J/K` | Focus next/previous window in stack |
| `Mod + Shift + J/K` | Move focused window in stack |
| `Mod + Tab` | Switch to previous tag |
| `Mod + 1-9` | Switch to tag N |
| `Mod + 0` | View all tags |
| `Mod + Ctrl + 1-9` | Toggle view of tag N |
| `Mod + Shift + 1-9` | Move focused window to tag N |

### Layout & Window Management
| Keybind | Action |
|---------|--------|
| `Mod + T` | Tiled layout |
| `Mod + F` | Toggle fullscreen |
| `Mod + Shift + M` | Monocle layout |
| `Mod + S` | Spiral layout |
| `Mod + Shift + T` | Dwindle layout |
| `Mod + Ctrl + Space` | Cycle layout |
| `Mod + Shift + Space` | Toggle floating |
| `Mod + Space` | Zoom (promote to master) |
| `Mod + Ctrl + Space` | Focus master |
| `Mod + Shift + S` | Toggle sticky window |
| `Mod + H/L` | Decrease/increase master area size |
| `Mod + Shift + I` | Increase number of master windows |
| `Mod + Ctrl + I` | Decrease number of master windows |

### Gaps Control
| Keybind | Action |
|---------|--------|
| `Mod + +/-` | Increase/decrease all gaps |
| `Mod + Alt + I` | Increase/decrease inner gaps |
| `Mod + Alt + O` | Increase/decrease outer gaps |
| `Mod + Shift + =` | Toggle gaps |
| `Mod + Shift + -` | Reset gaps to default |

### Multi-Monitor
| Keybind | Action |
|---------|--------|
| `Mod + [` | Focus next monitor |
| `Mod + ]` | Focus previous monitor |
| `Mod + Shift + [` | Move window to next monitor |
| `Mod + Shift + ]` | Move window to previous monitor |

### Applications
| Keybind | Action |
|---------|--------|
| `Mod + M` | Open music player (ncspot) |
| `Mod + B` | Open browser |
| `Mod + N` | Open neovim (in kitty) |
| `Mod + Shift + F` | Open file manager (nautilus) |
| `Mod + Shift + H` | Open system monitor (htop) |
| `Mod + V` | Open clipboard history |
| `Mod + Shift + N` | Open notes menu |
| `Mod + Shift + A` | Open video menu |
| `Mod + Ctrl + A` | Switch audio output |
| `Mod + Shift + W` | Wallpaper menu |

### Screenshots & Misc
| Keybind | Action |
|---------|--------|
| `Mod + Shift + F1` | Screenshot |
| `Mod + Shift + F2` | Colored screenshot |
| `Mod + Shift + F8` | Lock and suspend |
| `Mod + F8` | Lock screen (slock) |
| `Mod + F11` | Play/pause music (termusic) |
| `Mod + F12` | Next track (termusic) |
| `Mod + F10` | Previous track (termusic) |

### Statusbar
| Keybind | Action |
|---------|--------|
| `Mod + Shift + B` | Toggle bar visibility |
| `Mod + Ctrl + X` | Refresh colors (xrdb) |

**Note:** These bindings can be customized in `config.h` before compiling.


I use [dwmblocks](https://github.com/torrinfail/dwmblocks) for my statusbar ([bar scripts](https://github.com/BreadOnPenguins/scripts)), included in ```~/.xprofile``` with ```exec dwmblocks```.
If you intend to use another statusbar, [modify dwm appropriately](https://dwm.suckless.org/patches/anybar/) :)


## colors, other stuff:
If you aren't using ```~/.Xresources``` with or without [pywal16](https://github.com/eylles/pywal16), default color palette is a variant of [Nord](https://www.nordtheme.com/).


I have wal generate a template containing [dwm Xresource strings](https://dwm.suckless.org/patches/xrdb/). Then, I merge it with wal's auto-generated Xresources file, using ```xrdb -merge```.


```~/.config/wal/templates/xrdb_extra```
```
dwm.normbordercolor: {color0}
dwm.normbgcolor: {color0}
dwm.normfgcolor: {color4}
dwm.selbordercolor: {color8}
dwm.selbgcolor: {color4}
dwm.selfgcolor:  {color0}
```

After creating the template, add these to your wal post-script for automatic xrdb merge and refresh.

```
ln -sf ~/.cache/wal/colors.Xresources ~/.Xresources
cat ~/.Xresources ~/.cache/wal/xrdb_extra | xrdb -merge
xdotool key super+ctrl+backslash # xrdb refresh keybind
```

Alternatively, if you prefer a different color-setting method, follow the instructions on [pywal16's wiki](https://github.com/eylles/pywal16/wiki/Customization#dwm).


I use [slock](https://tools.suckless.org/slock/) for a lockscreen (build will be uploaded eventually), activated via keybind.

My config has a few glyphs used cosmetically; for those to render properly, install a [font with extra glyphs](https://www.nerdfonts.com/#home).

#### The [GNU Quilt](https://savannah.nongnu.org/projects/quilt/quilt/) system (used by Debian to manage patches in source packages) can be used to easily manage, apply, and reverse suckless software patches, and [this guide](https://codeberg.org/mok0/suckless-patches) (including ```suckless-patches.py```) can help download and prepare patches for use with Quilt. Thanks to [mok0](https://github.com/BreadOnPenguins/dwm/issues/1) for sharing!
