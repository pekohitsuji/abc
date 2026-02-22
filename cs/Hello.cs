// -*- coding: utf-8-unix; mode: csharp; -*-

//  SETUP
//    install mono-complete
//      $ sudo apt-get install mono-complete
//
//  COMPILE
//    $ mcs Hello.cs
//
//  RUN
//    $ mono Hello.exe

using System;

class Hello{
    static void Main(string[] args) {
        Console.Write("Hello, C#!");           // no new line
        Console.Write("\n");                   // new line
        Console.WriteLine("Good-bye, human!"); // with new line
        Console.WriteLine("こんにちは 世界!"); // 日本語も使える
        Console.WriteLine("円周率π={0,-2:F}", Math.Acos(-1));
    }
}
