#   Expand $PATH
export PATH="/usr/local/opt/coreutils/libexec/gnubin:/usr/local/git/bin:/sw/bin/:/usr/local/bin:/usr/local/:/usr/local/sbin:/usr/local/mysql/bin:$PATH"

#   Set Default Editor (change 'Nano' to the editor of your choice)
export EDITOR=/usr/bin/vim

#   Add color to terminal
#   from http://osxdaily.com/2012/02/21/add-color-to-the-terminal-in-mac-os-x/
export CLICOLOR=1

#   Useful Aliases
alias egrep='egrep -G'
alias fgrep='fgrep -G'
alias grep='grep -G'
alias histg='history | grep -G'
alias l='ls -CF -G'
alias la='ls -A -G '
alias ll='ls -alF -G'
alias top='htop'
alias wget='wget -c'
alias ..="cd .."
alias nsort='sort -n'
alias vi='sudo vim'
alias composer='/usr/local/bin/composer'
alias xdf='XDEBUG_CONFIG= php'
alias getIP='curl ipinfo.io'

php56='/usr/local/opt/php@5.6/bin/php'
    
