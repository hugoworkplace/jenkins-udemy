#!/bin/bash

crumb=$(wget --user=admin --password=1234 --auth-no-challenge -q --output-document - 'http://jenkins.local:8080/crumbIssuer/api/xml?xpath=concat(//crumbRequestField,":",//crumb)')
curl --user admin:1234 -H "$crumb" -X POST "http://jenkins.local:8080/job/backup-sql-to-s3/buildWithParameters?DB_HOST=db-host&DATABASE_NAME=testdb&BUCKET=jenkins-mysql-practice"
