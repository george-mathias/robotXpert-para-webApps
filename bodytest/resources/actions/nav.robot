*** Settings ***
Documentation        ações do menu superior de navegação

*** Keywords ***
User Should Be Logged In
    [Arguments]    ${user-name}

    Get Text     css=aside strong    should be    ${user-name}