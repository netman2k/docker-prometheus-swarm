#!/bin/sh -e

NODE_EXPORTER_BIN=/bin/node_exporter
 
if [ -z ${COLLECTOR_TEXTFILE_DIR} ];then
  COLLECTOR_TEXTFILE_DIR=/tmp/prometheus
fi

if [ -z ${HOST_HOSTNAME+x} ]; then
  echo "Environment variable 'HOST_HOSTNAME' not set, we won't add the hostname metric."
else
  host_hostname=$(cat ${HOST_HOSTNAME})
  [ -d $COLLECTOR_TEXTFILE_DIR ] || mkdir -p $COLLECTOR_TEXTFILE_DIR
  echo "host{host=\"$host_hostname\", node=\"$(hostname)\"} 1" > $COLLECTOR_TEXTFILE_DIR/host_hostname.prom
fi

# if command starts with an option, prepend node-exporter binary
if [ "${1:0:1}" = '-' ]; then
  echo "$@"
  set -- $NODE_EXPORTER_BIN "$@"
fi

exec "$@"
