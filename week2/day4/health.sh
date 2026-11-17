#!/bin/bash
for PORT in 80 8080 9999; do
    if curl -s -o /dev/null localhost:$PORT; then
        echo "Port $PORT: UP ✅"
    else
        echo "Port $PORT: DOWN ❌"
	echo "$(date) Port $PORT DOWN" >> ~/health.log
    fi
done
