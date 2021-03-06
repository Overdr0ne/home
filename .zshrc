# Path to your oh-my-zsh installation.
  export ZSH=/home/sam/.oh-my-zsh

setopt shwordsplit

setopt no_share_history

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#ZSH_THEME="robbyrussell"
ZSH_THEME="agnoster"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git ranger)

# User configuration

  export PATH="/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl:/home/sam/bin:/home/sam/lib/anaconda2/bin:~/lib/anaconda2/bin"
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

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

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
#PS1='[\u@\h \W]\$ '

#. ~/scripts/sshag.sh
#sagent

#setxkbmap -option "ctrl:menu_rctrl"

alias e='vim'
# alias e='launch-hide emacsclient -c'
# alias e='emacsclient -nw'
alias eb='e ~/.bashrc'
alias ez='e ~/.zshrc'
alias ed='e ~/.dialogrc'
alias es='e ~/.spacemacs'
alias ei3='e ~/.i3/config'
alias ev='e ~/.vimrc'
alias ej="e ~/notes/journal/`date +%m%d%y`"
alias es="e ~/.scratch"
alias em="e ~/.memorandum"
alias est="edit_story"
alias la='ls -a'
alias ll='ls -l'
alias rrc='source ~/.bashrc'
alias g='grep -rinI'
alias f='find_mod'
alias bc='bc -l'
alias mkdir='mkdir -pv'
alias diff='colordiff'
alias rm='rm -I --preserve-root'
alias diskspace='du -S | sort -n -r |less'
alias st='copy_to_stash'
alias stg='get_from_stash'
alias tg='ctags -R --c++-kinds=+p --fields=+iaS --extra=+q'
alias d2h='dec2hex'
alias h2d='hex2dec'
alias lap='xrandr --output LVDS-1 --auto --output  VGA-1 --off'
alias vga='xrandr --output LVDS-1 --off --output VGA-1 --auto'
alias dm=dirmenu
alias cd='pushd'

#package manager
alias pms='pacman -Ss'
alias pmi='sudo pacman -S'
alias pmr='sudo pacman -R'

# relocation commands
alias gh='cd ~'
alias gls='cd ~/src'

# version control commands
alias v='git'
alias vap='git apply'
alias vk='git_tree'
alias vch='git checkout'
alias vcb='git checkout -b'
alias vco='git commit'
alias vcom='git commit -m'
alias vcp='git cherry-pick'
alias vcl='~/bin/clean-repo.sh'
alias va='git add'
alias vaa='git add -A'
alias vau='git add -u'
alias vb='git branch'

alias vl='git log'
alias vr='git rebase'
alias vri='git rebase -i'
alias vrh='git reset --hard'
alias vrm='git rm'
alias vs='git status'
alias vsh='git stash'
alias vsu='git submodule update'
alias vd='git diff'
alias vp='git push'
alias vf='git fetch --all'
alias vfp='git format-patch'
alias vm='git merge'
alias vu='git reset HEAD --'

#add git autocompletion
#source ~/scripts/git-completion.bash

# Add git completion to aliases
#__git_complete v __git_main
#__git_complete vb __git_branch
#__git_complete vch _git_checkout
#__git_complete vco _git_commit
#__git_complete vcp _git_cherry_pick
#__git_complete vr _git_rebase
#__git_complete vm __git_merge
#__git_complete vp _git_pull

# reload bashrc if needed before before Bash displays a prompt
zshrc_sourced=$(stat -c %Y ~/.zshrc)

export PROMPT_COMMAND='
	test $(stat -c %Y ~/.zshrc) -ne $zshrc_sourced && source ~/.zshrc
	'
prmptcmd() { eval "$PROMPT_COMMAND" }
precmd_functions=(prmptcmd)

export HISTFILESIZE=20000
export HISTSIZE=10000
#shopt -s histappend
# Combine multiline commands into one in history
#shopt -s cmdhist
# Ignore duplicates, ls without options and builtin commands
HISTCONTROL=ignoredups
export HISTIGNORE="&:ls:[bf]g:exit"

mkcd(){
    mkdir $1
    cd $1
}

up(){
	local d=""
	limit=$1
	for ((i=1 ; i <= limit ; i++))
	do
		d=$d/..
	done
	d=$(echo $d | sed 's/^\///')
	if [ -z "$d" ]; then
		d=..
	fi
	cd $d
}

