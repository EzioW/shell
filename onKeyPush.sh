function oneKeyPush() {
  echo -e "\e[1;33m input commit info \e[0m";
  read msg;
  echo -e "\e[1;36m git add . \e[0m";
  git add .;
  echo -e "\e[1;32m git add . Done \e[0m";
  echo -e "\e[1;36m git commit -a -m $msg \e[0m";
  gcam $msg;
  echo -e "\e[1;36m git pull \e[0m";
  gl;
  # TODO 判断pull的结果 是否直接push
  echo -e "\e[1;32m git pull dnoe \e[0m";
  echo -e "\e[1;36m git merge \e[0m";
  gmom;
  mergeStatusCode=$?;
  # 判断是否merge成功
  if [ $mergeStatusCode -eq 0 ]; then
  echo -e "\e[1;32m git merge Done \e[0m";
  echo -e "\e[1;36m git push \e[0m";
  gp;
  echo -e "\e[1;32m git push Done \e[0m";
  echo -e "\e[1;32m Done Push Complete \e[0m";
  else
  echo -e "\e[1;31m Merge Failed Check Code \e[0m";
  fi
}

alias okp='oneKeyPush'