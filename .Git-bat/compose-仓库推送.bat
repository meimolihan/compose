@echo off
SETLOCAL ENABLEDELAYEDEXPANSION

REM 设置颜色为绿色背景，默认亮白色文字
COLOR 0A
CLS
PROMPT $P$G

REM 定义目标目录
SET "REPO_PATH=%USERPROFILE%\Desktop\GitHub\compose"

REM 检查目标目录是否存在
IF NOT EXIST "%REPO_PATH%" (
    ECHO ============================================
    ECHO 错误：目录 %REPO_PATH% 不存在，请检查路径！
    ECHO ============================================
    pause
    EXIT /B 1
)

REM 切换到目标目录
CD /D "%REPO_PATH%" 2>NUL
IF ERRORLEVEL 1 (
    ECHO ============================================
    ECHO 错误：无法切换到目录 %REPO_PATH%，请检查 Git 仓库。
    ECHO ============================================
    pause
    EXIT /B 1
)

REM 检查是否为有效的 Git 仓库
IF NOT EXIST .git (
    ECHO ============================================
    ECHO 错误：目录 %REPO_PATH% 不是一个有效的 Git 仓库。
    ECHO ============================================
    pause
    EXIT /B 1
)

REM 检查是否有修改需要提交
ECHO ============================================
ECHO 正在检查是否有文件需要提交...
ECHO ============================================
ECHO.

git status >nul 2>&1
IF ERRORLEVEL 1 (
    ECHO 错误：无法获取 Git 仓库状态，请检查环境。
    pause
    EXIT /B 1
)

FOR /F "delims=" %%D IN ('git status --porcelain') DO (
    IF "%%D" NEQ "" (
        SET "CHANGES=YES"
    )
)

IF DEFINED CHANGES (
    ECHO 检测到文件修改，开始提交...

    REM 添加所有更改
    ECHO.
    ECHO 正在添加所有更改...
    git add .
    IF ERRORLEVEL 1 (
        ECHO 错误：无法添加文件，请检查 Git 仓库。
        pause
        EXIT /B 1
    )

    REM 提交更改
    ECHO.
    ECHO 正在提交更改...
    git commit -m "update"
    IF ERRORLEVEL 1 (
        ECHO 错误：提交失败，请检查 Git 仓库。
        pause
        EXIT /B 1
    )

    REM 推送更改
    ECHO.
    ECHO 正在推送更改到远程仓库...
    git push
    IF ERRORLEVEL 1 (
        ECHO 错误：推送失败，请检查网络连接或远程配置。
        pause
        EXIT /B 1
    )

    ECHO.
    ECHO 提交和推送成功！
) ELSE (
    ECHO 没有文件需要提交。
)

REM 提示完成
ECHO.
ECHO ============================================
ECHO 脚本执行完成。
ECHO ============================================
pause
ENDLOCAL