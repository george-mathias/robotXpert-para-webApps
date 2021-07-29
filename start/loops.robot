*** Settings ***
Documentation        Laços de repetição

*** Variables ***
@{AVENGERS}    Hulk    Thor    Iron Man    Cap    Spiderman
@{JUSTICE}     Superman    Wonder Woman    Batman    Arrow

*** Test Cases ***
Meu Primeiro Loop
    Log To Console      \n
    FOR    ${item}    IN    @{AVENGERS}
        Log To Console      ${item}    
    END

Meu Loop Com Condicional
    Log To Console      \n
    FOR    ${item}    IN    @{AVENGERS}
        IF    $item == 'Ironman'
            Log To Console      ${item}        
        END
    END

Outro Loop
    [Tags]    thor

    Log To Console      \n
    FOR    ${item}    IN    @{AVENGERS}
        Exit For Loop If    $item == 'Thor'
        Log To Console      ${item}    
    END