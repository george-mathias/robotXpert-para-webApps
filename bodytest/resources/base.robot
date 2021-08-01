*** Settings ***
Documentation        arquivo base do projeto de automação

Library              Browser

Resource             ./actions/auth.robot
Resource             ./actions/nav.robot

*** Keywords ***
Start Browser Session
    New Browser     chromium    false
    New Page        about:blank