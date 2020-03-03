from flask_restful import Resource
from ..common.query import Query


class Drug(Resource):

    def get(self, curie=None):
        q = Query()
        if not curie:
            q.cursor.execute(
                """select a.curie, a.drug, a.target
                   from drug a""")
        else:
            q.cursor.execute(
                """select a.curie, a.drug, a.target
                   from drug a
                   where a.curie = %(curie)s""", {'curie': curie})

        return q.cursor.fetchall()