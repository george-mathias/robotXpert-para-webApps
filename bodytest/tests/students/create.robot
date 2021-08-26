*** Settings ***
Documentation        Cadastro de alunos

Resource             ${EXECDIR}/resources/base.robot

Suite Setup          Start Admin Session
Test Teardown        Take Screenshot

*** Test Cases ***
Cenário: Novo aluno

    &{student}    Create Dictionary    name=Nadaly Farache    email=nadaly@gmail.com    age=37    weight=45    feet_tall=1.45

    Remove Student            ${student.email}
    Go To Students
    Go To Form Student
    New Student               ${student}
    Toaster Text Should Be    Aluno cadastrado com sucesso.

    [Teardown]                Thinking And Take Screenshot    1

Cenário: Não deve permitir email duplicado
    [Tags]    dup

    &{student}    Create Dictionary    name=Nadaly Farache    email=nadaly@gmail.com    age=37    weight=45    feet_tall=1.45

    Insert Student            ${student}
    Go To Students
    Go To Form Student
    New Student               ${student}
    Toaster Text Should Be    Email já existe no sistema.

    [Teardown]                Thinking And Take Screenshot    1

Cenário: Todos os campos devem ser obrigatórios
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


Cenário: Validar Campos do Tipo Numerico
    [Template]    Check Type Field On Student Form
    ${AGE_FIELD}            number
    ${WEIGHT_FIELD}         number
    ${FEET-TALL_FIELD}      number

Cenario: Validar Campo do Tipo Email
    [Template]    Check Type Field On Student Form

    ${EMAIL_FIELD}    email

Cenario: Menor de 14 Anos Nao Pode Fazer Cadastro
    [Tags]    temp
    &{student}    Create Dictionary    name=Livia da Silva    email=liviadasilva@yahoo.com    age=13    weight=50    feet_tall=1.65

    Go To Students
    Go To Form Student
    New Student    ${student}
    Alert Text Should Be    A idade deve ser maior ou igual 14 anos

*** Keywords ***
Check Type Field On Student Form
    [Arguments]    ${element}    ${type}
    Go To Students
    Go To Form Student
    Field Should Be Type    ${element}    ${type}