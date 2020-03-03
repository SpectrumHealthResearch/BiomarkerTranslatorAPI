from flask_restful import Resource
from ..common.query import Query


class Gene(Resource):

    def get(self, curie=None):
        q = Query()
        if not curie:
            q.cursor.execute(
                """select a.curie, a.gene, a.gene_att, a.att_val
                   from gene a""")
        else:
            q.cursor.execute(
                """select a.curie, a.gene, a.gene_att, a.att_val
                   from gene a
                   where a.curie = %(curie)s""", {'curie': curie})

        return q.cursor.fetchall()