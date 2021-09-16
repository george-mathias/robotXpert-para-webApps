*** Settings ***
Documentation        Ações de componentes genéricos

*** Keywords ***
Toaster Text Should Be
    [Arguments]    ${expect-text}
    Wait For Elements State    css=.Toastify__toast-body >> text=${expect-text}    visible    5

Alert Text Should Be
    [Arguments]    ${expect-text}
    Wait For Elements State    css=form span >> text=${expect-text}    visible    5

Get Required Alerts
    [Arguments]    ${index}
    
    ${span}    Get Text    xpath=(//form//span)[${index}]
    
    [Return]    ${span}

Field Should Be Type
    [Arguments]    ${element}    ${type}

    ${attribute}    Get Attribute    ${element}    type
    Should Be Equal    ${attribute}    ${type}

Register Should Not Be Found
    Wait For Elements State           css=div >> text=Nenhum registro encontrado.    visible    5
    Wait For Elements State           css=table    detached    5

Total Items Should Be
    [Arguments]    ${number}
    ${element}     Set Variable    css=#pagination .total

    Wait For Elements State    ${element}    visible    5
    Get Text                   ${element}    ==    Total: ${number}