import requests
from automation_core.config.Env import Env


class ListOccupationAPI:
    base_url = Env.QA_BASE_URL
    listOccupationUrl = "{baseUrl}/v1/data/occupations"

    def getListOccupation(self, cookie):
        header = {'Cookie': cookie}
        url = self.listOccupationUrl.format(baseUrl=self.base_url)
        return requests.get(url, headers=header)
