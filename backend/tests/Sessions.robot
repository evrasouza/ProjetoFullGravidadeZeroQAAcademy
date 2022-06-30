*** Settings ***
Documentation        Session route test suite

Library              RequestsLibrary

Resource             ../resources/Base.robot

*** Variables ***
&{inv_pass}        email=kate@hotmail.com.br    password=abc123
&{inv_email}       email=kate.hotmail.com.br    password=pwd123
&{email_404}       email=kate@404.com.br        password=pwd123
&{empty_email}     email=${EMPTY}               password=pwd123
&{wo_email}                                     password=pwd123
&{empty_pass}      email=kate@hotmail.com.br    password=${EMPTY}
&{wo_pass}         email=kate@hotmail.com.br

*** Test Cases ***
User session
    
    # Dado que temos um usuário cadastrado
    ${payload}        Factory Users Session    signup 
    POST User         ${payload}
    
    ${payload}        Factory Users Session    login

    # Quando faço uma requisição POST na rota /sessions
    ${response}       POST Session         ${payload}

    # Então o status code deve ser 200
    Status Should Be     200                   ${response}
    
    # E deve gerar um token JWT
    ${size}              Get Length            ${response.json()}[token]
    Should Be True         ${size} > 0
    
    # E esse token deve expirar em 10 dias
    Should Be Equal      10d                   ${response.json()}[expires_in]

Should Not Get token
    [Template]        Attempt POST Sessions

    ${inv_pass}        401        Unauthorized
    ${inv_email}       400        Incorrect email
    ${email_404}       401        Unauthorized
    ${empty_email}     400        Required email
    ${wo_email}        400        Required email
    ${empty_pass}      400        Required pass
    ${wo_pass}         400        Required pass

*** Keywords ***
Attempt POST Sessions
    [Arguments]          ${payload}    ${status_code}    ${error_message}

    ${response}          POST Session        ${payload}

    Status Should Be     ${status_code}      ${response}
    Should Be Equal      ${error_message}    ${response.json()}[error]