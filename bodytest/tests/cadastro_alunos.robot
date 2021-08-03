*** Settings ***
Documentation        Cadastro de alunos

Resource            ../resources/base.robot

Suite Setup          Start Browser Session

*** Test Cases ***
Novo aluno
    Go To Login Page
    Login With                  admin@bodytest.com    pwd123       
    User Should Be Logged In    Administrador

    Go To Students
    Go To Form Student
    New Student    Nadaly Farache    nadaly@gmail.com    37    45    1.45
    Toaster Text Should Be    Aluno cadastrado com sucesso.

    [Teardown]                Thinking And Take Screenshot    1