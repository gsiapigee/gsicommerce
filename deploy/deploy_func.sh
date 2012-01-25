#!/bin/bash
SCRIPT_NAME=${BASH_SOURCE[0]}
if [ -L "$SCRIPT_NAME" ]; then
    SCRIPT_NAME=$(readlink $SCRIPT_NAME)    
fi
GATEWAY_DIR=`dirname $SCRIPT_NAME`/..
pushd $GATEWAY_DIR >/dev/null 
GATEWAY_DIR=`pwd`
echo "$GATEWAY_DIR"
popd >/dev/null

APPS_DIR=$GATEWAY_DIR/code/gateway
echo "APPS_DIR: $APPS_DIR"

# Uses the global variable $APPS_DIR
# param 1 - the name of the app to deploy
# param 2 - the profile to use
deploy_app() {  
    app=$1
    profile=$2

    if [ -d $APPS_DIR/$app ]
    then
        pushd $APPS_DIR/$app >/dev/null
        echo "$APPS_DIR/$app"
	   cp    $APPS_DIR/pom.xml $APPS_DIR/$app/pom.xml 
	   mvn -e apigee:deploy -P${profile} -Dappname=${app} || exit 1
         popd >/dev/null
    else
       echo "Directory: $APPS_DIR/$app does not exist"
    fi
}

