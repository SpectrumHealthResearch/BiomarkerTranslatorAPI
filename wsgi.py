#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
WSGI File

This is the _rough draft_ WSGI file. More development on this will be done
closer to production.


Reference:
    https://flask.palletsprojects.com/en/1.1.x/deploying/mod_wsgi/
"""
from BiomarkerTranslatorAPI.api import app as application
