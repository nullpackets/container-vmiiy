#!/bin/sh
set -ex

if [ ${FLASK_DEBUG} ]; then

    flask run --host 0.0.0.0 --port 5000
else
    # Start gunicorn, listening on port 500, access log to stdout
    exec gunicorn -w 4 -b '0.0.0.0:5000' --access-logfile=- 'app:app'
fi