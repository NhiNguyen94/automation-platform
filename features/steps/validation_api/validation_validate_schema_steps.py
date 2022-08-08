import json

from behave import *
from behave import when
from endpoints.validation_api.validate_schema_api import ValidateSchemaAPI
from automation_core.util.DeserializationJsonObject import Deserialization

use_step_matcher("parse")


@when('call Validate Schema API to validate schema "{schema}" with following payload')
def callValidateSchemaAPI(context, schema):
    validateSchemaAPI = ValidateSchemaAPI()
    request = json.loads(context.text)
    context.response = validateSchemaAPI.validateSchema(schema, request)
