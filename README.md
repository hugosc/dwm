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
  - Defaults: Mod is bound to the windows key
  - ```mod + enter``` to open terminal
  - ```mod + q``` to quit window
  - ```mod + shift + backspace``` to fully exit


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
