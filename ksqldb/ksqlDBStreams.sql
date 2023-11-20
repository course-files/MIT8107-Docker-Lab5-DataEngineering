-- Tutorial: https://developer.confluent.io/tutorials/working-with-nested-json/ksql.html
-- ############################ STAGE 1 ############################ 
-- The stream for the orderdetails table
CREATE STREAM orderdetails_stream (payload STRUCT<
  `orderNumber` INT,
  `productCode` VARCHAR,
  `quantityOrdered` INT,
  `priceEach` DOUBLE,
  `orderLineNumber` INT>)
 WITH (KAFKA_TOPIC='classicmodels.classicmodels.orderdetails',
       KEY_FORMAT='JSON', VALUE_FORMAT='JSON',
       PARTITIONS=1);

-- The stream for the orders table
CREATE STREAM orders_stream (payload STRUCT<
  `orderNumber` INT,
  `orderDate` DATE,
  `requiredDate` DATE,
  `shippedDate` DATE,
  `status` VARCHAR,
  `comments` STRING,
  `customerNumber` INT>)
 WITH (KAFKA_TOPIC='classicmodels.classicmodels.orders',
       KEY_FORMAT='JSON', VALUE_FORMAT='JSON',
       PARTITIONS=1);

-- The stream for the products table
CREATE STREAM products_stream (payload STRUCT<
  `productCode` VARCHAR,
  `productName` VARCHAR,
  `productLine` VARCHAR,
  `productScale` VARCHAR,
  `productVendor` VARCHAR,
  `productDescription` STRING,
  `quantityInStock` VARCHAR,
  `buyPrice` DOUBLE,
  `MSRP` DOUBLE>)
 WITH (KAFKA_TOPIC='classicmodels.classicmodels.products',
       KEY_FORMAT='JSON', VALUE_FORMAT='JSON',
       PARTITIONS=1);

-- The stream for the customers table
CREATE STREAM customers_stream (payload STRUCT<
  `customerNumber` INT,
  `customerName` VARCHAR,
  `contactLastName` VARCHAR,
  `contactFirstName` VARCHAR,
  `phone` VARCHAR,
  `addressLine1` VARCHAR,
  `addressLine2` VARCHAR,
  `city` VARCHAR,
  `state` VARCHAR,
  `postalCode` VARCHAR,
  `country` VARCHAR,
  `salesRepEmployeeNumber` INT,
  `creditLimit` DOUBLE>)
 WITH (KAFKA_TOPIC='classicmodels.classicmodels.customers',
       KEY_FORMAT='JSON', VALUE_FORMAT='JSON',
       PARTITIONS=1);

-- The stream for the productlines table
CREATE STREAM productlines_stream (payload STRUCT<
  `productLine` VARCHAR,
  `textDescription` VARCHAR>)
 WITH (KAFKA_TOPIC='classicmodels.classicmodels.productlines',
       KEY_FORMAT='JSON', VALUE_FORMAT='JSON',
       PARTITIONS=1);