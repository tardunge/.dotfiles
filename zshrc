# TODO:
# Noting in plate

# Path to your oh-my-zsh installation.
alias vi=nvim
alias vim=nvim
alias cat=bat
alias kak='kubectl apply -k'
export ZSH="/Users/manojbabu/.oh-my-zsh"
# export TERM="xterm-256color"
export POWERLINE="/Users/manojbabu/Library/Python/2.7/lib/python/site-packages/powerline/bindings/zsh/powerline.zsh"
export KUBE_EDITOR="nvim"
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export CLOUDSDK_PYTHON=/Users/manojbabu/.pyenv/versions/neovim3/bin/python
export CLOUDSDK_PYTHON_SITEPACKAGES=1
export PYENV_VIRTUALENV_DISABLE_PROMPT=1

# oh-my-zsh customization
POWERLEVEL9K_SHORTEN_STRATEGY="truncate_to_unique"
POWERLEVEL9K_SHORTEN_DIR_LENGTH=3
POWERLEVEL9K_SHORTEN_DELIMITER=''
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(dir_writable dir vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(kubecontext pyenv virtualenv_joined )
# POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(kubecontext)
POWERLEVEL9K_PYENV_PROMPT_ALWAYS_SHOW=true
POWERLEVEL9K_MODE='nerdfont-complete'
ZSH_THEME="powerlevel9k/powerlevel9k"

DISABLE_UPDATE_PROMPT="true"
POWERLEVEL9K_PROMPT_ON_NEWLINE=true

# oh-my-zsh plugins
plugins=(git zsh-completions kubectl kubetail)

source $ZSH/oh-my-zsh.sh
# end of oh-my-zsh customization

# user conf
eval "$(pyenv init -)"
PATH="/usr/local/share/python/:$PATH"
PATH="/Users/manojbabu/.local/bin:$PATH"
PATH="/usr/local/Cellar/libpq/13.0_1/bin:$PATH"

# asdf path settings for managing versions of nodejs, python, helm, kubectl
. $HOME/.asdf/asdf.sh

. $HOME/.asdf/completions/asdf.bash
if [ /Users/manojbabu/.asdf/shims/kubectl ]; then source <(kubectl completion zsh); fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# BAT Settings
export BAT_PAGER='less -R' # -R brings back to the prompt without the text printed
export BAT_STYLE=full
export BAT_THEME=OneHalfDark
export PAGER='bat' # commands like man e.t.c will now use bat instead of less

# FD OPTS For FZF
FD_OPTS="--follow --exclude .git --exclude site-packages --exclude .venv --exclude Containers --exclude google --exclude Google"
# FZF Settings
export FZF_DEFAULT_OPTS="--no-mouse --multi --height 40% --reverse --preview='if [[ -f {} ]];then bat --style=full --color=always {};elif [[ -d {} ]];then tree -C -L 2 {} | head -200;else echo {}; fi' --bind=';:execute(bat --style=full --color=always {} || less -f {}),?:toggle-preview,ctrl-d:half-page-down,ctrl-u:half-page-up,ctrl-a:select-all+accept,ctrl-y:execute-silent(echo {+} | pbcopy),ctrl-q:abort'"
export FZF_DEFAULT_COMMAND="git ls-files --cached --others --exclude-standard | fd --type f --type l $FD_OPTS"
export FZF_CTRL_T_COMMAND="fd $FD_OPTS"
export FZF_ALT_C_COMMAND="fd --type d $FD_OPTS"
export FZF_CTRL_R_OPTS="--preview 'echo {}' --preview-window down:3:hidden:wrap --bind '?:toggle-preview,ctrl-q:abort'"
export FZF_ALT_C_OPTS="--preview 'tree -C -L 2 {} | head -200'"

# Load nvm
export NVM_DIR="$HOME/.nvm"
[ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && . "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion
autoload compinit && compinit
autoload bashcompinit && bashcompinit
source ~/.bash_completion.d/breeze-complete

# Go Workspace
export GOPATH=$HOME/go
export GOROOT="$(brew --prefix golang)/libexec"
export PATH="$PATH:${GOPATH}/bin:${GOROOT}/bin"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/manojbabu/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/manojbabu/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/manojbabu/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/manojbabu/google-cloud-sdk/completion.zsh.inc'; fi

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/Users/manojbabu/.sdkman"
[[ -s "/Users/manojbabu/.sdkman/bin/sdkman-init.sh" ]] && source "/Users/manojbabu/.sdkman/bin/sdkman-init.sh"
