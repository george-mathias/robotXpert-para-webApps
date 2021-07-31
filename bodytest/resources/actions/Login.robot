*** Settings ***
Documentation        ações de autorização

*** Keywords ***
Login With
    [Arguments]    ${email}    ${pass}

    Fill Text    css=input[id=email]       ${email}
    Fill Text    css=input[id=password]    ${pass}
    Click        text=Entrar