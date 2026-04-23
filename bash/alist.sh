#!/bin/bash
# -*- coding: utf-8-unix; mode: shell-script; sh-basic-offset: 2 -*-

### # 概要
###
###   連想配列を試すスクリプト
###
### # 使用法
###
###   ./alist.sh
###   ./alist.sh -w
###   ./alist.sh --where
###

bash --version | head -1

if [ "${1}" = "-w" -o "${1}" = "--where" ] ; then
  for x in "$@" ; do
    echo "${x}"
  done
  exit
fi

color_echo () {
  for x in "$@" ; do
    echo -e "\e[32m${x}\e[m"
  done
}

color_echo "### # 連想配列を宣言 (必須!!!)"
color_echo "###     例: declare -A alist"
color_echo "###     例: declare -A blist=([k1]=foo [k2]=bar [k3]=baz)"
set -v
declare -A alist
declare -A blist=([k1]=foo [k2]=bar [k3]=baz)
set +v
echo

color_echo "### # キーを指定して値を設定"
color_echo "###     alist[key]=value"
set -v
alist[k1]=v1
alist[k2]=v2
alist[k3]=v3
alist[k4]=v4
set +v
echo

color_echo "### # 要素数を数える"
color_echo "###    \$#{alist[@]}"
set -v
echo "count of alist: ${#alist[@]}"
echo "count of blist: ${#blist[@]}"
set +v
echo

color_echo "### # キーを指定して要素を削除"
color_echo "###     unset alist[key]"
color_echo "###     例: unset alist[k2]"
set -v
unset alist[k2]
echo "count of alist: ${#alist[@]}"
set +v
echo

color_echo "キーで指定した要素の存在確認"
color_echo "    存在する   if [ -n \"\${alist[k1]}\" ] ; then 〜 fi"
color_echo "    存在しない if [ -z \"\${alist[k2]}\" ] ; then 〜 fi"
set -v
if [ -n "${alist[k1]}" ] ; then echo k1 の要素は存在する   ; fi
if [ -z "${alist[k1]}" ] ; then echo k1 の要素は存在しない ; fi
if [ -n "${alist[k2]}" ] ; then echo k2 の要素は存在する   ; fi
if [ -z "${alist[k2]}" ] ; then echo k2 の要素は存在しない ; fi
set +v
echo

color_echo "### # キーを指定して展開"
color_echo "###   \"\${alist[key]}\""
set -v
echo "${alist[k1]}" "${alist[k2]}" "${alist[k3]}" "${alist[k4]}"
set +v
echo

color_echo "### # キーを指定せず全て展開 (順は保証なし)"
color_echo "###   \"\${alist[@]}\""
set -v
echo "${alist[@]}"
echo "${blist[@]}"
set +v
echo
