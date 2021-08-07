*** Settings ***
Documentation        Cadastro de alunos

Resource            ../resources/base.robot

Suite Setup          Start Admin Session

*** Test Cases ***
Novo aluno
    Remove Student            nadaly@gmail.com
    Go To Students
    Go To Form Student
    New Student               Nadaly Farache    nadaly@gmail.com    37    45    1.45
    Toaster Text Should Be    Aluno cadastrado com sucesso.

    [Teardown]                Thinking And Take Screenshot    1