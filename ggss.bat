@echo off
set i=swagger.yml

set v=%1
set DEBUG_PARAMS=
if "%v%"=="1" (
    set DEBUG_PARAMS=-DdebugModels -DdebugOperations
)
java %DEBUG_PARAMS% -jar %~dp0bin\swagger-codegen-cli.jar generate --ignore-file-override %~dp0.swagger-codegen-ignore -o web -i swagger.yml -c %~dp0swagger-config.json -l go-server -t  %~dp0swagger-templates