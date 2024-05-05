*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${BROWSER}        Chrome
${URL}            https://www.saucedemo.com/
${VALID_USERNAME}    standard_user
${VALID_PASSWORD}    secret_sauce
${INVALID_USERNAME}  invalid_username_@
${INVALID_PASSWORD}  invalid_password
${LONG_USERNAME}     username_with_more_than_40_characters
${SPECIAL_CHAR_USERNAME}  @username
${SHORT_PASSWORD}   12345
${WEAK_PASSWORD}    abcdef
${PASSWORD_WITH_SPACE}  password with space
${LONG_PASSWORD}    password_with_more_than_40_characters

*** Test Cases ***
Positive Login Test
    [Documentation]    Test positive login scenario
    Open Browser    ${URL}    ${BROWSER}
    Input Text      id=user-name    ${VALID_USERNAME}
    Input Text      id=password    ${VALID_PASSWORD}
    Click Button    login-button
    Wait Until Page Contains Element    //div[@id='inventory_container']
    [Teardown]    Close Browser

Negative Login Test
    [Documentation]    Test various negative login scenarios
    # Invalid username and valid password
    Open Browser    ${URL}    ${BROWSER}
    Input Text      id=user-name    ${INVALID_USERNAME}
    Input Text      id=password    ${VALID_PASSWORD}
    Click Button    login-button
    Wait Until Page Contains Element    //h3[contains(text(),'Username and password do not match any user')]
    Close Browser

    # Valid username and invalid password
    Open Browser    ${URL}    ${BROWSER}
    Input Text      id=user-name    ${VALID_USERNAME}
    Input Text      id=password    ${INVALID_PASSWORD}
    Click Button    login-button
    Wait Until Page Contains Element    //h3[contains(text(),'Username and password do not match any user')]
    Close Browser

    # Username field empty
    Open Browser    ${URL}    ${BROWSER}
    Input Text      id=password    ${VALID_PASSWORD}
    Click Button    login-button
    Wait Until Page Contains Element    //h3[contains(text(),'Username is required')]
    Close Browser

    # Password field empty
    Open Browser    ${URL}    ${BROWSER}
    Input Text      id=user-name    ${VALID_USERNAME}
    Click Button    login-button
    Wait Until Page Contains Element    //h3[contains(text(),'Epic sadface: Password is required')]
    Close Browser

    # Username too long
    Open Browser    ${URL}    ${BROWSER}
    Input Text      id=user-name    ${LONG_USERNAME}
    Input Text      id=password    ${VALID_PASSWORD}
    Click Button    login-button
    Wait Until Page Contains Element    //h3[contains(text(),'Username and password do not match any user in this service')]
    Close Browser

    # Username starts with special character
    Open Browser    ${URL}    ${BROWSER}
    Input Text      id=user-name    ${SPECIAL_CHAR_USERNAME}
    Input Text      id=password    ${VALID_PASSWORD}
    Click Button    login-button
    Wait Until Page Contains Element    //h3[contains(text(),'Username and password do not match any user in this service')]
    Close Browser

    # Weak password
    Open Browser    ${URL}    ${BROWSER}
    Input Text      id=user-name    ${VALID_USERNAME}
    Input Text      id=password    ${WEAK_PASSWORD}
    Click Button    login-button
    Wait Until Page Contains Element    //h3[contains(text(),'Username and password do not match any user in this service')]
    Close Browser

    # Password with space
    Open Browser    ${URL}    ${BROWSER}
    Input Text      id=user-name    ${VALID_USERNAME}
    Input Text      id=password    ${PASSWORD_WITH_SPACE}
    Click Button    login-button
    Wait Until Page Contains Element    //h3[contains(text(),'Username and password do not match any user in this service')]
    Close Browser

    # Long password
    Open Browser    ${URL}    ${BROWSER}
    Input Text      id=user-name    ${VALID_USERNAME}
    Input Text      id=password    ${LONG_PASSWORD}
    Click Button    login-button
    Wait Until Page Contains Element    //h3[contains(text(),'Username and password do not match any user in this service')]
    Close Browser
