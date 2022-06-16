*** Settings ***
Documentation        Login Test Suite

Resource   ../resource/Base.robot

Test Setup       Start Session
Test Teardown    Finish Session

*** Test Cases ***
User Login

    ${user}                   Factory User Login
    Add User From Database    ${user}
    
    Go to Login Page
    Fill Credentials        ${user}
    Submit Credentials
    User Should Be Logged In    ${user}