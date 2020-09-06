FROM maven:3.6.0-jdk-10
WORKDIR /test-robot-01/

RUN apt-get update && apt-get install -y --no-install-recommends wget jq curl vim nano
RUN wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
RUN dpkg -i google-chrome-stable_current_amd64.deb; apt-get -fy install

RUN curl -SsL https://downloads.gauge.org/stable | sed 's/latest/15176631/g' | sh -s -- --location=/usr/sbin/
RUN gauge telemetry off
RUN gauge install java --version 0.7.1
RUN gauge install json-report
RUN gauge install html-report --version 4.0.6

COPY ./bin /test-robot-01/bin/
COPY ./ /test-robot-01/
RUN chmod a+x /test-robot-01/bin/*

CMD ["sh", "-c", "/test-robot-01/bin/entrypoint.sh"]