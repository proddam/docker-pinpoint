#!/bin/bash
set -e
set -x

CLUSTER_ENABLE=${CLUSTER_ENABLE:-false}
CLUSTER_ZOOKEEPER_ADDRESS=${CLUSTER_ZOOKEEPER_ADDRESS:-localhost}

FLINK_CLUSTER_ENABLE=${FLINK_CLUSTER_ENABLE:-false}
FLINK_CLUSTER_ZOOKEEPER_ADDRESS=${FLINK_CLUSTER_ZOOKEEPER_ADDRESS:-localhost}

COLLECTOR_TCP_PORT=${COLLECTOR_TCP_PORT:-9994}
COLLECTOR_UDP_STAT_LISTEN_PORT=${COLLECTOR_UDP_STAT_LISTEN_PORT:-9995}
COLLECTOR_UDP_SPAN_LISTEN_PORT=${COLLECTOR_UDP_SPAN_LISTEN_PORT:-9996}

HBASE_HOST=${HBASE_HOST:-localhost}
HBASE_PORT=${HBASE_PORT:-2181}

DISABLE_DEBUG=${DISABLE_DEBUG:-true}

cp /assets/pinpoint-collector.properties /usr/local/tomcat/webapps/ROOT/WEB-INF/classes/pinpoint-collector.properties
cp /assets/hbase.properties /usr/local/tomcat/webapps/ROOT/WEB-INF/classes/hbase.properties

sed -i "s/cluster.enable=true/cluster.enable=${CLUSTER_ENABLE}/g" /usr/local/tomcat/webapps/ROOT/WEB-INF/classes/pinpoint-collector.properties
sed -i "s/cluster.zookeeper.address=localhost/cluster.zookeeper.address=${CLUSTER_ZOOKEEPER_ADDRESS}/g" /usr/local/tomcat/webapps/ROOT/WEB-INF/classes/pinpoint-collector.properties

sed -i "s/flink.cluster.enable=false/flink.cluster.enable=${FLINK_CLUSTER_ENABLE}/g" /usr/local/tomcat/webapps/ROOT/WEB-INF/classes/pinpoint-collector.properties
sed -i "s/flink.cluster.zookeeper.address=localhost/flink.cluster.zookeeper.address=${FLINK_CLUSTER_ZOOKEEPER_ADDRESS}/g" /usr/local/tomcat/webapps/ROOT/WEB-INF/classes/pinpoint-collector.properties

sed -i "s/collector.tcpListenPort=9994/collector.tcpListenPort=${COLLECTOR_TCP_PORT}/g" /usr/local/tomcat/webapps/ROOT/WEB-INF/classes/pinpoint-collector.properties
sed -i "s/collector.udpStatListenPort=9995/collector.udpStatListenPort=${COLLECTOR_UDP_STAT_LISTEN_PORT}/g" /usr/local/tomcat/webapps/ROOT/WEB-INF/classes/pinpoint-collector.properties
sed -i "s/collector.udpSpanListenPort=9996/collector.udpSpanListenPort=${COLLECTOR_UDP_SPAN_LISTEN_PORT}/g" /usr/local/tomcat/webapps/ROOT/WEB-INF/classes/pinpoint-collector.properties

sed -i "s/collector.receiver.span.worker.threadSize=32/collector.receiver.span.worker.threadSize=512/g" /usr/local/tomcat/webapps/ROOT/WEB-INF/classes/pinpoint-collector.properties
sed -i "s/collector.receiver.span.worker.queueSize=256/collector.receiver.span.worker.queueSize=4096/g" /usr/local/tomcat/webapps/ROOT/WEB-INF/classes/pinpoint-collector.properties

sed -i "s/hbase.client.host=localhost/hbase.client.host=${HBASE_HOST}/g" /usr/local/tomcat/webapps/ROOT/WEB-INF/classes/hbase.properties
sed -i "s/hbase.client.port=2181/hbase.client.port=${HBASE_PORT}/g" /usr/local/tomcat/webapps/ROOT/WEB-INF/classes/hbase.properties

if [ "$DISABLE_DEBUG" == "true" ]; then
    sed -i 's/level value="DEBUG"/level value="INFO"/' /usr/local/tomcat/webapps/ROOT/WEB-INF/classes/log4j.xml
fi

exec /usr/local/tomcat/bin/catalina.sh run
