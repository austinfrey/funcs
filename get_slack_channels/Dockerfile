FROM alpine:latest

ADD https://github.com/alexellis/faas/releases/download/0.5.1-alpha/fwatchdog /usr/bin
RUN chmod +x /usr/bin/fwatchdog

ADD package.json /

RUN apk add --no-cache nodejs && \
    npm install -g coffeescript && \
    npm install

ADD . /

ENV fprocess="coffee index.coffee"

CMD ["fwatchdog"]
