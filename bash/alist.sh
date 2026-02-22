#!/bin/bash
# -*- coding: utf-8-unix; mode: shell-script -*-

### # 概要
###   連想配列を試すためのスクリプト
###
### # 使用法
###   ./alist.sh
###   ./alist.sh -w
###   ./alist.sh --where
if [ "${1}" = "-w" -o "${1}" = "--where" ] ; then
    echo "${0}"
    exit
fi
### # バージョン
###   GNU bash, バージョン 5.1.16(1)-release (x86_64-pc-linux-gnu)
###   bash 4.0 以降では連想配列が使える
###
bash --version | head -1

###
### # 連想配列を宣言
###   declare -A alist
###   declare -A blist=([key1]=value1 [key2]=value2 ...)
###
echo -e "\e[32m連想配列を宣言\e[m"
echo -e "\e[32m    例: declare -A alist\e[m"
echo -e "\e[32m    例: declare -A blist=([k1]=foo [k2]=bar [k3]=baz)\e[m"
declare -A alist
declare -A blist=([k1]=foo [k2]=bar [k3]=baz)
echo

###
### # キーを指定して値を設定
###   alist[key]=value
###
echo -e "\e[32mキーを指定して値を設定\e[m"
echo -e "\e[32m    alist[key]=value\e[m"
echo
echo -e "\e[32m    例: alist[k1]=v1\e[m"
echo -e "\e[32m    例: alist[k2]=v2\e[m"
echo -e "\e[32m    例: alist[k3]=v3\e[m"
echo -e "\e[32m    例: alist[k4]=v4\e[m"
alist[k1]=v1
alist[k2]=v2
alist[k3]=v3
alist[k4]=v4
echo

###
### # 要素数を数える
###   ${#alist[@]}
###
echo -e "\e[32m要素数を数える\e[m"
echo -e "\e[32m    \$#{alist[@]}\e[m"
echo "count of alist: ${#alist[@]}"
echo "count of blist: ${#blist[@]}"
echo

###
### # キーを指定して要素を削除
###   unset alist[key]
###
echo -e "\e[32mキーを指定して要素を削除\e[m"
echo -e "\e[32m    unset alist[key]\e[m"
echo
###   unset alist[k2]
###
echo -e "\e[32m    例: unset alist[k2]\e[m"
unset alist[k2]
echo

###
### # 要素数を数える
###   ${#alist[@]}
###
echo -e "\e[32m要素数を数える\e[m"
echo -e "\e[32m    \$#{alist[@]}\e[m"
echo "count of alist: ${#alist[@]}"
echo "count of blist: ${#blist[@]}"
echo

###
### # キーで指定した要素の存在確認
###
### - 存在する   if [ -n "${alist[k1]}" ] ; then 〜 fi
### - 存在しない if [ -z "${alist[k2]}" ] ; then 〜 fi
###
echo -e "\e[32mキーで指定した要素の存在確認\e[m"
echo -e "\e[32m    存在する   if [ -n \"\${alist[k1]}\" ] ; then 〜 fi\e[m"
echo -e "\e[32m    存在しない if [ -z \"\${alist[k2]}\" ] ; then 〜 fi\e[m"
if [ -n "${alist[k1]}" ] ; then
    echo k1 の要素は存在する
fi
if [ -z "${alist[k2]}" ] ; then
    echo k2 の要素は存在しない
fi
echo

###
### # キーを指定して展開
###  "${alist[key]}"
###
echo -e "\e[32mキーを指定して展開 \"\${alist[key]}\"\e[m"
echo -e "\e[32m    echo \"\${alist[key]}\"\e[m"
echo "${alist[k1]}" "${alist[k2]}" "${alist[k3]}"
echo

###
### # キーを指定せずすべて展開
###  "${alist[@]}"
###
echo -e "\e[32mキーを指定してせず全て展開 \"\${alist[@]}\"\e[m"
echo "${alist[@]}"
echo "${blist[@]}"
echo
