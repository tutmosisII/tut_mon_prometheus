# Bienvenidos a este tutorial de Prometheus

Para el desarrollo de este paso a paso vamos a necesitar [Virtual Box](https://www.virtualbox.org/) y [Vagrant](https://www.vagrantup.com/).

## Instalación de Dependencias del Tutorial

Este script esta diseñado para Ubuntu 18.04 [Instalar Ambiente Virtual](script/installVirtualEnvironment.sh)

## Instalando Rancher

[Rancher](https://rancher.com/) es un manejador de contenedores con el cual vamos a desplegar
prometheus, node_exporter, cAdvisor en las diferentes máquinas virtuales que vamos a manejar.


Ingrese al folder rancher_vg y ejecute: **vagrant up**


## Corriendo el primer nodo

Ingrese al folder node_first y ejecute: **vagrant up**
cuando el nodo este arriba ingrese con **vagrant ssh** y corra el agente de rancher.
![Primer Nodo](images/add1stNode.png)

## Inicie Gitlab en el Nodo 1

Desde el catalogo publico despliegue Gitlab este pude hacer las veces de
repositorio de código y de registry

Cree un proyecto y cargue el catálogo rancher-catalog allí:

       git init
       git remote add origin http://192.168.1.101:80/root/catalog.git
       git add .
       git commit  -m "Primer catalogo"
       git push origin master

## Registre el Catálogo en rancher

http://root:clave678@192.168.1.101:80/root/catalog.git

![Rancher Catalog](images/rancherCatalog.png)

## Inicie el Segundo nodo

Ingrese al folder node_second y ejecute: **vagrant up**
cuando el nodo este arriba ingrese con **vagrant ssh** y corra el agente de rancher.

Revise el cAdvisor en http://localhost:9102
Metricas de Prometheus http://localhost:9100/metrics

## Instalar Prometheus

Se requiere tener un registry funcionando

    docker run -d -p 5000:5000 --restart always --name registry registry:2

Para poder usar un registro sin certificados se debe modificar el archivo **daemon.json**

    echo '{"insecure-registries" : ["localhost:5000"]}'|sudo tee -a /etc/docker/daemon.json

Se debe reiniciar el demonio de docker.

    docker build -t localhost:5000/root/catalog/prom:v2.3.1 .

    docker push localhost:5000/root/catalog/prom:v2.3.1

## Instalar node exporter como demonio
