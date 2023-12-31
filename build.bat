rem TypeScript build script for Kontra

set NAME=js13k
set BUILD_FOLDER=dist
set BUILD_FILENAME=index.prod.js

del %NAME%.zip
rmdir  /s /q %BUILD_FOLDER%

call npm run prod
if %ERRORLEVEL% NEQ 0 (
    pause
    exit /b %ERRORLEVEL%
)

pushd %BUILD_FOLDER%
echo ^<canvas width="720" height="1280" style="position: absolute; top: 50%%; left: 50%%; transform: translate(-50%%, -50%%); height: 100%%;"^>^</canvas^> >> index.html
echo ^<script^> >> index.html
type %BUILD_FILENAME% >> index.html
echo ^</script^> >> index.html

call ..\node_modules\ect-bin\vendor\win32\ect.exe -9 -strip -zip ..\%NAME%.zip index.html
if %ERRORLEVEL% NEQ 0 (
    pause
    exit /b %ERRORLEVEL%
)

popd

