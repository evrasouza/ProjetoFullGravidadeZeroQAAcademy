*** Settings ***
Documentation    Signup Test Suite

Resource         ../resource/Base.robot

Test Setup       Start Session
Test Teardown    Finish Session

*** Test Cases ***
Register a new user
    [Tags]        new_user    smoke

    ${user}        Factory User    faker

    Go To Signup form
    Fill Signup Form    ${user}
    Submit Signup Form
    User Should Be Registered

Duplicate user
    [Tags]        attempt_signup

    ${user}                   Factory User    faker
    Add User From Database    ${user}

    Go To Signup form
    Fill Signup Form    ${user}
    Submit Signup Form
    Modal Content Should Be    Já temos um usuário com o e-mail informado.

Wrong Email
    [Tags]        attempt_signup

    ${user}       Factory User    wrong_email

    Go To Signup form
    Fill Signup Form    ${user}
    Submit Signup Form
    Alert span Should Be    O email está estranho

Required Fields
    [Tags]        attempt_signup        rr_fields

    @{expected_alerts}    Create List
    ...                   Cadê o seu nome?
    ...                   E o sobrenome?
    ...                   O email é importante também!
    ...                   Agora só falta a senha!

    Go To Signup form
    Submit Signup Form
    Alert Spans Should Be    ${expected_alerts}


Short Password
    [Tags]        attempt_signup        short_pass
    [Template]    Signup With Short Pass
    1
    12
    123
    1234
    12345
    a
    a2
    ab3
    ab3c
    a23bc
    -1
    acb#1

*** Keywords ***
Signup With Short Pass
    [Arguments]        ${short_pass}

    ${user}       Create Dictionary
    ...           name=Everton            lastname=Souza
    ...           email=evra@gmail.com    password=${short_pass}

    Go To Signup form
    Fill Signup Form    ${user}
    Submit Signup Form
    Alert span Should Be    Informe uma senha com pelo menos 6 caracteres
    