@echo off
::  this file is the "main" runnable file, 
::  you send all the arguments (filename, version, id) to it, 
::  it checks everything and interacts with you, and eventually sends it to node and index.js (node script).
::  to see how to use it, edit/view 'example.cmd'.

set "EXIT_CODE=0"

set "JWT_ISSUER="
set "JWT_SECRET="
set "FILENAME="
set "VERSION="
set "ID="

chcp 65001 2>nul >nul


::------------------------------------------------------------------ read JWT_ISSUER and JWT_SECRET from files.
if not exist "jwt_issuer.txt" ( goto ERROR_NO__JWT_ISSUER   )
set /p JWT_ISSUER=<"jwt_issuer.txt"
::if ["%JWT_SECRET%"] EQU ["user:0a1b2:c4d"]  ( goto ERROR_INVALID__JWT_ISSUER  )

if not exist "jwt_issuer.txt" ( goto ERROR_NO__JWT_ISSUER   )
set /p JWT_SECRET=<"jwt_secret.txt"
::if ["%JWT_SECRET%"] EQU ["0123456789abcdef0123456789abcdef0123456789abcdef0123456789abcdef"]  ( goto ERROR_INVALID__JWT_SECRET   )
::------------------------------------------------------------------------------------------------------------

set "FILENAME=%~1"
set "VERSION=%~2"
set "ID=%~3"

if ["%FILENAME%"] EQU [""] ( goto ERROR_NO__FILENAME     )
if ["%VERSION%"]  EQU [""] ( goto ERROR_NO__VERSION      )
if ["%ID%"]       EQU [""] ( goto ERROR_NO__ID           )

@echo on
call "node.exe" "index.js" "%JWT_ISSUER%" "%JWT_SECRET%" "%FILENAME%" "%VERSION%" "%ID%"
@echo off

set "EXIT_CODE=%ErrorLevel%"

goto END


:ERROR_NO__JWT_ISSUER
  echo missing JWT ISSUER.   1>&2
  echo jwt_issuer.txt is expected to exist in this folder.   1>&2
  set "EXIT_CODE=1"
  goto END

:ERROR_INVALID__JWT_ISSUER
  echo jwt_issuer.txt still has the 'sample'-values.                    1>&2
  echo use https://addons.mozilla.org/en-US/developers/addon/api/key/   1>&2
  echo and generate your own.                                           1>&2
  set "EXIT_CODE=2"
  goto END

:ERROR_NO__JWT_SECRET
  echo missing JWT SECRET.   1>&2
  echo jwt_secret.txt is expected to exist in this folder.   1>&2
  set "EXIT_CODE=3"
  goto END

:ERROR_INVALID__JWT_SECRET
  echo jwt_secret.txt still has the 'sample'-values.                    1>&2
  echo use https://addons.mozilla.org/en-US/developers/addon/api/key/   1>&2
  echo and generate your own.                                           1>&2
  set "EXIT_CODE=4"
  goto END

:ERROR_NO__FILENAME
  echo missing path to XPI filename.   1>&2
  set "EXIT_CODE=5"
  goto END

:ERROR_NO__VERSION
  echo missing version for the extension (same as in manifest).  1>&2
  set "EXIT_CODE=6"
  goto END

:ERROR_NO__ID
  echo missing id for the extension (same as in manifest).  1>&2
  set "EXIT_CODE=7"
  goto END


:END
::pause 1>&2
  exit /b %EXIT_CODE%
