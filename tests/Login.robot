*** Settings ***
Documentation        Login Test Suite

Resource   ../resource/Base.robot

Test Setup       Start Session
Test Teardown    Finish Session

*** Test Cases ***
User Login

    ${user}                   Factory User Login
    
    Go to Login Page
    Fill Credentials        ${user}
    Submit Credentials
    User Should Be Logged In    ${user}

Incorrect Pass
    
    ${user}        Create Dictionary        email=everton@souza.com.br        password=abc123

    Go to Login Page
    Fill Credentials    ${user}
    Submit Credentials
    Modal Content Should Be    Usuário e/ou senha inválidos.
