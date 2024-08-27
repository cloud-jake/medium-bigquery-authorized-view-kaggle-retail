#!/bin/bash

PROJECT_ID=`gcloud config get project`
gsutil mb -l us gs://${PROJECT_ID}-kaggle-retail

cd retaildataset/

gsutil cp *.csv gs://${PROJECT_ID}-kaggle-retail/


