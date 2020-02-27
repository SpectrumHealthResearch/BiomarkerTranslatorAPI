#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Biomarker Translator API
"""
from flask import Flask
from flask_restful import Api, reqparse
from .resources.biomarker import Biomarker
from .resources.disease   import Disease
from .resources.drug      import Drug
from .resources.patient   import Patient


app = Flask(__name__)
api = Api(app)

# parser = reqparse.RequestParser()
# parser.add_argument('foo')

api.add_resource(Biomarker, '/biomarker', '/biomarker/<string:alias>')
api.add_resource(Disease,   '/disease',   '/disease/<string:alias>')
api.add_resource(Drug,      '/drug',      '/drug/<string:alias>')
api.add_resource(Patient,   '/patient',   '/patient/<string:patient_id>')


if __name__ == "__main__":
    app.run(debug=True)
