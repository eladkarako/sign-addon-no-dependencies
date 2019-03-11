@echo off
:: this is a little helper, to help you understand how to use 'index.cmd'
:: it passes the filename, version, id arguments to the 'index.cmd'
:: 'index.cmd' takes the content of JWT_ISSUER and JWT_SECRET from the txt files, with the similar name so you don't need to send them as and argument yourself.
:: 'index.js' handles the actual request and download to the corrent folder. it is a much simpler example then in 'https://github.com/mozilla/sign-addon' page, but essentially the same.
:: the 'nothing.xpi' (zip archive) is an extension that does nothing... you can change version/id but remember to also set it here too. in the future I will read it from the XPI...
::

set "EXIT_CODE=0"

chcp 65001 2>nul >nul

set "ARGS="
::---------------------------------------filename
set  ARGS=%ARGS% "%~sdp0nothing.xpi"
::---------------------------------------version
set  ARGS=%ARGS% "22.22.22.22"
::---------------------------------------id
set  ARGS=%ARGS% "nothing@eladkarako.com"

call "%~sdp0index.cmd" %ARGS%

set "EXIT_CODE=%ErrorLevel%"


pause 1>&2
exit /b %EXIT_CODE%
