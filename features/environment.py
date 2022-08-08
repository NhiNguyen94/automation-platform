import os
from automation_core.util.cucumber_api.ScenarioService import ScenarioService
from automation_core.drivers.DriverManagerFactory import getDriverManager
from automation_core.config.Config import Config


def before_all(context):
    Config.driverType = context.config.userdata['driverType']
    Config.driverCapabilitiesFile = context.config.userdata['driverCapabilitiesFile']
    Config.capabilitiesItem = context.config.userdata['capabilitiesItem']
    scenarioService = ScenarioService()
    context.scenarioServices = scenarioService
    context.scenarioServices.start()
    context.driverType = context.config.userdata['driverType']
    context.urlAdminPage = context.config.userdata['localAdminUrl']
    context.adminUserName = context.config.userdata['localAdminUser']
    context.adminUserPassword = context.config.userdata['localAdminPass']


def before_scenario(context, scenario):
    print("Start running scenario " + scenario.name)


def after_scenario(context, scenario):
    context.scenarioServices.pushResult(scenario)
    print("End running scenario " + scenario.name)


def after_all(context):
    print("Finish all test scenarios....")
