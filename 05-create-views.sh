#!/bin/bash

PROJECT_ID=`gcloud config get project`

bq mk --location=us kaggle_retail_views

# View Sales Store 1
bq rm -f -t $PROJECT_ID:kaggle_retail_views.sales_store_1

bq mk \
--use_legacy_sql=false \
--view \
"""
SELECT    ST.Store,
          ST.Type,
          ST.Size,
          SA.Dept,
          SA.Date,
          SA.Weekly_Sales,
          SA.IsHoliday

FROM ${PROJECT_ID}.kaggle_retail.stores ST

LEFT JOIN ${PROJECT_ID}.kaggle_retail.sales SA
ON ST.Store = SA.Store 

WHERE ST.Store = 1
ORDER BY Date,Store,Dept
""" \
kaggle_retail_views.sales_store_1


# View Sales Store 2
bq rm -f -t $PROJECT_ID:kaggle_retail_views.sales_store_2

bq mk \
--use_legacy_sql=false \
--view \
"""
SELECT    ST.Store,
          ST.Type,
          ST.Size,
          SA.Dept,
          SA.Date,
          SA.Weekly_Sales,
          SA.IsHoliday

FROM ${PROJECT_ID}.kaggle_retail.stores ST

LEFT JOIN ${PROJECT_ID}.kaggle_retail.sales SA
ON ST.Store = SA.Store 

WHERE ST.Store = 2
ORDER BY Date,Store,Dept
""" \
kaggle_retail_views.sales_store_2