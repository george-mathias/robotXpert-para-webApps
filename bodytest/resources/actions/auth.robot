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

Toaster Text Should Be
    [Arguments]    ${expect-text}
    Wait For Elements State    css=.Toastify__toast-body >> text=${expect-text}    visible    5

Alert Text Should Be
    [Arguments]    ${expect-text}
    Wait For Elements State    css=form span >> text=${expect-text}    visible    5

Close Browser
    Take Screenshot
    # Close Browser