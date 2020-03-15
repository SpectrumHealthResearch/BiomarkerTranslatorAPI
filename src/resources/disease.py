from flask_restful import Resource, abort
from json import loads
from ..common.query import Query


class Disease(Resource):

    def get(self, name=None):
        if not name:
            abort(400)

        q = Query()

        # Get all records matching a name
        q.cursor.execute(
            """select a.record_id
               from disease a
               where a.disease_name = %(name)s""",
               {'name': name})
        res = q.cursor.fetchall()

        if not res:
            abort(404)

        # Get the JSON object matching the record_id(s)
        q.cursor.execute(
            """select a.body
               from json a
               where a.record_id in %(record_id)s""",
               {'record_id': [i['record_id'] for i in res]})
        res = q.cursor.fetchall()


        return [loads(i['body']) for i in res]
