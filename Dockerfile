FROM      python:2.7

RUN       pip install redis==2.10.3
RUN       pip install flower==0.8.2

# Default port
EXPOSE    5555

# Variables with default that can be overruled by environment vars during docker run.
ENV       REDIS_HOST redis
ENV       REDIS_PORT 6379
ENV       REDIS_DATABASE 0

CMD       flower --broker=redis://$REDIS_HOST:$REDIS_PORT/$REDIS_DATABASE
