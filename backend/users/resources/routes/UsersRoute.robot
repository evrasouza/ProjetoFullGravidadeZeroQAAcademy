*** Settings ***
Documentation        Users route

Library              RequestsLibrary

*** Keywords ***
POST User
    [Arguments]       ${payload}
    
    ${response}       POST
    ...               ${API_URL}/users
    ...               json=${payload}
    ...               expected_status=any

    [Return]          ${response}