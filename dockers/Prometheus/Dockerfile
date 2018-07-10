FROM prom/prometheus:v2.3.1
MAINTAINER alejandroleon09@gmail.com
COPY prometheus.yml /etc/prom-conf/prometheus.yml
USER root
RUN mkdir -p /etc/prom-conf/targets/nodes && \
    mkdir -p /etc/prom-conf/targets/springboot