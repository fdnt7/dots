## -- Aliases

## Better Defaults
alias ls="exa -lah --icons --color=always --git --group-directories-first --color-scale"

alias diff="colordiff"
alias egrep="egrep --color=auto"
alias fgrep="fgrep --color=auto"
alias grep="grep --color=auto"
alias black="black -S"
alias man="batman"
alias vim="nvim"
alias evcxr="irust"
alias python="ipython"
alias psql="pgcli"

alias ct="column -t"
alias df="df -hPT"
alias mount="mount | column -t"

alias ssh="TERM=xterm-256color $(which ssh)"
alias tree='tree -a -I .git'

alias cp='cp -i'
alias ln='ln -i'
alias mv='mv -i'
alias rm='rm -i'
alias mkdir='mkdir -pv'
alias diff="colordiff"
alias egrep="egrep --color=auto"
alias fgrep="fgrep --color=auto"
alias grep="rg --color=auto"
alias black="black -S"
alias du='dust'
alias cat='bat'
alias grep='rg'
alias visudo="sudoedit /etc/sudoers"

## XDG Compliance
#alias svn="svn --config-dir $XDG_CONFIG_HOME/subversion"
#alias wget="wget -c --hsts-file=$XDG_DATA_HOME/wget-hsts"
#alias xonsh="xonsh --rc $XDG_CONFIG_HOME/xonsh/xonshrc"
#alias yarn="yarn --use-yarnrc $XDG_CONFIG_HOME/yarn/config"

## -- Abbreviations

## Shorthands
abbr l "lf"
abbr s 'sudo'
abbr f 'hyfetch'
abbr pf 'pfetch'
abbr nf 'neofetch'
abbr ff 'fastfetch'
abbr hf 'hyfetch'
abbr py 'python'
abbr rs 'evcxr'
abbr pg 'psql'
abbr swi 'swww img'
abbr ht 'htop'
abbr bt 'btop'
abbr pk 'pkill'
abbr ssv 'sudo sv'
abbr Sv 'sudo sv'

## Utilities
abbr d 'date +%F'
abbr now 'date +"%T"'
abbr nowtime 'now'
abbr nowdate 'date +"%m-%d-%Y"'

abbr grubup 'sudo update-grub'
abbr fxpac 'sudo rm /var/lib/pacman/db.lck'
abbr tarnow 'tar -acf'
abbr untar 'tar -zxvf'
abbr psmem 'ps auxf | sort -nr -k 4'
abbr psmem10 'ps auxf | sort -nr -k 4 | head -10'
abbr hw 'hwinfo --short'
abbr big "expac -H M '%m\t%n' | sort -h | nl"
abbr acqr "asciiquarium -t"
abbr hpc "hyprctl clients"

abbr lss "ls -lahUumF@"
abbr lsss "ls -lahUumF@HSin --changed --octal-permissions"
abbr lr "ls -Rlah"
abbr lg "exa -a --icons --color=always --git --group-directories-first --color-scale"
abbr lt "ls -TL 3"
abbr l. "exa -ah --icons --color=always --group-directories-first | rg '^*\.'"

## Directories
abbr .c --position anywhere --set-cursor "$XDG_CONFIG_HOME/%"
abbr .d --position anywhere --set-cursor "$XDG_DATA_HOME/%"
abbr .l --position anywhere --set-cursor "$HOME/.local/lib/%"
abbr .b --position anywhere --set-cursor "$HOME/.local/bin/%"
abbr .h --position anywhere --set-cursor "/mnt/hdd/%"
abbr .hp --position anywhere --set-cursor "/mnt/hdd/Pictures/%"

## Package Management
abbr i "paru -S"
abbr p "paru"
abbr u "paru -Syu"
abbr y "yay"
abbr r "paru -R"
abbr rr "paru -Rcns"
abbr R "paru -Rcns"

## Neovim
abbr v "vim"
abbr V "sudoedit"
abbr vv "sudoedit"

abbr vb --set-cursor "vim $HOME/.local/bin/%"

abbr vc --set-cursor "vim $XDG_CONFIG_HOME/%"
abbr vcv "vim $XDG_CONFIG_HOME/nvim/lua/user/init.lua"
abbr vcf "vim $XDG_CONFIG_HOME/fish/config.fish"
abbr vcz "vim $XDG_CONFIG_HOME/zsh/.zshrc"
abbr vca "vim $XDG_CONFIG_HOME/alacritty/..alacritty.yml && colorsubst"
abbr vck "vim $XDG_CONFIG_HOME/kitty/kitty.conf"
abbr vckt "vim $XDG_CONFIG_HOME/kitty/..theme.conf && colorsubst"
abbr vch "vim $XDG_CONFIG_HOME/hypr/hyprland.conf"
abbr vchb "vim $XDG_CONFIG_HOME/hypr/conf/binds.conf"
abbr vchr "vim $XDG_CONFIG_HOME/hypr/conf/rules.conf"
abbr vchc "vim $XDG_CONFIG_HOME/hypr/conf/chords.conf"
abbr vcw "vim $XDG_CONFIG_HOME/waybar/config && restart-waybar"
abbr vcws "vim $XDG_CONFIG_HOME/waybar/..style.css && colorsubst"
abbr vcl "vim $XDG_CONFIG_HOME/lf/lfrc"
abbr vclc "vim $XDG_CONFIG_HOME/lf/colors"
abbr vcli "vim $XDG_CONFIG_HOME/lf/icons"
abbr vcs "vim $XDG_CONFIG_HOME/starship.toml"
abbr vcff "vim $XDG_CONFIG_HOME/fastfetch/config.conf"
abbr vchf "vim $XDG_CONFIG_HOME/hyfetch.json"

abbr vA "vim $HOME/.local/bin/autostart"
abbr vC "vim $XDG_DATA_HOME/colors.env && colorsubst"
abbr vS "sudoedit /etc/sudoers"

## Misc
abbr :q 'exit'
abbr :wq 'exit'

## -- Environment Variables

export SUDO_PROMPT="󰌆 "
export EDITOR="nvim"

## -- Sources

#source /usr/share/doc/find-the-command/ftc.fish
zoxide init fish | source
eval (batpipe)

## -- Functions

# Functions needed for !! and !$ https://github.com/oh-my-fish/plugin-bang-bang
function __history_previous_command
  switch (commandline -t)
  case "!"
    commandline -t $history[1]; commandline -f repaint
  case "*"
    commandline -i !
  end
end

function __history_previous_command_arguments
  switch (commandline -t)
  case "!"
    commandline -t ""
    commandline -f history-token-search-backward
  case "*"
    commandline -i '$'
  end
end

if [ "$fish_key_bindings" = fish_vi_key_bindings ];
  bind -Minsert ! __history_previous_command
  bind -Minsert '$' __history_previous_command_arguments
else
  bind ! __history_previous_command
  bind '$' __history_previous_command_arguments
end

## Fish command history
function hist
    builtin history --show-time='%F %T '
end

function backup --argument filename
    cp $filename $filename.bak
end

## Copy DIR1 DIR2
function copy
  set count (count $argv | tr -d \n)
  if test "$count" = 2; and test -d "$argv[1]"
	  set from (echo $argv[1] | trim-right /)
	  set to (echo $argv[2])
    command cp -r $from $to
  else
    command cp $argv
  end
end


## -- Aesthetics

## Bling
set fish_greeting 

if status is-interactive
    # Commands to run in interactive sessions can go here
    #pokemon-colorscripts -r --no-title
    pfetch
end

## Prompt
starship init fish | source

