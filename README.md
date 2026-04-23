<!-- -*- coding: utf-8-unix -*- -->
# 羊の砂場

覚書みたいなスクリプトと文書群


## コード表

| 10進 | 8進 | 16進 | 文字   | 名前                 | 説明             |
|-----:|:----|:-----|:-------|:---------------------|:-----------------|
|    0 | 000 | 0x00 | `\x00` | NUL (Null)           | 文字列終端       |
|    7 | 007 | 0x07 | `\a`   | BEL (Bell)           | ビープ音         |
|    8 | 010 | 0x08 | `\b`   | BS (Backspace)       | 1文字戻る        |
|    9 | 011 | 0x09 | `\t`   | HT (Horizontal Tab)  | 水平タブ         |
|   10 | 012 | 0x0A | `\n`   | LF (Line Feed)       | 改行 (Unix)      |
|   11 | 013 | 0x0B | `\v`   | VT (Vertical Tab)    | 垂直タブ         |
|   12 | 014 | 0x0C | `\f`   | FF (Form Feed)       | 改ページ         |
|   13 | 015 | 0x0D | `\r`   | CR (Carriage Return) | 行頭へ戻る       |
|   27 | 033 | 0x1B | `\x1b` | ESC (Escape)         | エスケープ       |
|   32 | 040 | 0x20 | `" "`  | SPACE                | 空白             |
|   34 | 042 | 0x22 | `\"`   | Double Quote         | ダブルクォート   |
|   39 | 047 | 0x27 | `\'`   | Single Quote         | シングルクォート |
|   92 | 134 | 0x5C | `\\`   | Backslash            | バックスラッシュ |


## Ubuntu

時計を秒まで表示する
```
gsettings set org.gnome.desktop.interface clock-show-seconds true
```

## man

幅を70文字で man rlwrap の出力をファイルに保存
```
$ COLUMNS=70 man rlwrap > rlwrap.txt
```


## rlwrap

[原文](rlwrap/man.txt)
/ [和訳](rlwrap/man-ja.md)

### rlwrap 0.43 のバグ

[rlwrap 0.43 には入力したコマンド行のプロンプトが消えるバグがある](https://github.com/hanslub42/rlwrap/issues/108)

~/.inputrc に以下の行を追加すれば解決する
```
set enable-bracketed-paste off
```

[rlwrap 0.44 でバグフィクスされた](https://github.com/hanslub42/rlwrap/releases/tag/0.44)

## Tcl/Tk

[README](tcl/README.md)

## Python

### 簡易 HTTP サーバー

1. ドキュメントルートにしたいフォルダに cd
1. `python3 -m http.server ポート`
   ポート省略時は 8000

- Google Chrome 拡張機能 [Markdown Viewer](https://chromewebstore.google.com/detail/markdown-viewer/ckkdlimhmcjmikdlpkmbgfkaikojcbjk?pli=1)
  設定 CONTENT の autoreload<br>
  ファイル変更がすぐブラウザに反映されるが、
  約 1秒ごとにリロードを繰り返すのでサーバーに負担がかかる


## Google Chrome

### Google Chrome 拡張機能 [Markdown Viewer](https://chromewebstore.google.com/detail/markdown-viewer/ckkdlimhmcjmikdlpkmbgfkaikojcbjk?pli=1)

- markdown[^1], php markdown extra[^2] も参照せよ

- 設定 CONTENT の autoreload<br>
  ファイル変更がすぐブラウザに反映されるが、
  約 1秒ごとにリロードを繰り返すのでサーバーに負担がかかる.

- 設定 COMPILER MARKDOWN-IT の deflist<br>
  行頭に `:` で
  `<DL><DT>名前</DT><DD>定義</DD></DL>` を作れる.
  Github の Jekyll、Stack Overflow の

## 参考

[^1]:
    [markdown の仕様](https://daringfireball.net/projects/markdown/syntax)

    総本山.
    目を通すべき.

[^2]:
    [php markdown extra](https://michelf.ca/projects/php-markdown/extra/)

    tables, definition lists, footnotes, abbreviations
