set PACKAGE=%1
set VERSION=%2
rmdir /S /Q %PACKAGE%
7z.exe x %PACKAGE%-%VERSION%.tgz -y
7z.exe x -x!*.so -x!*.so.meta %PACKAGE%-%VERSION%.tar -y
ren package %PACKAGE%
del %PACKAGE%-%VERSION%.tar
::del %PACKAGE%-%VERSION%.tgz