from flask_restful import Resource, abort
from json import loads
from ..common.query import Query


class Patient(Resource):

    table = 'patient'
    sql_find_records = ('select a.record_id '
                        'from {} a '
                        'where a.patient_id = %(patient_id)s')
    sql_retrieve_json = ('select a.body '
                         'from json a '
                         'where a.record_id in %(record_id)s')

    def get(self, patient_id=None):
        if not patient_id:
            abort(400)

        q = Query()
        q.cursor.execute(
                self.sql_find_records.format(self.table),
                {'patient_id': patient_id})
        res = q.cursor.fetchall()

        if not res:
            abort(404)

        q.cursor.execute(
                self.sql_retrieve_json,
                {'record_id': [i['record_id'] for i in res]})
        res = q.cursor.fetchall()

        return [loads(i['body']) for i in res]
