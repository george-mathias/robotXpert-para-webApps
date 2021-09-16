*** Settings ***
Documentation        Buscar alunos

Resource             ${EXECDIR}/resources/base.robot

Library              ../../resources/libs/DeloreanLibrary.py
Library              OperatingSystem

# Suite Setup          Start Admin Session
# Test Teardown        Take Screenshot


*** Test Cases ***
Cenario: Busca Exata

    &{student}    Create Dictionary    name=Steve Jobs    email=jobs@apple.com    age=45    weight=80    feet_tall=1.80

    Remove Student By Name            ${student.name}
    Insert Student                    ${student}
    Go To Students
    Search Student By Name            ${student.name}
    Student Name Should Be Visible    ${student.name}
    Total Items Should Be             1

Cenario: Registro nao encontrado
    
    ${nome}        Set Variable       Barão Zemo

    Remove Student By Name            ${nome}
    Go To Students
    Search Student By Name            ${nome}
    Register Should Not Be Found
    
Cenario: Busca alunos por um único termo
    [Tags]    temp
    ${file}=          Get File        ${EXECDIR}/resources/fixtures/students-search.json
    ${json_object}    Evaluate        json.loads($file)    json
    # Log To Console    ${json_object}

    FOR    ${item}    IN    @{json_object['students']}
        Log To Console      ${item['name']}
        
    END