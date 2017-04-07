

#
# User configuration sourced by interactive shells
#

# Source zim
if [[ -s ${ZDOTDIR:-${HOME}}/.zim/init.zsh ]]; then
  source ${ZDOTDIR:-${HOME}}/.zim/init.zsh
fi
TERM=xterm-256color
# User configuration

export PATH=$HOME/bin:/usr/local/bin:$PATH:/opt/anaconda/bin
# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
 export LANG=en_GB.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
export ARCHFLAGS="-arch x86_64"

# ssh
export SSH_KEY_PATH="~/.ssh/id_rsa"
#
# For backward kill: add some more word delimiters
WORDCHARS='*?_-.[]~=&;!#$%^(){}<>'

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
alias zshconfig="vim ~/.zshrc"
alias ls='ls -FS --color="auto"'
alias cl="clear"
alias rg="ranger"
alias cs="clear && ls"
alias syu='sudo pacman -Syu'
alias py_up="pip-review --local --interactive"
#alias ohmyzsh="mate ~/.oh-my-zsh"
#alias ranger='ranger --choosedir=$HOME/rangerdir; LASTDIR=`cat $HOME/rangerdir`; cd "$LASTDIR"'
alias weather='curl wttr.in/Lausanne'
bindkey -e
alias ssh_tunnel='ssh -L 2221:iccluster057.iccluster.epfl.ch:22 tremplin.epfl.ch -l 277066'
alias ssh_connect='ssh -Y -p 2221 localhost -l vthomas'
alias a='fasd -a'        # any
alias s='fasd -si'       # show / search / select
alias d='fasd -d'        # directory
alias f='fasd -f'        # file
alias sd='fasd -sid'     # interactive directory selection
alias sf='fasd -sif'     # interactive file selection
alias z='fasd_cd -d'     # cd, same functionality as j in autojump
alias zz='fasd_cd -d -i' # cd with interactive selection

#ssh -L 16006:127.0.0.1:6006 olivier@my_server_i
printmila(){
    cat $1 | ssh thomasva@elisa1.iro.umontreal.ca "lp -d hpc3256"
}

