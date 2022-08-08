from behave import *
from endpoints.authentication_api.login import LoginAPI
from endpoints.data_api.list_occupations import ListOccupationAPI
from automation_core.util.DeserializationJsonObject import Deserialization

use_step_matcher("parse")


@given('call Login API with partner username as "{userName}" and password as "{passWord}"')
def callLoginAPI(context, userName, passWord):
    loginAPI = LoginAPI()
    response = loginAPI.login(userName, passWord)
    context.cookie = loginAPI.getResponseCookie(response.cookies)


@when('call List Occupation API to get list of all occupations')
def callListOccupationAPI(context):
    occupationAPI = ListOccupationAPI()
    context.response = occupationAPI.getListOccupation(context.cookie)


@then('the response status code will be "{statusCode}"')
def verifyResponseStatusCode(context, statusCode):
    assert context.response.status_code == int(statusCode)


@then('the response data will be')
def verifyResponseData(context):
    expectedResponseData = Deserialization(context.text)
    actualResponseData = Deserialization(context.response.text)
    if expectedResponseData.__dict__.keys().__contains__("get_list"):
        assert expectedResponseData.get_list == actualResponseData.get_list
    else:
        assert expectedResponseData == actualResponseData
