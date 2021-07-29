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

