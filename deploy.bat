@echo off
REM Deploy script: Mirrors AEM site and flattens for GitHub Pages
REM Usage: deploy.bat
REM Prerequisite: AEM local server running on localhost:8080

set "WGET=C:\Users\aakas\AppData\Local\Microsoft\WinGet\Packages\JernejSimoncic.Wget_Microsoft.Winget.Source_8wekyb3d8bbwe\wget.exe"
set "ROOT=C:\Users\aakas\OneDrive\Desktop\Static portfolio"
set "MIRROR=%ROOT%\localhost+8080"
set "URL=http://localhost:8080/content/aakash-portfolio/home.html"

echo === Step 1: Cleaning old files ===
if exist "%ROOT%\css" rmdir /s /q "%ROOT%\css"
if exist "%ROOT%\js" rmdir /s /q "%ROOT%\js"
if exist "%ROOT%\images" rmdir /s /q "%ROOT%\images"
if exist "%ROOT%\icons" rmdir /s /q "%ROOT%\icons"
if exist "%ROOT%\documents" rmdir /s /q "%ROOT%\documents"
if exist "%ROOT%\index.html" del /q "%ROOT%\index.html"
if exist "%MIRROR%" rmdir /s /q "%MIRROR%"

echo === Step 2: Mirroring from AEM ===
"%WGET%" --mirror --convert-links --adjust-extension --page-requisites --no-parent -P "%ROOT%" "%URL%"

echo === Step 3: Flattening to GitHub Pages structure ===
mkdir "%ROOT%\css"
mkdir "%ROOT%\js"
mkdir "%ROOT%\images"
mkdir "%ROOT%\icons"
mkdir "%ROOT%\documents"
xcopy "%MIRROR%\apps\aakash-portfolio\clientlibs\clientlib-site\css\*" "%ROOT%\css\" /q /y
xcopy "%MIRROR%\apps\aakash-portfolio\clientlibs\clientlib-site\js\*" "%ROOT%\js\" /q /y 2>nul
xcopy "%MIRROR%\content\aakash-portfolio\assets\images\*" "%ROOT%\images\" /q /y
xcopy "%MIRROR%\content\aakash-portfolio\assets\icons\*" "%ROOT%\icons\" /q /y
xcopy "%MIRROR%\content\aakash-portfolio\assets\documents\*" "%ROOT%\documents\" /q /y 2>nul
copy /y "%MIRROR%\content\aakash-portfolio\home.html" "%ROOT%\index.html" >nul

echo === Step 4: Fixing paths in index.html ===
powershell -Command "(Get-Content '%ROOT%\index.html') -replace '../../apps/aakash-portfolio/clientlibs/clientlib-site/css/', 'css/' -replace '../../apps/aakash-portfolio/clientlibs/clientlib-site/js/', 'js/' -replace 'assets/images/', 'images/' -replace 'assets/icons/', 'icons/' -replace 'assets/documents/', 'documents/' -replace 'home\.html', 'index.html' | Set-Content '%ROOT%\index.html'"

echo === Step 5: Cleanup ===
rmdir /s /q "%MIRROR%"

echo.
echo Done! Your site is ready for GitHub Pages.
echo Structure:
echo   index.html
echo   css/
echo   js/
echo   images/
echo   icons/
echo   documents/
echo   README.md
