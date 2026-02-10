*** Settings ***
Library    uart_reader.py
Library    BuiltIn

*** Test Cases ***
Validate All 100 Steps
    ${lines}=    Read All Steps

    Log To Console    ===== UART DATA RECEIVED =====

    FOR    ${line}    IN    @{lines}
        Log To Console    ${line}
    END

    FOR    ${i}    IN RANGE    1    101
        ${step}=    Set Variable    STEP${i}
        ${status}=    Run Keyword And Return Status
        ...    Should Contain    ${lines}    ${step}

        Log To Console    Checking ${step} : ${status}
    END
