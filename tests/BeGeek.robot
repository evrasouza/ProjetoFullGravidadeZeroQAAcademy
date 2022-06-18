*** Settings ***
Documentation        BeGeek test suite

Resource   ../resource/Base.robot

Test Setup       Start Session
Test Teardown    Finish Session


*** Test Cases ***
Be a Geek
    
    ${user}        Factory User Be Geek

    Do Login       ${user}

    Go To Geek Form
    Fill Geek Form    ${user}[geek_profile]
    Submit geek Form
    
    Geek Form should Be Sucess