./kafka-topics.sh --list --bootstrap-server 10.50.16.2:9092 10.50.16.3:9092 10.50.16.4:9092

./kafka-topics.sh --create --topic risk.platform.rba.monitor.topic.stg \
    --bootstrap-server 10.50.16.2:9092 10.50.16.3:9092 10.50.16.4:9092 \
    --create --partitions 3 \ 
    --replication-factor 1 \

./kafka-topics.sh --create --topic risk.platform.rba.monitor.topic.prod --bootstrap-server 10.50.16.2:9092 10.50.16.3:9092 10.50.16.4:9092

./kafka-topics.sh --create --topic risk.platform.rba.monitor.topic.prod \
    --bootstrap-server 10.50.16.2:9092 10.50.16.3:9092 10.50.16.4:9092 \
    --create --partitions 3 --replication-factor 1 \