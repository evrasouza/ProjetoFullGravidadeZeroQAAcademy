*** Settings ***
Documentation        Temp
Library    Collections

*** Test Cases ***
Trabalhando com Listas
    
    @{avengers}        Create List    Tony Stark    Kamalakhan    Steve Rogers

    Append To List    ${avengers}    Bruce Banner
    Append To List    ${avengers}    Scot Lang

    # Log To Console    ${avengers}[0]
    # Log To Console    ${avengers}[1]
    # Log To Console    ${avengers}[2]
    # Log To Console    ${avengers}[3]

    FOR    ${a}    IN    @{avengers}
        Log To Console    ${avengers}        
    END

    @{avengers2}        Create List    Tony Stark    Miss Marvel    Steve Rogers    Bruce Banner    Scot Lang

    Lists Should Be Equal    ${avengers}    ${avengers2}