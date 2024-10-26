@REM run as Administrator
@echo off
cd /d %~dp0
set DOWNLOADS_DIR=%USERPROFILE%\Downloads
set DOWNLOADS_DIR_LINUX=%DOWNLOADS_DIR:\=/%

set PATH=^
%DOWNLOADS_DIR%\elixir-otp-27\bin;^
%DOWNLOADS_DIR%\otp_win64_27.1.2\bin;^
%DOWNLOADS_DIR%\otp_win64_27.1.2\erts-15.1.2\bin;

set MIX_ENV=prod
mix deps.get &&^
mix compile &&^
mix run -e "HelloWorld.Application.start()"