*** Settings ***
Documentation        Suíte de testes da ação login

Resource             ../resources/base.robot

Suite Setup          Start Browser Session
Test Teardown        Take Screenshot

*** Test Cases ***
Login do Administrador
    [Tags]    1
    Go To Login Page
    Login With                  admin@bodytest.com    pwd123       
    User Should Be Logged In    Administrador
    
    [Teardown]                  Clear Local Storage And Take Screenshot

Senha incorreta
    [Tags]    temp
    Go To Login Page
    Login With                admin@bodytest.com    abc123    
    Toaster Text Should Be    Usuário ou senha inválido

    [Teardown]                Thinking And Take Screenshot    1

Email incorreto
    [Tags]    temp
    Go To Login Page
    Login With                admin&bodytest.com    abd123
    Alert Text Should Be      informe um e-mail válido

Senha nao informada
    [Tags]    temp
    Go To Login Page
    Login With                admin@bodytest.com    ${EMPTY}
    Alert Text Should Be      A senha é obrigatória

Email nao informado
    [Tags]    temp
    Go To Login Page
    Login With                  ${EMPTY}    pwd123
    Alert Text Should Be        O e-mail é obrigatório

Email e senha nao informados
    [Tags]    temp
    Go To Login Page
    Login With                  ${EMPTY}    ${EMPTY}
    Alert Text Should Be        O e-mail é obrigatório
    Alert Text Should Be        A senha é obrigatória