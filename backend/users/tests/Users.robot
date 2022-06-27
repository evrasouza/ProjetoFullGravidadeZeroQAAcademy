*** Settings ***
Documentation        Session route test suite

Library              RequestsLibrary

Resource             ../resources/Base.robot
Resource             ../resources/Helpers.robot

*** Test Cases ***
Add New User
    
    ${user}               Factory New User

    Remove User           ${user}

    ${response}           POST User      ${user}
    Status Should Be      201            ${response}     
