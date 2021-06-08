#!/bin/bash
DB_HOST=$1
DB_PASSWORD=$2
DB_NAME=$3
AWS_SECRET=$4
BUCKET_NAME=$5

DATE=$(date +%H-%M-%S)
BACKUP=${DB_NAME}-${DATE}.sql

mysqldump --column-statistics=0 -u root -h ${DB_HOST} -p${DB_PASSWORD} ${DB_NAME} > /tmp/${DB_NAME}-${DATE}.sql  && \
	export AWS_ACCESS_KEY_ID=AKIAVFEJ3QM4WOQ7UJM4  && \
	export AWS_SECRET_ACCESS_KEY=$AWS_SECRET && \
	echo "uploading ${BACKUP} " && \
	/usr/local/bin/aws s3 cp /tmp/${DB_NAME}-${DATE}.sql s3://${BUCKET_NAME}/${BACKUP}
