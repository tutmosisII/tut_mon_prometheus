#!/bin/bash
################################################################################
# Objective:
#       Test the docker-compose.yml file, locally trougth the environment
#       variables exposing. Same variables that should be declared in
#       rancher-compose.yml
################################################################################
#                      ENVIROMENT VARIABLES
################################################################################
export RANCHER_SERVER=192.168.1.100
export PROM_CONFIG=/etc/prom-conf/prometheus.yml
export PROM_ARGS="--storage.tsdb.path=/prometheus --web.console.libraries=/etc/prometheus/console_libraries --web.console.templates=/etc/prometheus/consoles"
export VOLUME_DRIVER=local
export CATTLE_URL=http://192.168.1.100:8080/v2-beta
export RANCHER_SECRET_KEY=XoDH5EM35ETApJHVLg92R6kB38RsmLN4cB5M3tLM
export RANCHER_ACCESS_KEY=47654316342CEF333EEC
if [ -z $2 ]; then
	export REGISTRY=""
else
	echo "Registry: $2"
	export REGISTRY=$2
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
