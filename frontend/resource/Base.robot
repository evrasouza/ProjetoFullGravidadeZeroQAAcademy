*** Settings ***
Documentation        Base Test

Library    Browser
Library    factories/User.py
Library    Utils.py
Library    String

Resource   actions/_SharedActions.robot
Resource   actions/AuthActions.robot
Resource   actions/GeekActions.robot
Resource   actions/SignupActions.robot

Resource    Database.robot
Resource    Helpers.robot
Resource    Services.robot

*** Variables ***
${URL_BASE}        https://getgeeks-evra.herokuapp.com

*** Keywords ***
Start Session
    New Browser          ${BROWSER}        headless=${HEADLESS}        slowMo=00:00:00
    New Page             ${URL_BASE}

    Set Viewport Size    1280    768

After Test

    ${shot_name}       Screenshot Name
    Take Screenshot    fullPage=true    filename=${shot_name}