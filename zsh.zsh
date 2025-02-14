alias code='/Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin/code'

function change_to_github() {
  curUserName=`git config user.name`
  if [ curUserName != 'EzioW' ]
  then
  git config --global user.name "EzioW"
  git config --global user.email "seraphezio@gmail.com"
  fi
}

function change_to_work() {
  curUserName=`git config user.name`
  if [ curUserName != 'yuxinzhe.seraph' ]
  then
  git config --global user.name "yuxinzhe.seraph"
  git config --global user.email "yuxinzhe.seraph@bytedance.com"
  fi
}

function one_key_push() {
  echo "\e[1;33m input commit info \e[0m"
  read msg
  echo "\e[1;36m git add . \e[0m"
  git add .
  echo "\e[1;32m git add . Done \e[0m"
  echo "\e[1;36m git commit -a -m $msg \e[0m"
  gcam $msg
  echo "\e[1;36m git pull \e[0m"
  gl
  echo "\e[1;32m git pull dnoe \e[0m"
  echo "\e[1;36m git merge \e[0m"
  gmom
  mergeStatusCode=$?
  if [ $mergeStatusCode -eq 0 ]
  then
  echo "\e[1;32m git merge Done \e[0m"
  echo "\e[1;36m git push \e[0m"
  gp
  echo "\e[1;32m git push Done \e[0m"
  echo "\e[1;32m Done Push Complete \e[0m"
  else
  echo "\e[1;31m Merge Failed Check Code \e[0m"
  fi
}

function login_ci() {
  kinit --keychain yuxinzhe.seraph@BYTEDANCE.COM
  # ssh -K root@10.225.121.162
  ssh -K root@10.199.20.22
}

function npm_view_versions() {
  npm view $1 versions
}

function git_rebase_i_head() {
  grbi HEAD~$1
}

function check_port() {
  lsof -i tcp:$1
}

function format_dependencies() {
  # 检查当前目录下是否存在 package.json
  if [[ ! -f package.json ]]; then
    echo "package.json not found in the current directory."
    exit 1
  fi

  # 使用 jq 读取和格式化 package.json
jq 'with_entries(
  if .key == "dependencies" or .key == "peerDependencies" or .key == "devDependencies" then
    .value |= if . == null then . else to_entries | sort_by(.key) | from_entries end
  else
    .
  end
)' package.json > package.json.tmp

  # 覆盖原始 package.json 文件
  mv package.json.tmp package.json
}

alias bnpm="npm --registry=https://bnpm.byted.org"

alias bnpx="npm_config_registry=https://bnpm.byted.org npx"

alias auxoadd="bnpx @ecom/create-auxo@latest add"

alias byarn="yarn --registry=https://bnpm.byted.org"

alias bpnpm="pnpm --registry=https://bnpm.byted.org"

alias okp="change_to_github && one_key_push"

alias ctw="change_to_work"

alias nvv="npm_view_versions"

alias qtc="git add . && qt-commit"

alias grbh="git_rebase_i_head"

alias db="gbd -D"

alias grbod="git rebase origin/develop" 

alias grbm="git rebase origin/master" 

alias eslintreport="eslint src --ext .js,.jsx -f html -o ESLintReport.html"

alias grepnode="ps -ef | grep node"

alias glfa="gl && gfa"

alias glom="ggpull master"

alias np="npm publish"

alias nup="npm unpublish"

alias bnp="bnpm publish"

alias bnup="bnpm unpublish"

alias ws="whistle start"

alias gcnv="git commit --no-verify"

alias gcamnv="gcam --no-verify"

alias gpnv="gp --no-verify"

alias gpfnv="gpf --no-verify"

alias ycb="yarn create-branch"

alias checkport="check_port"

alias loginci="login_ci"

alias configgitlabrunner="vim etc/gitlab-runner/config.yaml"

alias restartci="gitlab-runner restart"

alias fd="format_dependencies"

# bnpm dist-tag add @ecom/mera@1.0.0 latest

# bnpm deprecate @ecom/mera@1.5.1 'package bug'

alias deletefiles="find . -name \"*\" -ctime +7 -print -exec rm -rf {} \;"

