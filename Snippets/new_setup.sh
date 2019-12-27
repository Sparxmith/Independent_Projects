#!/bin/bash

# Ensure that script is run with sudoer privileges
if [[ $UID != 0 ]]; then
    echo "Please run this script with sudo:"
    echo "sudo $0 $*"
    exit 1
fi

# Script to Setup From Fresh Install
clear
echo "Welcome!  Let's automate setup of your new box."

function main () {
apt update
apt -y dist-upgrade
setup_LAMP_stack
setup_vimrc 
setup_bash_aliases

exit 0
}

function setup_bash_aliases () {
	cat <<EOF >> ~/.bash_aliases
	## .bash_aliases -- Should be autosourced by .bashrc or .bashprofile
	# Setup pbcopy/pbpaste
	alias pbcopy='xsel --clipboard --input'
	alias pbpaste='xsel --clipboard --output'

	# Useful Aliases:
	alias ls='ls --color=auto'
	alias egrep='egrep --color=auto'
	alias fgrep='fgrep --color=auto'
	alias grep='grep --color=auto'
	alias histg='history | grep --color=auto'
	alias l='ls -CF --color=auto'
	alias la='ls -A --color=auto '
	alias ll='ls -alF --color=auto'
	alias top='htop'
	alias wget='wget -c'
	alias ..="cd .."
	alias nsort='sort -n'
	alias vi='vim'
	alias composer='/usr/local/bin/composer'
	alias xdf='XDEBUG_CONFIG= php'
	alias getIP='curl ipinfo.io'
	alias vi='vim'

	## Useful Variables:
	php56='/usr/local/opt/php@5.6/bin/php'
	DATE=`date +%Y-%m-%d`
EOF
}

function setup_vimrc () {
        cat <<EOF >> ~/.vimrc
" Don't put anything in your .vimrc that you don't understand."
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Set Color Scheme:
colorscheme badwolf  	" A highly recommended colorscheme

syntax enable  		    " Enable syntax highlighting

" Tab Settings:
set tabstop=4		    " Number of spaces per visual \t
set softtabstop=4	    " Number of spaces per \t when editing
set expandtab		    " Converts \t into \ \ \ \ 

" UI Configs:
set number		        " Show line numbers
set showcmd		        " Show last command entered

filetype indent on	    " Recognize file type and autoindent appropriately

set lazyredraw 		    " Don't redraw mid-macro
set showmatch		    " Highlight matching syntax (brackets, parenthesis, etc.)

set incsearch		    " search as characters are entered
set hlsearch		    " highlight found searches

nnoremap ,<space> :nohlsearch<CR> 
                        " Turn off highlighting with ,<space>

" Code Folding:
set foldenable		    " Enables code folding
set foldlevelstart=10	" Automatically expand everything up to the 10th level of folding
set foldnestmax=10	    " Sets the maximum number of folds to 10 (if you need more than this, reconsider what you're writing)
nnoremap <space> za	
                        " Allows <space> to open/close folds
set foldmethod=indent  	" Folds code based upon indentation

set mouse=a             " Allows mouse in all modes

EOF
}

function setup_LAMP_stack () {
	apt -y install git vim vim-doc vim-scripts gnome-tweak-tool gnome-tweaks
	snap install code --classic
	apt -y install --install-suggests apache2
	apt -y install \
default-mysql-client default-mysql-client-core default-mysql-server default-mysql-server-core libaio1 \
libevent-core-2.1-6 libhtml-template-perl mysql-client-5.7 mysql-client-core-5.7 mysql-common \
mysql-server-5.7 mysql-server-core-5.7 mysql-workbench mysql-workbench-data \
php7.2-common php7.2-cli php-pear php7.2-json php7.2-opcache php7.2-readline
    apt -y install xclip xsel

    # Setup basic git configurations automatically
    git config --global user.name "Eric J. Falgout"
    git config --global user.email "sparxmith@gmail.com"
    git config --global credential.helper cache

}

main
