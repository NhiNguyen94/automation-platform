import requests
from automation_core.config.Env import Env


def getDefaultHeader():
    return {"accept": "application/json; version=1"}


class SearchSchemaAPI:
    base_url = Env.QA_BASE_URL
    searchSchemaUrl = "{baseUrl}/schemas/{schema_name}"

    # Methods to get API Url
    def getSearchSchemaUrl(self, schema):
        return self.searchSchemaUrl.format(baseUrl=self.base_url, schema_name=schema)

    def searchSchemaByName(self, schema, payloadData):
        url = self.getSearchSchemaUrl(schema=schema)
        header = getDefaultHeader()
        return requests.post(url, headers=header, json=payloadData)
