set PACKAGE=%1
set VERSION=%2
set NAME=%3
set DEPEND=%4
call extract_package.bat %PACKAGE% %VERSION%
mkdir %PACKAGE%\Plugins\Android
move %PACKAGE%\Firebase\m2repository\com\google\firebase\%NAME%\%VERSION%\%NAME%-%VERSION%.srcaar.meta %PACKAGE%\Plugins\Android\%NAME%-%VERSION%.aar.meta
move %PACKAGE%\Firebase\m2repository\com\google\firebase\%NAME%\%VERSION%\%NAME%-%VERSION%.srcaar %PACKAGE%\Plugins\Android\%NAME%-%VERSION%.aar
move %PACKAGE%\Firebase\m2repository.meta %PACKAGE%\Plugins\Android.meta
rmdir /S /Q %PACKAGE%\Firebase\m2repository
del %PACKAGE%\Firebase\Plugins\x86_64\*.so
del %PACKAGE%\Firebase\Plugins\x86_64\*.so.meta