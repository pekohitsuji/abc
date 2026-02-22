package abc.java.hello;
// -*- coding: uft-8-unix; mode: java; -*-

/*
  SETUP
    $ sudo apt-get install default-jdk

  COMPILE
    $ javac Hello.java

  RUN
    $ java abc.java.Hello

  [eglot] Connected! Server `EGLOT (hello/(java-mode))' now managing `(java-mode)' buffers in project `hello'.

 */


import java.lang.Math;

class Hello {
    public static void main(String[] args) {
        System.out.print("Hello, Java!");
        System.out.print("\n");
        System.out.println("Good-bye, human!");
        System.out.println("こんにちは 世界!");
        System.out.printf("円周率π=%4.2f\n", Math.acos(-1));
    }
}
