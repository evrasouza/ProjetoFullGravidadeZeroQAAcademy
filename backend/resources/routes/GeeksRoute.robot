*** Settings ***
Documentation        Geeks route

Library              RequestsLibrary

*** Keywords ***

POST Geek
    [Arguments]       ${token}        ${payload}


    ${headers}        Create Dictionary        Authorization=${token}
    
    ${response}       POST
    ...               ${API_GEEKS}/geeks
    ...               json=${payload}
    ...               headers=${headers}
    ...               expected_status=any

    [Return]          ${response}
