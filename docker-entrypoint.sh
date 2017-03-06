#!/bin/bash

set -ex

# Add curator as command if needed
if [ "${1:0:1}" = '-' ]; then
	set -- curator "$@"
fi

# Step down via gosu  
if [ "$1" = 'curator' ]; then
	exec gosu curator bash -c "curator --config config.yml actions.yml"
fi

# As argument is not related to curator,
# then assume that user wants to run his own process,
# for example a `bash` shell to explore this image
exec "$@"
