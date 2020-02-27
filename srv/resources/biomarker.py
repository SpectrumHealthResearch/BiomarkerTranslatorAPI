from flask_restful import Resource


class Biomarker(Resource):

    def get(self, alias):
        return ({'alias': alias})

    def post(self, alias):
        return ({'alias': alias})