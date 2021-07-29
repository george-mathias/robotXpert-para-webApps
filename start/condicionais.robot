*** Settings ***
Documentation        trabalhando com condicionais

*** Test Cases ***
Carteira de Motorista
    ${idade}=    Set Variable    18

    IF     ${idade} >= 18
        Log To Console    Você pode tirar sua CNH
    ELSE
        Log To Console    Você pode andar de bicicleta
    END

Navegador
    [Tags]    browser
    ${browser}=    Set Variable    Chrome

    IF         '${browser}' == 'Firefox'
        Log To Console    Chamando o ${browser}
    ELSE IF    '${browser}' == 'Chrome'
        Log To Console    Chamando o ${browser}
    ELSE IF    '${browser}' == 'WebKit'
        Log To Console    Chamando o ${browser}
    ELSE
        Fail    Navegador Incorreto
    END