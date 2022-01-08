#!/bin/zsh
# ZSH aliases
alias vi=nvim
alias vim=nvim
alias cat=bat
alias kak='kubectl apply -k'
alias fketi="kgp --no-headers | awk '{print "\$"1}' | fzf --preview 'kubectl get pod {} -o yaml'| xargs -o -I % kubectl exec -it % -- /bin/sh"
alias fkd="k get all --no-headers  --all-namespaces | awk '{printf\"%s/%s\\n\","\$"1,"\$"2}' | fzf | xargs -o kubectl describe"
alias tls="tmux list-sessions"
alias td="todo.sh"
