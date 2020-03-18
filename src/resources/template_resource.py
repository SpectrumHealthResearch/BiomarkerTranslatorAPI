from flask_restful import Resource, abort
from json import loads
from ..common.query import Query


class TemplateResource(Resource):

    table = ''
    sql_find_records = ('select a.record_id '
                        'from {} a '
                        'where a.name = %(name)s')
    sql_retrieve_json = ('select a.body '
                         'from json a '
                         'where a.record_id in %(record_id)s')

    def get(self, name=None):
        if not name:
            abort(400)

        q = Query()

        # Get all records matching a name
        q.cursor.execute(
                self.sql_find_records.format(self.table),
                {'name': name})
        res = q.cursor.fetchall()

        if not res:
            abort(404)

        # Get the JSON object matching the record_id(s)
        q.cursor.execute(
                self.sql_retrieve_json,
                {'record_id': [i['record_id'] for i in res]})
        res = q.cursor.fetchall()

        return [loads(i['body']) for i in res]
