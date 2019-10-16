FROM matheusnd/spark-base:2.4.4-hadoop2.7-awslib

LABEL maintainer="Matheus Dantas <matheus.nery@gmail.com>"

COPY submit.sh /

ENV SPARK_MASTER_NAME spark-submit-single
ENV SPARK_MASTER_PORT 7077
ENV SPARK_APPLICATION_PYTHON_LOCATION /app/app.py
ENV SPARK_APPLICATION_ARGS ""

EXPOSE 8080 7077 6066

CMD ["/bin/bash", "/submit.sh"]
