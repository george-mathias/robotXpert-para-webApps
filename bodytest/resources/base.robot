*** Settings ***
Documentation        arquivo base do projeto de automação

Library              Browser
Library              Collections
Library              ./libs/DeloreanLibrary.py

Resource             ./actions/auth.robot
Resource             ./actions/nav.robot
Resource             ./actions/students.robot
Resource             ./actions/components.robot


*** Keywords ***
Start Browser Session
    New Browser     chromium    false
    New Page        about:blank

Start Admin Session
    Start Browser Session
    Go To Login Page
    Login With                  admin@bodytest.com    pwd123       
    User Should Be Logged In    Administrador

Clear Local Storage And Take Screenshot
    Take Screenshot
    LocalStorage Clear

Thinking And Take Screenshot
    [Arguments]    ${timeout}

    Sleep    ${timeout}
    Take Screenshot