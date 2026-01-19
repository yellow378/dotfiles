#zmodload zsh/zprof
# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

# Path to your Oh My Zsh installation.

export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time Oh My Zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git zsh-syntax-highlighting z extract sudo zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='nvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch $(uname -m)"

# Set personal aliases, overriding those provided by Oh My Zsh libs,
# plugins, and themes. Aliases can be placed here, though Oh My Zsh
# users are encouraged to define aliases within a top-level file in
# the $ZSH_CUSTOM folder, with .zsh extension. Examples:
# - $ZSH_CUSTOM/aliases.zsh
# - $ZSH_CUSTOM/macos.zsh
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
export JAVA_HOME=/usr/local/jdk17
export CLASSPATH=.:${JAVA_HOME}/jre/lib/rt.jar:${JAVA_HOME}/lib/tools.jar
export PATH=${JAVA_HOME}/bin:$PATH

export MAVEN_HOME=/usr/local/maven
export PATH=$PATH:${MAVEN_HOME}/bin

export N_NODE_MIRROR=https://npm.taobao.org/mirrors/node
export BROWSER=microsoft-edge-stable

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
#__conda_setup="$('/home/lwx/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
#if [ $? -eq 0 ]; then
#    eval "$__conda_setup"
#else
#    if [ -f "/home/lwx/miniconda3/etc/profile.d/conda.sh" ]; then
#        . "/home/lwx/miniconda3/etc/profile.d/conda.sh"
#    else
#        export PATH="/home/lwx/miniconda3/bin:$PATH"
#    fi
#fi
#unset __conda_setup
# <<< conda initialize <<<
#

#Conda lazy load
# 定义 Conda 可能的路径（Zsh 数组）
CONDA_PATH=(
    /data/miniconda3/bin/conda
    "$HOME/miniconda3/bin/conda"
)

# 懒加载 conda 函数
conda() {
    echo "Lazy loading conda upon first invocation..."
    
    # 删除当前函数自身
    unfunction conda
    
    # 遍历路径找 conda
    for conda_path in $CONDA_PATH; do
        if [[ -f "$conda_path" ]]; then
            echo "Using Conda installation found in $conda_path"
            # 生成并执行 Zsh hook
            eval "$("$conda_path" shell.zsh hook 2>/dev/null)"
            # 重新调用 conda 命令
            conda "$@"
            return
        fi
    done
    
    echo "No conda installation found in \$CONDA_PATH" >&2
    return 1
}
#cuda
export PATH=$PATH:/opt/cuda/bin

#ranger
rg(){
	if [ -z "$RANGER_LEVEL" ]
	then 
		ranger
	else
		exit
	fi
}

## [Completion]
## Completion scripts setup. Remove the following line to uninstall
[[ -f /home/lwx/.dart-cli-completion/zsh-config.zsh ]] && . /home/lwx/.dart-cli-completion/zsh-config.zsh || true
## [/Completion]


# go
export PATH="$PATH:$(go env GOBIN):$(go env GOPATH)/bin"

alias sus="systemctl suspend"
alias xo='xdg-open'
alias ff='fastfetch'
alias ED='cd /mnt/EDisk'
alias dotfiles='/usr/bin/git --git-dir="$HOME/projects/dotfiles/" --work-tree="$HOME"'


source /home/lwx/.zshrc.fzf
source /home/lwx/.zshrc.tldr

#nodejs n
export N_NODE_MIRROR=https://mirrors.tuna.tsinghua.edu.cn/nodejs-release/
export NODE_MIRROR=https://mirrors.tuna.tsinghua.edu.cn/nodejs-release/

source /home/lwx/.secretkey

___MY_VMOPTIONS_SHELL_FILE="${HOME}/.jetbrains.vmoptions.sh"; if [ -f "${___MY_VMOPTIONS_SHELL_FILE}" ]; then . "${___MY_VMOPTIONS_SHELL_FILE}"; fi


#wallpaper
nw() {
    WALLPAPER_DIR="$HOME/Pictures/wallpapers/"
    # 获取当前加载的壁纸（只取最后一行非空的路径）
    CURRENT_WALL=$(hyprctl hyprpaper listloaded | awk 'NF {path=$0} END {print path}' | xargs basename 2>/dev/null)
    
    # 如果没有当前壁纸（首次运行等），CURRENT_WALL 为空，则不过滤
    if [ -z "$CURRENT_WALL" ]; then
        WALLPAPER=$(find "$WALLPAPER_DIR" -type f \( -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" -o -iname "*.webp" \) | shuf -n 1)
    else
        WALLPAPER=$(find "$WALLPAPER_DIR" -type f ! -name "$CURRENT_WALL" \( -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" -o -iname "*.webp" \) | shuf -n 1)
    fi

    if [ -n "$WALLPAPER" ] && [ -f "$WALLPAPER" ]; then
        hyprctl hyprpaper reload ",$WALLPAPER"
        echo "Wallpaper changed to: $(basename "$WALLPAPER")"
    else
        echo "No other wallpapers found."
    fi
}
#zprof


# use NVIDIA GPU
alias nvgpu='__NV_PRIME_RENDER_OFFLOAD=1 __VK_LAYER_NV_optimus=NVIDIA_only __GLX_VENDOR_LIBRARY_NAME=nvidia'

# opencode
export PATH=/home/lwx/.opencode/bin:$PATH
