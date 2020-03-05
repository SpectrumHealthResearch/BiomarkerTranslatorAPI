#!/bin/bash

set -e

# Python virtualenv
if [ -e flask ]; then
  source flask/bin/activate
  echo "Environment already exists" >&2
else
  pip3 install --user virtualenv
  python3 -m virtualenv flask
  source flask/bin/activate
  pip install -r requirements.txt
  echo -e "New environment 'flask' installed" \
          "\nUse 'source flask/bin/activate' to activate" \
          "\nUse 'deactivate' to deactivate the virtualenv" >&2
fi

# Configuration file
if [ ! -e .env ]; then

  # Create a configuration file for database settings
  cat >.env <<EOF
DB_HOST=
DB_USER=
DB_PASS=
DB_SCHEMA=
EOF

  # Keeping the file secret
  chmod 600 .env
fi
