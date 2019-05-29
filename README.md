# kafka-cli
Kafka CLI Docker Image based on Alpine Linux distribution with smaller footprint

Inspired by https://github.com/taion809/kafka-cli

# Build
```
 docker-compose build
```                
# Running demo
```
   docker-compose up -d
``` 

## Run consumer
```
 docker-compose exec kafka-cli kafka-console-consumer.sh --bootstrap-server kafka:9092 --topic test --from-beginning
``` 

## Run producer
```
 docker-compose exec kafka-cli kafka-console-producer.sh --broker-list kafka:9092 --topic test
```
Try to submit some messages via console of producer. Consumer will echoing them.

# Kubernetes
_Assuming, Kafka cluster already running in Kubernetes_

Start kafka-cli pod within some namespace (eg. `dev`):
```
 kubectl -n dev apply -f k8s.yml
```                  
Create topic if doesn't exist:
```                                   
 kubectl -n dev exec -it kafka-cli --  kafka-topics.sh --create --bootstrap-server kafka:9092 --topic test --replication-factor 1 --partitions 1
```
Then run consumer with command: 
```
 kubectl -n dev exec -it kafka-cli -- kafka-console-consumer.sh --bootstrap-server kafka:9092 --topic test --from-beginning
```
Produce some messages:
```         
 kubectl -n dev exec -it kafka-cli --  kafka-console-producer.sh --broker-list kafka:9092 --topic test
```

