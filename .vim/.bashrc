#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

. ~/scripts/sshag.sh
sagent

#setxkbmap -option "ctrl:menu_rctrl"

alias e='vimx'
alias eb='e ~/.bashrc'
alias ei3='e ~/.i3/config'
alias ev='e ~/.vimrc'
alias ej="e ~/notes/journal/`date +%m%d%y`"
alias es="e ~/.scratch"
alias est="edit_story"
alias la='ls -a'
alias ll='ls -l'
alias rrc='source ~/.bashrc'
alias g='grep -rin'
alias f='find_mod'
alias bc='bc -l'
alias mkdir='mkdir -pv'
alias diff='colordiff'
alias rm='rm -I --preserve-root'
alias diskspace='du -S | sort -n -r |less'
alias st='copy_to_stash'
alias stg='get_from_stash'
alias d2h='dec2hex'
alias h2d='hex2dec'

# relocation commands
alias gh='cd /users/samorris'

alias ggr='cd /bonus/scratch/samorris/src/g2-r4'
alias glh='cd /bonus/scratch/samorris'
alias gst='cd /bonus/scratch/samorris/.stash'
alias gls='cd /bonus/scratch/samorris/src'
alias gli='cd /bonus/scratch/samorris/src/linux'

alias gml='cd /bonus/scratch/samorris/build-bundle/meta-lexmark'
alias gmll='cd /bonus/scratch/samorris/build-bundle-latest/meta-lexmark'
alias gml2='cd /bonus/scratch/samorris/build-bundle-2/meta-lexmark'
alias gmg='cd /bonus/scratch/samorris/build-bundle/meta-granite'
alias grgr='cd /bonus/scratch/samorris/build-bundle/meta-granite/recipes-bsp/g2-r4'
alias grgrl='cd /bonus/scratch/samorris/build-bundle-latest/meta-granite/recipes-bsp/g2-r4'
alias grgr2='cd /bonus/scratch/samorris/build-bundle-2/meta-granite/recipes-bsp/g2-r4'
alias gmgl='cd /bonus/scratch/samorris/build-bundle-latest/meta-granite'
alias gmg2='cd /bonus/scratch/samorris/build-bundle-2/meta-granite'
alias gma='cd /bonus/scratch/samorris/build-bundle/meta-armada'
alias gbb='cd /bonus/scratch/samorris/build-bundle'
alias gbbl='cd /bonus/scratch/samorris/build-bundle-latest'
alias gbb2='cd /bonus/scratch/samorris/build-bundle-2'
alias gpm='cd /bonus/scratch/samorris/src/power-mgmt'
alias grpm='cd /bonus/scratch/samorris/build-bundle/meta-lexmark/recipes-lowlevel/power-mgmt'
alias grpml='cd /bonus/scratch/samorris/build-bundle-latest/meta-lexmark/recipes-lowlevel/power-mgmt'
alias grpm2='cd /bonus/scratch/samorris/build-bundle-2/meta-lexmark/recipes-lowlevel/power-mgmt'
alias grl='cd /bonus/scratch/samorris/build-bundle/meta-lexmark/recipes-kernel/linux'
alias grll='cd /bonus/scratch/samorris/build-bundle-latest/meta-lexmark/recipes-kernel/linux'
alias grl2='cd /bonus/scratch/samorris/build-bundle-2/meta-lexmark/recipes-kernel/linux'

# yocto commands
alias bb='bitbake'
alias bbc='bitbake -C compile'
alias bbcl='bitbake -c cleanall'
alias bbd='bitbake -c devshell'
alias bbhl='bitbake core-image-highlevel'
alias bbll='bitbake core-image-lowlevel'
alias bbi='. ./init-build-env -c'
alias pts='point-to-source'

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
source ~/scripts/git-completion.bash

# Add git completion to aliases
__git_complete v __git_main
__git_complete vb __git_branch
__git_complete vch _git_checkout
__git_complete vco _git_commit
__git_complete vcp _git_cherry_pick
__git_complete vr _git_rebase
__git_complete vm __git_merge
__git_complete vp _git_pull

# reload bashrc if needed before before Bash displays a prompt
bashrc_sourced=$(stat -c %Y ~/.bashrc)

export PROMPT_COMMAND='
	test $(stat -c %Y ~/.bashrc) -ne $bashrc_sourced && source ~/.bashrc
	'
#export PATH=/m/dev-tools/f/n/wip/bin:$PATH

export HISTFILESIZE=20000
export HISTSIZE=10000
shopt -s histappend
# Combine multiline commands into one in history
shopt -s cmdhist
# Ignore duplicates, ls without options and builtin commands
HISTCONTROL=ignoredups
export HISTIGNORE="&:ls:[bf]g:exit"

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

complete -F _stashComplete stg
