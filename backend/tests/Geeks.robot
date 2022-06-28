*** Settings ***
Documentation                Geek Route test suite

Library              RequestsLibrary
Library              Browser

Resource             ../resources/Base.robot

*** Test Cases ***
Be a geek
    
    # Dado que temos um novo usuario
    ${user}        Factory Be Geek
    Remove User    ${user}
    
    # E esse usuario e um cliente comum
    POST User    ${user}

    # E esse usuario possui um token
    ${token}        Get Token        ${user}    

    # Quando faco uma requisicao POST na rota /geeks
    ${response}        POST Geek    ${token}    ${user}[geek_profile]
    
    # Entao deve retornar 201
    Status Should Be    201        ${response}
    
    # E ao consultar esse usuario na API USERS
    ${response}        Get User          ${token}      
    
    # Entao o perfil geek deve ser retornado
    Should Be Equal As Strings    ${user}[name]     ${response.json()}[name]
    Should Be Equal As Strings    ${user}[email]    ${response.json()}[email]

    Should Be Equal As Strings    ${user}[geek_profile][whatsapp]           ${response.json()}[whatsapp]
    Should Be Equal As Strings    ${user}[geek_profile][desc]               ${response.json()}[desc]

    ${expect_float}        Convert To Number        ${user}[geek_profile][cost]
    ${got_float}           Convert To Number        ${response.json()}[cost]

    Should Be Equal               ${expect_float}                           ${got_float} 
    Should Be Equal As Strings    ${user}[geek_profile][printer_repair]     ${response.json()}[printer_repair]
    Should Be Equal As Strings    ${user}[geek_profile][work]               ${response.json()}[work]
    Should Be Equal As Strings    None                                      ${response.json()}[avatar]
    Should Be Equal As Strings    True                                      ${response.json()}[is_geek]

Get Geek List
    [Tags]        temp

    ${data}               Factory Search For Geeks

    FOR    ${geek}    IN    @{data}[geeks]
        
        POST User    ${geek}
        ${token}     Get Token    ${geek}

        POST Geek    ${token}    ${geek}[geek_profile]
        
    END
    
    POST User           ${data}[user]

    ${token}            Get Token    ${data}[user]


    ${response}         GET Geeks    ${token}    
    Status Should Be    200          ${response}

    Log    ${response.json()}[Geeks]

    ${total}        Get Length    ${response.json()}[Geeks]
    Should Be True    ${total} > 0
