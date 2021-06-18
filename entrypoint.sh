#!/bin/bash

# set -e

THIS_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

cd ${THIS_DIR}

if [[ ! ${1} ]];then
	echo "USAGE: $(basename $0) <HOSTNAME or IP>"
	exit 1
fi

host_name=${1}

ssh ${host_name} "rm -rf ${HOME}/infra"

scp -r ${THIS_DIR}/infra ${host_name}:

ssh ${host_name}
