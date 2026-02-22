#!/usr/bin/python3
# -*- coding: utf-8-unix -*-

##  このプログラムは asyncio.create_task を使った非同期処理の説明

##  [非同期処理](https://www.youtube.com/watch?v=KnNWw5HX20w)
##  並行処理を簡単に扱えるようにしたものが async/await の非同期処理
##  Python 3.7 以上が必要

import asyncio
import time

##  コルーチンは値を返すことができる
async def wait(sec):
    print(f"{time.strftime('%X')} {sec}秒 待つ")
    await asyncio.sleep(sec)
    ret = f"{time.strftime('%X')} {sec}秒 待機しました"
    print(ret)
    return "結果 " + ret

##  関数定義の前に async を付けるとコルーチンになる
##  コルーチンを実行するには await を前置する
##  コルーチン = 処理をある時点で一時中断・再開できる関数
async def main():
    print(f"{time.strftime('%X')} main 開始")
    task5 = asyncio.create_task(wait(5))
    task2 = asyncio.create_task(wait(2))
    task1 = asyncio.create_task(wait(1))
    ## タスクを await で並行処理する
    await task1
    await task2
    await task5
    ## タスクは同時に並行で開始されるが、全て終了するまでココで停止する
    print(f"{time.strftime('%X')} main 中間")
    print(f"{time.strftime('%X')} {task1.result()}")
    print(f"{time.strftime('%X')} {task2.result()}")
    print(f"{time.strftime('%X')} {task5.result()}")
    print(f"{time.strftime('%X')} main 終了")

if __name__ == "__main__":
    ## asyncio.run はイベントループが作られ引数に指定したコルーチンを実行
    ## asyncio.run は指定した処理が終了するまで停止する(非同期ではない)
    print(f"{time.strftime('%X')} プログラム開始")
    asyncio.run(main())
    print(f"{time.strftime('%X')} プログラム終了")
