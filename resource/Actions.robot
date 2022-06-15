*** Settings ***
Documentation        Ações do Sistema

Library    Browser

*** Variables ***
${URL_BASE}        https://getgeeks-evra.herokuapp.com

*** Keywords ***
Go To Signup form
    Go To    ${URL_BASE}/signup
    Wait For Elements State    css=.signup-form        visible        5

Fill Signup Form
    [Arguments]    ${user}

    Fill Text    id=name        ${user}[name]
    Fill Text    id=lastname    ${user}[lastname]
    Fill Text    id=email       ${user}[email]
    Fill Text    id=password    ${user}[password]

Submit Signup Form
    Click        css=.submit-button >> text=Cadastrar 

User Should Be Registered

    ${expect_message}          Set Variable         css=p >> text=Agora você faz parte da Getgeeks. Tenha uma ótima experiência.
    Wait For Elements State    ${expect_message}    visible        5

Modal Content Should Be
    [Arguments]                ${expect_message}

    ${title}        Set Variable        css=.swal2-title
    ${content}      Set Variable        css=.swal2-html-container

    Wait For Elements State    ${title}     visible      5
    Get Text                   ${title}     equal        Oops...
    
    Wait For Elements State    ${content}   visible      5
    Get Text                   ${content}   equal        ${expect_message}

Alert span Should Be
    [Arguments]                ${expect_alert}
    Wait For Elements State    css=span[class=error] >> text=${expect_alert}    visible    5