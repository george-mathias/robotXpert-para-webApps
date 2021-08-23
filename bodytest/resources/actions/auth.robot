*** Settings ***
Documentation        ações de autorização

*** Keywords ***
Go To Login Page
    Go To    https://bodytest-web-george.herokuapp.com

Login With
    [Arguments]    ${email}    ${pass}

    Fill Text    css=input[id=email]       ${email}
    Fill Text    css=input[id=password]    ${pass}
    Click        text=Entrar

Close Browser
    Take Screenshot
    # Close Browser