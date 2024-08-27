#!/bin/bash

PROJECT_ID=`gcloud config get project`

bq mk --location=us kaggle_retail

bq rm -f -t $PROJECT_ID:kaggle_retail.stores

bq --location=us load \
--source_format=CSV \
--skip_leading_rows=1 \
$PROJECT_ID:kaggle_retail.stores \
"gs://${PROJECT_ID}-kaggle-retail/stores data-set.csv" \
stores.json

bq rm -f -t $PROJECT_ID:kaggle_retail.sales

bq --location=us load \
--source_format=CSV \
--skip_leading_rows=1 \
$PROJECT_ID:kaggle_retail.sales \
"gs://${PROJECT_ID}-kaggle-retail/sales data-set.csv" \
sales.json

bq rm -f -t $PROJECT_ID:kaggle_retail.Features

bq --location=us load \
--source_format=CSV \
--skip_leading_rows=1 \
$PROJECT_ID:kaggle_retail.Features \
"gs://${PROJECT_ID}-kaggle-retail/Features data set.csv" \
Features.json


