*** Settings ***
Documentation        Base Test

Library    Browser
Library    factories/User.py

Resource    Actions.robot

*** Keywords ***
Start Session
    New Browser    chromium        headless=false        slowMo=00:00:00.5
    New Page       ${URL_BASE}

Finish Session
    Take Screenshot