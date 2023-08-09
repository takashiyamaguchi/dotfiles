# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"

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
plugins=(git web-search zsh-autosuggestions zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

alias vim="nvim"

# Personal aliases
alias c="clear"
alias e="exit"
alias l="ls -l"
alias la="ls -la"
alias ll="ls -l"
alias ls="ls -G"
alias p="pwd"
alias q="exit"
alias r="ranger"
alias s="source"
alias v="vim"
alias vi="vim"
alias z="zsh"

# Git aliases
alias ga="git add"
alias gaa="git add ."
alias gai="git add -i"
alias gb="git branch"
alias gba="git branch -a"
alias gbd="git branch -d"
alias gbl="git blame"
alias gbr="git branch --remote"
alias gc="git commit"
alias gca="git commit --amend"
alias gcam="git commit --amend -m"
alias gcb="git checkout -b"
alias gcf="git config --list"
alias gcl="git clone"
alias gcm="git checkout master"
alias gco="git checkout"
alias gcp="git cherry-pick"
alias gcs="git commit -S"
alias gd="git diff"
alias gdc="git diff --cached"
alias gds="git diff --staged"
alias gf="git fetch"
alias gfa="git fetch --all"
alias gfo="git fetch origin"
alias gg="git grep"
alias gga="git grep -a"
alias ggf="git grep --files-with-matches"
alias ggl="git grep --files-without-matches"
alias ggp="git grep --perl-regexp"
alias ggs="git grep --show-function"
alias ggu="git pull upstream"
alias ggp="git grep --perl-regexp"
alias ggs="git grep --show-function"
alias ggu="git pull upstream"

alias gh="git hist"
alias ghh="git hist --max-count=10"
alias ghhh="git hist --max-count=20"
alias ghs="git hist --max-count=5"
alias ghh="git hist --max-count=10"
alias ghhh="git hist --max-count=20"
alias ghhhh="git hist --max-count=50"

alias gi="git init"
alias gignore="git update-index --assume-unchanged"
alias gignored="git ls-files -v | grep '^[[:lower:]]'"
alias git-svn-dcommit-push="git svn dcommit && git push github master:svntrunk"
alias gk="gitk --all --branches"
alias gl="git pull"
alias glg="git log --stat --max-count=10"

alias zshrc="vim ~/.zshrc"
alias ohmyzsh="vim ~/.oh-my-zsh"
alias vimrc="vim ~/.vimrc"
alias hosts="sudo vim /etc/hosts"
alias vhosts="sudo vim /Applications/MAMP/conf/apache/extra/httpd-vhosts.conf"

# for shortcut
alias up='cd ..'
alias upp='cd ../..'
alias uppp='cd ../../..'

alias ls='ls -GwF'
alias la='ls -alh'
alias ll='ls -n'

alias desktop="cd ~/Desktop"
alias downloads="cd ~/Downloads"
alias documents="cd ~/Documents"
alias pictures="cd ~/Pictures"
alias htdocs="cd ~/Local\ Sites"

alias kp="cd ~/Local\ Sites/kcrm-heartcore"
alias kbb="cd ~/Local\ Sites/kp_cdc"
alias sukusuku="cd ~/Local\ Sites/sukusukucopy"

# nodebrew
export PATH=$HOME/.nodebrew/current/bin:$PATH
