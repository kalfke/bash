# welcome to my .bashrc
export PS1='\n\[\033[0;33m\]\u\[\033[0;97m\]:\[\033[0;31m\]\w \[\033[0;95m\]$(parse_git_branch)\n\[\033[0;32m\]>\[\033[0m\] '

export EDITOR=vim
export JAVA_8_HOME=$(/usr/libexec/java_home -v1.8)
export JAVA_7_HOME=$(/usr/libexec/java_home -v1.7)

alias java7='export JAVA_HOME=$JAVA_7_HOME;PATH=${JAVA_HOME}/bin:$PATH'
alias java8='export JAVA_HOME=$JAVA_8_HOME;PATH=${JAVA_HOME}/bin:$PATH'

#default java8
export JAVA_HOME=$JAVA_8_HOME

export PATH=${JAVA_HOME}/bin:${MVN_HOME}/bin:$PATH

alias reload='. ~/.bash_profile'

#   -----------------------------
#   1.  MAKE GIT BETTER
#   -----------------------------
alias sb='git branch | grep'
alias gt='git tag -l --sort=version:refname "v*"'
alias gtfo='git reset --hard HEAD'
alias push='git push origin '
alias pull='git pull origin '
alias gs='git status'
alias gds='git diff HEAD | subl&'
alias gda='git diff HEAD | tmpin atom&'
alias gau='git add -u'
alias co='git checkout '
alias cob='git checkout -b '
alias commit='git commit -m'
alias lw='git for-each-ref --sort=-committerdate refs/heads/ | head'
alias clean='git clean -qfdx'
function parse_git_dirty {
  [[ $(git status 2> /dev/null | tail -n1) != "nothing to commit, working tree clean" ]] && echo "*"
}

function parse_git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/[\1$(parse_git_dirty)]/"
}

#   -----------------------------
#   2.  MAKE TERMINAL BETTER
#   -----------------------------
alias hosts="sudo vim /etc/hosts"
alias cp='cp -iv'                           # Preferred 'cp' implementation
alias mv='mv -iv'                           # Preferred 'mv' implementation
alias mkdir='mkdir -pv'                     # Preferred 'mkdir' implementation
alias ll='ls -FGlAhp'                       # Preferred 'ls' implementation
alias fix_stty='stty sane'                  # fix_stty:     Restore terminal settings when screwed up

#   -------------------------------
#   3.  FILE AND FOLDER MANAGEMENT
#   -------------------------------
zipf () { zip -r "$1".zip "$1" ; }          # zipf:         To create a ZIP archive of a folder
alias numFiles='echo $(ls -1 | wc -l)'      # numFiles:     Count of non-hidden files in current dir

#   ---------------------------
#   4.  SEARCHING
#   ---------------------------
alias qfind="find . -name "                 # qfind:    Quickly search for file
ff () { /usr/bin/find . -name "$@" ; }      # ff:       Find file under the current directory
ffs () { /usr/bin/find . -name "$@"'*' ; }  # ffs:      Find file whose name starts with a given string
ffe () { /usr/bin/find . -name '*'"$@" ; }  # ffe:      Find file whose name ends with a given string

#   ---------------------------
#   5.  PROCESS MANAGEMENT
#   ---------------------------
#   findPid: find out the pid of a specified process
#       Note that the command name can be specified via a regex
#       E.g. findPid '/d$/' finds pids of all processes with names ending in 'd'
#       Without the 'sudo' it will only find processes of the current user
#   -----------------------------------------------------
findPid () { lsof -t -c "$@" ; }

#   memHogsTop, memHogsPs:  Find memory hogs
#   -----------------------------------------------------
alias memHogsTop='top -l 1 -o rsize | head -20'
alias memHogsPs='ps wwaxm -o pid,stat,vsize,rss,time,command | head -10'

#   cpuHogs:  Find CPU hogs
#   -----------------------------------------------------
alias cpuHogsTop='ps wwaxr -o pid,stat,%cpu,time,command | head -10'

#   topForever:  Continual 'top' listing (every 10 seconds)
#   -----------------------------------------------------
alias topForever='top -l 9999999 -s 10 -o cpu'

#   ttop:  Recommended 'top' invocation to minimize resources
#   ------------------------------------------------------------
alias ttop="top -R -F -s 10 -o rsize"

#   my_ps: List processes owned by my user:
#   ------------------------------------------------------------
my_ps() { ps $@ -u $USER -o pid,%cpu,%mem,start,time,bsdtime,command ; }

#   ---------------------------
#   6.  NETWORKING
#   ---------------------------
alias myip='curl https://api.ipify.org'                    # myip:         Public facing IP Address
