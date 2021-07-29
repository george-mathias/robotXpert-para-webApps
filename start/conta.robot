*** Settings ***
Documentation        suite para testar a classe ContaLibrary

Library              ./app/ContaLibrary.py

*** Test Cases ***
Quando abro uma nova conta deve retornar saldo ZERADO
    Abrir Conta

    ${saldo_final}        Obter Saldo
    ${saldo_esperado}     Convert To Number    0.0

    Should Be Equal    ${saldo_final}    ${saldo_esperado}

Quando faço um deposito deve refletir o valor no meu saldo
    [Tags]    2

    Abrir Conta

    ${valor_deposito}    Convert To Number    100
    Deposita             ${valor_deposito}

    ${valor_final}       Obter Saldo

    Should Be Equal    ${valor_final}    ${valor_deposito}

Quando faço um saque deve deduzir o valor do meu saldo
    [Tags]    3
    Abrir Conta

    ${valor_deposito}    Convert To Number    2000
    Deposita             ${valor_deposito}

    ${valor_saque}       Convert To Number    100
    Saca                 ${valor_saque}

    ${saldo_esperado}    Evaluate    ${valor_deposito} - ${valor_saque} - 2
    ${saldo_atual}       Obter Saldo
    Should Be Equal    ${saldo_atual}    ${saldo_esperado}