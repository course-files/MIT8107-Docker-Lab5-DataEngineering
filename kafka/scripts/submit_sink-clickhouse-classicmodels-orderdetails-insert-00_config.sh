#!/usr/bin/env bash

curl -X DELETE http://localhost:8083/connectors/sink-clickhouse-classicmodels-orderdetails-insert-00

curl -i -X PUT -H "Content-Type:application/json" \
  http://localhost:8083/connectors/sink-clickhouse-classicmodels-orderdetails-insert-00/config \
  -d '{
            "connector.class": "io.confluent.connect.jdbc.JdbcSinkConnector",
            "connection.url": "jdbc:clickhouse://clickhouse-server:8123/default",
            "table.name.format": "payments",
            "tasks.max": "1",
            "topics": "classicmodels.classicmodels.payments",
            "insert.mode": "insert",
            "pk.mode": "record_key",
            "pk.fields": "customerNumber, checkNumber",
            "auto.create": "true",
            "auto.evolve": "true",
            "key.converter": "org.apache.kafka.connect.json.JsonConverter",
            "value.converter": "org.apache.kafka.connect.json.JsonConverter"
    }'