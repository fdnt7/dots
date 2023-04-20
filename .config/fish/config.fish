## -- Aliases

## Better Defaults
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
abbr -a s 'sudo'
abbr -a f 'hyfetch -b fastfetch'
abbr -a pf 'pfetch'
abbr -a nf 'neofetch'
abbr -a ff 'fastfetch'
abbr -a hf 'hyfetch'
abbr -a py 'python'
abbr -a ipy 'ipython'
abbr -a rs 'evcxr'
abbr -a irs 'irust'
abbr -a swi 'swww img'
abbr -a ht 'htop'
abbr -a bt 'btop'
abbr -a pk 'pkill'

## Utilities
abbr -a d 'date +%F'
abbr -a now 'date +"%T"'
abbr -a nowtime 'now'
abbr -a nowdate 'date +"%m-%d-%Y"'

abbr -a grubup 'sudo update-grub'
abbr -a fxpac 'sudo rm /var/lib/pacman/db.lck'
abbr -a tarnow 'tar -acf'
abbr -a untar 'tar -zxvf'
abbr -a psmem 'ps auxf | sort -nr -k 4'
abbr -a psmem10 'ps auxf | sort -nr -k 4 | head -10'
abbr -a hw 'hwinfo --short'
abbr -a big "expac -H M '%m\t%n' | sort -h | nl"
abbr -a acqr "asciiquarium -t"

## Directories
abbr -a .c --position anywhere --set-cursor "$XDG_CONFIG_HOME/%"
abbr -a .d --position anywhere --set-cursor "$XDG_DATA_HOME/%"
abbr -a .l --position anywhere --set-cursor "$HOME/.local/lib/%"
abbr -a .b --position anywhere --set-cursor "$HOME/.local/bin/%"
abbr -a .h --position anywhere --set-cursor "/mnt/hdd/%"
abbr -a .hp --position anywhere --set-cursor "/mnt/hdd/Pictures/%"

## Package Management
abbr -a i "paru -S"
abbr -a p "paru"
abbr -a u "paru -Syu"
abbr -a y "yay"
abbr -a r "paru -R"
abbr -a rr "paru -Rcns"
abbr -a R "paru -Rcns"

## Neovim
abbr -a v "nvim"
abbr -a V "sudoedit"
abbr -a vv "sudoedit"

abbr -a vb --set-cursor "nvim $HOME/.local/bin/%"

abbr -a vc --set-cursor "nvim $XDG_CONFIG_HOME/%"
abbr -a vcv "nvim $XDG_CONFIG_HOME/nvim/lua/user/init.lua"
abbr -a vcf "nvim $XDG_CONFIG_HOME/fish/config.fish"
abbr -a vcz "nvim $XDG_CONFIG_HOME/zsh/.zshrc"
abbr -a vca "nvim $XDG_CONFIG_HOME/alacritty/..alacritty.yml && colorsubst"
abbr -a vck "nvim $XDG_CONFIG_HOME/kitty/kitty.conf"
abbr -a vckt "nvim $XDG_CONFIG_HOME/kitty/..theme.conf && colorsubst"
abbr -a vch "nvim $XDG_CONFIG_HOME/hypr/hyprland.conf"
abbr -a vchb "nvim $XDG_CONFIG_HOME/hypr/conf/binds.conf"
abbr -a vchr "nvim $XDG_CONFIG_HOME/hypr/conf/rules.conf"
abbr -a vchc "nvim $XDG_CONFIG_HOME/hypr/conf/chords.conf"
abbr -a vcw "nvim $XDG_CONFIG_HOME/waybar/config && restart-waybar"
abbr -a vcw2 "nvim $XDG_CONFIG_HOME/waybar/..style.css && colorsubst"

abbr -a vA "nvim $HOME/.local/bin/autostart"
abbr -a vC "nvim $XDG_DATA_HOME/colors.env && colorsubst"
abbr -a vS "sudoedit /etc/sudoers"

## Misc
abbr -a :q 'exit'
abbr -a :wq 'exit'

## -- Environment Variables

export SUDO_PROMPT=" "
export EDITOR="nvim"


## -- Sources

source /usr/share/doc/find-the-command/ftc.fish
zoxide init fish | source

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
    pokemon-colorscripts -r --no-title
end

## Prompt
starship init fish | source

