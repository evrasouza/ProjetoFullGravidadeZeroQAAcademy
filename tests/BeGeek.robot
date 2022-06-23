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