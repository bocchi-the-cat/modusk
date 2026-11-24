```bat
@echo off
title updater
cd /d "%~dp0"

echo =====================================
echo          MODUSK GIT UPDATER
echo =====================================
echo.

:: Check Git repository
if not exist ".git" (
    echo ERROR: This folder is not a Git repository.
    pause
    exit /b 1
)

:: Check for changes
git status --short
if errorlevel 1 (
    echo ERROR: Git status failed.
    pause
    exit /b 1
)

git diff --quiet
set "TRACKED_CHANGES=%errorlevel%"

for /f %%i in ('git ls-files --others --exclude-standard') do set "UNTRACKED=1"

if "%TRACKED_CHANGES%"=="0" if not defined UNTRACKED (
    echo.
    echo No changes detected.
    pause
    exit /b 0
)

echo.
set /p "MESSAGE=Enter commit message: "

if not defined MESSAGE (
    echo.
    echo ERROR: Commit message cannot be empty.
    pause
    exit /b 1
)

echo.
echo Staging changes...
git add -A

echo Creating commit...
git commit -m "%MESSAGE%"

if errorlevel 1 (
    echo.
    echo ERROR: Commit failed.
    pause
    exit /b 1
)

echo.
echo Pushing to GitHub...
git push

if errorlevel 1 (
    echo.
    echo ERROR: Push failed. Your commit is still saved locally.
    pause
    exit /b 1
)

echo.
echo =====================================
echo       UPDATE SUCCESSFUL!
echo =====================================
pause
```