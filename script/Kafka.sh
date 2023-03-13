./kafka-topics.sh --list --bootstrap-server 10.50.16.2:9092 10.50.16.3:9092 10.50.16.4:9092

./kafka-topics.sh --create --topic risk.platform.rba.monitor.topic.stg \
    --bootstrap-server 10.50.16.2:9092 10.50.16.3:9092 10.50.16.4:9092 \
    --create --partitions 3 \ 
    --replication-factor 1 \

./kafka-topics.sh --list --topic risk.platform.rba.verify_factor_result --bootstrap-server 10.50.16.2:9092 10.50.16.3:9092 10.50.16.4:9092 

./kafka-run-class.sh kafka.tools.GetOffsetShell \
  --broker-list 10.50.16.2:9092 10.50.16.3:9092 10.50.16.4:9092 \
  --topic risk.platform.rba.verify_factor_result \
  | awk -F  ":" '{sum += $3} END {print sum}'

./kafka-console-consumer.sh --bootstrap-server 10.50.16.2:9092 10.50.16.3:9092 10.50.16.4:9092 --topic risk.platform.rba.verify_factor_result --from-beginning  --formatter kafka.tools.DefaultMessageFormatter --property print.timestamp=true --property print.key=true --property print.value=true

./kafka-console-consumer.sh --bootstrap-server 10.50.16.2:9092 10.50.16.3:9092 10.50.16.4:9092 --topic risk.platform.rba.post_mortem --from-beginning  --formatter kafka.tools.DefaultMessageFormatter --property print.timestamp=true --property print.key=true --property print.value=true --max-messages 1

./kafka-console-consumer.sh --bootstrap-server 10.50.16.2:9092 10.50.16.3:9092 10.50.16.4:9092 --topic risk.platform.rba.post_mortem --formatter kafka.tools.DefaultMessageFormatter --property print.timestamp=true --property print.key=true --property print.value=true  --offset 32  --partition 0

./kafka-get-offsets.sh --bootstrap-server 10.50.16.2:9092 10.50.16.3:9092 10.50.16.4:9092 --topic risk.platform.rba.verify_factor_result

./kafka-console-consumer.sh --bootstrap-server 10.50.16.2:9092 10.50.16.3:9092 10.50.16.4:9092 --topic risk.platform.rba.verify_factor_result --formatter kafka.tools.DefaultMessageFormatter --property print.timestamp=true --property print.key=true --property print.value=true  --offset 46  --partition 0

./kafka-run-class.sh kafka.tools.GetOffsetShell --broker-list 10.50.16.2:9092 10.50.16.3:9092 10.50.16.4:9092 --topic risk.platform.rba.verify_factor_result

./kafka-console-consumer.sh --bootstrap-server 10.50.16.2:9092 10.50.16.3:9092 10.50.16.4:9092 --topic risk.platform.rba.verify_factor_result --offset 40 --partition 0