#!/bin/sh
/bin/bash /utils/wait-for-it.sh -t 0 localhost:9200 -- ./insert.sh &
elasticsearch
