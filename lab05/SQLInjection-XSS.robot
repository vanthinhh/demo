*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${BROWSER}               Chrome
${URL}                   https://practice-automation.com/tables/
${SEARCH_INPUT_XPATH}    //*[@id="tablepress-1_filter"]/label/input
${INFO_XPATH}            //*[@id="tablepress-1_info"]
${SEARCH_TERM_SQLI}      "' OR 1=1--"  # SQL Injection Payload
${SEARCH_TERM_XSSI}      "<script>alert('XSS Injection')</script>"  # XSS Injection Payload

*** Test Cases ***
Test SQL Injection
    [Documentation]    Test for SQL Injection vulnerability by injecting a malicious SQL payload
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Wait Until Page Contains Element    ${SEARCH_INPUT_XPATH}
    
    # Inject SQL payload into search field
    Input Text    ${SEARCH_INPUT_XPATH}    ${SEARCH_TERM_SQLI}
    Press Keys    ${SEARCH_INPUT_XPATH}    \\13  # Press Enter to trigger search

    # Verify if the application is vulnerable to SQL Injection
    ${info_text}    Get Text    ${INFO_XPATH}
    Run Keyword If    "'No matching records found' not in ${info_text}"    Log    'SQL Injection Vulnerable'
    ...    ELSE    Log    'No SQL Injection Vulnerability Detected'

    [Teardown]    Close Browser

Test XSS Injection
    [Documentation]    Test for XSS Injection vulnerability by injecting a malicious script payload
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Wait Until Page Contains Element    ${SEARCH_INPUT_XPATH}
    
    # Inject XSS payload into search field
    Input Text    ${SEARCH_INPUT_XPATH}    ${SEARCH_TERM_XSSI}
    Press Keys    ${SEARCH_INPUT_XPATH}    \\13  # Press Enter to trigger search

    # Verify if the application is vulnerable to XSS Injection
    ${info_text}    Get Text    ${INFO_XPATH}
    Run Keyword If    "'No matching records found' not in ${info_text}"    Log    'XSS Injection Vulnerable'
    ...    ELSE    Log    'No XSS Injection Vulnerability Detected'

    [Teardown]    Close Browser
