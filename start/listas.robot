*** Settings ***
Documentation        Conhecendo as listas
Library              Collections

*** Variables ***
@{AVENGERS}    Hulk    Thor    Iron Man    Cap
@{JUSTICE}     Superman    Wonder Woman    Batman    Arrow

*** Test Cases ***
Minha Lista
    # buscando o indice de um item na lista
    ${index}          Get Index From List    ${AVENGERS}    Iron Man

    Log To Console    \nindex: ${index}
    Log To Console    \nLista Inicial: ${AVENGERS}
    
    # alterando o valor de um item na lista pelo indice
    Set List Value    ${AVENGERS}    ${index}    Homem de Ferro

    Log To Console    \nLista Modificada: ${AVENGERS}

    # removendo um item da lista
    ${index_thor}     Get Index From List    ${AVENGERS}    Thor
    Remove From List    ${AVENGERS}    ${index_thor}

    Log To Console    \nLista Modificada: ${AVENGERS}
Combinando Listas
    ${crossover}      Combine Lists    ${AVENGERS}    ${JUSTICE}
    Log To Console    \nListas Combinadas ${crossover}