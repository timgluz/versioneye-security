FROM        versioneye/ruby-base:2.4.12
MAINTAINER  Robert Reiz <reiz@versioneye.com>

ADD . /app

RUN apt-get update && apt-get install -y supervisor unzip; \
    cp /app/supervisord.conf /etc/supervisord.conf; \
    cd /app/ && bundle install;

CMD /usr/bin/supervisord -c /etc/supervisord.conf
