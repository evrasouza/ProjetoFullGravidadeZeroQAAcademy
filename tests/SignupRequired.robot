*** Settings ***
Documentation    Signup Reqquired Test Suite

Resource         ../resource/Base.robot

Suite Setup       Signup Without Fill Form
Suite Teardown    Finish Session


*** Test Cases ***
Name is Required
    Alert span Should Be            Cadê o seu nome?

LasteName is Required
    Alert span Should Be            Cadê o sobrenome?

Email is Required
    Alert span Should Be            O email é importante também!

Password is Required
    Alert span Should Be            Agora só falta a senha!

    
*** Keywords ***
Signup Without Fill Form
    Start Session
    Go To Signup form
    Submit Signup Form
    
    
