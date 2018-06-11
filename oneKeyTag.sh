function oneKeyTag() {
  echo -e "\e[1;33m choose tag type \e[0m";
  select tagType in hotfix;
  do
    break
  done
  
  now=$(date +"%Y%m%d%H%M");

  branchName=`git symbolic-ref --short -q HEAD`;

  replace=""

  result=`echo $branchName | sed -e "s/[-]/"${replace}"/g"`

  tagName="$tagType-$now-$result";

  echo -e "\e[1;32m create tag name Done \e[0m";
  echo "$tagName";

  echo -e "\e[1;33m input tag info \e[0m";
  read msg;

  git tag -a $tagName -m msg;
  gp origin $tagName;
  tagStatusCode=$?;

  if [ $tagStatusCode -eq 0 ]; then
  echo -e "\e[1;32m git create tag Done \e[0m";
  fi
}

alias okt='oneKeyTag'