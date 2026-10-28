@echo off
setlocal
REM ===== KONFIGURASI =====
set TOMCAT=C:\tomcat10
set PROJECT=%~dp0
set DEPLOY=%TOMCAT%\webapps\sistem-pelaporan

echo [1/3] Copy webapp ke Tomcat...
if not exist "%DEPLOY%" mkdir "%DEPLOY%"
xcopy /E /I /Y "%PROJECT%src\main\webapp" "%DEPLOY%" >nul

echo [2/3] Compile Java...
dir /s /b "%PROJECT%src\main\java\*.java" > "%TEMP%\sources.txt"
if not exist "%DEPLOY%\WEB-INF\classes" mkdir "%DEPLOY%\WEB-INF\classes"
javac -encoding UTF-8 -cp "%TOMCAT%\lib\*;%DEPLOY%\WEB-INF\lib\*" -d "%DEPLOY%\WEB-INF\classes" @"%TEMP%\sources.txt"
if errorlevel 1 (
    echo.
    echo [X] COMPILE GAGAL. Periksa error di atas.
    exit /b 1
)

echo [3/3] Selesai!
echo.
echo Jalankan: %TOMCAT%\bin\startup.bat  (atau restart kalau sudah jalan)
echo Buka: http://localhost:8080/sistem-pelaporan/home
