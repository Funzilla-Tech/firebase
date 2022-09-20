@echo off
SET EXTDEPMGR="1.2.172"
SET FBVER="9.5.0"

call wget https://dl.google.com/games/registry/unity/com.google.external-dependency-manager/com.google.external-dependency-manager-%EXTDEPMGR%.tgz
call wget https://dl.google.com/games/registry/unity/com.google.firebase.app/com.google.firebase.app-%FBVER%.tgz
call wget https://dl.google.com/games/registry/unity/com.google.firebase.crashlytics/com.google.firebase.crashlytics-%FBVER%.tgz
call wget https://dl.google.com/games/registry/unity/com.google.firebase.analytics/com.google.firebase.analytics-%FBVER%.tgz
call wget https://dl.google.com/games/registry/unity/com.google.firebase.remote-config/com.google.firebase.remote-config-%FBVER%.tgz
call extract_package.bat com.google.external-dependency-manager %EXTDEPMGR%
call extract_firebase.bat com.google.firebase.analytics %FBVER% firebase-analytics-unity AnalyticsDependencies.xml
call extract_firebase.bat com.google.firebase.app %FBVER% firebase-app-unity AppDependencies.xml
call extract_firebase.bat com.google.firebase.crashlytics %FBVER% firebase-crashlytics-unity CrashlyticsDependencies.xml
call extract_firebase.bat com.google.firebase.remote-config %FBVER% firebase-config-unity RemoteConfigDependencies.xml
SET DIR=%~dp0
cd %DIR%/com.google.external-dependency-manager
npm publish --registry http://34.72.115.139:4873
cd %DIR%/com.com.google.firebase.analytics
npm publish --registry http://34.72.115.139:4873
cd %DIR%/com.google.firebase.remote-config
npm publish --registry http://34.72.115.139:4873
cd %DIR%/com.google.firebase.crashlytics
npm publish --registry http://34.72.115.139:4873
cd %DIR%/com.google.firebase.app
npm publish --registry http://34.72.115.139:4873
cd %DIR%/
pause