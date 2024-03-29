# .zshrc - csa@csa-net.dk 20070602
umask 002


#fpath=($fpath ~/.zshfuncs)
#path=(~/bin $path)

# Variabel settings
export PAGER="less"
export EDITOR="vim"

export PATH="$PATH:/usr/bin:/etc:/usr/local/bin:/usr/sbin:/sbin:$HOME/bin"

HISTSIZE="50000"
HISTFILE="${HOME}/.zsh_history"
SAVEHIST="20000"
DIRSTACKSIZE=30

READNULLCMD=less

export LESSCHARSET=iso8859

###--------------------------------------------------
### hashes

#hash -d music=/srv/media/music
#hash -d movies=/srv/media/music

###--------------------------------------------------
### aliases

alias 'c'='cat'
alias 'g'='grep -i'
alias 'm'='less'
alias 'p'='pwd'
alias 'l'='ls -avF'
alias 'mk'='make'
alias 'which-command'='whence -afv'
alias 'which'='whence -afv'
alias 'pushd'='pushd;dirs -v'
alias 'popd'='podp;dirs -v'
alias 'd'='dirs -v'
alias 'j'='jobs -lp'
alias 'h'='fc -ldD -40'
alias alert='notify-send -i /usr/share/icons/gnome/32x32/apps/gnome-terminal.png "[$?] $(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/;\s*alert$//'\'')"'
#alias 'll'='ls -la'

#alias 'qstat'='sudo /var/qmail/bin/qmail-qstat'
#alias 'qsepostat'='sudo /var/qmailsepo/bin/qmail-qstat'
#alias 'qread'='sudo /var/qmail/bin/qmail-qread'
#alias 'qseporead'='sudo /var/qmailsepo/bin/qmail-qread'
#alias 'qlog'='tail -F /var/log/qmail/qmail-send/current | tai64nlocal'
#alias 'qmxlog'='tail -F /var/qmail-mx/log/qmail-send/current | tai64nlocal'
#alias 'qsepolog'='tail -F /var/log/qmail/qmailsepo-send/current | tai64nlocal'
#alias 'smtplog'='tail -F /var/log/qmail/qmail-smtpd/current | tai64nlocal'
#alias 'smtpmxlog'='tail -F /var/qmail-mx/log/qmail-smtpd/current | tai64nlocal'
#alias 'dnslog'='tail -F /service/dnscache/log/main/current| djbdns-log.py'
#alias 'qmqplog'='tail -F /var/log/qmail/qmail-qmqpd/current| djbdns-log.py'
#alias 'spamlog'='tail -F /var/log/spamd/current| djbdns-log.py'

###--------------------------------------------------
### functions

#.() {
#  if [[ $# -eq 0 ]]; then
#    cd $OLDPWD
#  else
#    builtin . $*
#  fi
#}

###--------------------------------------------------
### options

#setopt autocd autolist automenu autopushd braceccl cdablevars
#setopt correct extendedglob noflowcontrol
#setopt histignoredups histignorespace histnostore listtypes longlistjobs
#setopt cshnullglob magicequalsubst listpacked
#setopt numericglobsort pushdignoredups pushdminus pushdsilent
#setopt pushdtohome rcexpandparam rcquotes
#setopt sunkeyboardhack zle nobadpattern autoremoveslash
#setopt completeinword autoparamkeys
#setopt alwayslastprompt

#unsetopt bgnice norcs notify nonomatch hashdirs listambiguous


###--------------------------------------------------
### prompts

#precmd() {
#  local o=$? s
#
#  if (( o > 127 )); then
#    s=${(L)signals[o-127]}
#  else
#    s=$o
#  fi
#  if (( $#jobtexts )); then
#    psvar=($s $#jobtexts)
#  else
#    psvar=($s)
#  fi
#  chpwd
#  ?=$o
#}

#if [[ $TERM = linux ]]; then
#  chpwd() {}
#  P='%h | %~'
#else
#  chpwd () {
#    print -Pn "\e]0;%~\a"
#  }
#  P='%h'
#fi

if [[ $EUID = 0 ]]; then
#  PS1='%{[37;41m%} '"$P"' %{[0m%} %B'
  PS1=$'%{\e[1;31m%}%T%{\e[0m%} %n@%m% %{[0m%} %d %# %B'
else
  PS1=$'%{\e[1;32m%}%T%{\e[0m%} %n@%m% %{[0m%} %d %# %B'
fi
RPROMPT='%b%(0?..%{[36;44m%} %1v )%2(v.%{[0m%} %{[36;42m%} %2v .)%{[0m%}'
PS2='%{[37;41m%} %3_ %{[0m%} %B'
SPROMPT='%{[1;33m%}correct %R to %r (ynae)%{[0m%} '

POSTEDIT='[0m'

unset P


###--------------------------------------------------
### completion

zmodload zsh/complist
zmodload zsh/computil

autoload compinit
compinit

zstyle ':completion:*:*:cd:*' tag-order local-directories
zstyle ':completion:*:*:lp*:*' tag-order jobs
zstyle ':completion:*:*:(kill|wait):*' tag-order 'jobs processes'
zstyle ':completion:*:*:(kill|wait):*' group-order jobs
zstyle ':completion:*:*' users-hosts \
    foo@bar.com \
    baz@foobar.net
