*** Settings ***
Documentation        Session route test suite

Library              RequestsLibrary

Resource             ../resources/Base.robot

*** Test Cases ***
Add New User
    
    ${payload}        Factory New User

    ${response}       POST User         ${payload}

    Status Should Be     201                   ${response}
        
