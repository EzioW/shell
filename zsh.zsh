function npm_view_versions() {
	npm view $1 versions
}

function git_rebase_i_head() {
	grbi HEAD~$1
}

function check_port() {
  lsof -i tcp:$1
}

alias nvv="npm_view_versions"

alias gpnv="gp --no-verify"

alias gpfnv="gpf --no-verify"

alias grbh="git_rebase_i_head"

alias grbm="git rebase origin/master" 

alias checkport="check_port"
