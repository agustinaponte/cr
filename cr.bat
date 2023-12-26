@echo off

REM Check if a file name was provided as a parameter
if "%~1"=="" (
    echo Usage: %0 filename.pas
    exit /b
)

REM Extract file name and extension without path
for %%F in ("%~1") do (
    set "file_name=%%~nF"
    set "file_ext=%%~xF"
)

REM Compile the provided Pascal file
fpc "%~1"

REM Check the compilation result
if not exist "%file_name%.exe" (
    echo Compilation failed.
    exit /b
)

REM Run the compiled program
echo Compilation successful. Running the program...
"%file_name%.exe"

REM Optionally, pause to see output before closing the console window
pause
