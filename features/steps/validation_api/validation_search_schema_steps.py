import json

from behave import *
from behave import when
from endpoints.validation_api.search_schema_api import SearchSchemaAPI
from automation_core.util.DeserializationJsonObject import Deserialization

use_step_matcher("parse")


@when('call Search Schema API to search schema "{schema}" with following payload')
def callSearchSchemaByNameAPI(context, schema):
    searchSchemaAPI = SearchSchemaAPI()
    request = json.loads(context.text)
    context.response = searchSchemaAPI.searchSchemaByName(schema, request)
