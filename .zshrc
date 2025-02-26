# Force ARM64 mode
if [[ $(arch) == i386 ]]; then
    exec arch -arm64 /bin/zsh
fi

eval "$(/opt/homebrew/bin/brew shellenv)"

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

source $(brew --prefix)/share/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

alias reload-zsh="source ~/.zshrc"
alias edit-zsh="nvim ~/.zshrc"

# history setup
HISTFILE=$HOME/.zhistory
SAVEHIST=1000
HISTSIZE=999
setopt share_history
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_verify

# completion using arrow keys (based on history)
bindkey '^[[A' history-search-backward
bindkey '^[[B' history-search-forward

source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

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
alias localssl="sudo vim /Applications/MAMP/conf/apache/extra/httpd-ssl.conf"
alias todo="vim ~/Desktop/todo.md"

alias ws="open -a windsurf"

# tmux
alias tmux="TERM=screen-256color-bce tmux"
alias tmuxl="tmux ls"
alias tmuxa="tmux attach -t"
alias tmuxn="tmux new -s"
alias thome="tmux attach -t home"

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
alias mykao="cd ~/Local\ Sites/mykao"
alias sukusuku="cd ~/Local\ Sites/sukusukucopy"

# nodebrew
# export PATH=$HOME/.nodebrew/current/bin:$PATH

# ruby
export PATH=$home/.rbenv/bin:$PATH
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# python
alias python="python3"
alias pip="pip3"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/opt/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/opt/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/opt/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/opt/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

# ---- FZF -----

# Set up fzf key bindings and fuzzy completion
eval "$(fzf --zsh)"

# --- setup fzf theme ---
fg="#CBE0F0"
bg="#011628"
bg_highlight="#143652"
purple="#B388FF"
blue="#06BCE4"
cyan="#2CF9ED"

export FZF_DEFAULT_OPTS="--color=fg:${fg},bg:${bg},hl:${purple},fg+:${fg},bg+:${bg_highlight},hl+:${purple},info:${blue},prompt:${cyan},pointer:${cyan},marker:${cyan},spinner:${cyan},header:${cyan}"

# -- Use fd instead of fzf --

export FZF_DEFAULT_COMMAND="fd --hidden --strip-cwd-prefix --exclude .git"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd --type=d --hidden --strip-cwd-prefix --exclude .git"

# Use fd (https://github.com/sharkdp/fd) for listing path candidates.
# - The first argument to the function ($1) is the base path to start traversal
# - See the source code (completion.{bash,zsh}) for the details.
_fzf_compgen_path() {
  fd --hidden --exclude .git . "$1"
}

# Use fd to generate the list for directory completion
_fzf_compgen_dir() {
  fd --type=d --hidden --exclude .git . "$1"
}

source ~/fzf-git.sh/fzf-git.sh

show_file_or_dir_preview="if [ -d {} ]; then eza --tree --color=always {} | head -200; else bat -n --color=always --line-range :500 {}; fi"

export FZF_CTRL_T_OPTS="--preview '$show_file_or_dir_preview'"
export FZF_ALT_C_OPTS="--preview 'eza --tree --color=always {} | head -200'"

# Advanced customization of fzf options via _fzf_comprun function
# - The first argument to the function is the name of the command.
# - You should make sure to pass the rest of the arguments to fzf.
_fzf_comprun() {
  local command=$1
  shift

  case "$command" in
    cd)           fzf --preview 'eza --tree --color=always {} | head -200' "$@" ;;
    export|unset) fzf --preview "eval 'echo \${}'"         "$@" ;;
    ssh)          fzf --preview 'dig {}'                   "$@" ;;
    *)            fzf --preview "$show_file_or_dir_preview" "$@" ;;
  esac
}

# ----- Bat (better cat) -----

export BAT_THEME=tokyonight_night

# ---- Eza (better ls) -----

alias ls="eza --icons=always"

# ---- TheFuck -----

# thefuck alias
# eval $(thefuck --alias)
# eval $(thefuck --alias fk)

# ---- Zoxide (better cd) ----
eval "$(zoxide init zsh)"

# alias cd="z"

# Created by `pipx` on 2024-11-04 15:11:38
export PATH="$PATH:/Users/takashiyamaguchi/.local/bin"

# Added by Windsurf
export PATH="/Users/takashiyamaguchi/.codeium/windsurf/bin:$PATH"
# The following lines have been added by Docker Desktop to enable Docker CLI completions.
fpath=(/Users/takashiyamaguchi/.docker/completions $fpath)
autoload -Uz compinit
compinit
# End of Docker CLI completions