op () {
	if [ -f $1 ] ; then
		case $1 in
			*.pdf)
				evince $1 ;;
			*)
				echo "No default program to open '$1'" ;;
		esac
	else
		echo "'$1' is not a valid file"
	fi
}

function swap()
{
    local TMPFILE=tmp.$$
    mv "$1" $TMPFILE
    mv "$2" "$1"
    mv $TMPFILE "$2"
}

xtr () {
	if [ -f $1 ] ; then
		case $1 in
			*.tar.bz2)
				tar xjf $1	;;
			*.tar.gz)
				tar xzf $1	;;
			*.bz2)
				bunzip2 $1       ;;
			*.der)
				curl http://padebug.lpdev.prtdev.lexmark.com/~padebug/auto-fwdebug-decryptor/submit.cgi -k -F uploaded_file=@$1 > $1.tzo      ;;
			*.rar)
				rar x $1     ;;
			*.gz)
				gunzip $1     ;;
			*.tar)
				tar xf $1        ;;
			*.tbz2)
				tar xjf $1      ;;
			*.tgz)
				tar xzf $1  ;;
			*.tzo)
				lzop -d $1  ;;
			*.zip)
				unzip $1  ;;
			*.Z)
				uncompress $1  ;;
			*.7z)
				7z x $1  ;;
			*.tar.xz)
				tar xvfJ $1  ;;
			*)
				echo "'$1' cannot be extracted via extract()" ;;
		esac
	else
		echo "'$1' is not a valid file"
	fi
}

dirsize ()
{
	du -shx * .[a-zA-Z0-9_]* 2> /dev/null | \
		egrep '^ *[0-9.]*[MG]' | sort -n > /tmp/list
	egrep '^ *[0-9.]*M' /tmp/list
	egrep '^ *[0-9.]*G' /tmp/list
	rm -rf /tmp/list
}

copy(){
    test -z $1 && echo "No file input!" && return
    test ! -e $1 && echo "File not exist!" && return
    export orig_path="$PWD/$1"
    export orig_name="$1"
}
paste(){
    test -z $orig_path && echo "No copied file!" && return
    if [ "$#" -lt 1 ];then
        dist_name="$PWD/$orig_name"
        if [ -d $orig_path ];then
            cp -r $orig_path $dist_name
        else
            cp $orig_path $dist_name
        fi
        echo "$orig_name pasted."
    else
        dist_name="$PWD/$1"
        if [ -d $orig_path ];then
            cp -r $orig_path $dist_name
        else
            cp $orig_path $dist_name
        fi
        echo "\"$1\" pasted."
    fi
}

function dirmenu(){
	dirIter=($(dialog --backtitle 'dirmenu' \
		--clear \
		--cancel-label "Exit" \
		--menu "Please select:" 0 0 0 \
		$(dirs -v) 3>&2 2>&1 1>&3))

	cmd="cd ~$dirIter"
	eval $cmd
}

function i3workspaces(){
	for i in {1..10}
	do
		echo "$i workspace$i"
	done
}

function i3menu(){
	cmd="dialog --backtitle dirmenu --clear --cancel-label Exit --treeview "$(i3treestr)" 3>&2 2>&1 1>&3"
	echo $cmd
	tag=`eval "$cmd"`
	echo $tag

	workspace=$(dialog --backtitle dirmenu --clear --cancel-label Exit --menu "Select workspace" 0 0 10 `i3workspaces` 3>&2 2>&1 1>&3)
	echo $workspaces
	i3-msg "[con_id=\"$tag\"] focus; move container workspace $workspace"
}

# deer(){
#     emacsclient -nw --eval "(deer)" .
# }

# ranger(){
#     emacsclient -nw --eval "(ranger)" .
# }

# Prompt
#BGREEN='\[\033[1;32m\]'
#GREEN='\[\033[0;32m\]'
#BRED='\[\033[1;31m\]'
#RED='\[\033[0;31m\]'
#BBLUE='\[\033[1;34m\]'
#BLUE='\[\033[0;34m\]'
#NORMAL='\[\033[00m\]'
#PS1="${BLUE}(${RED}\w${BLUE}) ${NORMAL}\h ${RED}\$ ${NORMAL}"

# autocomplete specs
_stashComplete()
{
    local cur=${COMP_WORDS[COMP_CWORD]}
    COMPREPLY=( $(compgen -W "$(ls /bonus/scratch/samorris/.stash/)" -- $cur) )
}

#complete -F _stashComplete stg

export PATH="/home/.local/lib/anaconda2/bin:$PATH"
