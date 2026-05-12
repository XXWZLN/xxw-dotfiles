# xxw-dotfiles

这是我的个人 dotfiles 仓库，用来保存 macOS 和 Linux 环境中常用工具的配置。

仓库现在只维护一套配置，不再按固定模式拆分。不同机器、不同权限、不同使用习惯下需要的工具并不一样，所以请按工具自行选择：需要哪个工具，就复制对应配置；暂时不用的工具可以直接跳过。

## 使用原则

1. 先备份本机已有配置，避免覆盖自己正在使用的设置。
2. 按工具复制配置，不要默认把整个仓库一次性覆盖到家目录。
3. 复制配置后，根据对应工具的说明重载或重新打开程序。
4. 如果某个工具没有安装，请先安装它，或者注释掉相关配置。

建议先在仓库根目录执行后续命令：

```bash
cd xxw-dotfiles
```

备份示例：

```bash
cp ~/.vimrc ~/.vimrc.bak
cp ~/.zshrc ~/.zshrc.bak
cp -R ~/.config/tmux ~/.config/tmux.bak
cp -R ~/.config/kitty ~/.config/kitty.bak
cp -R ~/.config/fastfetch ~/.config/fastfetch.bak
```

如果某个文件或目录不存在，可以忽略对应备份命令。

## mihomo

mihomo 执行文件、配置文件和 systemd 服务文件 分别放到如下位置：

```bash
~/.local/bin/mihomo
~/.config/mihomo/*
~/.config/systemd/user/mihomo.service
```

在  https://github.com/MetaCubeX/mihomo 中下载 mihomo 执行文件，并放到 `~/.local/bin/mihomo`。对于 amd64 架构，建议下载 v1 指令集版本，对于 v1.19.24 版本的指令如下：

```bash
gunzip mihomo-linux-amd64-v1-v1.19.24.gz
chmod +x mihomo-linux-amd64-v1-v1.19.24
mv mihomo-linux-amd64-v1-v1.19.24 ~/.local/bin/mihomo
```

准备好配置文件以及 `config.yaml`

```bash
cp -R ./.config/mihomo ~/.config/mihomo
cp -R ./.config/systemd ~/.config/systemd
```

配置 `~/.bashrc` 添加如下内容，注意端口需要匹配

```bash

function onproxy() {
    export ALL_PROXY=socks5h://127.0.0.1:7891
    export NO_PROXY='127.0.0.1,localhost,::1'
    echo "ALL_PROXY=$ALL_PROXY"
    echo "NO_PROXY=$NO_PROXY"
}

function offproxy() {
    unset ALL_PROXY
    unset NO_PROXY
    echo "ALL_PROXY=$ALL_PROXY"
    echo "NO_PROXY=$NO_PROXY"
}
```

管理 `systemctl` 服务

```bash
# 更新 systemd 配置
systemctl --user daemon-reload

# 启动服务
systemctl --user start mihomo

# 停止服务
systemctl --user stop mihomo

# 重启服务
systemctl --user restart mihomo

# 查看服务状态
systemctl --user status mihomo

# 输出实时日志
journalctl --user -u mihomo -f

# 查看最近日志
journalctl --user -u mihomo -e

# 查看最近 10 条日志
journalctl --user -u mihomo -n 100
```

在 mihomo 服务运行且 `onproxy` 生效的情况下代理开启可测试一下：

```bash
curl https://www.google.com
```

## Vim

**依赖**

- Vim
- vim-plug
- NERDCommenter

仓库已经包含 `.vim/autoload/plug.vim` 和 NERDCommenter 相关文件，通常复制后即可使用。

**配置文件**

- `.vimrc`
- `.vim/`

**安装**

```bash
cp .vimrc ~/.vimrc
cp -R .vim ~/.vim
```

**启用**

