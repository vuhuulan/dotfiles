Use can use this dotfile via `stow`:
```
mkdir ~/project
cd project
git clone this-repo
cd dotfiles
stow config -t ~/.config
stow local/bin -t ~/.local/bin/
dconf load /desktop/ibus/ < ibus.conf
```
