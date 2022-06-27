*** Settings ***
Documentation        Session route test suite

Library    RequestsLibrary
Library    String


*** Variables ***
${API_URL}        https://getgeeks-users-evra.herokuapp.com

*** Test Cases ***
User session
    ${payload}        Create Dictionary    email=kate@hotmail.com.br    password=pwd123
    #${headers}        Create Dictionary    Content-Type=application/json

    ${response}       POST    ${API_URL}/sessions    json=${payload}    #headers=${headers}

    Status Should Be     200                   ${response}
    
    ${size}              Get Length            ${response.json()}[token]
    ${expected_size}     Convert To Integer    140
    
    Should Be Equal      ${expected_size}      ${size}
    Should Be Equal      10d                   ${response.json()}[expires_in]