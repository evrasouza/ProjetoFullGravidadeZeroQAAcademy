*** Settings ***
Documentation    Signup Test Suite

Resource         ../resource/Base.robot

Test Setup       Start Session
Test Teardown    Finish Session

*** Test Cases ***
Register a new user
    [Tags]        new_user

    ${user}        Factory User

    Go To Signup form
    Fill Signup Form    ${user}
    Submit Signup Form
    User Should Be Registered

Duplicate user
    [Tags]        attempt_signup

    ${user}                   Factory User
    Add User From Database    ${user}

    Go To Signup form
    Fill Signup Form    ${user}
    Submit Signup Form
    Modal Content Should Be    Já temos um usuário com o e-mail informado.

Wrong Email
    [Tags]        attempt_signup

    ${user}       Factory Wrong Email

    Go To Signup form
    Fill Signup Form    ${user}
    Submit Signup Form
    Alert span Should Be    O email está estranho

Required Fields
    [Tags]        attempt_signup        rr_fields

    Go To Signup form
    Submit Signup Form
    Alert span Should Be    Cadê o seu nome?
    Alert span Should Be    E o sobrenome?
    Alert span Should Be    O email é importante também!
    Alert span Should Be    Agora só falta a senha!