zstyle ':completion:*' use-compctl false
zstyle ':completion:*:match:*' original yes
zstyle ':completion:incremental:*' list yes
zstyle ':completion:incremental:*' prompt 'incremental (%c): %u%s%a  %l'
zstyle ':completion:*:oldlist:*' menu verbose
zstyle ':completion:predict:*' completer _complete
zstyle ':completion:predict:*' list always
zstyle ':completion:predict:*' cursor key
zstyle ':completion:predict:*' special-dirs yes
zstyle ':completion:*:default' menu select
zstyle ':completion:*:(correct|approximate):*' max-errors 2 numeric
zstyle ':completion:*:(correct|approximate)-*:*' original yes
zstyle ':completion:*:paths' expand prefix
zstyle ':completion:*:option(-*|s)' auto-description 'specify %d'
zstyle ':completion:*:processes' command ps --forest -u $EUID -o pid,cmd
zstyle ':completion:*' verbose yes
zstyle ':completion:*' prefix-needed yes
zstyle ':completion:*' prefix-hidden no
zstyle ':completion:*' last-prompt yes
zstyle ':completion:*' users foo baz root
zstyle ':completion:*:complete:*:(all-|)files' ignored-patterns \
  '?*~' '?*.(o|log|aux|elc|reg|pro|md[dh]|mdh[is]|syms|epro)' '(|*/)CVS'
zstyle ':completion:*:complete:*:(local|path)-directories' ignored-patterns '(|*/)CVS'
zstyle ':completion:*' group-name ''
zstyle ':completion:*:jobs' prefix-needed no
zstyle ':completion:*' ignore-parents pwd parent
zstyle ':completion:*:complete:*:(functions|parameters|association-keys)' ignored-patterns '_*'
zstyle ':completion:::::' completer _complete _match _ignored _correct _approximate _prefix
zstyle ':completion:*' matcher-list '' 'm:{a-z-}={A-Z_} r:|[-_./]=* r:|=*' 'm:{a-z-}={A-Z_} l:|=* r:|=*'
zstyle ':completion:*:*:diff:*:version' command =diff -v
zstyle ':completion:*:*:(p|gview|xdvi|kill|psnup):*' menu yes select
zstyle ':completion:*:*:(p|gview|xdvi|psnup):*' file-sort time
zstyle ':completion:*:default' list-prompt '%{[44;37m%} Line %l  Continue?                                                                       %b'
zstyle ':completion:*:default' select-prompt '%{[44;37m%} Match %m  Line %l  %p                                                                                  %b'
zstyle ':completion:*:(cp|mv|rm):*' ignore-line yes
zstyle ':completion:*:kill:*' force-list always
zstyle ':completion:*:*:*make:*:targets' command awk \''/^[a-zA-Z0-9][^\/\t=]+:/ {print $1}'\' \$file
zstyle ':completion:*history*' remove-all-dups yes
zstyle ':completion:*history*' stop yes

zstyle ':completion:*:(correct|approximate)-*:*:corrections' format '%{[1;31m%}-------------------- %{[36;41m%}  correct  %{[0m%} %{[36;41m%}  %e  %{[0m%} %{[36;43m%}  %-35.35o  %{[0m%}'
zstyle ':completion:*:expand:*:expansions' format '%{[1;31m%}--------------------------- %{[36;41m%}  expand  %{[0m%} %{[36;43m%}  %-35.35o  %{[0m%}'
zstyle ':completion:*:default' list-colors 'tc=35' 'ma=41;37' 'st=43;36' 'di=31;1' 'ex=33;1' \
                                          'ln=32' '*CVS=35' '*rej=31;1' '*orig=35'
zstyle ':completion:*:descriptions' format '%{[1;34m%}-------------------------------------- %{[44;37m%}  %-35.35d  %{[0m%}'
zstyle ':completion:*:messages' format '%{[1;34m%}-------------------------------------- %{[44;37m%}  %-35.35d  %{[0m%}'
zstyle ':completion:*:warnings' format '%{[1;31m%}-------------------------------------- %{[37;41m%}  no match for                         %{[0m%}
%{[33m%}%D%{[0m%}'
zstyle ':completion:*:processes' list-colors \
    '=(#b)( #[0-9]#)[^[/0-9a-zA-Z]#(*)=34=37;1=30;1'
zstyle ':completion:*:parameters' list-colors '=_*=33' '=[^a-zA-Z]*=31'
zstyle ':completion:*:functions' list-colors '=_*=33' '=*-*=31'
zstyle ':completion:*:original' list-colors '=*=31;1'
zstyle ':completion:*:all-expansions' list-colors '=*=32'
zstyle ':completion:*:reserved-words' list-colors '=*=31'
zstyle ':completion:*:(jobs|directory-stack|indexes)' list-colors \
    '=(#b)(*) -- (*)=35;1=31;1=33;1'
zstyle ':completion:*:(options|values)' list-colors \
    '=(#b)(*)-- (*)=35;1=31;1=33;1' '=*=31;1'
zstyle ':completion:*::lp*:jobs' list-colors '=(#b)* [0-9] ##([^ 	]##) ##([^ 	]##) ##([^ 	]##) ##(*)=35=32=31;1=33;1=32'


SELECTMIN=5
ZLS_COLOURS='ma=7:di=0:ex=0:bd=0:cd=0:ln=0:so=0'

bindkey -M menuselect '/' accept-and-infer-next-history \
                      '^U' undo \
    	              '^@' accept-and-menu-complete \
                      '^A' .beginning-of-line-hist \
                      '^E' .end-of-line-hist \
		              '^P' vi-forward-blank-word \
		              '^N' vi-backward-blank-word \
					  '^R' history-incremental-search-backward \
		              '\e<' beginning-of-history \
		              '\e>' end-of-history

