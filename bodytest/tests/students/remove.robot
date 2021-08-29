*** Settings ***
Documentation        Remover alunos

Library              ../../resources/libs/DeloreanLibrary.py
Library    Browser
Resource             ${EXECDIR}/resources/base.robot
Resource    ../../resources/actions/components.robot

Test Setup           Start Admin Session
Test Teardown        Take Screenshot


*** Test Cases ***
Cenario: Remover aluno cadastrado
    
    &{student}    Create Dictionary    name=Robert Pattinson    email=batman@dc.com    age=27    weight=70    feet_tall=1.80

    Insert Student                  ${student}
    Go To Students
    Request Removal By Email        ${student.email}
    Confirm Removal
    Toaster Text Should Be          Aluno removido com sucesso.
    Student Should Not visible      ${student.email}
    
    Log    ${student.email}
    [Teardown]    Thinking And Take Screenshot    1

Cenario: Desistir da exclusao

    &{student}    Create Dictionary    name=Robert Downey Jr    email=ironman@marvel.com    age=27    weight=70    feet_tall=1.80

    Insert Student                  ${student}
    Go To Students
    Request Removal By Email        ${student.email}
    Cancel Removal
    Student Should Be visible       ${student.email}