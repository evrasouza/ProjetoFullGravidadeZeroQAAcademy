*** Settings ***
Documentation        Authentication Actions

Library    Browser

Resource   ../Base.robot

*** Keywords ***
Go to Login Page
    Go To                      ${URL_BASE}
    Wait For Elements State    css=.login-form        visible    5

Fill Credentials
    [Arguments]        ${user}

    Fill Text          id=email        ${user}[email]
    Fill Text          id=password     ${user}[password]

Submit Credentials
    Click              css=.submit-button >> text=Entrar

User Should Be Logged In
    [Arguments]        ${user}

    ${element}              Set Variable    css=a[href="/profile"]
    ${expected_fullname}    Set Variable    ${user}[name] ${user}[lastname]

    Wait For Elements State    ${element}    visible    5
    Get Text                   ${element}    equal      ${expected_fullname}
