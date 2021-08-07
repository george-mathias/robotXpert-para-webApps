*** Settings ***
Documentation        Cadastro de alunos

Resource            ../resources/base.robot

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