#!/bin/bash

echo $CASES
echo $ENV

cd /test-robot-01/test-robot-01 && mvn clean package -DskipTests
cd /test-robot-01/test-robot-01 && mvn gauge:execute -DspecsDir=$CASES -Denv=$ENV