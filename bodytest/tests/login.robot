*** Settings ***
Documentation        Suíte de testes da ação login

Resource             ../resources/base.robot

*** Test Cases ***
Login do Administrador
    [Tags]    1
    New Browser     chromium    false
    New Page        https://bodytest-web-george.herokuapp.com

    Login With      admin@bodytest.com    pwd123
       
    Get Text     css=aside strong    should be    Administrador

    Take Screenshot

Senha incorreta
    [Tags]    2
    New Browser     chromium    false
    New Page        https://bodytest-web-george.herokuapp.com

    Login With      admin@bodytest.com    abc123
    
    Wait For Elements State    css=.Toastify__toast-body >> text=Usuário ou senha inválido    visible    5

    Take Screenshot

Email incorreto
    [Tags]    3
    New Browser     chromium    false
    New Page        https://bodytest-web-george.herokuapp.com

    Login With      admin&bodytest.com    abd123

    # Combinando estratégias de busca, espera e validação
    Wait For Elements State    css=form span >> text=informe um e-mail válido    visible    5

    Take Screenshot

Senha nao informada
    [Tags]    4
    New Browser     chromium    false
    New Page        https://bodytest-web-george.herokuapp.com

    Login With      admin@bodytest.com    ${EMPTY}

    # Combinando estratégias de busca, espera e validação
    Wait For Elements State    css=form span >> text=A senha é obrigatória    visible    5

    Take Screenshot

Email nao informado
    [Tags]    4
    New Browser     chromium    false
    New Page        https://bodytest-web-george.herokuapp.com

    Login With      ${EMPTY}    pwd123

    # Combinando estratégias de busca, espera e validação
    Wait For Elements State    css=form span >> text=O e-mail é obrigatório    visible    5

    Take Screenshot

Email e senha nao informados
    [Tags]    4
    New Browser     chromium    false
    New Page        https://bodytest-web-george.herokuapp.com

    Login With      ${EMPTY}    ${EMPTY}

    # Combinando estratégias de busca, espera e validação
    Wait For Elements State    css=form span >> text=O e-mail é obrigatório    visible    5
    Wait For Elements State    css=form span >> text=A senha é obrigatória     visible    5

    Take Screenshot