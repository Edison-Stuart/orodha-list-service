from flask_restx import Namespace, Resource

list_ns = Namespace(
    "lists",
    description='List related operations',
    path="/list"
    )

# class SomeResource(Resource):
