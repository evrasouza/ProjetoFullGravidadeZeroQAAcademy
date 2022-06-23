*** Settings ***
Documentation        BeGeek test suite

Resource   ../resource/Base.robot

Test Setup       Start Session
Test Teardown    Finish Session


*** Test Cases ***
Be a Geek
    
    ${user}        Factory User    be_geek

    Do Login       ${user}

    Go To Geek Form
    Fill Geek Form    ${user}[geek_profile]
    Submit geek Form
    
    Geek Form should Be Sucess

Short Description
    [Tags]    short_desc
    
    ${user}        Factory User    short_desc

    Do Login       ${user}

    Go To Geek Form
    Fill Geek Form    ${user}[geek_profile]
    Submit geek Form
    
    Alert span Should Be    A descrição deve ter no minimo 80 caracteres

Long Description
    [Tags]    long_desc
    
    ${user}        Factory User    long_desc

    Do Login       ${user}

    Go To Geek Form
    Fill Geek Form    ${user}[geek_profile]
    Submit geek Form
    
    Alert span Should Be    A descrição deve ter no máximo 255 caracteres

Empty Description
    [Tags]    empty_desc
    
    ${user}        Factory User    empty_desc

    Do Login       ${user}

    Go To Geek Form
    Fill Geek Form    ${user}[geek_profile]
    Submit geek Form
    
    Alert span Should Be    Informe a descrição do seu trabalho

Empty Whats
    [Tags]    empty_whats
    
    ${user}        Factory User    empty_whats

    Do Login       ${user}

    Go To Geek Form
    Fill Geek Form    ${user}[geek_profile]
    Submit geek Form
    
    Alert span Should Be    O Whatsapp deve ter 11 digitos contando com o DDD