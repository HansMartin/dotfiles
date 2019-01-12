#        _ _
#    ___| |_|___ ___ ___ ___
#   | .'| | | .'|_ -| -_|_ -|
#   |__,|_|_|__,|___|___|___|
#
# some ls aliases
alias ll='ls -alh --color=auto'
alias la='ls -Ah --color=auto'
alias l='ls -CFh --color=auto'
alias ls='ls -CFh --color=auto'

# cd stuff
alias ..='cd ..'
alias ...='cd ../..'

# grep coloring
alias ogrep='grep --color=auto -i' # keep original grep
alias grep='rg'


# source: github.com/sharkdp/fd
alias find='fd -H'

# cat on wings
alias cat='bat --theme zenburn'

alias pdf=zathura
# source: github.com/sharkdp/hexyl
alias hex=hexyl

# never vi
alias vi=vim

# show open ports
alias ports='netstat -tulanp'
alias netstat='netstat -tulanp'


# package manager stuff
alias update='sudo vpm sync'
alias upgrade='sudo vpm update'
alias install='sudo vpm install'

# own tools
alias cheat='python /root/tools/cheat/cheat.py'

alias python="python3.6"
alias loadX='xrdb $HOME/.Xresources'



# brightness settings
alias blow='xbacklight -set 10'
alias bmed='xbacklight -set 45'
alias bhi='xbacklight -set 90'

# it sec stuff

# Disassemble using objdump
disas() {
    objdump -M intel -d $@
}
