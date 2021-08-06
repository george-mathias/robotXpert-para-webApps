*** Settings ***
Documentation        ações do menu superior de navegação

*** Keywords ***
Go To Students
    Click        css=a[href$=alunos]
    # Wait For Elements State     //h1[text()='Gestão de Alunos']    visible    5
    Wait For Elements State    h1 >> text=Gestão de Alunos    visible    5

User Should Be Logged In
    [Arguments]    ${user-name}

    Get Text     css=aside strong    should be    ${user-name}