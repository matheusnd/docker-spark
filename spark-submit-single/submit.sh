#!/bin/bash

export SPARK_HOME=/spark

/wait-for-step.sh

/execute-step.sh
if [ -f "${SPARK_APPLICATION_PYTHON_LOCATION}" ]; then
    echo "Submit application ${SPARK_APPLICATION_PYTHON_LOCATION}"
    echo "Passing arguments ${SPARK_APPLICATION_ARGS}"
    PYSPARK_PYTHON=python3 /spark/bin/spark-submit \
        ${SPARK_SUBMIT_ARGS} \
        ${SPARK_APPLICATION_PYTHON_LOCATION} ${SPARK_APPLICATION_ARGS}
else
    echo "Not recognized application."
fi

/finish-step.sh
