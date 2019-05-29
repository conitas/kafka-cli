FROM azul/zulu-openjdk-alpine:11-jre
MAINTAINER Ghenadii Batalski <ghenadii.batalski@itas-gmbh.de>

ENV KAFKA_VERSION=2.2.0
ENV KAFKA_URL=https://www-eu.apache.org/dist/kafka/${KAFKA_VERSION}/kafka_2.12-${KAFKA_VERSION}.tgz
ENV KAFKA_TEMP_FILE=/opt/kafka.tgz
ENV KAFKA_WORKDIR=/opt/kafka

ADD entry-point.sh /opt/entry-point.sh

RUN apk update && apk add bash && rm -rf /var/cache/apk/* \
 && chmod +x /opt/entry-point.sh \
 && wget ${KAFKA_URL} -O ${KAFKA_TEMP_FILE} \
 && mkdir -p ${KAFKA_WORKDIR} \
 && tar -xzpf ${KAFKA_TEMP_FILE} --strip-components=1 -C ${KAFKA_WORKDIR} \
 && rm ${KAFKA_TEMP_FILE}  \
 && rm -rf ${KAFKA_WORKDIR}/bin/windows

ENV PATH ${PATH}:/opt/kafka/bin

WORKDIR /opt
ENTRYPOINT ["/opt/entry-point.sh"]
