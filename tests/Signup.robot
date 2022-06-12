*** Settings ***
Documentation    Signup Test Suite

Resource         ../resource/Base.robot

Test Setup       Start Session
Test Teardown    Finish Session

*** Test Cases ***
Register a new user

    ${user}        Factory User
    #Dado que acesso a página de cadastro
    Go To Signup form

    #Quando faço o meu cadastro com o nome completo, e-mail e senha
    Fill Signup Form    ${user}
    Submit Signup Form


    #Então vejo a mensagem de boas vindas:
    #"Agora você faz parte da Getgeeks. Tenha uma ótima experiência."
    User Should Be Registered