*** Settings ***
Documentation      AttemptBeGeek test suite

Resource           ../resource/Base.robot

Test Setup          Start Session For Attempt Be Geek

*** Variables ***
${LONG_DESC}       Nada do que é social e humano é mais real que as utopias. Na sua vertente eutópica, as utopias constituíram sempre o fundamento simbólico e mítico sem o qual nenhuma forma de organização social se sustenta, justifica ou sobrevive. E criam, tanto na vertente eutópica como na distópica, o vocabulário da revolução e da mudança.

*** Test Cases ***
Should Not Be a Geek
    [Template]      Attempt Be a Geek
    
    desc            ${LONG_DESC}          A descrição deve ter no máximo 255 caracteres
    desc            Formato seu PC        A descrição deve ter no minimo 80 caracteres
    desc            ${EMPTY}              Informe a descrição do seu trabalho
    whats           11                    O Whatsapp deve ter 11 digitos contando com o DDD
    whats           999999999             O Whatsapp deve ter 11 digitos contando com o DDD
    whats           ${EMPTY}              O Whatsapp deve ter 11 digitos contando com o DDD
    cost            aaaa                  Valor hora deve ser numérico 
    cost            aa12                  Valor hora deve ser numérico 
    cost            ^^%$                  Valor hora deve ser numérico 
    cost            ${EMPTY}              Valor hora deve ser numérico 

*** Keywords ***
Attempt Be a Geek
    [Arguments]        ${key}    ${input_field}    ${output_message}

    ${user}        Factory User    attempt_be_geek

    Set To Dictionary    ${user}[geek_profile]    ${key}    ${input_field}

    Fill Geek Form    ${user}[geek_profile]
    Submit geek Form
    Alert span Should Be    ${output_message}

    Take Screenshot    fullPage=true

Start Session For Attempt Be Geek
    ${user}        Factory User    attempt_be_geek
    
    Start Session
    Do Login    ${user}
    Go To Geek Form