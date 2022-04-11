import json


class Response:
    def __init__(self, body={}, error_message="", status_code=200) -> None:
        self.body = body
        self.error_message = error_message
        self.status_code = status_code
        self.default_headers = self.get_default_headers()

    def get_default_headers(self):
        return {
            "Access-Control-Allow-Origin": "*",
            "Access-Control-Allow-Headers": "Content-Type",
            "Access-Control-Allow-Methods": "OPTIONS,POST,GET,PUT,DELETE",
        }

    def format(self, headers={}):
        if self.error_message:
            return {
                "isBase64Encoded": False,
                "statusCode": self.status_code,
                "headers": self.get_default_headers(),
                "body": json.dumps({"error": {"message": self.error_message}}),
            }

        return {
            "isBase64Encoded": False,
            "statusCode": self.status_code,
            "headers": self.default_headers,
            "body": json.dumps(self.body),
        }


def build_response():
    data = {"resource": "Valuable resource data"}
    return Response(body=data)


def index(event, context):
    return build_response().format()


def list(event, context):
    return build_response().format()


def get(event, context):
    return build_response().format()


def post(event, context):
    return build_response().format()


def delete(event, context):
    return build_response().format()


def put(event, context):
    return build_response().format()
