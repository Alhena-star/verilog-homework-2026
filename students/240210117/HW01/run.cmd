@echo off
rem ============================================================
rem  240210117  HW01 : build + simulate + redraw waveform
rem  Double-click to run. Output: report.vcd, report.png
rem  (Chinese documentation: see 说明.md)
rem ============================================================
setlocal
set "HERE=%~dp0"
set "IVBIN=C:\Users\leyizihao\Documents\deepseek-harness\default-workspace\tools\iverilog\bin"
set "PY=C:\Users\leyizihao\.dsh\dsh-runtimes\dsh-primary-runtime\dependencies\python\python.exe"
set "VCD2PNG=C:\Users\leyizihao\Documents\deepseek-harness\default-workspace\tools\vcd2png.py"

if exist "%IVBIN%\iverilog.exe" set "PATH=%IVBIN%;%PATH%"

rem iverilog needs a writable temp dir; keep it inside this folder
set "TMP=%HERE%tmp"
set "TEMP=%TMP%"
if not exist "%TMP%" mkdir "%TMP%"

cd /d "%HERE%" || exit /b 1
title HW01 simulate - 240210117

echo ============================================================
echo   [1/3] compile
echo ============================================================
iverilog -g2012 -Wall -o simv.exe clk_gen.v cd4017.v top_tb.v
if errorlevel 1 goto err

echo.
echo ============================================================
echo   [2/3] simulate
echo ============================================================
vvp simv.exe
if errorlevel 1 goto err

echo.
echo ============================================================
echo   [3/3] draw waveform
echo ============================================================
if exist "%PY%" if exist "%VCD2PNG%" "%PY%" "%VCD2PNG%" "report.vcd" "report.png"

echo.
echo Done. report.vcd / report.png are in this folder.
echo Open the waveform with GTKWave if needed:  gtkwave report.vcd
echo.
pause
exit /b 0

:err
echo.
echo FAILED - please screenshot the messages above and send to the teacher.
echo.
pause
exit /b 1
