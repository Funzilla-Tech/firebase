for /f %%i in ('dir /a:d /s /b com.google.*') do rmdir /S /Q %%i
del com.google.*
pause