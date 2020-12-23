#!/usr/bin/env bash
sh -c "docker network create pranee"
sh -c "cd base/openjdk; docker build -t com.pranee.docker/jdk-1.8.222:latest ."
sh -c "cd base/hadoop-cluster; docker build -t com.pranee.docker/hadoop-cluster:latest ."
sh -c "cd base/mysql; docker build -t com.pranee.docker/mysql:latest ."

