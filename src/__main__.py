#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Biomarker Translator API Debug Mode
"""
from .api import app


app.run(debug=True)