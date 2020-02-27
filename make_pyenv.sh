#!/bin/bash
if test -d pyenv; then
  source pyenv/bin/activate
  echo "Environment already exists" >&2
else
  pip3 install --user virtualenv
  virtualenv pyenv
  source pyenv/bin/activate
  pip install $(<packages)
  echo -e "New environment 'pyenv' installed" \
          "\nUse 'source pyenv/bin/activate' to activate" >&2
fi

