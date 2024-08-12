# ZSH configuration.

# Path to Dotfiles dir clone.
export DOTFILES="$HOME/dotfiles"

# disable auto correct
setopt nocorrectall

# Source ohmyzsh config.
[[ -s $DOTFILES/ohmyzsh ]] && source $DOTFILES/ohmyzsh

# Source aliases
[[ -s $DOTFILES/profile ]] && source $DOTFILES/profile

# GENERAL VARIABLES
export LC_ALL=en_US.UTF-8
export MANPATH="/usr/bin/man:$MANPATH"
export LANG=en_US.UTF-8
# export CLOUDSDK_PYTHON=/Users/manojbabu/.pyenv/versions/neovim3/bin/python
# export CLOUDSDK_PYTHON_SITEPACKAGES=1
export KUBE_EDITOR="nvim"

# nord dir-colors
test -r "~/.dir_colors" && eval $(dircolors ~/.dir_colors)

# Go Workspace
export GOPATH=$HOME/go
export GOROOT="$(asdf where golang)/go/"
export PATH="$PATH:${GOPATH}/bin:${GOROOT}/bin"

# source pyenv
# Use pyenv to manage python versions. asdf has trouble with apple m1 processors
[[ -s $DOTFILES/pyenv ]] && source $DOTFILES/pyenv
# [[ -s $DOTFILES/sqlite ]] && source $DOTFILES/sqlite

# source bat settings
[[ -s $DOTFILES/bat ]] && source $DOTFILES/bat


# source after PATH variable modifications are done.
#[[ -s $DOTFILES/asdf/asdf ]] && source $DOTFILES/asdf/asdf
. ~/.asdf/plugins/java/set-java-home.zsh

# source fzf and its conf
[[ -s $DOTFILES/fzf ]] && source $DOTFILES/fzf

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/manojbabu/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/manojbabu/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/manojbabu/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/manojbabu/google-cloud-sdk/completion.zsh.inc'; fi

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/Users/manojbabu/.sdkman"
[[ -s "/Users/manojbabu/.sdkman/bin/sdkman-init.sh" ]] && source "/Users/manojbabu/.sdkman/bin/sdkman-init.sh"

eval "$(direnv hook zsh)"
# utility func to benchmark zsh load time
# USE Hyperfine
timezsh() {
  shell=${1-$SHELL}
  for i in $(seq 1 10); do /usr/bin/time $shell -i -c exit; done
}
