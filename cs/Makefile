all: Hello.exe

run: all
	mono Hello.exe

ver:
	mono --version
	mcs  --version
	make --version

Hello.exe: Hello.cs
	mcs Hello.cs
