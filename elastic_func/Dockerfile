FROM aafrey/fwatchdog:alpine

RUN apk add --no-cache python py-pip && \
    pip install elasticsearch

ADD elastic_func.py /

ENV ELASTIC_URL=http://elasticURL.com
ENV fprocess="python elastic_fun.py"

CMD ["fwatchdog"]
