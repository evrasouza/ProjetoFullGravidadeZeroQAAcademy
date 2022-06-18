*** Settings ***
Documentation        BeGeek test suite

Resource   ../resource/Base.robot

Test Setup       Start Session
Test Teardown    Finish Session


*** Test Cases ***
Be a Geek
    
    #Dado que eu tenho um usuário comum
    ${user}        Factory User Be Geek

    #Faço um login na plataforma geeks
    Do Login       ${user}

    #Quando submeto o formulário para me tornar um Geek (prestador de serviços)
    Go To Geek Form
    Fill Geek Form    ${user}[geek_profile]
    Sleep    10

    #Então devo ver uma mensagem de sucesso

*** Keywords ***
Go To Geek Form
    Click                      css=a[href="/be-geek"] >> text=Seja um Geek
    Wait For Elements State    css=.be-geek-form        visible        5

Fill Geek Form
    [Arguments]        ${geek_profile}

    Fill Text    id=whatsapp     ${geek_profile}[whats]
    Fill Text    id=desc         ${geek_profile}[desc]
    Fill Text    id=cost         ${geek_profile}[cost]

