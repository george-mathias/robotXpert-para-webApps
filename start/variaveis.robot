*** Settings ***
Documentation        Exemplos de variáveis

Library              ./app/nome.py

*** Variables ***
${APELIDO}    Papito

*** Test Cases ***
Exemplo 01
    # ${nome}    Set Variable    Fernando
    ${nome}    Obter Nome
    Set Suite Variable    ${nome}

    Log To Console    ${nome}
    Log To Console    ${APELIDO}

Exemplo 02
    Log To Console    ${nome}
    Log To Console    ${APELIDO}