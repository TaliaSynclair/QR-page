@echo off
setlocal enabledelayedexpansion

echo const imageList = [ > imageList.js
for %%f in (*.jpg *.png *.jpeg *.webp *.gif) do (
    echo   'images/%%f', >> imageList.js
)
:: Replace last comma with closing bracket
(for /f "delims=" %%l in (imageList.js) do (
    set "line=%%l"
    set "last=!line!"
    echo !line!
)) > tmp.js
(echo %last:~0,-1%) > lastline.js
more +1 tmp.js >> lastline.js
(echo ];) >> lastline.js

move /y lastline.js imageList.js > nul
del tmp.js
echo Done! imageList.js created.
