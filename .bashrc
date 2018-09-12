#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

#. ~/bin/check-ssh-agent
. ~/scripts/sshag.sh
sagent

#setxkbmap -option "ctrl:menu_rctrl"

#alias e='nvim'
alias e='vim'
alias eb='e ~/.bashrc'
alias ei='e ~/.inputrc'
alias ez='e ~/.zshrc'
alias ei3='e ~/.i3/config'
alias ev='e ~/.vimrc'
#alias ev='e ~/.config/nvim/init.vim'
#alias ej="e ~/notes/journal/`date +%m%d%y`"
alias ej="e ~/notes/journal/`date +%y%m%d`"
alias es="e ~/.scratch"
alias em="e ~/.memorandum"
alias est="edit_story"
alias la='ls -a'
alias ll='ls -l'
alias rrc='source ~/.bashrc'
#alias g='grep -rin'
alias g='grep -rin --exclude tags --exclude cscope.out --exclude-dir .git --'
alias qg='qgrep search'
alias f='sam_find'
alias bc='bc -l'
alias mkdir='mkdir -pv'
alias diff='colordiff'
alias rm='rm -I --preserve-root'
alias diskspace='du -S | sort -n -r |less'
alias st='copy2stash'
alias stg='copy_from_stash'
alias d2h='dec2hex'
alias h2d='hex2dec'
alias b2h='bin2hex'
alias h2b='hex2bin'
alias dg='ssh dg'
#alias dg='rsh -l user1 157.184.142.36'
alias rdg='ssh rdg'
alias cd='pushd'
alias bk='popd'
alias flip='pushd_builtin'
alias dirs='dirs -v'
alias dm='dirmenu'
alias trim="ex +'bufdo!%s/\s\+$//e' -scxa"
alias retab="ex +'set ts=2' +'bufdo retab' -scxa"
alias pss='ps aux |grep -i'
alias srl='serial'
alias fls='flash_printer'
alias ipp='print_ip'

# relocation commands
alias gh='cd ~'
alias glo='cd ~/logs'
alias ggr='cd ~/src/g2-r4'
alias glh='cd ~'
alias gst='cd ~/.stash'
alias gls='cd ~/src'
alias glt='cd ~/tmp'
alias gli='cd ~/src/linux'
alias glr='cd ~/src/linux-r4'
alias gdt='cd ~/src/linux/arch/arm/boot/dts'
alias gss='cd ~/src/sscore'
alias gpm='cd ~/src/power-mgmt'
alias gsm='cd ~/src/storagemgr'
alias gev='cd ~/ev'

BBD=~/build/builders/local
#BBD=~/build/builders/warner
#BBD=~/build/builders/chief
alias sbb="source $BBD/bb/bin/activate"
alias gml="cd $BBD/meta-lexmark"
alias gmll="cd $BBD-latest/meta-lexmark"
alias gmg="cd $BBD/meta-granite"
alias grlr="cd $BBD/meta-granite/recipes-kernel/linux"
alias gma="cd $BBD/meta-armada"
alias gbb="cd $BBD; source bb/bin/activate"
alias gbbl="cd $BBD-latest"
alias grpm="cd $BBD/meta-lexmark/recipes-lowlevel/power-mgmt"
alias grsm="cd $BBD/meta-lexmark/recipes-generic/storagemgr"
alias grpml="cd $BBD-latest/meta-lexmark/recipes-lowlevel/power-mgmt"
alias grl="cd $BBD/meta-lexmark/recipes-kernel/linux"
alias grll="cd $BBD-latest/meta-lexmark/recipes-kernel/linux"
alias grsm="cd $BBD/meta-lexmark/recipes-generic/storagemgr"
alias gb="cd ~/build"
alias gbs="cd ~/build/builders"

# yocto commands
BB='docker-bitbake'
alias bb="$BB"
alias bbp="$BB -c patch"
alias bbc="$BB -c compile"
alias bbg="$BB -g -u depexp"
alias bbf="$BB -c fetch"
alias bbcl="$BB -c cleanall"
alias bbcs="$BB -c cleansstate"
alias bbd="$BB -c devshell"
alias bbhl="$BB core-image-highlevel"
alias bbhls="$BB core-image-highlevel-sfp"
alias bbhlns="$BB core-image-highlevel-non-touch-sfp"
alias bbhlls="$BB core-image-highlevel-lite-sfp"
alias bbhlnm="$BB core-image-highlevel-non-touch-mfp"
alias bbhllm="$BB core-image-highlevel-lite-mfp"
alias bbhlm="$BB core-image-highlevel-mfp"
alias bbtp="$BB core-image-thickprint"
alias bbll="$BB core-image-lowlevel"
alias bbi='bb_init'
alias pts='point-to-source'

