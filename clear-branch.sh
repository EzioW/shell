#!/bin/bash

# 批量删除远程分支 shell script

branches=`git branch -a --sort committerdate --format '%(committerdate:short),%(refname:short)'`;

# echo "$branches"
DATE=$(date +%Y%m%d)
cur_time=$(date -d "${DATE} 6 month ago" "+%Y-%m-%d")
echo cur time "$DATE" last 6 month "$cur_time"

cur_time_arr=(${cur_time//-/ })
cur_time_year=${cur_time_arr[0]}
cur_time_month=${cur_time_arr[1]}

for branch in $branches;
do
  # echo "$branch";
  branch_arr=(${branch//,/ })
  # ${branch[@]}

  last_update=${branch_arr[0]}
  branch_name=${branch_arr[1]}

  last_update_arr=(${last_update//-/ })
  year=${last_update_arr[0]}
  month=${last_update_arr[1]}

  # echo "${branch_name: 7}"

  if [[ "" != "$branch" -a "HEAD" != "$branch" -a "master" != "$branch" -a $year -lt $cur_time_year ]]
    then
      echo 最后更新时间 "$year" 分支名 "${branch_name: 7}"
      # local_result=`git branch -d $branch_name`
      # echo "result:" $local_result;
      remote_result=`git push origin ${branch_name: 7} -d`
      # echo "删除当前分支结束"
      echo ""
  fi
  if [[ "" != "$branch" -a "HEAD" != "$branch" -a "master" != "$branch" -a $year -eq $cur_time_year -a $month -lt $cur_time_month ]]
    then
      echo 最后更新时间 "$year" 分支名 "${branch_name: 7}"
      # local_result=`git branch -d $branch_name`
      # echo "result:" $local_result;
      remote_result=`git push origin ${branch_name: 7} -d`
      # echo "删除当前分支结束"
      echo ""
  fi
done

echo "删除结束"
