#!/usr/bin/env bash
image=root/catalog/prom:v2.3.1
if [ -z $1 ]; then
	#Creación de imagen de forma local
	docker rmi -f $image
	docker build -t $image . --no-cache
else
	#Creción de imagen para almacenar en un registro
	echo "Docker registry $1/$image"
	docker rmi -f $1/$image
	docker build -t $1/$image . --no-cache
	docker push $1/$image
fi
