*** Settings ***
Documentation        BeGeek test suite

Resource   ../resource/Base.robot

Test Setup       Start Session
Test Teardown    Finish Session


*** Test Cases ***
Be a Geek
    
    #Dado que eu tenho um usuário comum
    ${user}        Factory User Be Geek

    #Faço um login na plataforma geeks
    Do Login       ${user}

    #Quando submeto o formulário para me tornar um Geek (prestador de serviços)


    #Então devo ver uma mensagem de sucesso


