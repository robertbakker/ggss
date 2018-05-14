@echo off
set c=%~dp0swagger-config.json
set i=swagger.yml
set d=0

:initial
if "%1"=="" goto done
set aux=%1
if "%aux:~0,1%"=="-" (
   set nome=%aux:~1,250%
) else (
   set "%nome%=%1"
   set nome=
)
shift
goto initial
:done

set SCRIPT_PATH=%~dp0
set CURRENT_PATH=%cd%
set DEBUG_PARAMS=
if "%d%"=="1" (
    set DEBUG_PARAMS=-DdebugModels -DdebugOperations
)
java %DEBUG_PARAMS% -jar %SCRIPT_PATH%/bin/swagger-codegen-cli.jar generate --ignore-file-override %~dp0/.swagger-codegen-ignore -o web -i %i% -c %c% -l go-server -t  %SCRIPT_PATH%/swagger-templates