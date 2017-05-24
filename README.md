# Demo Structure

## Prerequisites

* Docker installed
* Docker Compose installed

### Build the required Docker images
* Execute `./build-docker-images`

This will build 2 images:

* **Fluentd Docker image**: with plugins that are used during the demo
* **Apache Httpd Docker image**: modified version of the HTTPD image using the combined logging format

---

## Step 1: Run Fluentd with monitoring agent

* Start Fluentd using docker-compose > dc up
* Show docker-compose.yml > including portmapping
* Show Fluent config > fluent.conf
* Navigate to <http://localhost:24220/api/plugins.json> > show the default healtcheck

## Step 2: Capture input from Docker container

* Start Fluentd using docker-compose > dc up
* Show docker-compose.yml > including portmapping
* Explain the Docker logging driver > docker-compose.yml
  * Without the links the echo container will stop because the Fluentd container is not available, --> use async-connect setting from the LogDriver
* Explain the default fields that Fluentd adds like:
  * `container_name`
  * `source`
  * `log`  
* Show Fluent config > fluent.conf
* Stop Fluentd and enable dummy data in config > restart to show dummy data

## Step 3: Capture HTTP access logs

* Start Fluentd using docker-compose > dc up
* Explain fluent.conf with the added `filter`
* Generate some data by navigating to <http://localhost/> or by executing `./generate-load.sh`
* Show the results in Fluentd log

## Step 4: Capture HTTP access logs and store in MongoDB

* Start Fluentd using docker-compose > dc up
* Exec inside the container that runs mongo
  * docker exec -it mongodb bash
* Start Mongo shell
  * `mongo`
  * `show dbs
  * See that the fluentd database is not there
  * Generate some data by navigating to <http://localhost/> or by executing `./generate-load.sh
  * `use fluentd`
  * `db.test.find()

## Step 5: Capture HTTPD access logs and store in ELK stack

* Start Fluentd using docker-compose > dc up
* Generate some data by navigating to <http://localhost/> or by executing `./generate-load.sh
* Explain docker-compose and show the 2 added services
  * Elasticsearch
  * Kibana
* Show fluent.conf and explain the added match with type @copy
  * Stdout
  * Elasticsearch
  * File output
* Navigate to <http://localhost:5601/> and show the data that flows in
  * Create PIE vizualisation
  * Split Slices > Aggregation > Terms > Field > agent

## Step 6: Capture Spring Boot logs and store in the ELK stack including intail

* Start Fluentd using docker-compose > dc up
* Explain the Spring Boot application
* Navigate to <http://localhost:8080/> and generate some load showing the log entry
* Navigate to <http://localhost:5601/> and show the data that flows in
  * Filter on possibilities

## Step 7: HA Setup
* Start Fluentd using docker-compose > dc up
* Explain the Log Collector / Log Aggregator
* Show the Fluentd config for Collector / Aggregator
* Generate load by executing `./generate-load.sh
* Stop the Log Aggregator 1 > `docker stop fluentd-aggregator-1`
* See data flowing to Log Aggregator 2
* Start Log Aggregator 1 > `docker start fluentd-aggregator-1`

### Sources
* <http://jasonwilder.com/blog/2013/07/16/centralized-logging-architecture/>
* <http://jasonwilder.com/blog/2012/01/03/centralized-logging/>