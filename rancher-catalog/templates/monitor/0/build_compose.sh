#!/bin/bash
################################################################################
# Objective:
#       Test the docker-compose.yml file, locally trougth the environment
#       variables exposing. Same variables that should be declared in
#       rancher-compose.yml
################################################################################
#                      ENVIROMENT VARIABLES
################################################################################
export CADVISOR_PORT=9102
export NODEEX_PORT=9100
if [ -z $2 ]; then
	export REGISTY=""
else
	export REGISTY="192.168.1.100/"
fi
################################################################################
#                      COMMANDS
################################################################################
case $1 in
	down)
		docker-compose down
		;;
    destroy )
		docker-compose kill
        docker-compose down
        ;;
    up )
        docker-compose up
        ;;
    *)
        echo "use: destroy|down|up"
    ;;
esac
