*** Settings ***
Library    uart_reader.py
Library    BuiltIn

*** Test Cases ***
Validate All 100 Steps
    ${lines}=    Read All Steps

    FOR    ${i}    IN RANGE    1    101
        ${step}=    Set Variable    STEP${i}
        ${found}=    Evaluate    any("${step}" in line for line in ${lines})

        Log To Console    Checking ${step} : ${found}

        Should Be True    ${found}    ${step} not found!
    END