# version control commands
alias v='git'
alias vh='git help'
alias vap='git apply'
alias vk='git_tree'
alias vka='git_tree_all'
alias vch='git checkout'
alias vcb='git checkout -b'
alias vco='git commit'
alias vcom='git commit -m'
alias vcp='git cherry-pick'
alias vcpc='git cherry-pick --continue'
alias vcl='clean-repo'
alias va='git add'
alias vaa='git add -A'
alias vau='git add -u'
alias vb='git branch'
alias vba='git branch -a'
alias vbr='git branch -r'
alias vb='git branch'
alias vl='git log'
alias vlb='git log -p -M --follow --stat --'
alias vr='git rebase'
alias vri='git rebase -i'
alias vrh='git reset --hard'
alias vrm='git rm'
alias vs='git status'
alias vsh='git stash'
alias vsu='git submodule update --init'
alias vd='git diff'
alias vp='git push'
alias vf='git fetch --all; git submodule foreach git fetch --all'
alias vfp='git format-patch'
alias vm='git merge'
alias vu='git reset HEAD --'
alias vo='git remote'
alias voa='git remote add'
alias vos='git remote set-url'
alias vov='git remote -v'
alias vam='git am -3'


alias pmi="sudo pacman -S"
alias pms="pacman -Ss"
alias pmf="pacman -Fs"
alias pmr="pacman -Rns"

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

###############################################################################
# Environment Variables
###############################################################################

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
export EDITOR="vim"
export VISUAL="vim"

###############################################################################
# My Functions
###############################################################################

bb_init(){
	gbb
	. ./init-build-env -c $1
}

print_ip(){
	ip addr show eno1|grep 'inet '|awk '{print $2}'|sed 's:/23::'
}

flash_printer(){
	#nc $1 9100 <$2
	nc $1 10010 <$2
}

serial(){
	sudo picocom -b 115200 /dev/ttyUSB$1
}

mkcd(){
	mkdir $1
	cd $1
}

i3mvw(){
	i3-msg "workspace $1; move workspace to output DVI-$2"
}

digi-connect(){
	telnet 157.184.142.36 20$1
}

secure-digi-connect(){
	ssh user1@157.184.142.36
}

secure-digi-connect-root(){
	ssh root@157.184.142.36
}

vbf(){
	vb -f $1
}

vcbf(){
	vb -f $1
	vch $1
}

ptd(){
	cd $1
	pwd
	cd - >/dev/null
}

cl(){
	cd $1; ls
}

vchom(){
	vch "origin/master"
}

vpc(){
	vp $1 HEAD
}

vpcf(){
	vp -f $1 HEAD
}

vpcs(){
	vpc sam
}

vpcsf(){
	vpcf sam
}

vpcg(){
	vpc gitlpm
}

vpcgf(){
	vpcf gitlpm
}

vdp(){
	if [ -z "$1" ]; then
		vd HEAD~1 HEAD
	else
		vd $1~1 $1
	fi
}

vuml(){
	gbb
	va meta-lexmark
	vcom "update meta-lexmark"
}

vumg(){
	gbb
	va meta-granite
	vcom "update meta-granite"
}

bbclc(){
	bbcl $1 && bbc $1
}

bbcsc(){
	bbcs $1 && bbc $1
}

bbcld(){
	bbcl $1 && bbd $1
}

stemu(){
	export PERSONA="armada-palazzo-debug"
	../sentry/sdk/start_sentry -b
}

cmx(){
	comox --device=/dev/ttyUSB$1 --baud 115200
}

psr(){
	if [ -z "$3" ]; then
		offTime=5
	else
		offTime=$3
	fi

	echo "offTime: $offTime"

	if [ $1 == 1 ]; then
		apcReset -s 157.184.142.50 -p $2 -d $offTime
	elif [ $1 == 2 ]; then
		apcReset -s 157.184.142.66 -p $2 -d $offTime
	else
		echo "Invalid input"
	fi
	#apcReset -s 157.184.142.66 -p $1 -d 5
}

