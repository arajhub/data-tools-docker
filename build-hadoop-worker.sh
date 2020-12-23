#!/usr/bin/env bash

sh -c "cd base/hadoop-worker; docker build --no-cache -t com.pranee.docker/hadoop-worker:latest ."
