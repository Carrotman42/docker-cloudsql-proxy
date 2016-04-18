FROM golang

RUN go get github.com/GoogleCloudPlatform/cloudsql-proxy/cmd/cloud_sql_proxy

EXPOSE 3306

CMD echo $GCLOUD_ACCOUNT_JSON | base64 --decode > /gcloud-account.json && \
  cloud_sql_proxy \
    -dir=/cloudsql \
    -instances=$INSTANCE_NAME=tcp:0.0.0.0:3306 \
    -credential_file=/gcloud-account.json
