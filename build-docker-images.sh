#!/usr/bin/env bash
echo ""
echo "Building Fluentd demo image"
echo "--------------------------------------------------------------------------------"
cd ./docker-images/fluentd-demo
bash build.sh
cd -
echo ""
echo "Building HTTPD demo image"
echo "--------------------------------------------------------------------------------"
cd ./docker-images/httpd-demo
bash build.sh
cd -
echo ""
echo "Building SpringBoot demo image"
echo "--------------------------------------------------------------------------------"
cd ./docker-images/spring-boot-fluentd-demo
bash build.sh
