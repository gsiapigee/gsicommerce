#!/usr/bin/env bash
. deploy_func.sh

if [ $# -ne 1 ]; then
    echo
    echo "Usage: $0 <profile>"
    echo
    exit 1
fi

PROFILE_NAME=$1

echo
echo "Using profile: '${PROFILE_NAME}'"
echo

pushd $APPS_DIR/HealthCheckApplication > /dev/null
mvn apigee:exec -P${PROFILE_NAME} -Dast.scriptFile=$GATEWAY_DIR/deploy/create_domain.ast || exit 1
popd > /dev/null
deploy_app SampleProxy ${PROFILE_NAME}
deploy_app StandaloneSampleProxy ${PROFILE_NAME}

