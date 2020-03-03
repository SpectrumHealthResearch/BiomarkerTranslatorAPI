from flask_restful import Resource
from ..common.query import Query


class Biomarker(Resource):

    def get(self, curie=None):
        if not curie:
            return None
        return ({'curie': curie})

    def post(self, curie):
        if not curie:
            return None
        return ({'curie': curie})