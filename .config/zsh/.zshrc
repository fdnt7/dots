HISTFILE="$XDG_STATE_HOME"/zsh/history
HISTSIZE=1024
SAVEHIST=8192
setopt autocd beep extendedglob nomatch notify
bindkey -e

zstyle :compinstall filename "$XDG_CONFIG_HOME/zsh/.zshrc"

autoload -Uz compinit
compinit -d "$XDG_CACHE_HOME"/zsh/zcompdump-""


## Aliases
alias l="exa -ah --icons --color=always --group-directories-first"
alias ls="exa -lah --icons --color=always --git --group-directories-first --color-scale"
alias lss="exa -lahUumF@ --icons --color=always --git --group-directories-first --color-scale"
alias lsss="exa -lahUumF@HSi --icons --color=always --git --group-directories-first --color-scale"
alias lr="exa -Rlah --icons --color=always --git --group-directories-first --color-scale"
alias lg="exa -a --icons --color=always --git --group-directories-first --color-scale"
alias lt="exa -Tlah -L 3 --icons --color=always --git --group-directories-first --color-scale"
alias l.="exa -ah --icons --color=always --group-directories-first | rg '^*\.'"

alias diff="colordiff"
alias egrep="egrep --color=auto"
alias fgrep="fgrep --color=auto"
alias grep="grep --color=auto"
alias black="black -S"

alias ct="column -t"
alias df="df -hPT"
alias mount="mount | column -t"
alias wget="wget -c --hsts-file=$XDG_DATA_HOME/wget-hsts"
alias xonsh="xonsh --rc $XDG_CONFIG_HOME/xonsh/xonshrc"

alias d='date +%F'
alias now='date +"%T"'
alias nowtime=now
alias nowdate='date +"%m-%d-%Y"'
alias ssh="TERM=xterm-256color $(which ssh)"
alias tree='tree -a -I .git'

alias cp='cp -i'
alias ln='ln -i'
alias mv='mv -i'
alias rm='rm -i'
alias mkdir='mkdir -pv'

alias v="nvim"
alias vv="sudoedit"
alias yay="paru"
alias yeet="paru -R"
alias yeeet="paru -Rcns"
alias V="neovide --multigrid"
alias ff="fastfetch --load-config examples/2"
alias nf="neofetch"
alias y="paru"
alias s="sudo"
alias code="code-insiders"

#alias ...="cd ../.."
#alias ....="cd ../../.."
#alias .....="cd ../../../.."
#alias ......="cd ../../../../.."
#alias .......="cd ../../../../../.."
#alias ........="cd ../../../../../../.."

alias :q="exit"
alias :wq="exit"

alias aup="pamac upgrade --aur"
alias grubup="sudo update-grub"
alias fixpacman="sudo rm /var/lib/pacman/db.lck"
alias tarnow='tar -acf '
alias untar='tar -zxvf '
alias psmem='ps auxf | sort -nr -k 4'
alias psmem10='ps auxf | sort -nr -k 4 | head -10'
alias upd='sudo reflector --latest 5 --age 2 --fastest 5 --protocol https --sort rate --save /etc/pacman.d/mirrorlist && cat /etc/pacman.d/mirrorlist && sudo pacman -Syu && fish_update_completions'

alias dir='dir --color=auto'
alias vdir='vdir --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias hw='hwinfo --short'                                   # Hardware Info
alias big="expac -H M '%m\t%n' | sort -h | nl"              # Sort installed packages according to size in MB (expac must be installed)

alias mirror="sudo reflector -f 30 -l 30 --number 10 --verbose --save /etc/pacman.d/mirrorlist" 
alias mirrord="sudo reflector --latest 50 --number 20 --sort delay --save /etc/pacman.d/mirrorlist" 
alias mirrors="sudo reflector --latest 50 --number 20 --sort score --save /etc/pacman.d/mirrorlist" 
alias mirrora="sudo reflector --latest 50 --number 20 --sort age --save /etc/pacman.d/mirrorlist" 

fpath=(~/.local/share/zsh/zsh-autosuggestions/src/ $fpath)
source ~/.local/share/zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.local/share/zsh/zsh-history-substring-search/zsh-history-substring-search.zsh

eval "$(starship init zsh)"
source ~/.local/share/zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
