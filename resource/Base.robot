*** Settings ***
Documentation        Base Test

Library    Browser
Library    factories/User.py

Resource   actions/AuthActions.robot
Resource   actions/SignupActions.robot

Resource    Database.robot
Resource    Helpers.robot

*** Variables ***
${URL_BASE}        https://getgeeks-evra.herokuapp.com

*** Keywords ***
Start Session
    New Browser    chromium        headless=false        slowMo=00:00:00
    New Page       ${URL_BASE}

Finish Session
    Take Screenshot