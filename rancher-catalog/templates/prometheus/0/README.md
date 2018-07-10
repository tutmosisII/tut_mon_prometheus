# Cyxtera Prometheus

### Info:

This template deploys a collection of monitoring services based upon the technologies listed below, once deployed you should have a monitoring platform capable of querying a wide variety of metrics that represent your environment, also included are somehandy pre-configured dashboards to get you started.

In this catalog item, the following technologies are utilised to make this as useful as possible;

* [Prometheus](https://github.com/prometheus/prometheus) - Used to scrape and store metrics from our data sources.
* [Prometheus Node Exporter](https://github.com/prometheus/node_exporter) - Gets host level metrics and exposes them to Prometheus.
* [cAdvisor](https://github.com/google/cadvisor) - Deploys and Exposes the cadvsior stats used by Rancher's agent container, to Prometheus.
* [Grafana](https://github.com/grafana/grafana/) - Used to visualise the data from Prometheus and InfluxDB.
* [Prometheus Rancher Exporter](https://github.com/infinityworksltd/prometheus-rancher-exporter/) - Allows Prometheus to access the Rancher API and return the status of any stack or service in the rancher environment associated with the API key used.

The full compliment of metrics from the Rancher server itsself are now available for graphing directly in Prometheus, this is easily enabled with an environment variable. For those interested, I've documented the steps [here].(https://github.com/infinityworksltd/Guide_Rancher_Monitoring)

All components in this stack are open source tools available in the community. All this template does is to bound them together in an easy to use package. I expect most people who find this useful will make use of this as a starting point and develop it further around their own needs.
 
## Deployment:
1. 
2. 
3. 

## Usage
* Grafana port 3000.
* Prometheus port 9090
