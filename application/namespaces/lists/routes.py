from flask_restx import Namespace, Resource

list_ns = Namespace(
    "list",
    description='List related operations',
    url_prefix="/list"
    )

# class SomeResource(Resource):
