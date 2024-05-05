*** Settings ***
Library    SeleniumLibrary
Library    Collections

*** Variables ***
${BROWSER}              Chrome
${URL}                  https://www.saucedemo.com/
${VALID_USERNAME}       valid_user123.
${INVALID_USERNAME}     !invaliduser
${VALID_PASSWORD}       password1
${INVALID_PASSWORD}     invalid password 123

*** Test Cases ***
Test Username Requirements
    [Documentation]    Test username requirements
    Open Browser    ${URL}    ${BROWSER}
    [Teardown]    Close Browser
    ${valid_user}    Set Variable    ${VALID_USERNAME}
    ${invalid_user}    Set Variable    ${INVALID_USERNAME}
    ${empty}    Set Variable    ''
    ${too_long_user}    Set Variable    ${VALID_USERNAME}${VALID_USERNAME}${VALID_USERNAME}${VALID_USERNAME}
    ${non_alphanumeric_user}    Set Variable    123user

    Check Username Requirements    ${valid_user}    ${VALID_PASSWORD}
    Check Username Requirements    ${invalid_user}    ${VALID_PASSWORD}
    Check Username Requirements    ${empty}    ${VALID_PASSWORD}
    Check Username Requirements    ${too_long_user}    ${VALID_PASSWORD}
    Check Username Requirements    ${non_alphanumeric_user}    ${VALID_PASSWORD}

Test Password Requirements
    [Documentation]    Test password requirements
    Open Browser    ${URL}    ${BROWSER}
    [Teardown]    Close Browser
    ${valid_pass}    Set Variable    ${VALID_PASSWORD}
    ${invalid_pass}    Set Variable    12345
    ${too_short_pass}    Set Variable    pass1
    ${no_alphabetic_pass}    Set Variable    123456
    ${no_numeric_pass}    Set Variable    password
    ${contains_space_pass}    Set Variable    pass word
    ${too_long_pass}    Set Variable    ${VALID_PASSWORD}${VALID_PASSWORD}${VALID_PASSWORD}${VALID_PASSWORD}

    Check Password Requirements    ${VALID_USERNAME}    ${valid_pass}
    Check Password Requirements    ${VALID_USERNAME}    ${invalid_pass}
    Check Password Requirements    ${VALID_USERNAME}    ${too_short_pass}
    Check Password Requirements    ${VALID_USERNAME}    ${no_alphabetic_pass}
    Check Password Requirements    ${VALID_USERNAME}    ${no_numeric_pass}
    Check Password Requirements    ${VALID_USERNAME}    ${contains_space_pass}
    Check Password Requirements    ${VALID_USERNAME}    ${too_long_pass}

*** Keywords ***
Check Username Requirements
    [Arguments]    ${username}    ${password}
    Input Text    id=username    ${username}
    Input Text    id=password    ${password}
    Click Button    id=submit
    ${error_message}    Get Text    xpath=//div[@class='error']
    Should Be Equal As Strings    ${error_message}    ''

Check Password Requirements
    [Arguments]    ${username}    ${password}
    Input Text    id=username    ${username}
    Input Text    id=password    ${password}
    Click Button    id=submit
    ${error_message}    Get Text    xpath=//div[@class='error']
    Should Be Equal As Strings    ${error_message}    ''
