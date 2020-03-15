#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Biomarker Translator API
"""
from flask import Flask
from flask_restful import Api
from .resources.biomarker import Biomarker
from .resources.disease   import Disease
from .resources.gene      import Gene
from .resources.drug      import Drug
from .resources.patient   import Patient


app = Flask(__name__)
api = Api(app)

api.add_resource(Biomarker, '/biomarker', '/biomarker/', '/biomarker/<string:name>')
api.add_resource(Disease,   '/disease',   '/disease/',   '/disease/<string:name>')
api.add_resource(Gene,      '/gene',      '/gene/',      '/gene/<string:name>')
api.add_resource(Drug,      '/drug',      '/drug/',      '/drug/<string:name>')
api.add_resource(Patient,   '/patient',   '/patient/',   '/patient/<string:patient_id>')
