# Installation

```
brew install tmux, fzf, tldr, fastfetch, yazi, fnm
```

# Kitty Config

[Kitty Web](https://sw.kovidgoyal.net/kitty/)
下载 Kitty
将 `./.config/kitty` 复制到 `~/.config/kitty`

# Vim Config

1. `cp plug.vim ~/.vim/autoload`
2. 在 vim 中执行 `:PlugInstall`, 如果有网
3. 否则将三个文件复制到 `.vim` 中

# Tmux Config

下载 tpm

```
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

`cp tmux.conf ~/.tmux.conf`

`tmux source ~/.tmux.conf`

# fzf

[fzf github repo](https://github.com/junegunn/fzf)

``brew install fzf``

``source <(fzf --zsh)``

# tldr

人类可读的 `man`

[git rebo](https://github.com/tldr-pages/tldr/wiki)

`brew install tldr`

add this alias to `~/.zshrc`
``alias tldrview='tldr --list | fzf --preview "tldr {1} --color=always" --preview-window=right,70% | xargs tldr'``

# kitty

`brew install fastfetch`


# References
