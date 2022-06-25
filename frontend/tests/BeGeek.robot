*** Settings ***
Documentation        BeGeek test suite

Resource   ../resource/Base.robot

Test Setup       Start Session
Test Teardown    After Test


*** Test Cases ***
Be a Geek
    [Tags]        smoke    
    
    ${user}        Factory User    be_geek

    Do Login       ${user}

    Go To Geek Form
    Fill Geek Form    ${user}[geek_profile]
    Submit geek Form
    
    Geek Form should Be Sucess