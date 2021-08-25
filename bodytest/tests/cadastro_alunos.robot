*** Settings ***
Documentation        Cadastro de alunos

Library              Collections

Resource             ../resources/base.robot

Suite Setup          Start Admin Session

*** Test Cases ***
Novo aluno

    &{student}    Create Dictionary    name=Nadaly Farache    email=nadaly@gmail.com    age=37    weight=45    feet_tall=1.45

    Remove Student            ${student.email}
    Go To Students
    Go To Form Student
    New Student               ${student}
    Toaster Text Should Be    Aluno cadastrado com sucesso.

    [Teardown]                Thinking And Take Screenshot    1

Não deve permitir email duplicado
    [Tags]    dup

    &{student}    Create Dictionary    name=Nadaly Farache    email=nadaly@gmail.com    age=37    weight=45    feet_tall=1.45

    Insert Student            ${student}
    Go To Students
    Go To Form Student
    New Student               ${student}
    Toaster Text Should Be    Email já existe no sistema.

    [Teardown]                Thinking And Take Screenshot    1

Todos os campos devem ser obrigatórios
    @{expected_alerts}    Set Variable    Nome é obrigatório    O e-mail é obrigatório    idade é obrigatória    o peso é obrigatório    a Altura é obrigatória
    @{got_alerts}         Create List

    Go To Students
    Go To Form Student
    Submit Student Form
    
    # FOR  ${item}  IN  @{expected_alerts}
    #     Alert Text Should Be    ${item}
    # END

    FOR    ${index}    IN RANGE    1    6    
        ${span}               Get Required Alerts    ${index}
        Append To List        ${got_alerts}    ${span}         
    END

    Log To Console    \nLista Esperada: ${expected_alerts}
    Log To Console    \nLista Obtida: ${got_alerts}

    Lists Should Be Equal    ${expected_alerts}    ${got_alerts}


Validate Number Type
    [Tags]        temp
    [Template]    Check Type Field On Student Form
    ${AGE_FIELD}            number
    ${WEIGHT_FIELD}         number
    ${FEET-TALL_FIELD}      number

Validate Email Type
    [Tags]    temp
    [Template]    Check Type Field On Student Form

    ${EMAIL_FIELD}    email


*** Keywords ***
Check Type Field On Student Form
    [Arguments]    ${element}    ${type}
    Go To Students
    Go To Form Student
    Field Should Be Type    ${element}    ${type}