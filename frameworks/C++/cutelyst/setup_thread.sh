#!/bin/bash

DRIVER=
UWSGI=
NGINX=
C_PROCESSES=1
C_THREADS=${CPU_COUNT}
CPU_AFFINITY=1

source ${TROOT}/config.sh