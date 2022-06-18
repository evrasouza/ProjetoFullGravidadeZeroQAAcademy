*** Settings ***
Documentation        Geek Actions

Resource   ../Base.robot

*** Keywords ***
Go To Geek Form
    Click                      css=a[href="/be-geek"] >> text=Seja um Geek
    Wait For Elements State    css=.be-geek-form        visible        5

Fill Geek Form
    [Arguments]        ${geek_profile}

    Fill Text          id=whatsapp     ${geek_profile}[whats]
    Fill Text          id=desc         ${geek_profile}[desc]

    Select Options By  id=printer_repair    value        ${geek_profile}[printer_repair]

    Select Options By  id=work              text         ${geek_profile}[work]

    Fill Text    id=cost         ${geek_profile}[cost]

Submit geek Form
    Click         css=button >> text=Quero ser um geek

Geek Form should Be Sucess
    ${expected_message}        Set Variable        Seu cadastro está na nossa lista de geeks. Agora é só ficar de olho no seu WhatsApp.
    Wait For Elements State    css=p >> text=${expected_message}    visible        5

