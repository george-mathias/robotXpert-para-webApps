*** Settings ***
Documentation        Ações de componentes genéricos


*** Keywords ***
Toaster Text Should Be
    [Arguments]    ${expect-text}
    Wait For Elements State    css=.Toastify__toast-body >> text=${expect-text}    visible    5