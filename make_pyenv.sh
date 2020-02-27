#!/bin/bash
test -d pyenv && echo "Environment already exists" >&2 && exit 1

pip3 install --user virtualenv
virtualenv pyenv
source pyenv/bin/activate
pip install flask

echo -e "New environment 'pyenv' installed\n" \
        "Use 'source pyenv/bin/activate' to activate" >&2
