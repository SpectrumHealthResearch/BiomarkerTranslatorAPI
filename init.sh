#!/bin/bash
if test -d flask; then
  source flask/bin/activate
  echo "Environment already exists" >&2
else
  pip3 install --user virtualenv
  virtualenv flask
  source flask/bin/activate
  pip install $(<packages)
  echo -e "New environment 'flask' installed" \
          "\nUse 'source flask/bin/activate' to activate" \
          "\nUse 'deactivate' to deactivate the virtualenv" >&2
fi
