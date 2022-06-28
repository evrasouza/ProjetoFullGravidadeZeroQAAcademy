*** Settings ***
Documentation        Session route test suite

Library              RequestsLibrary

Resource             ../resources/Base.robot
Resource             ../resources/Helpers.robot

*** Test Cases ***
Add New User
    
    ${user}               Factory New User

    Remove User           ${user}

    ${response}           POST User          ${user}
    Status Should Be      201                ${response}

    ${user_id}            Set Variable       ${response.json()}[id]
    Should Be True        ${user_id} > 0

Get User Data
    ${user}               Factory Get User
    POST User             ${user}
    
    ${token}              Get Token             ${user}
    ${response}           GET User              ${token}
    Status Should Be      200                   ${response}

    Should Be Equal As Strings    ${user}[name]     ${response.json()}[name]
    Should Be Equal As Strings    ${user}[email]    ${response.json()}[email]

    Should Be Equal As Strings    None              ${response.json()}[whatsapp]
    Should Be Equal As Strings    None              ${response.json()}[avatar]
    Should Be Equal As Strings    False             ${response.json()}[is_geek]

Remove User
    
    # Dado que existe um usuario
    ${user}               Factory Remove User
    POST User             ${user}
    
    # E tenho um token desse usuario
    ${token}              Get Token             ${user}
    
    # Quando faco uma solicitacao de remocao na rota /users
    ${response}           DELETE User           ${token}
    
    # Entao deve retornar o status code 204 (no content)
    Status Should Be      204                   ${response}

    # E ao fazer uma requisicao GET, deve retornar o status code 404 (not found)
    ${response}           GET User              ${token}
    Status Should Be      404                   ${response}