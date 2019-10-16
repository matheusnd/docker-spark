FROM alpine:3.10

LABEL maintainer="Gezim Sejdiu <g.sejdiu@gmail.com>, Giannis Mouchakis <gmouchakis@gmail.com>"

ENV ENABLE_INIT_DAEMON true
ENV INIT_DAEMON_BASE_URI http://identifier/init-daemon
ENV INIT_DAEMON_STEP spark_master_init

ENV SPARK_VERSION=2.4.4
ENV HADOOP_VERSION=2.7

ENV NEW_LIB="spark.jars	/hadoop/share/hadoop/tools/lib/aws-java-sdk-1.7.4.jar,/hadoop/share/hadoop/tools/lib/hadoop-aws-2.7.7.jar"

COPY wait-for-step.sh /
COPY execute-step.sh /
COPY finish-step.sh /
COPY hdfs-site.xml /

#COPY bde-spark.css /css/org/apache/spark/ui/static/timeline-view.css

RUN apk add --no-cache curl bash openjdk8-jre python3 py-pip nss libc6-compat \
      && ln -s /lib64/ld-linux-x86-64.so.2 /lib/ld-linux-x86-64.so.2 \
      && chmod +x *.sh \
      && wget https://archive.apache.org/dist/spark/spark-${SPARK_VERSION}/spark-${SPARK_VERSION}-bin-hadoop${HADOOP_VERSION}.tgz \
      && tar -xvzf spark-${SPARK_VERSION}-bin-hadoop${HADOOP_VERSION}.tgz \
      && mv spark-${SPARK_VERSION}-bin-hadoop${HADOOP_VERSION} spark \
      && rm spark-${SPARK_VERSION}-bin-hadoop${HADOOP_VERSION}.tgz \
      && wget http://mirror.nbtelecom.com.br/apache/hadoop/common/hadoop-2.7.7/hadoop-2.7.7.tar.gz \
      && tar -xvzf hadoop-2.7.7.tar.gz \
      && mv hadoop-2.7.7 hadoop \
      && rm hadoop-2.7.7.tar.gz \
      && cp /spark/conf/spark-defaults.conf.template spark-defaults.conf \
      && mv hdfs-site.xml /spark/conf \
      && echo ${NEW_LIB} >> /spark/conf/spark-defaults.conf \
      && cd /

#Give permission to execute scripts
RUN chmod +x /wait-for-step.sh && chmod +x /execute-step.sh && chmod +x /finish-step.sh

# Fix the value of PYTHONHASHSEED
# Note: this is needed when you use Python 3.3 or greater
ENV PYTHONHASHSEED 1
