<!-- -*- coding: utf-8-unix -*- -->
# Tcl/Tk 覚書

## [公式](https://www.tcl-lang.org/)
[9.1](https://www.tcl-lang.org/man/tcl9.1/TclCmd/)
/ [9.0](https://www.tcl-lang.org/man/tcl9.0/TclCmd/)
/ [8.7](https://www.tcl-lang.org/man/tcl8.7/TclCmd/)
/ [8.6](https://www.tcl-lang.org/man/tcl8.6/TclCmd/contents.htm)
/ [8.5](https://www.tcl-lang.org/man/tcl8.5/TclCmd/contents.htm)

## 翻訳・要約
[9.0](9.0/README.md)
[8.6](8.6/README.md)

## 起動

`tclsh ?-encoding name? ?fileName arg arg ...?`

`wish ?options? ?fileName arg ...?`

### 起動時オプション

-encoding name
: cp932, shiftjis, euc-jp, utf-8 等
  encoding names  で利用可能な encoding が分かる.
  utf-8 と iso8859-1 が含まれていることは保証される.

### シェバン

Tcl のみ
```
#!/bin/bash
# -*- coding: utf-8-unix; mode: tcl; tcl-indent-level: 2 -*- \
exec tclsh -encoding utf-8 "$0" ${1+"$@"}
```

Tcl から Tk も使う
```
#!/bin/bash
# -*- coding: utf-8-unix; mode: tcl; tcl-indent-level: 2 -*- \
exec tclsh -encoding utf-8 "$0" ${1+"$@"}
package require Tk
```

GUI 前提
```
#!/bin/bash
# -*- coding: utf-8-unix; mode: tcl; tcl-indent-level: 2 -*- \
exec wish "$0" ${2+"$@"}
```

GUI 前提 すっきりバージョン
```
#!/usr/bin/wish
# -*- coding: utf-8-unix; mode: tcl; tcl-indent-level: 2 -*-
```

GUI にアイコンを設定したいとき
```
if [file exists "${icon_file}"] {
  wm iconphoto . [image create photo -file "${icon_file}"]
}
```

## 言語

### 代入

```
set foo "FOO"          ;# "FOO"
set var "abc def xyz"  ;# "abc def xyz"
set var {abc def xyz}  ;# "abc def xyz"

set var "abc $foo xyz" ;# "abc FOO xyz"  ;# 展開される
set var {abc $foo xyz} ;# "abc $foo xyz" ;# 展開されない
set var                ;# "abc $foo xyz" ;# 展開されない
subst $var             ;# "abc FOO xyz"  ;# 展開される
# subst は 変数 $、コマンド []、クオート \ を全て展開する
# オプションで制御 -novariables -nocommands -nobackslashes

set dic [dict create]
set dic [dict create key1 value1 key2 value2 ...] ;# 初期値
### 取得
dict get $dic key2        ;# "value2"
### 設定
dict set dic key3 value3  ;# "key1 value1 key2 value2 key3 value3"

### dict も ただの文字列
set foo {foo bar hoge piyo}
dict get $foo hoge        ;# "piyo"
```

### 条件分岐

```
if {$var == "abc"} {
  ...
} elseif {$var != "xyz"} {
  ...
} else {
  ...
}
```

### 繰り返し

```
foreach i {a b c d} j {x y z} { append foo $i $j }
set foo
axbyczd ;# append

dict for {key val} {a 1 b 2 c 3 foo 4} { lappend bar "$key = $val; " }
set bar
{a = 1; } {b = 2; } {c = 3; } {foo = 4; } ;# lappend

set person {name taro age 21 id @taro}

dict with person { set name ichiro }
set person
name ichiro age 21 id @taro ;# キー name が変わる

dict with person name id {
  # set age 23 ;# これは NG
  set id  @ichiro 
}
set person
name ichiro age 23 id @taro ;# キー age が変わる
```

## Tk

### image

### ttk::frame

### ttk::label

### text

## スタイル

## package の作り方

## package

### tcllib

- Ubuntu 22.04LTS Synaptic パッケージマネージャ

Tcllib (標準Tclライブラリ) は、すべてハイレベルなTclで記述された、
一般的なユーティリティ関数およびモジュールの集合体です。

含まれるモジュール：

```
* aes: 高等暗号化標準 (AES)
* amazon-s3: Amazon S3 ウェブサービスインターフェース
* asn: ASN.1 エンコーダーおよびデコーダー
* base32: base32 エンコーダーおよびデコーダー
* base64: base64 エンコーダーおよびデコーダー
* bee: BitTorrent シリアライゼーションのエンコーダーおよびデコーダー
* bench: ベンチマークツール
* bibtex: BibTeX 形式の文献目録用パーサー
* blowfish: blowfish 暗号化
* cache: 非同期インメモリキャッシュ
* clay: clay フレームワーク
* clock: 日付/時刻ユーティリティ
* cmdline: opt に似たコマンドライン引数プロセッサ
* comm: リモート通信機能
* control: 制御フロー構造のためのプロシージャ
* coroutine: コルーチンユーティリティ
* counter: カウンター機能を提供し、収集されたデータから統計やヒストグラムを計算可能
* crc: チェックサム計算ルーチン (crc32, cksum, sum)
* cron: コマンドの定期的なコールバックの自動化
* csv: CSV (カンマ区切り値) データを扱うための関数
* debug: デバッグメッセージのインフラストラクチャ
* defer: 遅延実行
* des: DES および 3DES 暗号化
* dicttool: 辞書ツール
* dns: DNS およびリゾルバライブラリ関連の関数
* docstrip: リテレートプログラミング用のツール。しばしば (La)TeX と共に使用される
* doctools: ドキュメンテーションツール
* dtplite: 軽量な doctools マークアッププロセッサ
* fileutil: いくつかの標準 Unix ユーティリティの Tcl 実装
* ftp: FTP プロトコルへの Tcl インターフェース
* ftpd: FTP サーバーに必要な機能の実装
* fumagic: ファイルユーティリティ
* generator: Tcl ジェネレーターコマンド
* gpx: GPS eXchange Format (GPX)
* grammar_aycock: Tcl 用の Aycock-Horspool-Earley パーサージェネレーター
* grammar_fa: 有限オートマトン操作と利用
* grammar_me: 文法操作と利用
* grammar_peg: 文法操作と利用
* hook: フック
* html: HTML タグの生成と制御
* htmlparse: HTML 文字列のパース
* http: HTTP プロトコルヘルパーモジュール
* httpd: HTTP サーバー
* httpwget: HTTP 経由でファイルをダウンロードするツール
* ident: ident プロトコルへのクライアントインターフェース
* imap4: IMAP クライアント
* inifile: Windows INI ファイルのパース
* interp: インタプリタユーティリティ
* irc: 低レベル IRC プロトコルインターフェース
* javascript: 一般的な JavaScript 関数を作成するための Tcl ショートカット
* jpeg: JPEG 画像を照会・修正するための関数
* json: JSON パーサー
* lambda: 無名プロシージャ用のユーティリティコマンド
* lazyset: 変数および配列の遅延評価
* ldap: LDAP クライアントおよび拡張オブジェクトインターフェース
* log: さまざまな機能やレベルでメッセージをログに記録する関数
* map: マッピングユーティリティ
* mapproj: 地図投影ルーチン
* markdown: Markdown プロセッサ
* math: Tcl 数学ライブラリ
* md4: md4 ハッシュ関数
* md5: md5 ハッシュ関数
* md5crypt: md5 ベースのパスワードハッシュ
* mime: MIME エンコーダーおよびデコーダー
* multiplexer: メッセージ多重化
* namespacex: 名前空間ユーティリティコマンド
* ncgi: 新しい CGI 処理モジュール
* nettool: ネットワークアプリケーション用ツール
* nmea: NMEA プロトコルの実装
* nns: ネームサービス機能
* nntp: NNTP プロトコル用の Tcl 関数
* ntp: NTP クライアント用の関数
* oauth: OAuth API 基本署名
* oodialect: TclOO ベースの DSL 構築
* oometa: TclOO クラス用データレジストリサービス
* ooutil: TclOO 用ユーティリティコマンド
* otp: RFC 2289 ワンタイムパスワードシステム
* page: パーサージェネレーター
* pki: RSA 公開鍵暗号化
* pluginmgr: プラグイン管理
* png: PNG 画像を照会・修正するための関数
* pop3: POP3 プロトコルの実装
* pop3d: POP3 サーバーの実装
* practcl: カスタム Tcl 型と TclOO オブジェクトを必要とする C API Tcl コード向けの、大規模モジュール統合ツール
* processman: 子プロセスの管理
* profiler: 関数レベルの Tcl ソースコードプロファイラ
* pt: パーサーツール
* rc4: RC4 ストリーム暗号の実装
* rcs: RCS 低レベルユーティリティ
* report: レポートの生成と整形に使用できるオブジェクトの提供
* rest: RESTful ウェブサービス用のフレームワーク
* ripemd: RIPEMD メッセージダイジェストアルゴリズム
* sasl: 簡易認証セキュアレイヤー (SASL) の実装
* sha1: sha1 ハッシュ関数
* simulation: Tcl シミュレーションツール
* smtpd: SMTP サーバーに必要な機能の実装
* snit: Snit's Not Incr Tcl, オブジェクト指向システム
* soundex: 音声的な類似性に基づく単語の比較
* stooop: シンプルな Tcl のみのオブジェクト指向プログラミングスキーム - C++/Java のような OOP インターフェースを提供
* string: 文字列のトークン化
* stringprep: 国際化文字列の準備
* struct: 一般的なデータ構造 (木、グラフなど) の Tcl 実装
* tar: tar ファイルを操作するための関数
* tepam: Tcl の拡張プロシージャおよび引数マネージャー
* term: 端末制御
* textutil: 文字列操作ライブラリ
* tie: 永続的な Tcl 配列を作成するためのフレームワーク
* tiff: TIFF 画像操作
* tool: 辞書ツール
* tool::datatype: 辞書ツール
* tool-ui: Tao がネイティブ Tk、HTML5、および Tao-Layout インターフェースを表現できるようにするための抽象化
* transfer: データ転送機能
* treeql: ツリークエリ言語
* try: エラーおよび例外の捕捉と処理
* udpcluster: UDP ピアツーピアクラスター
* uev: ユーザーイベント
* units: 単位付きの量の変換と操作
* uri: 一般的に使用される URI を生成・操作するための関数
* uuid: 汎用一意識別子 (UUID) ジェネレーター
* valtype: 検証型
* virtchannel: リフレクテッド/バーチャルチャネルのサポート
* websocket: ウェブセッションプロトコルの実装
* wip: ワードインタプリタ
* yaml: YAML 形式のエンコーダー/デコーダー
* zip: zip アーカイブの操作
```

> Tcllib, the standard Tcl library, is a collection of common utility
> functions and modules all written in high-level Tcl.
>
> Modules included:
>   * aes: advanced encryption standard
>   * amazon-s3: Amazon S3 web service interface
>   * asn: an ASN.1 encoder and decoder
>   * base32: a base32 encoder and decoder
>   * base64: a base64 encoder and decoder
>   * bee: bittorrent serialization encoder and decoder
>   * bench: benchmark tool
>   * bibtex: parser for bibliographies in BibTeX format
>   * blowfish: blowfish encryption
>   * cache: asynchronous in-memory cache
>   * clay: clay framework
>   * clock: date/time utilities
>   * cmdline: a command line argument processor similar to opt
>   * comm: remote communications facility
>   * control: procedures for control flow structures
>   * coroutine: coroutine utilities
>   * counter: provides a counter facility and can compute statistics
>     and histograms over the collected data.
>   * crc: checksum-calculation routines (crc32, cksum, sum)
>   * cron: automating the period callback of commands
>   * csv: functions to handle CSV (comma-separated values) data
>   * debug: debug messages infrastructure
>   * defer: deferred execution
>   * des: DES and 3DES encryption
>   * dicttool: dictionary tools
>   * dns: DNS and resolver library-related functions
>   * docstrip: tools for literate programming, often used with (La)TeX
>   * doctools: documentation tools
>   * dtplite: lightweight doctools markup processor
>   * fileutil: Tcl implementations of some standard Unix utilities
>   * ftp: Tcl interface to the FTP protocol
>   * ftpd: implementation of functions needed for an FTP server
>   * fumagic: file utilities
>   * generator: Tcl generator commands
>   * gpx: GPS eXchange Format (GPX)
>   * grammar_aycock: Aycock-Horspool-Earley parser generator for Tcl
>   * grammar_fa: finite automaton operations and usage
>   * grammar_me: grammar operations and usage
>   * grammar_peg: grammar operations and usage
>   * hook: hooks
>   * html: generate and control HTML tags
>   * htmlparse: parse HTML strings
>   * http: HTTP protocol helper modules
>   * httpd: HTTP server
>   * httpwget: tool to download files over HTTP
>   * ident: client interface to the ident protocol
>   * imap4: IMAP client
>   * inifile: parsing of Windows INI files
>   * interp: interpreter utilities
>   * irc: low-level IRC protocol interface
>   * javascript: Tcl shortcuts to create common javascript functions
>   * jpeg: functions to query and modify JPEG images
>   * json: JSON parser
>   * lambda: utility commands for anonymous procedures
>   * lazyset: lazy evaluation for variables and arrays
>   * ldap: LDAP client and extended object interface
>   * log: functions to log messages with various facilities and levels
>   * map: mapping utilities
>   * mapproj: map projection routines
>   * markdown: Markdown processor
>   * math: Tcl math library
>   * md4: md4 hashing functions
>   * md5: md5 hashing functions
>   * md5crypt: md5 based password hashing
>   * mime: a MIME encoder and decoder
>   * multiplexer: message multiplexing
>   * namespacex: namespace utility commands
>   * ncgi: a new CGI processing module
>   * nettool: tools for networked applications
>   * nmea: NMEA protocol implementation
>   * nns: name service facility
>   * nntp: Tcl functions for the NNTP protocol
>   * ntp: functions for an NTP client
>   * oauth: oauth API base signature
>   * oodialect: build TclOO based DSLs
>   * oometa: data registry service for TclOO classes
>   * ooutil: utility commands for TclOO
>   * otp: RFC 2289 a one-time password system
>   * page: parser generator
>   * pki: RSA public key encryption
>   * pluginmgr: plugin management
>   * png: functions to query and modify PNG images
>   * pop3: a POP3 protocol implementation
>   * pop3d: a POP3 server implementation
>   * practcl: tool for integrating large modules for C API Tcl code
>     that requires custom Tcl types and TclOO objects
>   * processman: manage child processes
>   * profiler: a function level Tcl source code profiler
>   * pt: parser tools
>   * rc4: implementation of the RC4 stream cipher
>   * rcs: RCS low level utilities
>   * report: provides objects which can be used to generate and format
>     reports
>   * rest: a framework for RESTful web services
>   * ripemd: RIPEMD message-digest algorithm
>   * sasl: Simple Authentication and Security Layer implementation
>   * sha1: sha1 hashing functions
>   * simulation: Tcl simulation tools
>   * smtpd: implementation of functions needed for an SMTP server
>   * snit: snit's not incr Tcl, OO system
>   * soundex: comparison of words based on their phonetic likeness
>   * stooop: simple Tcl-only object oriented programming scheme -
>     provides C++/Java-like OOP interfaces
>   * string: tokenize strings
>   * stringprep: preparation of internationalized strings
>   * struct: Tcl implementations of common data structures (tree, graph,
>     etc)
>   * tar: functions to manipulate tar files
>   * tepam: Tcl's enhanced procedure and argument manager
>   * term: terminal control
>   * textutil: string manipulation library
>   * tie: framework for creating persistent Tcl arrays
>   * tiff: TIFF image manipulation
>   * tool: dictionary tools
>   * tool::datatype: dictionary tools
>   * tool-ui: abstractions to allow Tao to express Native Tk, HTML5, and
>     Tao-Layout interfaces
>   * transfer: data transfer facilities
>   * treeql: tree query language
>   * try: trap and process errors and exceptions
>   * udpcluster: UDP peer-to-peer cluster
>   * uev: user events
>   * units: convert and manipulate quantities with units
>   * uri: functions to generate and manipulate commonly-used URIs
>   * uuid: generator of universally unique identifiers (UUID)
>   * valtype: validation types
>   * virtchannel: reflected/virtual channel support
>   * websocket: implementation of the websocket protocol
>   * wip: word interpreter
>   * yaml: YAML format encoder/decoder
>   * zip: working with zip archives

### tklib

- Ubuntu 22.04LTS Synaptic パッケージマネージャ

標準 Tk ライブラリである Tklib は、
すべて純粋な Tcl/Tk で記述された
一般的なユーティリティ関数とウィジェットのコレクションです。

含まれるモジュール:

```
autoscroll: 必要に応じてスクロールバーを自動的にマップします。
canvas: 正方形のタイルをベースとしたマップ背景のキャンバスを提供します。
chatwidget: チャットアプリケーション用の複合ウィジェットです。
controlwidget: 数値を表示および制御するためのウィジェットです。
crosshair: クロスヘアのアクティブ/非アクティブ、および追跡するためのコマンドを提供します。
on canvas ウィジェットです。
ctext: 構文強調表示をサポートするテキストウィジェットです。
cursor: いくつかのカーソルルーチンを提供します。
datefield: 日付入力用のエントリウィジェットです。
Diagrams: フローチャートなどのダイアグラムの描画を支援します。
getstring: 文字列入力を促すダイアログです。
history: エントリウィジェットの履歴機能を提供します。
ico: ウィンドウアイコンの読み書き関数を提供します。
ipentry: IP アドレス入力用のウィジェットです。
khim: 国際文字をサポートしていないキーボードで国際文字を入力するためのキーバインディングを提供します。

mentry: 複数エントリウィジェット。
menubar: メニューバーの作成と操作を行います。
notifywindow: アラート/通知用の目立たないウィンドウを提供します。
ntext: Text ウィジェットの代替バインディングを提供します。
persistentSelection: プライマリ選択を永続化します。
Plotchart: シンプルなプロットおよびチャート作成コマンドを提供します。
scrollutil: スクロール可能なウィジェットとマウスホイールをサポートします。
style: Tk オプションを使用したシンプルなテーマ設定を提供します。
swaplist: 2 つのリスト間でオプションを移動できるダイアログです。
tablelist: 複数列のリストボックスウィジェットです。
tkpiechart: キャンバスに表示される 2D または 3D の円グラフオブジェクトです。
tooltip: Tk ウィジェット用のツールチップを提供します。
wcb: ウィジェットのコールバックです。
widget: snit システムに基づくメガウィジェットのセットです。
widgetl: 順序付きリストと順序なしリストを入力するためのウィジェット。
widgetPlus: エントリ、スピンボックス、コンボボックスウィジェットに機能を追加します。
widgetv: ウィジェットバリデータ。
```

> Tklib, the standard Tk library, is a collection of common utility
> functions and widgets all written in pure Tcl/Tk.

> Modules included:
>   autoscroll: automatically maps scrollbars when they are needed;
>   canvas: provides a canvas with map background based on square tiles;
>   chatwidget: a composite widget for chat applications;
>   controlwidget: widgets for displaying and controlling numerical values;
>   crosshair: provides commands to (de)activate and track crosshairs;
>              on canvas widgets;
>   ctext: a text widget with syntax highlighting support;
>   cursor: provides a few cursor routines;
>   datefield: an entry widget for the purpose of date entry;
>   Diagrams: helps drawing diagrams, like flowcharts;
>   getstring: a dialog which prompts for a string input;
>   history: provides a history for mechanism for entry widgets;
>   ico: provides functions for reading and writing windows icons;
>   ipentry: a widget for the entering of an IP address;
>   khim: provides key bindings for entering international
>         characters on a keyboard that does not support them;
>   mentry: a multi-entry widget;
>   menubar: creates and manipulates menubars;
>   notifywindow: provides unobtrusive window for alerts/notifications;
>   ntext: provides alternative bindings for the Text widget;
>   persistentSelection: makes primary selection persistent;
>   Plotchart: provides simple plotting and charting commands;
>   scrollutil: scrollable widgets and mouse wheel support;
>   style: provides simple theming using Tk options;
>   swaplist: a dialog which allows one to move options between two lists;
>   tablelist: a multicolumn listbox widget;
>   tkpiechart: 2D or 3D pie chart object in a canvas;
>   tooltip: provides tooltips for Tk widgets;
>   wcb: widget callbacks;
>   widget: a set of megawidgets based on snit system;
>   widgetl: a widget for entry of ordered and unordered lists;
>   widgetPlus: adds features to entry, spinbox and combobox widgets;
>   widgetv: a widget validator.

### tkinspect

- Ubuntu 22.04LTS Synaptic パッケージマネージャ

Tkinspectは、実行中のTkアプリケーションの内容を検査するためのツールです。
検査対象アプリケーション内の変数、配列、プロシージャ、
その他のオブジェクトのビューを持ち、
Tkのsendコマンドまたはtcllibのcommコマンドを使用して通信します。

> Tkinspect is a tool to permit one to inspect the contents of a
> separate running Tk application. It has views for the variables,
> arrays, procedures and other objects in the inspectee and
> communicates using the Tk send or tcllib comm commands.
