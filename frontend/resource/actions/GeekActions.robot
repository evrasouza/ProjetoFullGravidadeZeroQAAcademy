*** Settings ***
Documentation        Geek Actions

Resource             ../Base.robot

*** Keywords ***
Go To Geek Form
    Click                      css=a[href="/be-geek"] >> text=Seja um Geek
    Wait For Elements State    css=.be-geek-form        visible        5

Go To Geeks
    Click                       css=a[href="/geeks"] >> text=Geeks

    Wait For Elements State     css=.title strong >> text=Estes são os Geeks disponíveis.
    ...                         visible     5

Fill Geek Form
    [Arguments]        ${geek_profile}

    Reset Geek Form

    Fill Text          id=whatsapp     ${geek_profile}[whats]
    Fill Text          id=desc         ${geek_profile}[desc]

    IF    '${geek_profile}[printer_repair]' 
        Select Options By  id=printer_repair    value        ${geek_profile}[printer_repair]
    END

    IF    '${geek_profile}[work]' 
        Select Options By  id=work              text         ${geek_profile}[work]
    END

    Fill Text    id=cost         ${geek_profile}[cost]

Fill Search Form
    [Arguments]         ${target_option}       ${target_text}

    IF      '${target_option}'
        Select Options By   id=printer_repair       value       ${target_option}
    END
    
    Fill Text           id=desc                 ${target_text}

Submit geek Form
    Click         css=button >> text=Quero ser um geek

Submit Search Form
    Click           css=button[type="submit"] >> text=Buscar

Geek Form should Be Sucess
    ${expected_message}        Set Variable        Seu cadastro está na nossa lista de geeks. Agora é só ficar de olho no seu WhatsApp.
    Wait For Elements State    css=p >> text=${expected_message}    visible        5

Reset Geek Form
    Evaluate Javascript    css=.be-geek-form    document.getElementsByClassName("be-geek-form")[0].reset();
    
