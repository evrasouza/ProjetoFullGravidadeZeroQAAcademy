*** Settings ***
Documentation        Sessions route

Library              RequestsLibrary

*** Keywords ***
POST Session
    [Arguments]       ${payload}
    
    ${response}       POST
    ...               ${API_URL}/sessions
    ...               json=${payload}
    ...               expected_status=any

    [Return]          ${response}