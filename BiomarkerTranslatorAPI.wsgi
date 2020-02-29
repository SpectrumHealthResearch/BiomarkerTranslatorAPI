#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
WSGI File

This is the _rough draft_ WSGI file. More development on this will be done
closer to production.


Reference:
    https://flask.palletsprojects.com/en/1.1.x/deploying/mod_wsgi/
"""
from os.path import join
from dotenv import load_dotenv

# Set project directory here
project_dir = ''

# This is for the .env config file
load_dotenv(dotenv_path=join(project_dir, '.env'))

# This is for the virtualenv
activate_this = join(project_dir, '/bin/activate_this.py')
with open(activate_this) as file_:
    exec(file_.read(), dict(__file__=activate_this))

from BiomarkerTranslatorAPI.api import app as application
