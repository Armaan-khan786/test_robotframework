*** Settings ***
Library    uart_reader.py
Library    BuiltIn

*** Test Cases ***
Validate All 100 Steps
    ${lines}=    Read All Steps

    FOR    ${i}    IN RANGE    1    101
        ${step}=    Set Variable    STEP${i}
        ${status}=    Run Keyword And Return Status    Should Contain    ${lines}    ${step}
        
        Run Keyword If    '${status}' == 'False'    Sleep    5s
        
        Log    Checking ${step} : ${status}
    END