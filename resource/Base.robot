*** Settings ***
Documentation        Base Test

Library    Browser
Library    factories/User.py

Resource   actions/_SharedActions.robot
Resource   actions/AuthActions.robot
Resource   actions/GeekActions.robot
Resource   actions/SignupActions.robot

Resource    Database.robot
Resource    Helpers.robot

*** Variables ***
${URL_BASE}        https://getgeeks-evra.herokuapp.com

*** Keywords ***
Start Session
    New Browser          chromium        headless=false        slowMo=00:00:00
    New Page             ${URL_BASE}

    Set Viewport Size    1280    768

Finish Session
    Take Screenshot    fullPage=true