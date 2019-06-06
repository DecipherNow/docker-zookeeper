#   Copyright 2019 Decipher Technology Studios
#
#   Licensed under the Apache License, Version 2.0 (the "License");
#   you may not use this file except in compliance with the License.
#   You may obtain a copy of the License at
#
#       http://www.apache.org/licenses/LICENSE-2.0
#
#   Unless required by applicable law or agreed to in writing, software
#   distributed under the License is distributed on an "AS IS" BASIS,
#   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#   See the License for the specific language governing permissions and
#   limitations under the License.

FROM alpine:3.9

LABEL maintainer=engineering@deciphernow.com

ARG VERSION

ENV INIT_LIMIT 10
ENV LOG_LEVEL INFO
ENV SERVER localhost
ENV SERVERS localhost
ENV SYNC_LIMIT 5
ENV TICK_TIME 2000

RUN apk add --no-cache \
  bash \
  curl \
  openjdk8 \
  ruby

WORKDIR /opt/apache/zookeeper

RUN curl -L https://www-us.apache.org/dist/zookeeper/zookeeper-${VERSION}/apache-zookeeper-${VERSION}-bin.tar.gz | tar -xz --strip-components=1

COPY /files /

RUN chown -R 0:0 /opt/apache/zookeeper /var/lib/zookeeper
RUN chmod -R g=u /opt/apache/zookeeper /var/lib/zookeeper

EXPOSE 2181/tcp
EXPOSE 2888/tcp
EXPOSE 3888/tcp
USER 1000
VOLUME /var/lib/zookeeper/data
VOLUME /var/lib/zookeeper/log

ENTRYPOINT ["/usr/local/bin/entrypoint"]

CMD ["/opt/apache/zookeeper/bin/zkServer.sh", "start-foreground"]
