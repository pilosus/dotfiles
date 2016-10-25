## My Personal dotfiles ##

In *nix-like systems dotfiles are hidden files often used for
configuration purposes.

This repo represents my collection of dotfiles I can share with
others. These files used for configuration of the following software:

### GNU/Emacs ###

There's no system but [GNU](https://youtu.be/S76pHIYx3ik) and Linux is
one of its kernels. Emacs is a part and a parcel of GNU. It's a universe.

![Real programmers](https://imgs.xkcd.com/comics/real_programmers.png)

There are tons of quite sophisticated `.emacs` dotfiles in the wild. My
version is the minimal working example I use on several machines,
expanding it with email packages config as needed.

### Git ###

`.gitconfig` used for Git configuration including setting aliases for `git` command.

![Git](https://imgs.xkcd.com/comics/git.png)

### Bash ###

`.bashrc` used by Bash shells to export environment variables,
aliases, update `$PATH`, modify shell prompt, etc. on startup.

![](https://imgs.xkcd.com/comics/universal_install_script.png)

### Xorg ###

On GNU/Linux machines I prefer lightweight tiling window managers like
`i3` or `ratpoison` to the bloated desktop environments.

All my systems run with `runlevel 3`, so whenever I need GUI I run X
server with `startx` (or `xinit -- :1`).

![Xorg](https://imgs.xkcd.com/comics/x11.png)

`.xinitrc` is a shell script run when `startx` invoked on a
[per-user basis](https://wiki.archlinux.org/index.php/Xinit).

`.Xresources` used as a user-level configuration file in order to set
[X resources](https://wiki.archlinux.org/index.php/x_resources) such
as terminal fonts, colors, etc.

### Xbindkeys ###

Xbindkeys is a program that allows to bind commands to certain keys or
key combinations on the keyboard. It's a useful tool especially when
using for the laptop keyboard.

`.xbindkeysrc` keeps keybinding that have been identified with
`xbindkeys -k`.

### Credits ###

These dotfiles could not be written without help of all these
wonderful people helping on StackOverflow, in the mailing-list, etc.

Also, [xkcd](https://xkcd.com/) is awesome. First, go check out my
`.emacs`, then `xkcd`.