bbgl(){
	vf
	git checkout $(git --no-pager log --decorate --oneline --all |  grep -o "tag: stable-[0-9]\+" | grep -o "stable-[0-9]\+"| head -1)
	vsu
}

bbvch(){
	pushd .
	cd /bonus/scratch/samorris/build-bundle/meta-lexmark
	vch $1
	cd /bonus/scratch/samorris/build-bundle
	vch $1
	vsu
	popd
}

load-keymaps(){
	xkbcomp -i 12 ~/keymaps/arduino/keybrd.xkb $DISPLAY
	xkbcomp -i 9 ~/keymaps/tartarus/keybrd.xkb $DISPLAY
	xkbcomp -i 13 ~/keymaps/dell/keybrd.xkb $DISPLAY
}

clean-repo(){
	echo 'Remove all tracked and untracked files? (Y/n)';
	read rsp;
	if [ "$rsp" == "Y" ]; then
		git clean -f -d -x
		exit 1
	elif [ "$rsp" == "n" ]; then
		exit 1
	else
		echo "Invalid response"
		exit 1
	fi
}

git_tree(){
	export GIT_PAGER='less -p"\(HEAD"'
	git log --oneline --graph --decorate
	export GIT_PAGER=less
}

git_tree_all(){
	export TMP=$GIT_PAGER
	export GIT_PAGER='less -p"\(HEAD"'
	git log --oneline --graph --decorate --all
	export GIT_PAGER='less'
}

dec2hex(){
	printf '%x\n' $1
}

hex2dec(){
	echo $((16#$1))
}

bin2hex(){
	printf '%x\n' "$((2#$1))"
}

hex2bin(){
	decArg=$(hex2dec $1)
	echo "obase=2;${decArg}" | bc
}

dec2bin(){
	echo "obase=2;$1" | bc
}

bchex(){
	upper_arg=$(echo "$1" | tr '[:lower:]' '[:upper:]')
	d2h `echo "ibase=16; $upper_arg" | bc`
	#hex_arg = "ibase=16;${1}"
	#dec_result = hex_arg | bc
	#d2h dec_result
}

copy2stash(){
	cp "$@" /bonus/scratch/samorris/.stash
}

copy_from_stash(){
	mv /bonus/scratch/samorris/.stash/$1 .
}

edit_story(){
	vimx ~/Dropbox/Stories/$1
}

sam_find(){
	find $2 -iname \*$1\*
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

linux_ws(){
	case $1 in
		mono)
			rm w s
			ln -s /home/sam/src/build-bundle/poky/granite2-mono-debug/tmp/work/granite2-poky-linux-gnueabi/linux-granite-upstream/4.11.12+gitAUTOINC+2567c0991d-r0/ w
			ln -s /home/sam/src/build-bundle/poky/granite2-mono-debug/tmp/work-shared/granite2/kernel-source/ s
			;;
		color)
			rm w s
			ln -s /home/sam/src/build-bundle/poky/granite2v8-color-debug/tmp/work-shared/granite2v8/kernel-source/ s
			ln -s /home/sam/src/build-bundle/poky/granite2v8-color-debug/tmp/work/granite2v8-poky-linux/linux-granite-upstream/4.11.12+gitAUTOINC+2567c0991d-r0/ w
	esac
}


xtr () {
	#strip extension
	filename="${1%.*}"
	if [ -f $1 ] ; then
		case $1 in
			*.tar.bz2)
				tar xjf $1	;;
			*.tar.gz)
				tar xzf $1	;;
			*.bz2)
				bunzip2 $1       ;;
			*.der)
				curl http://padebug.lpdev.prtdev.lexmark.com/~padebug/auto-fwdebug-decryptor/submit.cgi -k -F uploaded_file=@$1 > ${filename}      ;;
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
			*.lzo)
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

anywait(){

    for pid in "$@"; do
        while kill -0 "$pid"; do
            sleep 0.5
        done
    done
}

