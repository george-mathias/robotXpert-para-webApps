*** Settings ***
Documentation        Cadastro de alunos

Resource            ../resources/base.robot

Suite Setup          Start Browser Session

*** Test Cases ***
Novo aluno
    Go To Login Page
    Login With                  admin@bodytest.com    pwd123       
    User Should Be Logged In    Administrador

    Click        css=a[href$=alunos]

    # Wait For Elements State     //h1[text()='Gestão de Alunos']    visible    5
    Wait For Elements State    h1 >> text=Gestão de Alunos    visible    5
    
    Click        css=a[href$="alunos/new"]

    # Wait For Elements State    //h1[text()="Novo aluno"]    visible    5
    Wait For Elements State    h1 >> text=Novo aluno    visible    5


    Fill Text    css=input[name=name]        Nadaly Farache
    Fill Text    css=input[name=email]       nadaly@gmail.com
    Fill Text    css=input[name=age]         37
    Fill Text    css=input[name=weight]      45
    Fill Text    css=input[name=feet_tall]   1.45

    Click        xpath=//button[contains(text(), "Salvar")]

    Toaster Text Should Be    Aluno cadastrado com sucesso.

    [Teardown]                Thinking And Take Screenshot    1