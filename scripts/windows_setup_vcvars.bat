@echo off
rem adapted from https://gist.github.com/vvuk/01dc8a12678d1beffaa1e26549d03b02

set oldpath=%PATH%
call "%ProgramFiles(x86)%\Microsoft Visual Studio 14.0\VC\vcvarsall.bat" amd64

echo INCLUDE='%INCLUDE%'>>%GITHUB_ENV%
echo LIB='%LIB%'>>%GITHUB_ENV%
echo LIBPATH='%LIBPATH%'>>%GITHUB_ENV%

set newpath="%%PATH:%oldpath%=%%"
for %%p in ("%newpath:;=" "%") do (
    echo new path %%~p
    echo %%~p>>%GITHUB_PATH%
)
