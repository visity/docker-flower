#!/bin/bash

set -ex

# Add flower as command if needed
if [ "${1:0:1}" = '-' ]; then
	set -- flower "$@"
fi

# Step down via gosu  
if [ "$1" = 'flower' ]; then
	exec gosu flower "$@" --broker=redis://$REDIS_HOST:$REDIS_PORT/$REDIS_DATABASE
fi

# As argument is not related to flower,
# then assume that user wants to run his own process,
# for example a `bash` shell to explore this image
exec "$@"