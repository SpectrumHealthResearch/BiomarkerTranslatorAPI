#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Biomarker Translator API
"""
from flask import Flask
from flask_restful import Api
from flasgger import Swagger
from .resources.biomarker import Biomarker
from .resources.disease   import Disease
from .resources.drug      import Drug
from .resources.patient   import Patient


app = Flask(__name__)
api = Api(app)
app.config['SWAGGER'] = {
    'title': 'Biomarker Translator API',
    'doc_dir': './docs/',
    'uiversion': 2,
}
swagger = Swagger(app, parse=True)

api.add_resource(Biomarker, '/biomarker/<string:name>')
api.add_resource(Disease,   '/disease/<string:name>')
api.add_resource(Drug,      '/drug/<string:name>')
api.add_resource(Patient,   '/patient/<string:patient_id>')
