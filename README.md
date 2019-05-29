# kafka-cli
Kafka CLI Docker Image

inspired by https://github.com/taion809/kafka-cli

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
 docker-compose run kafka-cli kafka-console-consumer.sh --bootstrap-server kafka:9092 --topic test --from-beginning
``` 

## Run producer
```
 docker-compose run kafka-cli kafka-console-producer.sh --broker-list kafka:9092 --topic test
```
Try to submit some messages via console of producer. Consumer will echoing them.

# Kubernetes
Start kafka-cli pod within some namespace (eg. `dev`) 
```
 kubectl -n dev apply -f k8s.yml
```                                     
Then run
```
  kubectl -n dev 
```
