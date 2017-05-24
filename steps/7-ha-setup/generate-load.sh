#!/usr/bin/env bash
for i in {1..200}
do
    http POST http://localhost:8888/input.http \
    acme:="$i" \
    corp:="$i"
done
