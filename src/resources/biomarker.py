from flask_restful import Resource
from ..common.query import Query


class Biomarker(Resource):

    def get(self, alias=None):
        if not alias:
            return None
        return ({'alias': alias})

    def post(self, alias):
        if not alias:
            return None
        return ({'alias': alias})