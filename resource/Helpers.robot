*** Settings ***
Documentation        Test Helpers

Library     factories/User.py
Resource    Actions.robot

*** Keywords ***
Add user
    [Arguments]    ${user}

    Go To Signup form
    Fill Signup Form    ${user}
    Submit Signup Form
    User Should Be Registered