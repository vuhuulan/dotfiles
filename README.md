# Prerequisite

Make sure to have `git` and `stow` installed.

# Usage

First, clone and navigate this project directory:

```bash
mkdir ~/project
cd project
git clone this-repo
cd dotfiles
```

Depending what to symlink, check the following:

- `.config`:

```bash
stow .config -t ~/.config
```

- `.local`:

```bash
cd .local
stow bin -t ~/.local/bin
cd -
```

- `ibus`:

```bash
dconf load /desktop/ibus/ < ibus.conf
```
