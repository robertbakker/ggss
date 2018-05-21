#!/usr/bin/env bash
i="swagger.yml"

v=$1
SCRIPT_PATH="`dirname \"$0\"`"
DEBUG_PARAMS=
  if [ ${v} = "1" ]; then
    DEBUG_PARAMS="-DdebugModels -DdebugOperations"
   fi
java ${DEBUG_PARAMS} -jar ${SCRIPT_PATH}/bin/swagger-codegen-cli.jar generate --ignore-file-override ${SCRIPT_PATH}/.swagger-codegen-ignore -o web -i swagger.yml -c ${SCRIPT_PATH}/swagger-config.json -l go-server -t ${SCRIPT_PATH}/swagger-templates