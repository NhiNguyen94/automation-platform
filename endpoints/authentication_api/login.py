import requests
from automation_core.config.Env import Env


class LoginAPI:
    base_url = Env.QA_BASE_URL
    loginUrl = "{baseUrl}/v1/auth/login"

    def login(self, user, password):
        url = self.loginUrl.format(baseUrl=self.base_url)
        payload = {
            'username': user,
            'password': password
        }
        return requests.post(url, json=payload)

    def getResponseCookie(self, cookie):
        stringCookie = ""
        for c in cookie:
            stringCookie += c.name + "=" + c.value + ";"
        return stringCookie
