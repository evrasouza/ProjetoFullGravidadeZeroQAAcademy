*** Settings ***
Documentation        Test Helpers

Resource    ../resource/Database.robot
Resource   ../resource/Base.robot

*** Keywords ***
Add User From Database
    [Arguments]    ${user}
    
    Connect To Postgress
    Insert User    ${user}
    Disconnect From Database

Do Login
    [Arguments]        ${user}

    Go to Login Page
    Fill Credentials    ${user}
    Submit Credentials
    User Should Be Logged in    ${user}
    
    

