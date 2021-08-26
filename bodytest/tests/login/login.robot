*** Settings ***
Documentation        Suíte de testes da ação login

Resource             ${EXECDIR}/resources/base.robot

Suite Setup          Start Browser Session
Test Teardown        Take Screenshot

*** Test Cases ***
Cenário: Login do Administrador
    Go To Login Page
    Login With                  admin@bodytest.com    pwd123       
    User Should Be Logged In    Administrador
    
    [Teardown]                  Clear Local Storage And Take Screenshot

Cenário: Senha incorreta
    Go To Login Page
    Login With                admin@bodytest.com    abc123    
    Toaster Text Should Be    Usuário e/ou senha inválidos.

    [Teardown]                Thinking And Take Screenshot    1

Cenário: Email nao cadastrado
    Go To Login Page
    Login With                fulano@bodytest.com    abc123    
    Toaster Text Should Be    Usuário e/ou senha inválidos.

    [Teardown]                Thinking And Take Screenshot    1

Cenário: Email incorreto
    Go To Login Page
    Login With                admin&bodytest.com    abd123
    Alert Text Should Be      informe um e-mail válido

Cenário: Senha nao informada
    Go To Login Page
    Login With                admin@bodytest.com    ${EMPTY}
    Alert Text Should Be      A senha é obrigatória

Cenário: Email nao informado
    Go To Login Page
    Login With                  ${EMPTY}    pwd123
    Alert Text Should Be        O e-mail é obrigatório

Cenário: Email e senha nao informados
    Go To Login Page
    Login With                  ${EMPTY}    ${EMPTY}
    Alert Text Should Be        O e-mail é obrigatório
    Alert Text Should Be        A senha é obrigatória