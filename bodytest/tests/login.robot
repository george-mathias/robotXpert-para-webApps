*** Settings ***
Documentation        Suíte de testes da ação login

Resource             ../resources/base.robot

Test Setup           Go To Login Page
Test Teardown        Close Browser

*** Test Cases ***
Login do Administrador
    [Tags]    1
    Login With      admin@bodytest.com    pwd123       
    User Should Be Logged In    Administrador

Senha incorreta
    [Tags]    2
    Login With                admin@bodytest.com    abc123    
    Toaster Text Should Be    Usuário ou senha inválido    

Email incorreto
    [Tags]    3    
    Login With                admin&bodytest.com    abd123
    Alert Text Should Be      informe um e-mail válido

Senha nao informada
    [Tags]    4
    Login With                admin@bodytest.com    ${EMPTY}
    Alert Text Should Be      A senha é obrigatória

Email nao informado
    [Tags]    4
    Login With                  ${EMPTY}    pwd123
    Alert Text Should Be        O e-mail é obrigatório

Email e senha nao informados
    [Tags]    4
    Login With                  ${EMPTY}    ${EMPTY}
    Alert Text Should Be        O e-mail é obrigatório
    Alert Text Should Be        A senha é obrigatória