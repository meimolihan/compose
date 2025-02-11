@echo off
cd /d "%USERPROFILE%\Desktop\GitHub\compose"

git add .
git commit -m "update"
git push

pause