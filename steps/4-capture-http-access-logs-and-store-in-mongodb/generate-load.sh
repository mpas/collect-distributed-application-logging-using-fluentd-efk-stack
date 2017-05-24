#!/usr/bin/env bash
while sleep 1 ; do for n in {0..$(((RANDOM % 10) + 1))} ; do curl -s -A $n localhost &>/dev/null ; done ; done;