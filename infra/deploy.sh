#!/bin/bash


function prepare_profile(){
	cat <<EOF > ${HOME}/.profile
WHITE='\[\033[0m\]'
GREEN='\[\033[1;32m\]'
PURPURE='\[\033[1;35m\]'
YELLOW='\[\033[1;33m\]'
RED='\[\033[0;31m\]'
BLUE='\[\033[1;34m\]'
CYAN='\[\033[0;36m\]'
PS1="\${CYAN}[\u]\${BLUE}@\${CYAN}[\h]\${BLUE}[\W]\${WHITE}\${CYAN}\\$\${WHITE} "
alias ll='ls -la'

EOF
}

function update(){
	if ! apt update;then
		if ! apk update;then
			echo "WARNING: not updated"
		fi
	fi
}

function deploy_jenkins(){
	docker run -p 8080:8080 --name=jenkins-master -d jenkins/jenkins
	docker exec jenkins-master cat /var/jenkins_home/secrets/initialAdminPassword > /tmp/secret.txt
}

####################  __MAIN__  ####################

THIS_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

cd ${THIS_DIR}

prepare_profile

if [[ $(hostname) == 'node1' ]];then
	deploy_jenkins
fi

if [[ $(hostname) == 'node2' ]];then
	cd wordpress \
	&& docker-compose up -d
fi