@echo off
rem adapted from https://gist.github.com/vvuk/01dc8a12678d1beffaa1e26549d03b02

echo %PATH%
call "%ProgramFiles(x86)%\Microsoft Visual Studio 14.0\VC\vcvarsall.bat" amd64

echo INCLUDE='%INCLUDE%'>>%GITHUB_ENV%
echo LIB='%LIB%'>>%GITHUB_ENV%
echo LIBPATH='%LIBPATH%'>>%GITHUB_ENV%
echo %PATH%
