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

    ${response}       POST    ${API_URL}/sessions    json=${payload}    expected_status=any    #headers=${headers}

    Status Should Be     200                   ${response}
    
    ${size}              Get Length            ${response.json()}[token]
    ${expected_size}     Convert To Integer    140
    
    Should Be Equal      ${expected_size}      ${size}
    Should Be Equal      10d                   ${response.json()}[expires_in]

Incorrect pass
    ${payload}        Create Dictionary    email=kate@hotmail.com.br    password=abc123

    ${response}       POST    ${API_URL}/sessions    json=${payload}    expected_status=any     #headers=${headers}

    Status Should Be     401                   ${response}
    Should Be Equal      Unauthorized          ${response.json()}[error]

User not found
    ${payload}        Create Dictionary    email=kate@404.com.br    password=pwd123

    ${response}       POST    ${API_URL}/sessions    json=${payload}    expected_status=any     #headers=${headers}

    Status Should Be     401                   ${response}
    Should Be Equal      Unauthorized          ${response.json()}[error]

Incorrect email
    ${payload}        Create Dictionary    email=kate.hotmail.com.br    password=pwd123

    ${response}       POST    ${API_URL}/sessions    json=${payload}    expected_status=any     #headers=${headers}

    Status Should Be     400                   ${response}
    Should Be Equal      Incorrect email       ${response.json()}[error]

Empty email
    ${payload}        Create Dictionary    email=${EMPTY}    password=pwd123

    ${response}       POST    ${API_URL}/sessions    json=${payload}    expected_status=any     #headers=${headers}

    Status Should Be     400                   ${response}
    Should Be Equal      Required email       ${response.json()}[error]

Without email
    ${payload}        Create Dictionary    password=pwd123

    ${response}       POST    ${API_URL}/sessions    json=${payload}    expected_status=any     #headers=${headers}

    Status Should Be     400                   ${response}
    Should Be Equal      Required email       ${response.json()}[error]

Empty pass
    ${payload}        Create Dictionary    email=kate@hotmail.com.br    password=${EMPTY}

    ${response}       POST    ${API_URL}/sessions    json=${payload}    expected_status=any     #headers=${headers}

    Status Should Be     400                   ${response}
    Should Be Equal      Required pass       ${response.json()}[error]

Without pass
    ${payload}        Create Dictionary    email=kate@hotmail.com.br

    ${response}       POST    ${API_URL}/sessions    json=${payload}    expected_status=any     #headers=${headers}

    Status Should Be     400                   ${response}
    Should Be Equal      Required pass       ${response.json()}[error]