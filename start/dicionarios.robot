*** Settings ***
Documentation        Conhecendo os dicionarios de dados do robot (nativo no Python)


*** Variables ***
${SIMPLES}        Fernando
@{CARROS}         chevette    opala    camaro    mustang
&{CARRO}          nome=chevette    hp=1500    portas=2    cor=marrom

*** Test Cases ***
Obtendo Valores de um Dicionario
    Log To Console    \n
    Log To Console    ${CARRO}          # imprimindo todo o dicionario
    Log To Console    ${CARRO.nome}     # imprimindo apenas um valor do dicionario