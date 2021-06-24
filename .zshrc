git_branch () {
    git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n' | awk '{ print " " $1 }'
}

export EDITOR=vim
export VISUAL=$EDITOR
export PATH="$PATH:$HOME/bin"
export PATH="$PATH:$HOME/.local/bin"
export PATH="$PATH:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"

# Force evaluation of functions in prompt
setopt PROMPT_SUBST

PS1='%B%F{blue}%~%B%F{magenta}$(git_branch)%b%F{reset_color} %# '

if [ -e /usr/local/bin/fzf ]; then
  #alias fzf="fzf --preview 'cat {}'"
  alias vf="vim \$(fzf)"
fi

if [ -e /usr/local/bin/gls ]; then
  alias ls="gls --color=auto"
else
  alias ls="ls --color=auto"
fi

alias tedit="open -a TextEdit"
alias notes="vim ~/notes/scratch-pad.md"
alias checklist="vim ~/notes/docs-project-checklist.md"

# Enable completions
autoload -Uz compinit && compinit

[ -f /opt/dev/dev.sh ] && source /opt/dev/dev.sh
