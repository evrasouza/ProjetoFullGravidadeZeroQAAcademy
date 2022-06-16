*** Settings ***
Documentation        Login Test Suite

Resource   ../resource/Base.robot

Test Setup       Start Session
Test Teardown    Finish Session

*** Test Cases ***
User Login
    Go to Login Page
    Fill Credentials        everton@souza.com.br        pwd123
    Submit Credentials
    User Should Be Logged In    Everton Souza