#!/bin/sh
# Setup yarn and build qmk_configurator inside the docker container.

set -e

# Set the API URL
sed "s;%API_URL%;${QMK_API_URL:-https://api.qmk.fm};g" /etc/nginx/nginx.conf.in > /etc/nginx/nginx.conf

cat << EOF
============================================================================
----------------------------------------------------------------------------
                ${QMK_API_URL:-https://api.qmk.fm}

----------------------------------------------------------------------------
============================================================================
EOF

# Start nginx
cat << EOF
============================================================================
----------------------------------------------------------------------------

QMK Configurator is ready to go! You can access it at the following address:

                         http://localhost:5000

If you have chosen a port other than 5000 you may have to adjust that URL.

----------------------------------------------------------------------------
============================================================================
EOF
nginx -g 'daemon off;'
