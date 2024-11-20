@echo off
chcp 65001 >nul

set TITLE="アルゴリズム実験室2024 / 本橋大輔"
set AUTHOR="本橋大輔"
set DESCRIPTION="アルゴリズムってなんだろう？"
set SRC_PATH=src
set DST_PATH=dist

set FILEBODY=slide
if exist %DST_PATH%\%FILEBODY%.png (
    echo 🪽 - skip: [%DST_PATH%\%FILEBODY%.png] は既に存在します
) else (
    echo 🧑‍🔧 build: [%SRC_PATH%\%FILEBODY%] OGP用画像を生成します
    call marp %SRC_PATH%\%FILEBODY%.md --image png  --theme themes\mytheme.css --allow-local-files -o %DST_PATH%\%FILEBODY%.png --html
)
echo 🧑‍🔧 - build: [%SRC_PATH%\%FILEBODY%] html版スライドを生成します
call marp %SRC_PATH%\%FILEBODY%.md -o %DST_PATH%\%FILEBODY%.html --theme themes\mytheme.css --title %TITLE% --allow-local-files --og-image %FILEBODY%.png --html --description %DESCRIPTION% --author %AUTHOR%
call python ..\tools\imagecopy.py %SRC_PATH%\%FILEBODY%.md %DST_PATH%\img
