*** Settings ***
Documentation    Signup Test Suite

Resource         ../resource/Base.robot

Test Setup       Start Session
Test Teardown    Finish Session

*** Test Cases ***
Register a new user

    ##### Cenário: Cadastro de cliente
    ${user}        Factory User

    #Dado que acesso a página de cadastro
    Go To Signup form
    #Quando faço o meu cadastro com o nome completo, e-mail e senha
    Fill Signup Form    ${user}
    Submit Signup Form
    #Então vejo a mensagem de boas vindas:
    #"Agora você faz parte da Getgeeks. Tenha uma ótima experiência."
    User Should Be Registered

Duplicate user
    [Tags]        dup_email
    ##### Cenário: E-mail duplicado

    ${user}        Factory User

    Add user    ${user}

    #Dado que acesso a página de cadastro
    Go To Signup form
    #Porem o meu e-mail já foi cadastrado
    Fill Signup Form    ${user}
    Submit Signup Form
    #Quando faço o meu cadastro com o nome completo, e-mail e senha
    #Então vejo a mensagem de alerta:
        #"Oops! Já temos um usuário com o e-mail informado."
    Modal Content Should Be    Já temos um usuário com o e-mail informado.