pushd(){
  if [ $# -eq 0 ]; then
    DIR="${HOME}"
  else
    DIR="$1"
  fi

  builtin pushd "${DIR}" > /dev/null
  #echo -n "DIRSTACK: "
  #dirs
}

pushd_builtin(){
  builtin pushd > /dev/null
  #echo -n "DIRSTACK: "
  #dirs
}

popd(){
  builtin popd > /dev/null
  #echo -n "DIRSTACK: "
  #dirs
}

dirmenu(){
	dirIter=$(dialog --backtitle 'dirmenu' --clear --cancel-label "Exit" --menu "Please select:" 0 0 0 $(dirs) 3>&2 2>&1 1>&3)
	#dirIter=$(dialog --backtitle 'dirmenu' --cancel-label "Exit" --menu "Please select:" 0 0 0 $(dirs) 3>&2 2>&1 1>&3)
	cmd="builtin cd ~$dirIter"

	eval $cmd
}

agv(){
	ag --vimgrep $1 $2 |vimx -
}

agn(){
	ag ~/notes $1
}

cpa(){
	rsync -a $1 $2
}

ctg(){
	case $1 in
		lpm)
			ctags -R --exclude=drivers/w --exclude=.git/ --exclude=../libinput/.git . ../libinput/ ;;
		*)
			echo "No default project to tag" ;;
	esac
}

i3st(){
	for i in `seq 1 10`;
	do
		i3-save-tree --workspace $i > ~/.i3/test/workspace-$i.json
		sed -i 's:// ::g' ~/.i3/lex/workspace-$i.json
	done
}

i3sn(){
	FOCUSED=$(wmctrl -lp | grep $(xprop -root | grep _NET_ACTIVE_WINDOW | head -1 | awk '{print $5}' | sed 's/,//' | sed 's/^0x/0x0/'))
	FPID=$(echo $FOCUSED | awk '{print $3}')
	FNME=$(echo $FOCUSED | cut -f -4  -d ' ' --complement)
	xdotool search -all --pid $FPID --name "$FNME" set_window -name "$*"
}

i3menu(){
  cmd="dialog --backtitle dirmenu --clear --cancel-label Exit --treeview \""$(i3treestr)"\" 3>&2 2>&1 1>&3"
  echo $cmd
  tag=`eval "$cmd"`
  echo $tag

  workspace=$(dialog --backtitle dirmenu --clear --cancel-label Exit --menu "Select workspace" 0 0 10 `i3workspaces` 3>&2 2>&1 1>&3)
  echo $workspaces
  i3-msg "[con_id=\"$tag\"] focus; move container workspace $workspace"
}

#i3title(){
	#FOCUSED=$(wmctrl -lp | grep $(xprop -root | grep _NET_ACTIVE_WINDOW | head -2 | tail -n 1 | awk '{print $5}' | sed 's/,//' | sed 's/^0x/0x0/'))
	#FPID=$(echo $FOCUSED | awk '{print $3}')
	#FNME=$(echo $FOCUSED | cut -f -4  -d ' ' --complement)
	#xdotool search -all --pid $FPID --name "$FNME" set_window -name "$*"
#}

sdd(){
	sudo dd if=./$1 of=/dev/sd$2 bs=1M && sync
}

mktestspace(){
	WORKSPACE=$1
	test -z $1 && echo "usage: mktestspace <workspace>" && return

	i3-msg "workspace $WORKSPACE; append_layout ~/.i3/lex/workspace-7.json"
	i3-msg "workspace $WORKSPACE; exec ~/bin/init-test-sh 1"
	i3-msg "workspace $WORKSPACE; exec ~/bin/init-test-sh 2"
	i3-msg "workspace $WORKSPACE; exec ~/bin/init-test-sh 3"
	i3-msg "workspace $WORKSPACE; exec ~/bin/init-test-sh 4"
	i3-msg "workspace $WORKSPACE; exec ~/bin/init-test-sh 5"
	i3-msg "workspace $WORKSPACE; exec ~/bin/init-test-sh 6"
	i3-msg "workspace $WORKSPACE; exec ~/bin/init-test-sh 7"
	i3-msg "workspace $WORKSPACE; exec ~/bin/init-test-sh 8"
	i3-msg "workspace $WORKSPACE; exec ~/bin/init-test-sh 9"
	i3-msg "workspace $WORKSPACE; exec ~/bin/init-test-sh 10"
	#i3-msg "workspace $WORKSPACE; exec urxvt -e bash -c \'i3st 10; bash\'"
}

# autocomplete specs
_stashComplete()
{
    local cur=${COMP_WORDS[COMP_CWORD]}
    COMPREPLY=( $(compgen -W "$(ls /bonus/scratch/samorris/.stash/)" -- $cur) )
}

complete -F _stashComplete stg
