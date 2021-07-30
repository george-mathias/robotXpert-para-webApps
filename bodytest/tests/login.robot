*** Settings ***
Documentation        Suíte de testes da ação login

Library              Browser

*** Test Cases ***
Login do Administrador
    New Browser     chromium    false
    New Page        https://bodytest-web-george.herokuapp.com

    Fill Text    css=input[id=email]       admin@bodytest.com
    Fill Text    css=input[id=password]    pwd123
    Click        text=Entrar
    
    Get Text     css=aside strong    should be    Administrador

    Take Screenshot

Senha incorreta
    [Tags]    2
    New Browser     chromium    false
    New Page        https://bodytest-web-george.herokuapp.com

    Fill Text    css=input[id=email]          admin@bodytest.com
    Fill Text    css=input[id=password]       abc123
    Click        text=Entrar
    
    # Wait For Elements State    css=.Toastify__toast-body    visible    5
    # Get Text                   css=.Toastify__toast-body    should be    Usuário ou senha inválido

    # Combinando estratégias de busca, espera e validação
    Wait For Elements State    css=.Toastify__toast-body >> text=Usuário ou senha inválido    visible    5

    Take Screenshot

Email incorreto
    [Tags]    3
    New Browser     chromium    false
    New Page        https://bodytest-web-george.herokuapp.com

    Fill Text    css=input[id=email]          admin&bodytest.com
    Fill Text    css=input[id=password]       abc123
    Click        text=Entrar

    # Combinando estratégias de busca, espera e validação
    Wait For Elements State    css=form span >> text=informe um e-mail válido    visible    5

    Take Screenshot

Senha nao informada
    [Tags]    4
    New Browser     chromium    false
    New Page        https://bodytest-web-george.herokuapp.com

    Fill Text    css=input[id=email]          admin@bodytest.com
    Fill Text    css=input[id=password]       ${EMPTY}
    Click        text=Entrar

    # Combinando estratégias de busca, espera e validação
    Wait For Elements State    css=form span >> text=A senha é obrigatória    visible    5

    Take Screenshot

Email nao informado
    [Tags]    4
    New Browser     chromium    false
    New Page        https://bodytest-web-george.herokuapp.com

    Fill Text    css=input[id=email]          ${EMPTY}
    Fill Text    css=input[id=password]       pwd123
    Click        text=Entrar

    # Combinando estratégias de busca, espera e validação
    Wait For Elements State    css=form span >> text=O e-mail é obrigatório    visible    5

    Take Screenshot

Email e senha nao informados
    [Tags]    4
    New Browser     chromium    false
    New Page        https://bodytest-web-george.herokuapp.com

    Fill Text    css=input[id=email]          ${EMPTY}
    Fill Text    css=input[id=password]       ${EMPTY}
    Click        text=Entrar

    # Combinando estratégias de busca, espera e validação
    Wait For Elements State    css=form span >> text=O e-mail é obrigatório    visible    5
    Wait For Elements State    css=form span >> text=A senha é obrigatória     visible    5

    Take Screenshot