重新打开 Vim 即可。注释插件快捷键：
- `<Leader>` 一般是 `\`
- `<Leader>cc`：注释当前行或选区
- `<Leader>cu`：取消注释当前行或选区


**注意事项**

- 配置里启用了行号、语法高亮、搜索高亮、鼠标、4 空格缩进等基础设置。
- `set clipboard=unnamed` 会尝试使用系统剪贴板；在部分服务器 Vim 构建中可能不支持剪贴板功能。
- `set nonumber` 关闭行号

## Tmux

**安装配置文件**

```bash
mkdir -p ~/.config/tmux && cp .config/tmux/tmux.conf ~/.config/tmux/tmux.conf
```

**启用配置**

```bash
tmux source ~/.config/tmux/tmux.conf
```

**注意事项**

- 前缀键保持为 `Ctrl + b`。
- 开启鼠标、vi 复制模式、真彩色和 Sixel 支持。
- `prefix + h/j/k/l` 在窗格之间移动。
- `prefix + s` 上下分屏，`prefix + v` 左右分屏，都会继承当前路径。

## bashrc/zshrc

记录一些常见的个人使用的 bashrc/zshrc 配置：

```bash
alias sz='source ~/.bashrc'
alias sudo="sudo TERMINFO=\"$TERMINFO\""
alias cman='tldr'
alias sudo="sudo TERMINFO=\"$TERMINFO\""
alias ll="ls -al"
alias cc="claude"

# type y to use yazi, 
# type q to quit yazi and change cwd to the final dir in yazi
# type Q to quit yazi without any changes
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	command yazi "$@" --cwd-file="$tmp"
	IFS= read -r -d '' cwd < "$tmp"
	[ "$cwd" != "$PWD" ] && [ -d "$cwd" ] && builtin cd -- "$cwd"
	rm -f -- "$tmp"
}

export TERM=xterm-256color
```

## MacOS 软件下载

macOS 上可以用 Homebrew 一次性安装常用命令行工具：

```bash
brew install tmux fzf tldr fastfetch yazi fnm
```

Linux 服务器上请按发行版包管理器或项目官方文档安装需要的工具。

## Kitty

**依赖**

- Kitty
- fastfetch（可选，但当前快捷键会用到）

Kitty 安装方式见官方文档：

- https://sw.kovidgoyal.net/kitty/

**配置文件**

- `.config/kitty/kitty.conf`
- `.config/kitty/Tokyo-Night.conf`
- `.config/kitty/12-Dark.jpg`

**安装配置**

```bash
mkdir -p ~/.config/kitty
cp -R .config/kitty/* ~/.config/kitty/
```

**启用配置**

- macOS：`Ctrl + Cmd + ,`
- Linux：`Ctrl + Shift + F5`

**注意事项**

- 主配置使用 Tokyo Night 配色，并设置了背景图、透明度、模糊、标签栏和窗口快捷键。
- `cmd+t` 会新建 tab，并先运行 `fastfetch --config ~/.config/fastfetch/config.jsonc`。如果不使用 fastfetch，请调整或注释这个快捷键。
- 背景图来自 `.config/kitty/12-Dark.jpg`，如果想换图，修改 `background_image` 即可。


### 效果预览

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/kitty-screen-shot.png">
  <img src="docs/kitty-screen-shot.png" alt="Kitty Terminal" width="45%">
</picture>
<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/tmux-screen-shot.png">
  <img src="docs/tmux-screen-shot.png" alt="Tmux" width="45%">
</picture>

### 颜色调试

```bash
bash colors_demo.sh
```

运行脚本即可查看当前终端的基础颜色、背景色、文本样式和 256 色显示效果。这个脚本适合在调整 Kitty、tmux 或远程终端颜色时做快速检查。


### Fastfetch

**安装配置**

```bash
mkdir -p ~/.config/fastfetch
cp .config/fastfetch/config.jsonc ~/.config/fastfetch/config.jsonc
```

**启用配置**

手动运行：

```bash
fastfetch --config ~/.config/fastfetch/config.jsonc
```

如果同时使用 Kitty 配置，`cmd+t` 新建 tab 时会自动展示 fastfetch 信息。


## 参考资料

- https://www.bilibili.com/video/BV1jCkxBMEF4
- https://www.bilibili.com/video/BV1DdR8YEE9Z
- https://github.com/preservim/nerdcommenter
- https://github.com/junegunn/vim-plug
