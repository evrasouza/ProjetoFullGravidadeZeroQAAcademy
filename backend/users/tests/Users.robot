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
