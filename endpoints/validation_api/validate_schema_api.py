import requests
from automation_core.config.Env import Env


def getDefaultHeader():
    return {"accept": "application/json; version=1"}


class ValidateSchemaAPI:
    base_url = Env.QA_BASE_URL
    validateSchemaUrl = "{baseUrl}/schemas/{schema_name}/validation"

    # Methods to get API Url
    def getValidateSchemaUrl(self, schema):
        return self.validateSchemaUrl.format(baseUrl=self.base_url, schema_name=schema)

    def validateSchema(self, schema, payloadData):
        url = self.getValidateSchemaUrl(schema=schema)
        header = getDefaultHeader()
        return requests.post(url, headers=header, json=payloadData)
