#!/bin/bash
# -*- coding: utf-8-unix; mode: shell-script -*-

### # 概要
###   空白を含む引数が正常に展開するか試すためのスクリプト
###
### # 使用法
###   ./arg-expand.sh "a bb ccc" def xyz
###
### # バージョン
###   GNU bash, バージョン 5.1.16(1)-release (x86_64-pc-linux-gnu)
###
bash --version

### # 引数は "a bb ccc" def xyz と仮定する
###
### # 配列の展開
###

### - ${@} だと空白を含む引数を正しく展開できない
echo -e "\e[31mwrong expansion: \${@}\e[m"
argv ${@}

### - "${@}" なら空白を含む引数を正しく展開できる
echo -e "\e[32mcorrect expansion: \"\${@}\"\e[m"
argv "${@}"

echo

###
### # 配列のコピー
###

### - 空白を含む引数を正しく処理できない例
###   junks=(${@})
echo -e "\e[31mjunks: (wrong copied from \${@})\e[m"
junks=(${@})
argv "${junks[@]}"

echo

### - 空白を含む引数を正しく処理できる例
###   words=("${@}")
echo -e "\e[32mwords: (correct copied from \"\${@}\")\e[m"
words=("${@}")
argv "${words[@]}"

echo

###
### # 配列要素の削除
###
### - 削除と言ってもインデックスは残ることに注意

### - 間違った削除例: words[1]=""
echo -e "\e[31mwrong delete: words[1]=\"\"\e[m"
words[1]=""
echo -n words[0] = "${words[0]}" ; echo " #" "a bb cc"
echo -n words[1] = "${words[1]}" ; echo " #" 空ではなく空文字列 \"\"
echo -n words[2] = "${words[2]}" ; echo " #" "xyz"
echo -n words[3] = "${words[3]}" ; echo " #" 存在しない要素へのアクセス可
echo -n words[4] = "${words[4]}" ; echo " #" 存在しない要素へのアクセス可
### - 変数展開すればインデックスが詰まっていないことが分かる
echo -e "\e[31mwrong delete by parameter expansion\e[m"
argv "${words[@]}"

echo

### - 正しい削除例: unset words[1]
echo -e "\e[32mcorrect delete: unset words[1]\e[m"
unset words[1]
echo -n words[0] = "${words[0]}" ; echo " #" "a bb cc"
echo -n words[1] = "${words[1]}" ; echo " #" unset したので空
echo -n words[2] = "${words[2]}" ; echo " #" "xyz"
echo -n words[3] = "${words[3]}" ; echo " #" 存在しない要素へのアクセス可
echo -n words[4] = "${words[4]}" ; echo " #" 存在しない要素へのアクセス可
### - 変数展開すればインデックスを詰めることができる
echo -e "\e[32mcorrect delete by parameter expansion\e[m"
argv "${words[@]}"

echo

###
### # 配列の追加
###
### - 正しい追加例: words+=(hello world)
echo -e "\e[32mcorrect append: words+=(hello world)\e[m"
words+=(hello world)
echo    words[0] = "${words[0]}"
echo    words[1] = "${words[1]}"
echo    words[2] = "${words[2]}"
echo    words[3] = "${words[3]}"
echo    words[4] = "${words[4]}"
argv "${words[@]}"

echo

###
### # コピー元の変数 @ は影響を受けない
###

### - ${@} だと空白を含む引数を正しく処理できない
echo -e "\e[31mwrong expansion: \${@}\e[m"
argv ${@}

### - "${@}" なら空白を含む引数を正しく展開できる
echo -e "\e[32mcorrect expansion: \"\${@}\"\e[m"
argv "${@}"

echo
