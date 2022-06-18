*** Settings ***
Documentation        Login Test Suite

Resource   ../resource/Base.robot

Test Setup       Start Session
Test Teardown    Finish Session

*** Test Cases ***
User Login

    ${user}                   Factory User    login
    
    Go to Login Page
    Fill Credentials        ${user}
    Submit Credentials
    User Should Be Logged In    ${user}

Incorrect Pass
    [Tags]    i_pass

    ${user}        Create Dictionary        email=everton@souza.com.br        password=abc123

    Go to Login Page
    Fill Credentials    ${user}
    Submit Credentials
    Modal Content Should Be    Usuário e/ou senha inválidos.

User Not Found
    [Tags]    user_404
         
    ${user}        Create Dictionary        email=everton@404.com.br        password=abc123

    Go to Login Page
    Fill Credentials    ${user}
    Submit Credentials
    Modal Content Should Be    Usuário e/ou senha inválidos.

Incorrect Email
    [Tags]    i_email
         
    ${user}        Create Dictionary        email=everton.com.br        password=abc123

    Go to Login Page
    Fill Credentials    ${user}
    Submit Credentials
    Should Be Type Email

Required Email
    [Tags]        attempt_login       rr_email

    ${user}        Create Dictionary        email=${EMPTY}    password=abc123

    Go to Login Page
    Fill Input Password    ${user}
    Submit Credentials
    Alert span Should Be    E-mail obrigatório

Required Password
    [Tags]        attempt_login        rr_password

    ${user}        Create Dictionary        email=everton@404.com.br    password=${EMPTY}
    
    Go to Login Page
    Fill Input Email    ${user}
    Submit Credentials
    Alert span Should Be    Senha obrigatória

Required Fields
    [Tags]        attempt_login        rr_fields

    @{expected_alerts}    Create List
    ...                   E-mail obrigatório
    ...                   Senha obrigatória

    Go to Login Page
    Submit Credentials
    Alert Spans Should Be    ${expected_alerts}
