from flask_restful import abort


def resource_not_found(resource):
    abort(404, 'Resource {} not found'.format(resource))
