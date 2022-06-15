*** Settings ***
Documentation        Base Test

Library    Browser
Library    factories/User.py

Resource    Actions.robot
Resource    Database.robot
Resource    Helpers.robot

*** Keywords ***
Start Session
    New Browser    chromium        headless=false        slowMo=00:00:00
    New Page       ${URL_BASE}

Finish Session
    Take Screenshot