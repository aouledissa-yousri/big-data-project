# Use an official OpenJDK runtime as a parent image
FROM openjdk:8-jdk-alpine

# Set the Hadoop version
ARG HADOOP_VERSION=3.3.1
ENV HADOOP_VERSION ${HADOOP_VERSION}

# Install required packages
RUN apk update && apk add --no-cache \
    bash \
    curl \
    openssh \
    rsync \
    python3 \
    && rm -rf /var/cache/apk/*


# Download and install Hadoop
RUN curl -fsSL https://archive.apache.org/dist/hadoop/core/hadoop-${HADOOP_VERSION}/hadoop-${HADOOP_VERSION}.tar.gz -o hadoop.tar.gz \
    && tar -xvf hadoop.tar.gz \
    && mv hadoop-${HADOOP_VERSION} /usr/local/hadoop \
    && rm hadoop.tar.gz

# Set Hadoop environment variables
ENV HADOOP_HOME /usr/local/hadoop
ENV PATH $HADOOP_HOME/bin:$HADOO_HOME/sbin:$PATH
ENV HADOOP_CONF_DIR $HADOOP_HOME/etc/hadoop

# Expose necessary ports
EXPOSE 50070 50075 8088 9000 9864

# Default entrypoint
COPY start.sh /usr/local/hadoop/bin/start.sh
RUN chmod +x /usr/local/hadoop/bin/start.sh

CMD ["/bin/bash", "/usr/local/hadoop/bin/start.sh"]
